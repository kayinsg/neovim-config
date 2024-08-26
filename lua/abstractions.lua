-- Utility Scripts for Perplexity AI
-- Cookie Cutter Question Template
--{{
function cookieCutterQuestionTemplate()
	-- Wrap the entire text in the current buffer
	executeOnCommandLine("set wrap")
	-- Quote the entire text in the current buffer using surround.nvim plugin
	-- Simulate the keystrokes for the surround.nvim plugin command
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('ggsaG"', true, false, true), "x", false)

	-- Go to the start of the buffer
	vim.api.nvim_feedkeys("gg", "n", false)
	-- Go to the end of the excerpt
	vim.api.nvim_feedkeys("G", "n", false)

	appendedNumber = [[

1. ]]

	local buffer = 0 -- Use 0 for the current buffer
	local totalLines = vim.api.nvim_buf_line_count(buffer)

	-- Insert the text at the last line of the buffer
	vim.api.nvim_buf_set_lines(buffer, totalLines, totalLines, false, vim.split(appendedNumber, "\n"))

	-- Go to the end of the line
	vim.api.nvim_feedkeys("$", "n", false)
end
--}}
-- Program Debugger Script
--{{
function pythonDebugger()
	-- Wrap the entire text in the current buffer
	executeOnCommandLine("set wrap")

	-- Quote the entire text in the current buffer using surround.nvim plugin
	-- Simulate the keystrokes for the surround.nvim plugin command
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('ggsaG"', true, false, true), "x", false)

	-- Go to the start of the buffer
	vim.api.nvim_feedkeys("gg", "n", false)

	-- Create a new line above the first line in the buffer and insert the text
	textToInsert = [[
[You are an overwhelmingly proficient educator and programmer in the art of the Python programming language.
You are excellent at distilling concepts pertaining to programming in a form that is understandable to the layman.
A great part of your skill primarily owes to two things:
    1. Breaking down the logic of code and programming concepts into irreducible bits
    2. Explaining the logical structures in a cohesive manner
At the same time, you are also immensely thorough and nothing if not
skillful with respect to applying the concept beyond the direct context
of whatever is asked
That is you delineate the general applicability of programming concepts
You have an exceedingly solid foundation not only in basic programming concepts such as for loops and while loops but also
    1. Data Structures & Algorithms
    2. Object-Oriented programming
    3. Design Patterns
Observe the following and answer the succeeding requests accordingly]
]]

	-- Insert the text at the beginning of the buffer
	vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(textToInsert, "\n"))

	appendedQuestions = [[
1. **Code Examination:**
   - Carefully review the provided code snippet to identify potential issues and understand its context.

2. **Error Traceback Investigation:**
   - Analyze the error traceback to pinpoint where and why the error occurred.

**Error Explanation:**

3. **Error Identification and Causes:**
   - Clearly identify the name of the error encountered.
   - Provide a detailed explanation of the common causes of this error.

4. **Error Resolution:**

   - **Resolution Methods:**
     - Explore various methods to resolve the error.
     - Offer step-by-step instructions for each solution.
     - Include code examples or modifications when applicable.

**Learning and Prevention:**

5. **Lessons Learned:**
   - Discuss insights gained from the error and debugging process.
   - Highlight best practices to prevent similar errors in the future.

6. **Error Avoidance:**
   - Provide advice on what to avoid in future coding efforts.
   - Suggest coding habits or tools that can help minimize errors.

---
]]

	local buffer = 0 -- Use 0 for the current buffer
	local totalLines = vim.api.nvim_buf_line_count(buffer)

	-- Insert the text at the last line of the buffer
	vim.api.nvim_buf_set_lines(buffer, totalLines, totalLines, false, vim.split(appendedQuestions, "\n"))

	-- Go to the end of the line
	vim.api.nvim_feedkeys("G$", "n", false)
end
--}}
-- Rephraser
--{{

function rephraseScript()
	-- Wrap the entire text in the current buffer
	executeOnCommandLine("set wrap")

	-- Quote the entire text in the current buffer using surround.nvim plugin
	-- Simulate the keystrokes for the surround.nvim plugin command
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('ggsaG"', true, false, true), "x", false)

	-- Go to the start of the buffer
	vim.api.nvim_feedkeys("gg", "n", false)

	-- Create a new line above the first line in the buffer and insert the text
	textToInsert = [[
Observe the following.
Ensure that your answers satisfy the following conditions:
    1. It is remarkably intelligible to a layman
        1.1 In other words the rephrasing is stated in pellucid language
    2. The logic is broken down into irreducible bits
    3. The logic is explained in a cohesive manner
        3.1. This signifies that that the response you return
             should comprise ample use of transitional words to connect related
             points
    4. Should have minimal use of commas in the similar context of ", which means".
       To make this clearer, an example of this is "Alice had business to take
       care of, which means we will be going to the movie without her". I do
       not want to see many of these sentence fragments that involve "which.
    5. Is invariably in paragraph format unless specified otherwise in
       the question below the quoted text
]]

	-- Insert the text at the beginning of the buffer
	vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(textToInsert, "\n"))

	-- Go to the end of the excerpt
	vim.api.nvim_feedkeys("G", "n", false)

	appendedQuestions = [[

1. Rephrase the above with more clarity. 
   Among your principal goals should be to 
   Eradicate 
       1. Jargon
       2. Ambiguity 
   in the above text ]]

	local buffer = 0 -- Use 0 for the current buffer
	local totalLines = vim.api.nvim_buf_line_count(buffer)

	-- Insert the text at the last line of the buffer
	vim.api.nvim_buf_set_lines(buffer, totalLines, totalLines, false, vim.split(appendedQuestions, "\n"))

	-- Go to the end of the line
	vim.api.nvim_feedkeys("$_fE", "n", false)
end
--}}

-- General Illuminator
--{{
function explainScript()
	-- Wrap the entire text in the current buffer
	executeOnCommandLine("set wrap")

	-- Quote the entire text in the current buffer using surround.nvim plugin
	-- Simulate the keystrokes for the surround.nvim plugin command
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('ggsaG"', true, false, true), "x", false)

	-- Go to the start of the buffer
	vim.api.nvim_feedkeys("gg", "n", false)

	-- Create a new line above the first line in the buffer and insert the text
	textToInsert = [[
Ensure your answers meet these criteria:
    1. Easy to understand for the average person
        1.1 Use clear, simple language
        1.2 Avoid technical jargon or complex terminology
        1.3 If specialized terms are necessary, define them immediately
    2. Break down complex ideas into basic components
        2.1 Present information in small, digestible chunks
        2.2 Use step-by-step explanations when appropriate
        2.3 Provide concrete examples to illustrate abstract concepts
    3. Present information in a logical, flowing manner
        3.1 Use transition words to connect related points
        3.2 Ensure each paragraph naturally leads to the next
        3.3 Maintain a clear narrative thread throughout the explanation
    4. Blend technical explanations with relatable examples
        4.1 Use analogies or metaphors to explain complex ideas
        4.2 Relate concepts to everyday experiences or objects
        4.3 Avoid separating simplified explanations into distinct sections
        4.4 Seamlessly integrate examples within the main explanation
    5. Use paragraph format unless otherwise specified
        5.1 Break long explanations into multiple paragraphs for readability
        5.2 Use short paragraphs (3-5 sentences) to maintain reader engagement
        5.3 If lists are necessary, embed them within paragraphs
    6. Minimize use of phrases like ", which means"
        6.1 Rephrase sentences to avoid overuse of "which" clauses
        6.2 Use direct, active language instead of passive constructions
        6.3 Break complex sentences into multiple simpler ones when possible
]]

	-- Insert the text at the beginning of the buffer
	vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(textToInsert, "\n"))

	-- Go to the end of the excerpt
	vim.api.nvim_feedkeys("G", "n", false)

	appendedQuestions = [[

1. Explain the above in more detail.]]

	local buffer = 0 -- Use 0 for the current buffer
	local totalLines = vim.api.nvim_buf_line_count(buffer)

	-- Insert the text at the last line of the buffer
	vim.api.nvim_buf_set_lines(buffer, totalLines, totalLines, false, vim.split(appendedQuestions, "\n"))

	-- Go to the end of the line
	vim.api.nvim_feedkeys("$_fE", "n", false)
end

-- Toggle Line Numbers Between Absolute and Relative
--{{
function toggle_numbering()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
		vim.wo.number = true
	else
		vim.wo.relativenumber = true
		vim.wo.number = false
	end
end

--}}

--}}
-- Python Documentation Assistant
--{{
function gatherDocumentationInsights()
	-- Wrap the entire text in the current buffer
	executeOnCommandLine("set wrap")

	-- Quote the entire text in the current buffer using surround.nvim plugin
	-- Simulate the keystrokes for the surround.nvim plugin command
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('ggsaG"', true, false, true), "x", false)

	-- Go to the start of the buffer
	vim.api.nvim_feedkeys("gg", "n", false)

	-- Create a new line above the first line in the buffer and insert the text
	textToInsert = [[
Observe the following.
Ensure that your answers satisfy the following conditions:

1. Explain the method or function using simple, everyday language.
    1.1. Avoid technical jargon unless absolutely necessary.
    1.2. Use analogies or real-world examples to illustrate complex concepts.
    1.3. Break down the explanation into short, easy-to-understand sentences.

2. When technical programming terms are unavoidable:
    2.1. Provide a clear, concise definition for each term.
    2.2. Explain the term's relevance to the method or function being discussed.
    2.3. If possible, offer a simpler alternative phrase or description.
    2.4. Use examples to demonstrate how the term applies in practice.

3. Include a variety of reliable resources for further information:
    3.1. Provide at least three different URLs for additional reading.
    3.2. Ensure the sources are diverse, including:
        3.2.1. Official documentation or specifications.
        3.2.2. Well-regarded programming tutorials or blogs.
        3.2.3. Academic or educational resources when applicable.
    3.3. Briefly describe what kind of information each link provides.
    3.4. If possible, include resources suitable for different skill levels (beginner, intermediate, advanced).
]]

	-- Insert the text at the beginning of the buffer
	vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(textToInsert, "\n"))

	-- Go to the end of the excerpt
	vim.api.nvim_feedkeys("G", "n", false)

	appendedQuestions = [[

Give a detailed account of the above according to the concerns of the following framework:
1. Function Analysis
    1.1. 
        Dependencies and Side Effects
        External libraries or modules required
    1.2. 
        General Description
        Purpose of the function
        Input parameters and their types
        Expected output
        Any side effects or modifications to external state
    1.3. 
        Algorithm and Logic
        1.3.1. Provide a detailed, sequential breakdown of the function's logic
        1.3.2. Explain each step's purpose and how it contributes to the overall goal
        1.3.3. Highlight any conditional statements or loops, explaining their conditions and iterations
2. Return Value Analysis
    2.1
        Object Return
        Type of object returned
        Structure and properties of the object
        Common methods associated with the object
        How the object is typically used in further operations
    2.2
        Void Return (Modifies Data)
        What data is modified
        How the data is modified
        Where the modified data is stored or used
    2.3 
        Boolean Return
        Conditions for True
        Conditions for False
        Edge cases or exceptions
3. Code Implementation
    3.1. 
        Usage Examples
        Common use cases
        Code snippets demonstrating typical usage
    3.2. 
        Error Handling and Edge Cases
        How the function handles unexpected inputs
        Any error messages or exceptions thrown
    3.3. 
        Performance Considerations
        Potential bottlenecks or optimization opportunities

Please format your answers with emboldened section names for improved clarity
]]

	local buffer = 0 -- Use 0 for the current buffer
	local totalLines = vim.api.nvim_buf_line_count(buffer)

	-- Insert the text at the last line of the buffer
	vim.api.nvim_buf_set_lines(buffer, totalLines, totalLines, false, vim.split(appendedQuestions, "\n"))

	-- Go to the end of the line
	vim.api.nvim_feedkeys("$", "n", false)
end

--}}
-- Python Illuminator
--{{
function pythonScript()
	-- Wrap the entire text in the current buffer
	executeOnCommandLine("set wrap")

	-- Quote the entire text in the current buffer using surround.nvim plugin
	-- Simulate the keystrokes for the surround.nvim plugin command
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('ggsaG"', true, false, true), "x", false)

	-- Go to the start of the buffer
	vim.api.nvim_feedkeys("gg", "n", false)

	-- Create a new line above the first line in the buffer and insert the text
	textToInsert =
		[[You are an overwhelmingly proficient educator and programmer in the art of the Python programming language.
You are excellent at distilling concepts pertaining to programming in a form that is understandable to the layman.
A great part of your skill primarily owes to two things:
    1. Breaking down the logic of code and programming concepts into irreducible bits
    2. Explaining the logical structures in a cohesive manner
At the same time, you are also immensely thorough and nothing if not
skillful with respect to applying the concept beyond the direct context
of whatever is asked
That is you delineate the general applicability of programming concepts
You have an exceedingly solid foundation not only in basic programming concepts such as for loops and while loops but also
    1. Data Structures & Algorithms
    2. Object-Oriented programming
    3. Design Patterns
Observe the following and answer the succeeding questions accordingly]]

	-- Insert the text at the beginning of the buffer
	vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(textToInsert, "\n"))

	appendedQuestions = [[

1. Restate the Relevant Code:
    Clearly present the code snippet in question. 
    Ensure it is formatted correctly for readability and includes any necessary context or dependencies.
2. 
    Elucidate the Code in Pellucid Language:
2.1. 
    Explain in the Spirit of How the Python Interpreter Processes the Data:
    2.1.1. Describe step-by-step how the Python interpreter executes the code. 
    2.1.2. Include details on how variables are assigned, how functions are called, and how control structures 
           (like loops and conditionals) are evaluated.
    2.1.3. Discuss any relevant data types and how they are manipulated during execution.
    Mention any built-in functions or libraries used and how they interact with the code.
2.2. 
    Return in Paragraph Form:
    Provide a clear, concise, and detailed explanation of the code's functionality. 
    Ensure that the explanation flows logically and covers each part of the code comprehensively.
    Use analogies or real-world examples where appropriate to make complex concepts more understandable.
3. 
    Generally Speaking, What Problems Could I Apply the Above Code To?
    Discuss the practical applications of the code. 
    Explain what types of problems or scenarios the code is designed to solve.
    Provide examples of real-world use cases where this code could be beneficial.
    Mention any potential limitations or considerations when applying the code to different problems.
4. 
    What is the Essential Lesson to Take from This?
    Summarize the key takeaways from the code and its explanation.
    Highlight any important programming concepts or best practices demonstrated by the code.
    Discuss how understanding this code can help in writing better, more efficient, or more maintainable code in the 
    future.

]]

	local buffer = 0 -- Use 0 for the current buffer
	local totalLines = vim.api.nvim_buf_line_count(buffer)

	-- Insert the text at the last line of the buffer
	vim.api.nvim_buf_set_lines(buffer, totalLines, totalLines, false, vim.split(appendedQuestions, "\n"))

	-- Go to the end of the line
	vim.api.nvim_feedkeys("G6kfR", "n", false)
end

--}}
-- Code Architect and Refactoriztor
--{{
function refactoringScript()
	-- Wrap the entire text in the current buffer
	executeOnCommandLine("set wrap")

	-- Quote the entire text in the current buffer using surround.nvim plugin
	-- Simulate the keystrokes for the surround.nvim plugin command
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('ggsaG"', true, false, true), "x", false)

	-- Go to the start of the buffer
	vim.api.nvim_feedkeys("gg", "n", false)

	-- Create a new line above the first line in the buffer and insert the text
	textToInsert = [[
Observe the following.
Ensure that your answers satisfies the following conditions:
    1. Strongly conforms forms to clean code principles as much as is possible.
    2. Each sub-task is made into an abstraction.
    3. Has meaningful variable and functions names.
    4. Whether local or global, all data is encapsulated within a function.
    5. ALL methods and variable names are in camelCase.
]]

	-- Insert the text at the beginning of the buffer
	vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(textToInsert, "\n"))

	appendedQuestions = [[

1. Produce clean code from the above.]]

	local buffer = 0 -- Use 0 for the current buffer
	local totalLines = vim.api.nvim_buf_line_count(buffer)

	-- Insert the text at the last line of the buffer
	vim.api.nvim_buf_set_lines(buffer, totalLines, totalLines, false, vim.split(appendedQuestions, "\n"))

	-- Go to the end of the line
	vim.api.nvim_feedkeys("G$", "n", false)
end

--}}
--Madhyamaka Elucidator
--{{
function explainBuddhism()
	-- Wrap the entire text in the current buffer
	executeOnCommandLine("set wrap")

	-- Quote the entire text in the current buffer using surround.nvim plugin
	-- Simulate the keystrokes for the surround.nvim plugin command
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('ggsaG"', true, false, true), "x", false)

	-- Go to the start of the buffer
	vim.api.nvim_feedkeys("gg", "n", false)

	-- Create a new line above the first line in the buffer and insert the text
	textToInsert = [[
Observe the following.
Ensure that your answers satisfy the following conditions:
    1. It is remarkably intelligible to a layman
        1.1 In other words your insight is stated in pellucid language
    2. The logic is broken down into irreducible bits
    3. The logic is explained in a cohesive manner
        3.1. This signifies that that the response you return
             should comprise ample use of transitional words to connect related
             points
    4. Is invariably in paragraph format unless specified otherwise in
       the question below the quoted text
    5. Should have minimal use of commas in the similar context of ", which means".
       To make this clearer, an example of this is "Alice had business to take
       care of, which means we will be going to the movie without her". I do
       not want to see many of these sentence fragments that involve "which.
]]

	-- Insert the text at the beginning of the buffer
	vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(textToInsert, "\n"))

	-- Go to the end of the excerpt
	vim.api.nvim_feedkeys("G", "n", false)

	appendedQuestions = [[

1. Rephrase the above with greater clarity. You don't have to dumb it
down too much, but at least eliminate technical jargon and use simple
prose
2. Explain the above to a 12-year old
of reality as according to the Madhyamaka school of Buddhism.
3. Discuss the above in particular relation to the Pratītyasamutpāda doctrine in Buddhism.
    3.1 Be specific about how it relates to the doctrine. A relevant objective you should try to achieve for example 
    entails you talking about which link in the Pratītyasamutpāda Doctrine does it seek to address
    3.2 After executing the first objective, you should summarize the overall signifance of what is being said 
    in relation to the Pratītyasamutpāda Doctrine
4. What is the crucial lesson above with respect to the Madhyamaka
school of Buddhism that maintains that everything arises from
emptiness.]]

	local buffer = 0 -- Use 0 for the current buffer
	local totalLines = vim.api.nvim_buf_line_count(buffer)

	-- Insert the text at the last line of the buffer
	vim.api.nvim_buf_set_lines(buffer, totalLines, totalLines, false, vim.split(appendedQuestions, "\n"))

	-- Go to the end of the line
	vim.api.nvim_feedkeys("$_fE", "n", false)
end
--}}

-- Abstractions For Config Files
--{{
-- autocommands.lua
--{{
-- Create An Autocommand
--{{
function autocommand(event, opts)
	local autocmd_opts = {
		group = opts.group,
		pattern = opts.pattern,
		desc = opts.desc or false,
		once = opts.once or false,
		nested = opts.nested or false,
	}

	if opts.callback then
		autocmd_opts.callback = opts.callback
	elseif opts.command then
		autocmd_opts.command = opts.command
	else
		error("Either 'callback' or 'command' must be provided")
	end

	vim.api.nvim_create_autocmd(event, autocmd_opts)
end

--}}
-- Create An Autocommand Group
--{{
function autocommandGroup(group_name)
	-- Create the autocommand group with the provided name
	local group_id = vim.api.nvim_create_augroup(group_name, { clear = true })

	-- Return the group_id for potential future use
	return group_id
end

--}}
-- Simple API Calls That Were Made Into More Concise Names
--{{
setCursor = vim.api.nvim_win_set_cursor
executeOnCommandLine = vim.cmd

--}}
-- Page Positioning Suite
--{{
-- Center The Current Line
--{{
function positionLineAtCenter()
	-- Execute the 'zz' command to center the current line
	executeOnCommandLine("normal! zz")
end

--}}
-- Place Current Line At The Top Of The Buffer
--{{
function positionLineAtTop()
	-- Execute the 'zz' command to center the current line
	executeOnCommandLine("normal! zt")
end

--}}
--}}
-- LSP
-- Miscellaneous Abstractions For Autocommands
--{{
-- For Deleting Unnamed Buffers
--{{
function isDeletableBuffer(event, buffer_options)
	return event.file == "" and buffer_options.buftype == "" and not buffer_options.modified
end

function deleteBuffer(buffer_number)
	vim.schedule(function()
		pcall(vim.api.nvim_buf_delete, buffer_number, {})
	end)
end

--}}
-- Highlight Line
--{{
-- [[
--  Highlights the current line in the specified highlight group for a given duration.
--
--  @param hiGroup string The highlight group to use for the current line.
--  @param timeout number The duration (in milliseconds) for which the highlight should persist.
-- ]]
-- [[
--  Highlights the current line in the specified highlight group for a given duration.
--
--  @param hiGroup string The highlight group to use for the current line.
--  @param timeout number The duration (in milliseconds) for which the highlight should persist.
-- ]]
function highlightLine(hiGroup, timeout)
	-- Ensure that the provided arguments are valid
	local isValidHiGroup = type(hiGroup) == "string" and #hiGroup > 0
	local isValidTimeout = type(timeout) == "number" and timeout > 0

	if not (isValidHiGroup and isValidTimeout) then
		error("Invalid arguments provided to highlightLine")
		return
	end

	-- Get the current line number
	local currentLine = vim.fn.line(".")

	-- Define the highlight options
	local highlightOptions = {
		higroup = hiGroup,
		timeout = timeout,
	}

	-- Call the Neovim API to highlight the current line
	require("vim.highlight").range(0, currentLine - 1, currentLine, 0, -1, highlightOptions)
end

--}}

-- Function to handle cursor movement
function handleCursorMovement()
	-- Define a table to store cursor positions
	local cursorPositions = {}

	-- Get the new cursor position
	local newPosition = vim.fn.getpos(".")

	-- Get the current buffer number
	local currentBufferNumber = vim.api.nvim_get_current_buf()

	-- Check if the old position exists in the table
	local oldPosition = cursorPositions[currentBufferNumber]
	if oldPosition then
		-- Check if the cursor moved horizontally
		if newPosition[3] ~= oldPosition[3] then
			-- Cursor moved horizontally
			positionLineAtCenter()
		end
	end

	-- Store the new cursor position in the table
	cursorPositions[currentBufferNumber] = newPosition
end

-- Unused
--{{
-- function setNormalModeKeymap(mode, lhs, rhs)
-- Check if the mode is valid
-- local validModes = { "n", "v", "s", "x", "o", "l", "t" }
-- if not vim.tbl_contains(validModes, mode) then
-- vim.api.nvim_err_writeln("Invalid mode: " .. mode)
-- return
-- end

-- Create the keymap
-- vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, { silent = true, noremap = true })
-- end
--}}
--}}
--}}
-- keymaps.lua
--{{
-- For Non-recursive keymaps. This means that when an action is assigned to a keystroke, if the action is commensurate with other actions, it will not call on thoes other actions
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

function Normal(keybinding, actions)
	vim.keymap.set("n", keybinding, actions, opts)
end

function Visual(keybinding, actions)
	vim.keymap.set("v", keybinding, actions, opts)
end

function Command(keybinding, actions)
	vim.keymap.set("c", keybinding, actions, opts)
end

function Insert(keybinding, actions)
	vim.keymap.set("i", keybinding, actions, opts)
end

function changeToNextBuffer()
	vim.schedule(function()
		executeOnCommandLine("bnext")
	end)
end

-- Close All Buffers Except Current Closes All Buffers Except The Current One
--{{
function closeAllBuffersExceptCurrent()
	-- Execute the command to close all buffers
	executeOnCommandLine("%bd!")

	-- Reopen the current buffer
	executeOnCommandLine("e#")

	-- Close the alternate buffer
	executeOnCommandLine("bd#")
end

--}}

--{{
function EnterVimgrepCommand()
	-- Enter the command in the command line
	vim.api.nvim_feedkeys(":vimgrep //g %", "n", false)

	-- Move the cursor to the position after the first forward slash
	vim.api.nvim_feedkeys("\x80\xfdl", "n", false)
end

--}}

--}}
-- nvim-lint.lua
-- oiler.lua
--{{
-- Copy Full Path Of Specified File In Oil.nvim To System Clipboard
function copyFullPathToClipboard()
	local function copyEntryPathToRegister()
		require("oil.actions").copy_entry_path.callback()
	end

	local function copyRegisterToClipboard()
		vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
	end

	copyEntryPathToRegister()
	copyRegisterToClipboard()
end

--}}
-- TODO
--{{
-- local setHighlight = vim.api.nvim_set_hl
-- local deferFunction = vim.defer_fn

-- function makeCodePretty()
--     buf = vim.api.nvim_get_current_buf()
--     lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
--
--     -- Characters to add spaces around
--     chars_to_space = {"%(", "%)", "%[", "%]", "=", "-", "%+" , "&", "|", ">", "<", ",", "%*"}
--
--     -- Temporary Move
--         -- {"* *" , "**"    },
--
--     -- Patterns for removing spaces between specific character sets
--     patterns_to_remove_space =
--     {
--         {"%+ =", "+="      }   ,
--         {"%- >", "->"      }   ,
--         {"%* =", "*="      }   ,
--         {"/ = ", "/="      }   ,
--         {"= = ", " == "    }   ,
--         {"! = ", " != "    }   ,
--         {"> = ", " >= "    }   ,
--         {"< = ", " <= "    }   ,
--         {"& &" , "&&"      }   ,
--         {"| |" , "||"      }   ,
--
--     }
--
--     for i, line in ipairs(lines) do
--         -- Add spaces around specified characters
--         for _, char in ipairs(chars_to_space) do
--             line = line:gsub("(%S)" .. char, "%1 " .. char)
--             line = line:gsub(char .. "(%S)", char .. " %1")
--         end
--
--         -- Remove spaces between specific character sets
--         for _, pattern in ipairs(patterns_to_remove_space) do
--             line = line:gsub(pattern[1], pattern[2])
--         end
--
--         -- Remove trailing whitespace
--         line = line:gsub("%s+$", "")
--
--         -- Eliminate double spaces after the first non-blank character
--         line = line:gsub("(%S)%s%s+", "%1 ")
--
--         lines[i] = line
--     end
--
--     -- Update the buffer with the formatted lines
--     vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
-- end
--}}
-- colorscheme.lua
--{{
function setColorScheme(schemeName)
	vim.cmd.colorscheme(schemeName)
end

function setHighlight(group, attributes)
	vim.api.nvim_set_hl(0, group, attributes)
end
function formatVimCommand(command)
	return string.format("vim.cmd [[%s]]", command)
end

local function setHighlight(group, attributes)
	vim.api.nvim_set_hl(0, group, attributes)
end
--}}
-- luasnip.lua
--{{
local function indentLine(numberOfSpaces, startAtBeginning)
	-- Get the current line content
	local currentLine = vim.api.nvim_get_current_line()

	-- If startAtBeginning is true, remove leading whitespace
	if startAtBeginning then
		currentLine = currentLine:match("^%s*(.*)")
	end

	-- Create indentation string
	local indentation = string.rep(" ", numberOfSpaces)

	-- Indent the line
	local newLine = indentation .. currentLine
	vim.api.nvim_set_current_line(newLine)
end
