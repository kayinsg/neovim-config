local LuaSnip = require("luasnip")
local createSnippet = LuaSnip.add_snippets
local SnippetContent = LuaSnip.snippet
local input = LuaSnip.insert_node
local text = LuaSnip.text_node
local executeFunction = LuaSnip.function_node
local format = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
-- local d = LuaSnip.dynamic_node

-- Function to generate the self.attribute = attribute lines
local function generateSelfAssignments(args)
	local params = args[1][1]
	local assignments = {}
	for param in string.gmatch(params, "[^, ]+") do
		if param ~= "self" then -- Exclude 'self' from assignments
			table.insert(assignments, "        self." .. param .. " = " .. param)
		end
	end
	return assignments
end

local function createRepeatNode(index)
	return executeFunction(function(args)
		return args[1]
	end, { index })
end

local function classTemplate()
	createSnippet("python", {
		SnippetContent(
			"class",
			format(
				[[
            class {}:
                def __init__(self, {}):
            {}

                def {}(self, {}) -> {}:
                    {}
        ]],
				{
					input(1, "ClassName"),
					input(2, "firstAttribute, secondAttribute, thirdAttribute"),
					executeFunction(generateSelfAssignments, { 2 }),
					input(3, "functionName"),
					input(4, "parameters"),
					input(5, "returnType"),
					input(6, "functionBody"),
				}
			)
		),
	})
end

local function instanceMethod()
	createSnippet("python", {
		SnippetContent(
			"def",
			format(
				[[
            def {}({}, {}):
                {}
        ]],
				{
					input(1, "functionName"),
					input(2, "self"),
					input(3, "parameters"),
					input(4, "functionBody"),
				}
			)
		),
	})
end

local function staticMethod()
	createSnippet("python", {
		SnippetContent(
			"static",
			format(
				[[
    @staticmethod
    def {}({}) -> {}:
        {}
                ]],
				{
					input(1, "functionName"),
					input(2, "parameters"),
					input(3, "returnType"),
					input(4, "functionBody"),
				}
			)
		),
	})
end

local function listOfValues()
	createSnippet("python", {
		SnippetContent("lis", {
			text("list(["),
			input(1, "firstElement, secondElement, thirdElement"),
			text("])"),
		}),
	})
end

local function importStatement()
	createSnippet("python", {
		SnippetContent(
			"import",
			format("from {} import {}", {
				input(1, "library"),
				input(2, "functionOrVariable"),
			})
		),
	})
end

local function objectStorage()
	createSnippet("python", {
		SnippetContent(
			"obj",
			format("{} = {}({})", {
				input(1, "object"),
				input(2, "Class"),
				input(3, "instanceVariables"),
			})
		),
	})
end

local function functionReturnStorage()
	createSnippet("python", {
		SnippetContent(
			"de",
			format("{} = {}({})", {
				input(1, "variableName"),
				input(2, "function"),
				input(3, "parameters"),
			})
		),
	})
end

local function NamedTuple()
	createSnippet("python", {
		SnippetContent(
			"nt",
			format(
				[[
class {}(NamedTuple):
    {}: {}
    {}: {}
    {}: {}
]],
				{
					input(1, "NameOfStruct"),
					input(2, "A"),
					input(3, "TypeA"),
					input(4, "B"),
					input(5, "TypeB"),
					input(6, "C"),
					input(7, "TypeC"),
				}
			)
		),
	})
end

local function printEmptyLine()
	createSnippet("python", {
		SnippetContent("prE", format('print("")', {})),
	})
end

local function printInfoLog()
	createSnippet("python", {
		SnippetContent(
			"pri",
			format(
				[[
                    print("")
                    print('[ SOURCE ]: {}')
                    print('[ INFO ] {}')
                    print({})
                ]],
				{
					input(1, "statementToTerminal"), -- First input node
					input(2, "sourceOfInfo"),
					input(3, "variableToLog"),
				}
			)
		),
	})
end

local function printErrorLog()
	createSnippet("python", {
		SnippetContent(
			"pre",
			format(
				[[
                    print("")
                    print('[ ERROR ] {}')
                    print('{}')
                ]],
				{
					input(1, "Statement To Terminal"), -- First input node
					input(2, "Error Message"),
				}
			)
		),
	})
end

local function printPlainVariable()
	createSnippet("python", {
		SnippetContent(
			"prv",
			format(
				[[
                    print({})
                ]],
				{
					input(1, "variable"), -- First input node
				}
			)
		),
	})
end

local function formattedPrint()
	createSnippet("python", {
		SnippetContent(
			"pr",
			format(
				[[
                    print(f'{}{}')
                ]],
				{
					input(1, "The Quick Brown Fox Jumped Over"), -- First input node
					input(2, "The Moon"), -- Adding the second input node for the second part
				}
			)
		),
	})
end

local function initMethod()
	createSnippet("python", {
		SnippetContent(
			"init",
			format(
				[[
                                    def __init__(self, {}):
                                {}
]],
				{
					input(1, "firstAttribute, secondAttribute, thirdAttribute"),
					executeFunction(generateSelfAssignments, { 1 }),
				}
			)
		),
	})
end

-- Call the function to add the snippet()
classTemplate()
instanceMethod()
printInfoLog()
printErrorLog()
printPlainVariable()
formattedPrint()
staticMethod()
listOfValues()
importStatement()
functionReturnStorage()
objectStorage()
NamedTuple()
printEmptyLine()
initMethod()
