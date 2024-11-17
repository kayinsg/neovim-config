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
You are an overwhelmingly proficient educator and programmer in the art of the Python programming language.
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
Observe the following and answer the succeeding requests accordingly
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
Observe the conditions specified below and answer the question that succeeds the text
1. Simplify complex concepts
    1.1 Avoid technical jargon unless absolutely necessary
    1.2 If specialized terms are used, provide clear definitions
    1.3 Eradicate Ambiguity Completely

2. Structure your response logically
    2.1 Start with the most fundamental ideas
    2.2 Build upon these basics step by step
    2.3 Use cause-and-effect relationships to show connections

3. Enhance readability and flow
    3.1 Begin each paragraph with a clear topic sentence
    3.2 Use transition words to link ideas (e.g., "however," "therefore," "as a result")
    3.3 Vary sentence structure to maintain reader interest
    3.4 Keep sentences concise and direct

4. Tailor the format to the content
    4.1 Use paragraphs as the default format
    4.2 Employ lists, tables, or diagrams only when they enhance understanding
    4.3 If a specific format is requested, follow that instruction

5. Ensure completeness and accuracy
    5.1 Address all parts of the question or prompt
    5.2 Acknowledge limitations or uncertainties in the information

6. Engage the reader
    6.1 Use an active voice when possible

]]

	-- Insert the text at the beginning of the buffer
	vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(textToInsert, "\n"))

	-- Go to the end of the excerpt
	vim.api.nvim_feedkeys("G", "n", false)

	appendedQuestions = [[

1. Rephrase the above with more clarity. Please return in paragraph form. I want it to read like a book, not bite-sized pieces of information ]]

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
        1.3 If specialized terms are necessary, define them
        immediately.
        1.4 Also, please try not to stray too much from
        the text. No matter how difficult, I don't want you to hide
        details in your elucidation since it sacrifices true
        understanding
    2. Break down complex ideas into basic components
        2.1 Present information in small, digestible chunks
        2.2 Provide concrete examples to illustrate abstract concepts
    3. Present information in a logical, flowing manner
        3.1 Use transition words to connect related points
        3.2 Ensure each paragraph naturally leads to the next
        3.3 Maintain a clear narrative thread throughout the explanation
    4. Blend technical explanations with relatable examples
        4.1 Use analogies or metaphors to explain complex ideas
        4.2 Seamlessly integrate examples within the main explanation
    5. Use paragraph format unless otherwise specified
        5.1 Break long explanations into multiple paragraphs for readability
        5.2 Use short paragraphs (3-5 sentences) to maintain reader engagement
        5.3 If lists are necessary, embed them within paragraphs
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
    1.2. Provide concrete examples to illustrate abstract concepts

2. When technical programming terms are unavoidable:
    2.1. Provide a clear, concise definition for each term.
    2.2. Explain the term's relevance to the method or function being discussed.
    2.2. Use examples to demonstrate how the term applies in practice.

3. Include a variety of reliable resources for further information:
    3.1. Provide at least three different URLs for additional reading.
    3.2. Ensure the sources are diverse, including:
        3.2.1. Official documentation or specifications.
        3.2.2. Well-regarded programming tutorials or blogs.
]]

	-- Insert the text at the beginning of the buffer
	vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(textToInsert, "\n"))

	-- Go to the end of the excerpt
	vim.api.nvim_feedkeys("G", "n", false)

	appendedQuestions = [[

Give a detailed account of the above according to the concerns of the following framework:

1. Function Analysis
    1.1. 
        Dependencies(and any potential side effects)
    1.2. 
        General Description
        Purpose of the function
        Positional Arguments (Embolden The Heading)
        Optional Arguments (Embolden The Heading)
        Expected output (or any side effects)
        
    1.3. 
        Algorithm and Logic
        1.3.1. Provide a detailed, sequential breakdown of the function's logic
        1.3.2. Explain each step's purpose and how it contributes to the overall goal
        1.3.3. Highlight any conditional statements or loops, explaining their conditions and iterations

2. Return Value Analysis
    In this context, focus on analyzing only one specific item: the item that is returned by the function.
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
        Code snippets demonstrating typical usage
        Common use cases
    3.2. 
        Error Handling
        How the function handles unexpected inputs
        Any error messages or exceptions thrown

    Please format your answers with emboldened section names for improved clarity
]]

	local buffer = 0 -- Use 0 for the current buffer
	local totalLines = vim.api.nvim_buf_line_count(buffer)

	-- Insert the text at the last line of the buffer
	vim.api.nvim_buf_set_lines(buffer, totalLines, totalLines, false, vim.split(appendedQuestions, "\n"))

	-- Go to the end of the line vim.api.nvim_feedkeys("$", "n", false)
end

--}}
-- Python Code Illuminator
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
    1. Each line has a maximum length of 72 characters
    2. To achieve the first condition, functions with long parameter components are spread across in a multiline logic
    3. Each method in the code accounts for 
        3.1. the fact that it resides within a class and therefore the function keyword "def" has 4 spaces preceding it        
        3.2. As a result of 3.1., uppermost content within the method subsequent to "def" has 8 spaces preceding it, and so on.        
        3.3. It is essential that you get these stipulations right, as it is frustrating to have to adjust the indentation format
    4. Absolutely avoids the use of backslashes 
    5. The format of the code achieves maximum attractivness with respct to readability
]]

	-- Insert the text at the beginning of the buffer
	vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(textToInsert, "\n"))

	appendedQuestions = [[

1. Format the above according to the conditions specifed above. Return in python code blocks]]

	local buffer = 0 -- Use 0 for the current buffer
	local totalLines = vim.api.nvim_buf_line_count(buffer)

	-- Insert the text at the last line of the buffer
	vim.api.nvim_buf_set_lines(buffer, totalLines, totalLines, false, vim.split(appendedQuestions, "\n"))

	-- Go to the end of the line
	vim.api.nvim_feedkeys("G$", "n", false)
end

--}}
-- Madhyamaka Elucidator
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
-- Python Code Formatter
--{{
function formatterScript()
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

    2. Variable and Function Naming: Utilize descriptive and
    meaningful names for all variables and functions. Names should
    convey the specific intent or function of the variable or method,
    aiding in understanding their role within the code.

    3. Camel Case Conventions: All method and variable names must
    strictly follow camelCase formatting. This includes using a
    lowercase letter for the first word and capitalizing the first
    letter of each subsequent word without spaces or underscores.
]]

	-- Insert the text at the beginning of the buffer
	vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(textToInsert, "\n"))

	appendedQuestions = [[

1. Please create a Python script that adheres closely to the Airbnb JavaScript Style Guide. The code should exhibit strong adherence to clean code principles, ensuring readability, maintainability, and comprehensibility. Please adhere to the following specific requirements:
2. Line Length Limitation: Ensure that each line of code does not exceed 79 characters. This promotes readability and allows for easier navigation of the code in various text editors.
3. Make certain that the code is in python

]]

	local buffer = 0 -- Use 0 for the current buffer
	local totalLines = vim.api.nvim_buf_line_count(buffer)

	-- Insert the text at the last line of the buffer
	vim.api.nvim_buf_set_lines(buffer, totalLines, totalLines, false, vim.split(appendedQuestions, "\n"))

	-- Go to the end of the line
	vim.api.nvim_feedkeys("G$", "n", false)
end
--}}
