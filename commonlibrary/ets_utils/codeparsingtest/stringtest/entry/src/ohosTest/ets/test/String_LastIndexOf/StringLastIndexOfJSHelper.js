/*
* Copyright (C) 2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

export function testArrayParam001() {
  let result = '1,2,3'.lastIndexOf([1, 2, 3]);
  return { result, expected: 0 };
}

export function testArrayParam002() {
  let result = 'test1,2,3test'.lastIndexOf([1, 2, 3]);
  return { result, expected: 4 };
}

export function testArrayParam003() {
  let result = 'a,b,c'.lastIndexOf(['a', 'b', 'c']);
  return { result, expected: 0 };
}

export function testDateParam001() {
  let date = new Date('2020-01-01');
  let dateStr = date.toString();
  let result = dateStr.lastIndexOf(date);
  return { result, expected: 0 };
}

export function testNullParam001() {
  let result = 'null value'.lastIndexOf(null);
  return { result, expected: 0 };
}

export function testNullParam002() {
  let result = 'testnulltest'.lastIndexOf(null);
  return { result, expected: 4 };
}

export function testNullParam003() {
  let result = 'is null'.lastIndexOf(null);
  return { result, expected: 3 };
}

export function testUndefinedParam001() {
  let result = 'undefined'.lastIndexOf(undefined);
  return { result, expected: 0 };
}

export function testUndefinedParam002() {
  let result = 'is undefined'.lastIndexOf(undefined);
  return { result, expected: 3 };
}

export function testUndefinedParam003() {
  let result = 'test undefined test'.lastIndexOf(undefined);
  return { result, expected: 5 };
}

export function testNoParam001() {
  let result = 'undefined'.lastIndexOf();
  return { result, expected: 0 };
}

export function testNoParam002() {
  let result = 'test undefined'.lastIndexOf();
  return { result, expected: 5 };
}

export function testNoParam003() {
  let result = 'hello'.lastIndexOf();
  return { result, expected: -1 };
}

export function testIntParam001() {
  let result = '123456'.lastIndexOf(3);
  return { result, expected: 2 };
}

export function testIntParam002() {
  let result = 'test123test'.lastIndexOf(123);
  return { result, expected: 4 };
}

export function testIntParam003() {
  let result = '2019-12-31'.lastIndexOf(31);
  return { result, expected: 8 };
}

export function testFloatParam001() {
  let result = '3.14'.lastIndexOf(3.14);
  return { result, expected: 0 };
}

export function testFloatParam002() {
  let result = 'value: 2.5'.lastIndexOf(2.5);
  return { result, expected: 7 };
}

export function testFloatParam003() {
  let result = 'test1.5test'.lastIndexOf(1.5);
  return { result, expected: 4 };
}

export function testNegativeParam001() {
  let result = 'temp: -5'.lastIndexOf(-5);
  return { result, expected: 6 };
}

export function testNegativeParam002() {
  let result = '-10-20-30'.lastIndexOf(-20);
  return { result, expected: 3 };
}

export function testNegativeParam003() {
  let result = 'value:-1.5'.lastIndexOf(-1.5);
  return { result, expected: 6 };
}

export function testTrueParam001() {
  let result = 'true or false'.lastIndexOf(true);
  return { result, expected: 0 };
}

export function testTrueParam002() {
  let result = 'istrue'.lastIndexOf(true);
  return { result, expected: 2 };
}

export function testTrueParam003() {
  let result = 'test true test'.lastIndexOf(true);
  return { result, expected: 5 };
}

export function testFalseParam001() {
  let result = 'true or false'.lastIndexOf(false);
  return { result, expected: 8 };
}

export function testFalseParam002() {
  let result = 'isfalse'.lastIndexOf(false);
  return { result, expected: 2 };
}

export function testFalseParam003() {
  let result = 'test false test'.lastIndexOf(false);
  return { result, expected: 5 };
}

export function testObjParam001() {
  let obj = { toString() { return 'test'; } };
  let result = 'this is a test'.lastIndexOf(obj);
  return { result, expected: 10 };
}

export function testObjParam002() {
  let obj = { toString() { return 'test'; } };
  let result = 'testtest'.lastIndexOf(obj);
  return { result, expected: 4 };
}

export function testNumToString001() {
  let result = 'value: 123'.lastIndexOf(123);
  return { result, expected: 7 };
}

export function testNumToString002() {
  let result = 'test123test'.lastIndexOf(String(123));
  return { result, expected: 4 };
}

export function testNumToString003() {
  let result = '123456'.lastIndexOf(123);
  return { result, expected: 0 };
}

export function testBoolToString001() {
  let result = 'is true'.lastIndexOf(true);
  return { result, expected: 3 };
}

export function testBoolToString002() {
  let result = 'is false'.lastIndexOf(false);
  return { result, expected: 3 };
}

export function testBoolToString003() {
  let result = String(true).lastIndexOf(true);
  return { result, expected: 0 };
}

export function testStrPosition001() {
  let result = 'hello'.lastIndexOf('l', '3');
  return { result, expected: 3 };
}

export function testStrPosition002() {
  let result = 'hello'.lastIndexOf('l', '2');
  return { result, expected: 2 };
}

export function testStrPosition003() {
  let result = 'test'.lastIndexOf('t', '3');
  return { result, expected: 3 };
}

export function testBoolPosition001() {
  let result = 'hello'.lastIndexOf('h', true);
  return { result, expected: 0 };
}

export function testBoolPosition002() {
  let result = 'hello'.lastIndexOf('h', false);
  return { result, expected: 0 };
}

export function testBoolPosition003() {
  let result = 'hello'.lastIndexOf('e', false);
  return { result, expected: -1 };
}

export function testRegexMatch001() {
  let str = 'test1 test2 test3';
  let lastIndex = str.lastIndexOf('test');
  let matches = str.match(/test/g);
  let lastMatch = matches ? matches[matches.length - 1] : null;
  return { lastIndex, lastMatch, expectedIndex: 12, expectedMatch: 'test' };
}

export function testRegexSearch001() {
  let str = 'test.test.test';
  let lastIndexOf = str.lastIndexOf('.');
  let searchResult = str.search(/\./g);
  return { lastIndexOf, searchResult, expectedLast: 9, expectedSearch: 4 };
}
