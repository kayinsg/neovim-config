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
            def {}(self, {}) -> {}:
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

local function AbstractInterface()
	createSnippet("python", {
		SnippetContent(
			"abst",
			format(
				[[
from abc import ABC, abstractmethod

class {}(ABC):
    @abstractmethod
    def {}(self, {}) -> {}:
        pass

class {}({}):
    def {}(self, {}) -> {}:
        {}

class {}({}):
    def {}(self, {}) -> {}:
        {}

]],
				{
					input(1, "AbstractClass"),
					input(2, "abstractMethod"),
					input(3, "parameters"),
					input(4, "returnType"),
					input(5, "ConcreteClass"),
					rep(1), -- Reference to the AbstractClass input
					input(6, "concreteFunction"),
					input(7, "parameters"),
					input(8, "returnType"),
					input(9, "functionBody"),
					input(10, "AnotherConcreteClass"),
					rep(1), -- Reference to the AbstractClass input
					input(11, "anotherConcreteFunction"),
					input(12, "parameters"),
					input(13, "returnType"),
					input(14, "functionBody"),
				}
			)
		),
	})
end

local function objectStorage()
	createSnippet("python", {
		SnippetContent(
			"iobj",
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
			"ntup",
			format(
				[[
from collections import namedtuple

{} = namedtuple('{}', [{}])
{} = {}({})
]],
				{
					input(1, "TupleName"),
					rep(1),
					input(2, "'field1', 'field2'"),
					input(3, "instance"),
					rep(1),
					input(4, "value1, value2"),
				}
			)
		),
	})
end

local function printStatementWithFStrings()
	createSnippet("python", {
		SnippetContent(
			"pr",
			format('print(f"{}")', {
				input(1, "informationToBePrinted"),
			})
		),
	})
end

local function printStatementWithFormat()
	createSnippet("python", {
		SnippetContent(
			"pri",
			format('print("{}".format({}))', {
				input(1, "informationToBePrinted"),
				input(2, "variableInput"),
			})
		),
	})
end

local function stringRepresentationOfInstanceVariables()
	createSnippet("python", {
		SnippetContent(
			"stR",
			format(
				[[
            def __str__(self) -> str:
                return f"""
                {{self.{}}} =
                {{self.{}}} =
                {{self.{}}} =
                """"
        ]],
				{
					input(1, "firstInstanceVariable"),
					input(2, "secondInstanceVariable"),
					input(3, "thirdInstanceVariable"),
				}
			)
		),
	})
end

local function initMethod()
	createSnippet("python", {
		SnippetContent(
			"init",
			format("def __init__(self, {}):\n{}", {
				input(1, "firstAttribute, secondAttribute, thirdAttribute"),
				executeFunction(generateSelfAssignments, { 1 }),
			})
		),
	})
end
-- Call the function to add the snippet()
classTemplate()
instanceMethod()
staticMethod()
listOfValues()
importStatement()
AbstractInterface()
functionReturnStorage()
objectStorage()
NamedTuple()
printStatementWithFStrings()
printStatementWithFormat()
stringRepresentationOfInstanceVariables()
initMethod()
