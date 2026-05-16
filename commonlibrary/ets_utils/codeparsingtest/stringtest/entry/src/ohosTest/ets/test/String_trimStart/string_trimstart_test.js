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
export function testResultTypeof() {
    let str = "   test";
    let result = str.trimStart();
    return typeof result;
}
export function testResultInstanceof() {
    let str = "   test";
    let result = str.trimStart();
    return result instanceof String;
}
export function testCallNum() {
    let num = 123;
    let result = String.prototype.trimStart.call(num);
    return result;
}
export function testCallObj() {
    let obj = {toString: () => "   test"};
    let result = String.prototype.trimStart.call(obj);
    return result;
}
export function testCallArr() {
    let arr = ["   a", "b   "];
    let result = String.prototype.trimStart.call(arr);
    return result;
}
export function testCallSym() {
    let sym = Symbol("test");
    let result;
    try {
        result = String.prototype.trimStart.call(sym);
    } catch(e) {
        result = e instanceof TypeError;
    }
    return result;
}
export function testCallHint() {
    let obj = {
        [Symbol.toPrimitive](hint) {
            return "   custom";
        }
    };
    let result = String.prototype.trimStart.call(obj);
    return result;
}
export function testCallUndefined() {
    let result;
    try {
        result = String.prototype.trimStart.call(undefined);
    } catch(e) {
        result = e instanceof TypeError;
    }
    return result;
}
export function testCallNumber() {
    let result = String.prototype.trimStart.call(123);
    return result;
}
export function testTrimStartIgnored() {
    let str = "   test";
    let result = str.trimStart("ignored");
    return result;
}
export function testTrimStartNumber() {
    let str = "   test";
    let result = str.trimStart(1, 2, 3);
    return result;
}
export function testUserInput() {
    function processInput(input) {
        return input.trimStart();
    }
    let userInput = "   user@example.com";
    return processInput(userInput);
}
export function testEndInput() {
    function preserveEndSpace(input) {
        return input.trimStart();
    }
    let input = "   text   ";
    return preserveEndSpace(input);
}
export function testFormatCode() {
    function formatCode(code) {
        return code.trimStart();
    }
    let code = "   function test() { return 1; }";
    return formatCode(code);
}
export function testCsvFields() {
    function cleanCSVField(field) {
        return field.trimStart();
    }
    let csvLine = "  value1,  value2,  value3";
    let fields = csvLine.split(',').map(cleanCSVField);
    return fields;
}
export function testJsonStr() {
    let jsonStr = '{"name": "  John", "email": "  john@example.com"}';
    let data = JSON.parse(jsonStr);
    let cleaned = {
        name: data.name.trimStart(),
        email: data.email.trimStart()
    };
    return cleaned;
}
export function testTemplateStr() {
    function processTemplate(strings, ...values) {
        return strings[0].trimStart();
    }
    let name = "World";
    let result = processTemplate`   Hello ${name}`;
    return result;
}
export function testHtmlText() {
    function cleanHTMLText(text) {
        return text.trimStart();
    }
    let htmlText = "   <p>Content</p>";
    return cleanHTMLText(htmlText);
}
export function testFilePath() {
    function cleanPath(path) {
        return path.trimStart();
    }
    let filePath = "   /user/home/document.txt";
    return cleanPath(filePath);
}
export function testCleanUrl() {
    function cleanURL(url) {
        return url.trimStart();
    }
    let url = "   https://example.com/path";
    return cleanURL(url);
}
export function testFrozenString() {
    let frozenStr = Object.freeze(new String("  test"));
    let result = frozenStr.trimStart();
    let isFrozen = Object.isFrozen(frozenStr);
    return { trimmed: result, isFrozen };
}
export function testFrozenOriginalStr() {
    let frozenPrimitive = Object.freeze("   test");
    let result = frozenPrimitive.trimStart();
    return result;
}
export function testSealedString() {
    let sealedStr = Object.seal(new String("   test"));
    let result = sealedStr.trimStart();
    let isSealed = Object.isSealed(sealedStr);
    return { trimmed: result, isSealed };
}
export function testStringProxy() {
    let target = new String("  test");
    let proxy = new Proxy(target, {
        get(target, prop) {
            if (prop === 'trimStart') {
                return target.trimStart.bind(target);
            }
            return Reflect.get(target, prop);
        }
    });
    let result = proxy.trimStart();
    return result;
}
export function testStringGetter() {
    let obj = {
        get text() {
            return "   test";
        }
    };
    let result = obj.text.trimStart();
    return result;
}
export function testSetterrTrimStart() {
    let obj = {
        _text: "",
        set text(value) {
            this._text = value.trimStart();
        },
        get text() {
            return this._text;
        }
    };
    obj.text = "   test";
    return obj.text;
}
export function testInheritedMethod() {
    let str = "   test";
    const hasOwnOnInstance = str.hasOwnProperty('trimStart');
    const hasOwnOnPrototype = String.prototype.hasOwnProperty('trimStart');
    return {
        hasOwnOnInstance,
        hasOwnOnPrototype
    };
}
export function testVerifyRelationship() {
    let str = "   test";
    const hasOwnOnInstance = String.prototype.isPrototypeOf(str);
    const hasOwnOnPrototype = String.prototype.isPrototypeOf(new String(str));
    return {
        hasOwnOnInstance,
        hasOwnOnPrototype
    };
}
export function testCustomClassStr() {
    let result;
    class MyString extends String {
        constructor(value) {
            super(value);
        }
    }
    let myStr = new MyString("   test");
    let result1 = myStr.trimStart();
    let result2 = result instanceof MyString;
    return {
        result1,result2
    }
}
export function testCoverageMethod() {
    class CustomString extends String {
        trimStart() {
            return "Custom: " + super.trimStart();
        }
    }
    let customStr = new CustomString("   test");
    let result = customStr.trimStart();
    return result;
}
export function testPrototypeMethod() {
    let originalTrimStart = String.prototype.trimStart;
    let result;
    try {
        String.prototype.trimStart = function() {
            return "Modified: " + originalTrimStart.call(this);
        };
        let str = "   test";
        result = str.trimStart();
    } finally {
        String.prototype.trimStart = originalTrimStart;
    }
    return result;
}
export function testRestoringPrototypeMethod() {
    let saved = String.prototype.trimStart;
    let result = false;
    try {
        delete String.prototype.trimStart;
        let str = "   test";
        str.trimStart();
    } catch(e) {
        result = e instanceof TypeError;
    } finally {
        String.prototype.trimStart = saved;
    }
    return result;
}
export function testFunctionLength() {
    return String.prototype.trimStart.length;
}
export function testCallTrimStart() {
    let result = String.prototype.trimStart.call("   test");
    return result;
}
export function testApplyTrimStart() {
    let result = String.prototype.trimStart.apply("   test");
    return result;
}
export function testBindTrimStart() {
    let boundTrimStart = String.prototype.trimStart.bind("   test");
    let result = boundTrimStart();
    return result;
}
export function testTypeTrimStart() {
    return typeof String.prototype.trimStart;
}
export function testInstanceOfFunction() {
    return String.prototype.trimStart instanceof Function;
}
export function testConvertingToString() {
    let funcStr = String.prototype.trimStart.toString();
    let result1 = typeof funcStr;
    let result2 = funcStr.includes('trimStart');
    return {result1,result2};
}
export function testLiteralUsing() {
    let obj = {
        toString() {
            return "   test";
        }
    };
    let result = String.prototype.trimStart.call(obj);
    return result;
}
export function tesCustomObject() {
    function CustomObj(value) {
        this.value = value;
    }
    CustomObj.prototype.toString = function() {
        return this.value;
    };
    let customObj = new CustomObj("   test");
    let result = String.prototype.trimStart.call(customObj);
    return result;
}
export function tesDataObject() {
    let date = new Date("   2024-01-01");
    let result = String.prototype.trimStart.call(date);
    return result;
}
export function tesRegExpObject() {
    let regex = /   test/;
    let result = String.prototype.trimStart.call(regex);
    let result1 = typeof result;
    let result2 = result.includes('test');
    return {result1,result2};
}
export function tesBooleanObject() {
    let bool = new Boolean(true);
    let result = String.prototype.trimStart.call(bool);
    return result;
}