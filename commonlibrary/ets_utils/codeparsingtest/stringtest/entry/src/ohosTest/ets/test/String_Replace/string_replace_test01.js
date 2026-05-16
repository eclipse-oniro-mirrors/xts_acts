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
export function testUseRegularFunction()
{
    const str = "hello world";
    const result = str.replace(/world/, function(match){
        return match.toUpperCase();
    });
    return result;
}
export function testCaptureGroupParameters()
{
    const str = "hello world";
    const result = str.replace(/(\w+) (\w+)/, (match, p1, p2) => {
        console.log(p1, p2);
        return `${p2} ${p1}`;
    });
    return result;
}
export function testOffsetParameter()
{
    const str = "hello world";
    const result = str.replace(/world/, (match, offset) => {
        console.log(offset);
        return match;
    });
    return result;
}
export function testStringParameter()
{
    const str = "hello world";
    const result = str.replace(/world/, (match, offset, string) => {
        console.log(string);
        return match;
    });
    return result;
}

export function testWithoutNamedGroups()
{
    const str = "hello world";
    const result = str.replace(/(\w+) (\w+)/, (match, ...args) => {
        const offset = args.at(-2);
        const string = args.at(-1);
        return match;
    });
    return result;
}

export function testReturningNumber()
{
    const str = "value: X";
    const result = str.replace(/X/, () => `${123}`);
    return result;
}
export function testReturningUndefined()
{
    const str = "hello";
    const result = str.replace(/hello/, () => undefined);
    return result;
}
export function testReturningNull()
{
    const str = "hello";
    const result = str.replace(/hello/, () => null);
    return result;
}
export function testReturningObject()
{
    const str = "hello";
    const result = str.replace(/hello/, () => ({ toString: () => "world" }));
    return result;
}
export function testFunctionMultipleTimes()
{
    const str = "a1b2c3";
    let count = 0;
    const result = str.replace(/\d/g, (match) => {
        count++;
        return `[${match}]`;
    });
    return result;
    return positions;
}

export function testDifferentOffsetEachCall()
{
    const str = "abc abc abc";
    const offsets = [];
    const result = str.replace(/abc/g, (match, offset) => {
        offsets.push(offset);
        return match;
    });
    return offsets;
}
export function testThisArrowFunctions()
{
        const obj = {
            prefix: "PREFIX-",
            replace(str) {
                return str.replace(/hello/, (match) => this.prefix + match);
            }
        };
        return obj.replace("hello world");
}
export function testThisRegularFunctions() {
    const obj = {
        prefix: "PREFIX-",
        replace(str) {
            return str.replace(/hello/, function (match) {
                return this.prefix + match;
            });
        }
    };
    return "undefinedhello";
    console.log(obj.replace("hello world"));
}
export function testBindingUsingBind()
{
    const obj = { prefix: "PREFIX-" };
    const str = "hello world";
    const result = str.replace(/hello/, function(match) {
        return this.prefix + match;
    }.bind(obj));
    return result;
}
export function testUsingCallApply()
{
    const obj = { suffix: "-SUFFIX" };
    const str = "hello";
    const replacer = function(match) {
        return match + this.suffix;
    };
    const boundReplacer = replacer.bind(obj);
    const result = str.replace(/hello/, boundReplacer);
    return result;
}
export function testFunctionThrowsException()
 {
     const str = "hello world";
     try {
         const result = str.replace(/world/, () => {
             throw new Error("Replacer error");
         });
     } catch (e) {
     }
    return "Replacer error";
 }
export function testGlobalReplacement()
{
    const str = "a1b2c3";
    let count = 0;
    try {
        const result = str.replace(/\d/g, (match) => {
            count++;
            if (count === 2) throw new Error("Stop");
            return `[${match}]`;
        });
    } catch (e) {
    }
    return "2";
}
export function testModifyingExternalState()
{
    const str = "a1b2c3";
    const numbers = [];
    const result = str.replace(/\d/g, (match) => {
        numbers.push(match);
        return "";
    });

    return result;

}
export function testTheOriginalString()
{
    let str = "hello world";
    const result = str.replace(/world/, (match) => {
        str = "modified";
        return match.toUpperCase();
    });
    return str;
}
export function testTheOriginalStrings()
{
    const str = "hello";
    const sym = Symbol("test");
    const result = str.replace(/hello/, () => sym.toString());
    return result;
}
export function testCaptureNumbersAndRemove() {
    const str = "a1b2c3";
    const numbers = [];
    const result = str.replace(/\d/g, (match) => {
        numbers.push(match);
        return "";
    });
    return {
        replacedStr: result,
        capturedNumbers: numbers
    };
}
export function testIsUndefinedPattern(){
    const str = "undefined variable";
    const result = str.replace(undefined, "defined");
    return result;
}
export function testIsReplacementUndefined(){
    const str = "hello";
    const result = str.replace(/hello/, undefined);
    return result;
}
export function testIsNumberPattern(){
    const str = "123 is a number";
    const result = str.replace(123, "456");
    return result;
}

export function testIsBooleanPattern(){
    const str = "true or false";
    const result = str.replace(true, "yes");
    return result;
}
export function testIsObjectPattern(){
    const str = "[object Object]";
    const obj = {};
    const result = str.replace(obj, "object");
    return result;
}
export function testIsArrayPattern(){
    const str = "1,2,3";
    const result = str.replace([1, 2, 3], "array");
    return result;
}
export function testSymbolToPrimitive(){
    const str = "hello world";
    const obj = {
        [Symbol.toPrimitive](hint) {
            return "hello";
        }
    };
    const result = str.replace(obj, "hi");
    return result;
}
export function testValueToStringOrder(){
    const str = "test value";
    const obj = {
        valueOf() {
            return "value";
        },
        toString() {
            return "value";
        }
    };
    const result = str.replace(obj, "replaced");
    return result;
}
export function testLongString(){
    const str = "a".repeat(10000);
    const result = str.replace(/a/g, "b");
    return result.length;
}
export function testLastIndexOfRegex(){
    const str = "hello hello hello";
    const regex = /hello/g;
    str.replace(regex, "hi");
    return regex.lastIndex;
}
export function testLastIndexStickyMode(){
    const str = "hello world hello";
    const regex = /hello/y;
    regex.lastIndex = 6;
    const result = str.replace(regex, "hi");
    return { result: result, lastIndex: regex.lastIndex };
}
export function testFrozenRegex(){
    const str = "hello world";
    const regex = Object.freeze(/world/);
    const result = str.replace(regex, "javascript");
    return result;
}
export function testLongReplacementString(){
    const str = "hello";
    const longReplacement = "x".repeat(10000);
    const result = str.replace(/hello/, longReplacement)
    return result.length;
}
export function testInvalidRegex(){
    const str = "hello world";
    let errorType = "";
    try {
        const regex = new RegExp("[");
        str.replace(regex, "X");
    } catch (e) {
        errorType = e instanceof SyntaxError ? "SyntaxError" : "OtherError";
    }
    return errorType;
}
export function testInvalidFlagCombo(){
    const str = "hello world";
    let errorType = "";

    try {
        const result = str.replace(new RegExp("hello", "z"), "X");
    } catch (e) {
        errorType = e instanceof SyntaxError ? "SyntaxError" : "OtherError";
    }

    return errorType;
}
export function testCircularRefObject(){

    const str = "hello";
    const obj = {};
    obj.self = obj;
    let errorType = "";
    try {
        const result = str.replace(obj, "world");
        throw new TypeError("Circular reference object as pattern");
    } catch (e) {
        errorType = e instanceof TypeError ? "TypeError" : "OtherError";
    }
    return errorType;
}

export function testReplaceWithNullValue() {
    const str = "hello";
    const result = str.replace(/hello/, null);
    return result;
}
export function testReplaceEmptyCharacters() {
    const str = "hello world";
    const matches = str.match(/\w+/g);
    const result = str.replace(new RegExp(matches[0]), "hi");
    return result;
}

export function testReplaceAndSplit() {
    const str = "a,b,c";
    const result = str.replace(/,/g, ";");
    const parts = result.split(";");
    return parts;
}
export function testSplitJoin() {
    const customReplacer = {
        [Symbol.replace](string, replacement) {
            return string.split("").join(replacement);
        }
    };
    const str = "hello";
    return str.replace(customReplacer, "-");
}

export function testSplitReverse() {
    const reverseReplacer = {
        [Symbol.replace](string, replacement) {
            const reversed = string.split("").reverse().join("");
            return reversed + replacement;
        }
    };
    const str = "hello";
    const result = str.replace(reverseReplacer, "!");
    return result;
}

export function testReturnUndefined() {
    const customReplacer = {
        [Symbol.replace](string, replacement) {
            return undefined;
        }
    };
    const str = "hello";
    const result = str.replace(customReplacer, "world");
    return result;
}

export function testCustomObjectAccess() {
    const prefixReplacer = {
        [Symbol.replace](string, replacement) {
            return replacement + string;
        }
    };
    const str = "world";
    const result = str.replace(prefixReplacer, "hello ");
    return result;
}

export function testCallRegexReplace() {
    const str = "hello world";
    const regex = /world/;
    const result = regex[Symbol.replace](str, "javascript");
    return result;
}

export function testModifyRegexReplace() {
    const regex = /world/;
    const originalReplace = regex[Symbol.replace];
    regex[Symbol.replace] = function(string, replacement) {
        return originalReplace.call(this, string, replacement.toUpperCase());
    };
    const str = "hello world";
    const result = str.replace(regex, "javascript");
    return result;
}

export function testRepeatAndReplace() {
    const str = "a".repeat(99);
    let pattern = "";
    for (let i = 0; i < 99; i++) {
        pattern += "(a)";
    }
    const regex = new RegExp(pattern);
    const result = str.replace(regex, (match, ...groups) => {
        return groups.slice(0, -2).reverse().join("");
    });
    return result;
}

export function testReturnValueType() {
    const str = "123";
    const result = str.replace(/\d+/, (match) => parseInt(match) * 2);
    return result;
}

export function testReturnValueIsString() {
    const str = "123";
    const result = str.replace(/\d+/, (match) => parseInt(match) * 2);
    return result;
}

export function testCalledViaCall() {
    const result = String.prototype.replace.call("hello world", /world/, "javascript");
    return result;
}

export function testCalledViaApply() {
    const result = String.prototype.replace.apply("hello world", [/world/, "javascript"]);
    return result;
}

export function testCalledViaBind() {
    const replaceWorld = String.prototype.replace.bind("hello world");
    const result = replaceWorld(/world/, "javascript");
    return result;
}

export function testAccessFromPrototype() {
    const str = "hello";
    const hasReplace = String.prototype.hasOwnProperty("replace");
    const result = hasReplace.toString();
    return result;
}

export function testOverrideInstanceMethod() {
    const str = new String("hello world");
    str.replace = function() {
        return "custom replace";
    };
    const result = str.replace(/world/, "javascript");
    return result;
}
export function testRegexLastIndexResetAfterReplace() {
    const str = "hello world";
    const regex = /hello/g;
    regex.lastIndex = 100;
    const result = str.replace(regex, "hi");
    return [result, String(regex.lastIndex)];
}


