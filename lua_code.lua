
-- Lua code for University of Utah LuaLaTeX Template Class (u_template.cls)
-- Created by Thomas Kelkel | thomaskelkel.de

local FLOOR = math.floor

local ID = node.id
local GLUE = ID ( "glue" )
local PENALTY = ID ( "penalty" )
local KERN = ID ( "kern" )
local WI = ID ( "whatsit" )

local SWAPPED = table.swapped
local SUBTYPES = node.subtypes
local SPACESKIP = SWAPPED ( SUBTYPES ("glue") )["spaceskip"]

local NEW = node.new
local REM = node.remove
local PREV = node.prev
local NEXT = node.next
local INS_B = node.insert_before
local INS_A = node.insert_after
local T = node.traverse
local T_GLYPH = node.traverse_glyph

local U = unicode.utf8
local SUB = U.sub
local GSUB = U.gsub
local FIND = U.find
local CHAR = U.char
u_template_CHAR = U.char

local T_CC = table.concat

local ATC = luatexbase.add_to_callback

local OUTPUT = io.output

local WIS = node.whatsits
local PDF_LITERAL = SWAPPED ( WIS () )["pdf_literal"]

-----

local function file_exists ( name )
    return os.rename ( name, name ) and true or false
end

local function make_file ( file_name, content )
    OUTPUT ( file_name ):write ( content )
end

function u_template_get_ratio ( first, second )
    tex.sprint ( tex.sp ( first ) / tex.sp ( second ) )
end

function u_template_make_caption ( string, label )
    if not string then
        string = ""
    end
    local first_sentence = ""
    if FIND ( string, "%." ) then
        first_sentence = SUB ( string, 1, FIND ( string, "%." ) - 1 )
    else
        first_sentence = string
    end
    local add = ""
    local label_add = ""
    if label then
        add = "\\\\"
        label_add = "\\label{" .. label .. "}"
    end
    if not ( string == "" ) then
        tex.sprint ( "\\caption[" .. first_sentence .. label_add .. "]{" .. string .. label_add .. "}" .. add )
    end
end

function u_template_number_of ( list, number )
    make_file ( list .. ".num", number )
end

function u_template_get_number_of ( list )
    if file_exists ( list .. ".num" ) then
        for line in io.lines ( list .. ".num" ) do
            if not ( list == "appendix" ) then
                if tonumber ( line ) < 5 or tonumber ( line ) > 25 then
                    tex.sprint ( "false" )
                else
                    tex.sprint ( "true" )
                end
            else
                if FIND ( line, "A" ) then
                    tex.sprint ( "true" )
                else
                    tex.sprint ( "false" )
                end
            end
        end
    end
end

u_template_figures = 0

u_template_tables = 0


local committee = {}

u_template_cochairs = false

function u_template_add_committee_member ( name, date )
    local role = "Member"
    if not u_template_cochairs and #committee < 1 then
        role = "Chair"
    end
    if u_template_cochairs and  #committee < 2 then
        role = "Co-Chair"
    end
    committee[#committee + 1] = {name, role, date}
end

function u_template_print_committee ()
    tex.sprint ( "\\begin{tabular}{clc}" )
    for index, member in ipairs ( committee ) do
        tex.sprint ( "\\underLine{\\textbf{" .. member[1] .. "}} & \\hspace{.25em},\\hspace{.45em}" .. member[2] .. " & \\quad\\underLine{\\textbf{" .. member[3] .. "}} \\\\" )
        tex.sprint ( " & \\vspace*{\\dimexpr\\approvalpagesmallspace - \\approvalpageheadingfontsize\\relax} & \\quad{\\fontsize{\\dateapprovedlabelfontsize}{\\dateapprovedlabelfontsize}\\selectfont{}\\raisebox{.5em}{Date Approved}} \\\\" )
    end
    tex.sprint ( "\\end{tabular}\\par" )
    tex.sprint ( "\\addvspace{\\dimexpr\\approvalpagespaceafterlist - \\approvalpagesmallspace\\relax}%" )
end

local dedication_pages = {}

function u_template_add_dedication ( text )
    if not ( text == "none" or text == "" ) then
        dedication_pages[#dedication_pages + 1] = text
    end
end

function u_template_print_dedication_pages ()
    for index, page in ipairs ( dedication_pages ) do
        tex.sprint ( "\\begin{dedicationpage}\\centering{}" .. page .. "\\end{dedicationpage}" )
    end
end

function u_template_print_dedication_pages ()
    for index, page in ipairs ( dedication_pages ) do
        tex.sprint ( "\\begin{dedicationpage}\\centering{}" .. page .. "\\end{dedicationpage}" )
    end
end

local figures = {}

function u_template_add_figure ( option, file_name, caption, label, pagefigure )
    figures[#figures + 1] = {}
    figures[#figures][1] = option
    figures[#figures][2] = file_name
    figures[#figures][3] = caption
    figures[#figures][4] = label
    figures[#figures][5] = pagefigure
end

function u_template_print_figures ()
    for index, figure in ipairs ( figures ) do
        if not figure[5] then
            tex.sprint ( "\\begin{figure}[p]\\centering{}\\includegraphics[" .. figure[1] .. "]{" .. figure[2] .. "}" )u_template_make_caption ( figure[3] )
        else
            tex.sprint ( "\\begin{figure}[p!]" )
            u_template_make_caption ( figure[3] )
            tex.sprint ( "\\end{figure}\\begin{figure}[p!]\\centering{}\\includegraphics[" .. figure[1] .. "]{" .. figure[2] .. "}" )
        end
        tex.sprint ( "\\label{" .. figure[4] .. "}\\end{figure}" )
        tex.sprint ( "" )
    end
    figures = {}
end

local tables = {}

function u_template_add_table ( caption, label, style, content, switch, tableheading )
    tables[#tables + 1] = {}
    tables[#tables][1] = caption
    tables[#tables][2] = label
    tables[#tables][3] = style
    tables[#tables][4] = GSUB ( GSUB ( content, "HLINE", "\\hline" ), "BOLD", "\\bfseries" )
    if switch == "switch" then
        tables[#tables][5] = true
    else
        tables[#tables][5] = false
    end
    if tableheading then
        tables[#tables][6] = GSUB ( GSUB ( tableheading, "HLINE", "\\hline" ), "BOLD", "\\bfseries" )
    end
end

function u_template_print_tables ()
    for index, table in ipairs ( tables ) do
        if table[5] then
            tex.sprint ( "\\stepcounter{rownum}" )
        end
        if not table[6] then
            tex.sprint ( "\\begin{table}[p]\\centering{}" )
            u_template_make_caption ( table[1] )
            tex.sprint ( "\\begin{tabular}{" .. table[3] .. "}" .. table[4] .. "\\end{tabular}\\label{" .. table[2] .. "}\\end{table}" )
            tex.sprint ( "" )
        else
            tex.sprint ( "\\clearpage" )
            tex.sprint ( "\\vspace*{-1.5\\baselineskip}" )
            tex.sprint ( "\\linespread{\\directlua{tex.sprint ( \\linespacing * 0.5 )}}\\normalfont" )
            tex.sprint ( "\\begin{longtable}{" .. table[3] .. "}" )
            u_template_make_caption ( table[1], table[2] )
            tex.sprint ( "\\hline" )
            tex.sprint ( table[6] )
            tex.sprint ( "\\hline" )
            tex.sprint ( "\\endfirsthead" )
            tex.sprint ( "Table \\ref{" .. table[2] .. "} continued.\\\\" )
            tex.sprint ( "\\hline" )
            tex.sprint ( table[6] )
            tex.sprint ( "\\hline" )
            tex.sprint ( "\\endhead" )
            tex.sprint ( table[4] .. "\\end{longtable}\\renewcommand*{\\arraystretch}{\\tabstretch}" )
            tex.sprint ( "\\linespread{\\linespacing}\\normalfont" )
            tex.sprint ( "" )
        end
    end
    tables = {}
end
