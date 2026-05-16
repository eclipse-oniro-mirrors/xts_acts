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
export function testReplaceAllChars(){
    'use strict';
    const str = "hello";
    const result = str.replaceAll("l", "L");
    const chars = [...str];
    return [ result, chars ];
}

export function testTrimSplit() {
    'use strict';
    const str = "  hello world  ";
    const result = str.trim().split(" ");
    return result;
}

export function testTrimMatch() {
    'use strict';
    const str = "  hello123  ";
    const result = str.trim().match(/\d+/);
    return result[0];
}

export function testClearUsername(input){
    const username = input.trim();
    if (username.length === 0) {
        return "用户名不能为空";
    }
    if (username.length < 3) {
        return "用户名至少3个字符";
    }
    return "用户名有效: " + username;
}

export function testValidateEmail(input) {
    const email = input.trim().toLowerCase();
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

export function testCleanedData() {
    const data = {
        name: "  John  ",
        email: "  john@example.com  "
    };
    const cleanedData = {
        name: data.name.trim(),
        email: data.email.trim()
    };
    return cleanedData;
}

export function testSearchProducts(keyword) {
    const cleanKeyword = keyword.trim().toLowerCase();
    const products = ["iPhone", "iPad", "MacBook"];
    return products.filter(p =>
    p.toLowerCase().includes(cleanKeyword)
    );
}

export function testParseTags(input) {
    return input.split(",")
        .map(tag => tag.trim())
        .filter(tag => tag.length > 0);
}

export function testCompareIgnoreWhitespace(str1, str2) {
    return str1.trim() === str2.trim();
}

export function testCaseAndWhitespace(str1, str2) {
    return str1.trim().toLowerCase() === str2.trim().toLowerCase();
}

export function testNonEmptyString(input) {
    return input.trim().length > 0;
}

export function testDateRequired(value, fieldName) {
    if (!value || value.trim().length === 0) {
        return fieldName + " 是必填项";
    }
    return null;
}

export function testCleanUrlParams(params) {
    const cleanParams = {};
    for (const [key, value] of Object.entries(params)) {
        cleanParams[key.trim()] = value.trim();
    }
    return cleanParams;
}

export function testSanitizeFilename(filename) {
    return filename.trim().replace(/\s+/g, "_");
}

export function testHasOwnProperty() {
    const str = "  test  ";
    return str.hasOwnProperty('trim');
}

export function testHasOwnProperty1() {
    return String.prototype.hasOwnProperty('trim');
}

export function testHasOwnProperty2() {
    const str = "  test  ";
    return str.trim === String.prototype.trim;
}

export function testTrimParamLength() {
    return String.prototype.trim.length;
}

export function testTrimMethodName() {
    return String.prototype.trim.name;
}

export function testOwnPropertyDescriptor() {
    const descriptor = Object.getOwnPropertyDescriptor(
        String.prototype, 'trim'
    );
    return [descriptor.enumerable,descriptor.writable,descriptor.writable];
}

export function testTrimCall(input) {
    return String.prototype.trim.call(input);
}

export function testTrimApply(input) {
    return String.prototype.trim.apply(input);
}

export function testTrimCallBind() {
    const arrayLike = {
        0: "  test  ",
        length: 1
    };
    return Array.prototype.map.call(
        arrayLike,
        String.prototype.trim.call.bind(String.prototype.trim)
    );
}

export function testTrimCallObj() {
    const obj = {toString: () => "  test  "};
    return String.prototype.trim.call(obj);
}

export function testTrim(input,input1,input2) {
    const str = "  test  ";
    return str.trim(input,input1,input2);
}

export function testTrim1() {
    const str = `
      line1
      line2
      `;
    return str.trim();
}

export function testTrimBool() {
    const strObj = new String("  test  ");
    const result = strObj.trim();
    return result instanceof String;
}

export function testCatchTrim() {
    'use strict';
    try {
        String.prototype.trim.call(null);
    } catch (e) {
        return e.message;
    }
}

export function testTrimCallObj1() {
    const obj = {
        toString() {
            return "  test  ";
        }
    };
    return String.prototype.trim.call(obj);
}
