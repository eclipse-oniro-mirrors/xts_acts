/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export function testStringWithTrailingSpaces(){
    let str = "Hello World   ";
    let result = str.trimEnd();
    return result;
}
export function testMultiSpacesBetweenWords() {
    let str = "Hello    World   ";
    let result = str.trimEnd();
    return result;
}
export function testStringObjReturnPrimitive() {
    let strObj = new String("Hello   ");
     let result = strObj.trimEnd();
    return result;
}
export function testRecursivelyGeneratedString() {

    function buildStr(n) {
        if (n === 0) return "";
        return n + " " + buildStr(n - 1);
    }
    let str = buildStr(3) + "   ";
    let result = str.trimEnd();
    return result;
}

export function testParamIgnoredByPassing() {

    let str = "Hello   ";
    let result = str.trimEnd(" World");
    return result;
}
export function testMultiParamPassing() {

    let str = "Hello   ";
    let result = str.trimEnd("a", "b", "c");
    return result;
}
export function testCleanUserInput() {
    let userInput = "Hello World  ";
    function cleanUserInput(input) {
        return input.trimEnd();
    }
    let result = cleanUserInput(userInput);
    return result;
}
export function testProcessMultiLineText() {
    function cleanMultiLineText(text) {
        return text.split("\n").map(line => line.trimEnd()).join("\n");
    }
    let text = "Line 1   \nLine 2   \nLine 3   ";
    const result = cleanMultiLineText(text);
    return result;
}
export function testProcessCsvData() {
    function cleanCSV(csvLine) {
        return csvLine.split(",").map(field => field.trimEnd()).join(",");
    }
    let csvLine = "John, Doe, 30   ";
    return cleanCSV(csvLine);
}
export function testFormatCodeString() {
    function formatCode(code) {
        return code.split("\n").map(line => line.trimEnd()).join("\n");
    }
    let code = "function hello() {   \n  return 'world';   \n}   ";
    return formatCode(code);
}
export function testCleanFilePath() {
    function cleanFilePath(path) {
        return path.trimEnd();
    }
    let filePath = "/home/user/documents   ";
    return cleanFilePath(filePath);
}
export function testProcessUrlString() {
    function cleanURL(url) {
        return url.trimEnd();
    }
    let url = "https://example.com/path   ";
    return cleanURL(url);
}
export function testCleanLogLine() {

    function cleanLogLine(log) {
        return log.trimEnd();
    }

    let logLine = "[ERROR] Connection failed   ";
    return cleanLogLine(logLine);
}
    export function testCheckUsername() {
        function validateUsername(username) {
            let cleaned = username.trimEnd();
            return cleaned.length >= 3 && cleaned.length <= 20;
        }
        return [validateUsername("john   "), validateUsername("ab   ")];
}
export function testValidateEmail() {
    function validateEmail(email) {
        let cleaned = email.trimEnd();
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(cleaned);
    }
    return [validateEmail("user@example.com   "), validateEmail("invalid-email   ")];
}
export function testPreTrimCompareStr() {
    function compareStrings(str1, str2) {
        return str1.trimEnd() === str2.trimEnd();
    }
    return [compareStrings("Hello   ", "Hello"), compareStrings("Hello   ", "World   ")];
}
export function testPreCleanDbData() {
    function prepareForStorage(data) {
        if (typeof data === "string") {
            return data.trimEnd();
        }
        return data;
    }
    return [prepareForStorage("Hello World   "), prepareForStorage(123)];
}
export function testAutoCleanLineEndSpaces() {
    function autoCleanTrailingSpaces(text) {
        return text.split("\n").map(line => line.trimEnd()).join("\n");
    }
    let codeText = "function test() {   \n  return true;   \n}   ";
    return autoCleanTrailingSpaces(codeText);
}
export function testPreserveIndentTrimLineEnd() {
    function cleanTrailingKeepIndent(text) {
        return text.split("\n").map(line => line.trimEnd()).join("\n");
    }
    let indentedText = "    indented line   \n        more indented   ";
    return cleanTrailingKeepIndent(indentedText);
}
export function testReturnTypeIsString() {
    let str = "Hello   ";
    let result = str.trimEnd();
    return [typeof result, result instanceof String];
}




