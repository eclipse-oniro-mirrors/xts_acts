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

export function test001() {
  const str = "test1test2test3";
  const regexp = /test\d/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3,
    match0: matches[0][0],
    match1: matches[1][0],
    match2: matches[2][0]
  };
}

export function test002() {
  const str = "hello world";
  const regexp = /\d+/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 0
  };
}

export function test003() {
  const str = "only one match";
  const regexp = /only/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

export function test004() {
  const str = "aaa";
  const regexp = /a/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3
  };
}

export function test005() {
  const str = "test1test2";
  const regexp = /test\d/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

export function test006() {
  const str = "a1b2c3";
  const regexp = /[a-z]\d/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3
  };
}

export function test007() {
  const str = "foo1foo2";
  const regexp = /foo\d/g;
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2
  };
}

export function test008() {
  const str = "test1test2";
  const regexp = /test\d/g;
  const iterator = str.matchAll(regexp);
  const first = [...iterator];
  const second = [...iterator];
  return {
    firstLength: first.length,
    secondLength: second.length
  };
}

export function test009() {
  const str = "ab";
  const regexp = /./g;
  const iterator = str.matchAll(regexp);
  const result1 = iterator.next();
  const result2 = iterator.next();
  const result3 = iterator.next();
  return {
    result1Value: result1.value[0],
    result1Done: result1.done,
    result2Value: result2.value[0],
    result2Done: result2.done,
    result3Done: result3.done
  };
}

export function test010() {
  const str = "";
  const regexp = /test/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 0
  };
}

export function test011() {
  const str = "";
  const regexp = /(?:)/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 1,
    match0Index: matches[0].index
  };
}

export function test012() {
  const str = "a";
  const regexp = /a/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

export function test013() {
  const str = "a".repeat(10000);
  const regexp = /a/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 10000
  };
}

export function test014() {
  const str = "line1\nline2\nline3";
  const regexp = /line\d/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3
  };
}

export function test015() {
  const str = "col1\tcol2\tcol3";
  const regexp = /col\d/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3
  };
}

export function test016() {
  const str = "hello world";
  const regexp = /^hello/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 1,
    match0Index: matches[0].index
  };
}

export function test017() {
  const str = "hello world";
  const regexp = /world$/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 1,
    match0Index: matches[0].index
  };
}

export function test018() {
  const str = "cat catfish category";
  const regexp = /\bcat\b/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

export function test019() {
  const str = "cat catfish";
  const regexp = /\Bcat\B/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 0
  };
}

export function test020() {
  const str = "test1test2";
  const regexp = /test\d/g;
  regexp.lastIndex = 5;
  const matches = [...str.matchAll(regexp)];
  return {
    matchesLength: matches.length,
    lastIndex: regexp.lastIndex,
    expectedLength: 1
  };
}

export function test021() {
  const str = "test";
  const regexp = /test/;
  try {
    str.matchAll(regexp);
    return { isTypeError: false };
  } catch (e) {
    return { isTypeError: e instanceof TypeError };
  }
}

export function test022() {
  const str = "test";
  try {
    const regexp = new RegExp("[");
    str.matchAll(regexp);
    return { isSyntaxError: false };
  } catch (e) {
    return { isSyntaxError: e instanceof SyntaxError };
  }
}

export function test023() {
  const str = "test1test2";
  const regexp = /test\d/g;
  const matchResult = str.match(regexp);
  const matchAllResult = [...str.matchAll(regexp)];
  return {
    matchResult: matchResult,
    matchAllLength: matchAllResult.length,
    matchAll0: matchAllResult[0][0],
    matchAllIndex: matchAllResult[0].index
  };
}

export function test024() {
  const str = "test1test2";
  const regexp = /test\d/g;
  const execResults = [];
  let match;
  while ((match = regexp.exec(str)) !== null) {
    execResults.push(match);
  }
  const matchAllResults = [...str.matchAll(/test\d/g)];
  return {
    execLength: execResults.length,
    matchAllLength: matchAllResults.length
  };
}

export function test025() {
  const str = "test1test2";
  const regexp = /test\d/g;
  regexp.lastIndex = 5;
  const match = regexp.exec(str);
  return {
    match0: match[0],
    matchIndex: match.index
  };
}

export function test026() {
  const str = "test1test2";
  const regexp = /test\d/g;
  regexp.lastIndex = 5;
  const matches = [...str.matchAll(regexp)];
  return {
    matchesLength: matches.length,
    lastIndex: regexp.lastIndex,
    expectedLength: 1
  };
}

export function test027() {
  const str = "aaa";
  const regexp = /a+/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

export function test028() {
  const str = "aaa";
  const regexp = /a+?/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3,
    match0: matches[0][0]
  };
}

export function test029() {
  const str = "a aa aaa aaaa";
  const regexp = /a{2,3}/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3,
    match0: matches[0][0],
    match1: matches[1][0],
    match2: matches[2][0]
  };
}

export function test030() {
  const str = "a aa aaa";
  const regexp = /a{2}/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0]
  };
}

export function test031() {
  const str = "a1b2c3";
  const regexp = /[a-z]/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3,
    match0: matches[0][0]
  };
}

export function test032() {
  const str = "a1b2c3";
  const regexp = /[^a-z]/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3,
    match0: matches[0][0]
  };
}

export function test033() {
  const str = "a1 b2 c3";
  const regexp = /\d/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3,
    match0: matches[0][0]
  };
}

export function test034() {
  const str = "test1 test2 test";
  const regexp = /test(?=\d)/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0]
  };
}

export function test035() {
  const str = "test1 test2 test";
  const regexp = /test(?!\d)/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 1,
    match0Index: matches[0].index
  };
}

export function test036() {
  const str = "$100 €200";
  const regexp = /(?<=\$)\d+/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

export function test037() {
  const str = "$100 €200";
  const regexp = /(?<!\$)\d+/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0]
  };
}

export function test038() {
  const str = "test@example.com and admin@test.org";
  const regexp = /[\w.-]+@[\w.-]+\.\w+/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

export function test039() {
  const str = "Visit https://example.com and http://test.org";
  const regexp = /https?:\/\/[\w.-]+/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

export function test040() {
  const str = "<div>content</div><span>text</span>";
  const regexp = /<\/?(\w+)>/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 4,
    match0: matches[0][0],
    match1: matches[1][1]
  };
}

export function test041() {
  const str = "Phone: 123-456-7890 or 987.654.3210";
  const regexp = /\d{3}[-.]\d{3}[-.]\d{4}/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

export function test042() {
  const str = "IPs: 192.168.1.1 and 10.0.0.1";
  const regexp = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

export function test043() {
  const str = "Visit https://example.com and http://test.org for more info";
  const regexp = /https?:\/\/[^\s]+/g;
  const matches = [...str.matchAll(regexp)];
  const links = matches.map(m => m[0]);
  return {
    result: links.length,
    expected: 2,
    link0: links[0],
    link1: links[1]
  };
}

export function test044() {
  const str = "Contact us at test@example.com or admin@test.org";
  const regexp = /[\w.-]+@[\w.-]+\.\w+/g;
  const matches = [...str.matchAll(regexp)];
  const emails = matches.map(m => m[0]);
  return {
    result: emails.length,
    expected: 2,
    email0: emails[0],
    email1: emails[1]
  };
}

export function test045() {
  const str = "This is #awesome and #cool #javascript";
  const regexp = /#(\w+)/g;
  const matches = [...str.matchAll(regexp)];
  const tags = matches.map(m => m[1]);
  return {
    result: tags.length,
    expected: 3,
    tag0: tags[0],
    tag1: tags[1],
    tag2: tags[2]
  };
}

export function test046() {
  const str = "Hello @john and @jane, how are you?";
  const regexp = /@(\w+)/g;
  const matches = [...str.matchAll(regexp)];
  const mentions = matches.map(m => m[1]);
  return {
    result: mentions.length,
    expected: 2,
    mention0: mentions[0],
    mention1: mentions[1]
  };
}

export function test047() {
  const csv = "name,age,city\nJohn,30,NYC\nJane,25,LA";
  const lines = csv.split("\n");
  const regexp = /([^,]+)/g;
  const data = lines.map(line => {
    const matches = [...line.matchAll(regexp)];
    return matches.map(m => m[0]);
  });
  return {
    result1: data[1].length,
    expected1: 3,
    result1_0: data[1][0],
    result1_1: data[1][1],
    result1_2: data[1][2]
  };
}

export function test048() {
  const str = "name=John;age=30;city=NYC";
  const regexp = /(\w+)=(\w+)/g;
  const matches = [...str.matchAll(regexp)];
  const obj = {};
  matches.forEach(m => {
    obj[m[1]] = m[2];
  });
  return {
    resultName: obj.name,
    resultAge: obj.age,
    resultCity: obj.city
  };
}

export function test049() {
  const code = `function foo() {}
const bar = function() {};
const baz = () => {};`;
  const regexp = /function\s+(\w+)|(\w+)\s*=\s*function|\s*(\w+)\s*=\s*\(\)/g;
  const matches = [...code.matchAll(regexp)];
  const functions = matches.map(m => m[1] || m[2] || m[3]).filter(Boolean);
  return {
    result: functions.length,
    expected: 3,
    func0: functions[0],
    func1: functions[1],
    func2: functions[2]
  };
}

export function test050() {
  const code = `const a = 1; let b = 2; var c = 3;`;
  const regexp = /(const|let|var)\s+(\w+)/g;
  const matches = [...code.matchAll(regexp)];
  const variables = matches.map(m => ({ type: m[1], name: m[2] }));
  return {
    result0Name: variables[0].name,
    result1Type: variables[1].type,
    result2Name: variables[2].name
  };
}

export function test051() {
  const code = `// This is a comment
const a = 1; // inline comment
/* multi-line
comment */`;
  const regexp = /\/\/.*|\/\*[\s\S]*?\*\//g;
  const matches = [...code.matchAll(regexp)];
  const comments = matches.map(m => m[0].trim());
  return {
    result: comments.length,
    expected: 3
  };
}

export function test052() {
  const text = "JavaScript is awesome. JavaScript is powerful.";
  const keyword = "JavaScript";
  const regexp = new RegExp(keyword, "gi");
  const matches = [...text.matchAll(regexp)];
  let result = text;
  let offset = 0;
  matches.forEach(match => {
    const start = match.index + offset;
    const end = start + match[0].length;
    result = result.substring(0, start) + "**" + result.substring(start, end) + "**" + result.substring(end);
    offset += 4;
  });
  return {
    result: result.includes("**JavaScript**")
  };
}

export function test053() {
  const text = "Numbers: 42, 1, 100, 7, 23";
  const regexp = /\d+/g;
  const matches = [...text.matchAll(regexp)];
  const numbers = matches.map(m => parseInt(m[0])).sort((a, b) => a - b);
  return {
    result: numbers.length,
    expected: 5,
    num0: numbers[0],
    num1: numbers[1],
    num4: numbers[4]
  };
}

export function test054() {
  const text = "hello world hello javascript world";
  const regexp = /\w+/g;
  const matches = [...text.matchAll(regexp)];
  const frequency = {};
  matches.forEach(m => {
    frequency[m[0]] = (frequency[m[0]] || 0) + 1;
  });
  return {
    resultHello: frequency.hello,
    resultWorld: frequency.world,
    resultJavascript: frequency.javascript
  };
}

export function test055() {
  const password = "Pass123!";
  const checks = [
    { pattern: /[a-z]/g, name: "lowercase" },
    { pattern: /[A-Z]/g, name: "uppercase" },
    { pattern: /\d/g, name: "digit" },
    { pattern: /[!@#$%^&*]/g, name: "special" }
  ];
  const results = checks.map(check => ({
    name: check.name,
    found: [...password.matchAll(check.pattern)].length > 0
  }));
  return {
    result: results.every(r => r.found)
  };
}

export function test056() {
  const formErrors = "Error: Name is required. Error: Email is invalid. Error: Password too short.";
  const regexp = /Error:\s*([^.]*)\./g;
  const matches = [...formErrors.matchAll(regexp)];
  const errors = matches.map(m => m[1].trim());
  return {
    result: errors.length,
    expected: 3,
    error0: errors[0],
    error1: errors[1],
    error2: errors[2]
  };
}

export function test057() {
  const str = "test ".repeat(10000);
  const regexp = /test/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 10000
  };
}

export function test058() {
  const str = "a".repeat(1000000) + "target" + "a".repeat(1000000);
  const regexp = /target/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 1,
    match0Index: matches[0].index
  };
}

export function test059() {
  const str = "test ".repeat(1000);
  const regexp = /test/g;
  const iterator = str.matchAll(regexp);
  const first = iterator.next();
  return {
    result: first.value[0],
    expected: "test"
  };
}

export function test060() {
  const str = "test ".repeat(10000);
  const regexp = /test/g;
  const iterator = str.matchAll(regexp);
  const first10 = [];
  for (let i = 0; i < 10; i++) {
    const result = iterator.next();
    if (result.done) break;
    first10.push(result.value);
  }
  return {
    result: first10.length,
    expected: 10
  };
}

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

export function test101() {
  const str = "hello123world456";
  const regexp = new RegExp("\\d+", "g");
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

export function test102() {
  const str = "cat bat rat";
  const regexp = /[cbr]at/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3
  };
}

export function test103() {
  const str = "hello world hello";
  const matches = [...str.matchAll("hello")];
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

export function test104() {
  const str = "a.b+c*d";
  const matches = [...str.matchAll("a.b")];
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

export function test105() {
  const str = "hello";
  const matches = [...str.matchAll("")];
  return {
    result: matches.length,
    expected: 6
  };
}

export function test106() {
  const str = "null value";
  const matches = [...str.matchAll(null)];
  return {
    result: matches.length,
    expected: 1
  };
}

export function test107() {
  const str = "undefined";
  const matches = [...str.matchAll(undefined)];
  return {
    result: matches.length,
    expected: 10
  };
}

export function test108() {
  const str = "123 456 123";
  const matches = [...str.matchAll(123)];
  return {
    result: matches.length,
    expected: 2
  };
}

export function test109() {
  const str = "[object Object]";
  const obj = {};
  const matches = [...str.matchAll(obj)];
  return {
    result: matches.length,
    expected: 13
  };
}

export function test201() {
  const str = "test1 test2";
  const regexp = /test(\d)/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0_0: matches[0][0],
    match0_1: matches[0][1],
    match1_0: matches[1][0],
    match1_1: matches[1][1]
  };
}

export function test202() {
  const str = "2019-01-02 2020-12-31";
  const regexp = /(\d{4})-(\d{2})-(\d{2})/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0_0: matches[0][0],
    match0_1: matches[0][1],
    match0_2: matches[0][2],
    match0_3: matches[0][3]
  };
}

export function test203() {
  const str = "test1test2";
  const regexp = /t(e)(st(\d?))/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0_0: matches[0][0],
    match0_1: matches[0][1],
    match0_2: matches[0][2],
    match0_3: matches[0][3]
  };
}

export function test204() {
  const str = "2019-01-02";
  const regexp = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/g;
  const matches = [...str.matchAll(regexp)];
  return {
    resultYear: matches[0].groups.year,
    resultMonth: matches[0].groups.month,
    resultDay: matches[0].groups.day,
    expectedYear: "2019",
    expectedMonth: "01",
    expectedDay: "02"
  };
}

export function test205() {
  const str = "John Doe";
  const regexp = /(\w+) (?<surname>\w+)/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result0_1: matches[0][1],
    resultSurname: matches[0].groups.surname,
    expected1: "John",
    expectedSurname: "Doe"
  };
}

export function test206() {
  const str = "color colour";
  const regexp = /colou?r/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

export function test207() {
  const str = "a1b";
  const regexp = /a(\d)?b/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result0_0: matches[0][0],
    result0_1: matches[0][1],
    expected0: "a1b",
    expected1: "1"
  };
}

export function test208() {
  const str = "abc ab ac bc a";
  const regexp = /a(b)?(c)?/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result0_1: matches[0][1],
    result0_2: matches[0][2],
    expected0_1: "b",
    expected0_2: "c"
  };
}

export function test209() {
  const str = "test1test2";
  const regexp = /t(e)(st(\d?))/g;
  const matchResult = str.match(regexp);
  const matchAllResult = [...str.matchAll(regexp)];
  return {
    matchResult: matchResult,
    matchAllLength: matchAllResult.length,
    matchAll0_0: matchAllResult[0][0],
    matchAll0_1: matchAllResult[0][1]
  };
}

export function test210() {
  const str = "test";
  const regexp = /te/g;
  const matches = [...str.matchAll(regexp)];
  return {
    isArray: Array.isArray(matches[0]),
    match0_0: matches[0][0],
    match0_index: matches[0].index,
    match0_input: matches[0].input
  };
}

export function test211() {
  const str = "a1b2c3";
  const regexp = /([a-z])(\d)/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches[0].length,
    expected: 3
  };
}

export function test212() {
  const str = "hello world";
  const regexp = /hello/g;
  const matches = [...str.matchAll(regexp)];
  return {
    match0_index: matches[0].index,
    match0_input: matches[0].input,
    match0_groups: matches[0].groups
  };
}

export function test213() {
  const str = "hello world";
  const regexp = /world/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches[0].index,
    expected: 6
  };
}

export function test214() {
  const str = "ab cd ef";
  const regexp = /[a-z]{2}/g;
  const matches = [...str.matchAll(regexp)];
  return {
    match0_index: matches[0].index,
    match1_index: matches[1].index,
    match2_index: matches[2].index,
    expected0: 0,
    expected1: 3,
    expected2: 6
  };
}

export function test215() {
  const str = "test string";
  const regexp = /test/g;
  const matches = [...str.matchAll(regexp)];
  return {
    match0_input: matches[0].input,
    match0_inputEqual: matches[0].input === str
  };
}

export function test216() {
  const str = "test";
  const regexp = /test/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches[0].groups,
    expected: undefined
  };
}

export function test217() {
  const str = "2021-12-25";
  const regexp = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/g;
  const matches = [...str.matchAll(regexp)];
  return {
    typeOf: typeof matches[0].groups,
    resultYear: matches[0].groups.year,
    expectedYear: "2021"
  };
}

export function test218() {
  const str = "Hello HELLO hello";
  const regexp = /hello/gi;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3
  };
}

export function test219() {
  const str = "line1\nline2\nline3";
  const regexp = /^line/gm;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 3
  };
}

export function test220() {
  const str = "line1\nline2";
  const regexp = /line1.line2/gs;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

export function test221() {
  const str = "😀😁😀";
  const regexp = /😀/gu;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2
  };
}

export function test222() {
  const str = "test";
  const regexp = /t/gd;
  const matches = [...str.matchAll(regexp)];
  return {
    indices0_0: matches[0].indices[0],
    indices1_0: matches[1].indices[0],
    expected0: [0, 1],
    expected1: [3, 4]
  };
}

export function test223() {
  const str = "a1b2";
  const regexp = /([a-z])(\d)/gd;
  const matches = [...str.matchAll(regexp)];
  return {
    indices0_0: matches[0].indices[0],
    indices0_1: matches[0].indices[1],
    indices0_2: matches[0].indices[2],
    expected0_0: [0, 2],
    expected0_1: [0, 1],
    expected0_2: [1, 2]
  };
}

export function test224() {
  const str = "2021-12-25";
  const regexp = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/gd;
  const matches = [...str.matchAll(regexp)];
  return {
    indicesGroupsYear: matches[0].indices.groups.year,
    indicesGroupsMonth: matches[0].indices.groups.month,
    indicesGroupsDay: matches[0].indices.groups.day,
    expectedYear: [0, 4],
    expectedMonth: [5, 7],
    expectedDay: [8, 10]
  };
}

export function test301() {
  const str = "abc abc def def";
  const regexp = /(\w+)\s+\1/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

export function test302() {
  const str = "abc abc";
  const regexp = /(?<word>\w+)\s+\k<word>/g;
  const matches = [...str.matchAll(regexp)];
  return {
    result: matches.length,
    expected: 1,
    resultWord: matches[0].groups.word,
    expectedWord: "abc"
  };
}

export function test303() {
  const str = "abc123def456";
  const regexp = /(?:abc|def)(\d+)/g;
  const matches = [...str.matchAll(regexp)];
  return {
    match0_0: matches[0][0],
    match0_1: matches[0][1],
    match1_0: matches[1][0],
    match1_1: matches[1][1]
  };
}

export function test304() {
  const str = "foo123bar";
  const regexp = /(?:foo(\d+))bar/g;
  const matches = [...str.matchAll(regexp)];
  return {
    match0_0: matches[0][0],
    match0_1: matches[0][1]
  };
}

export function test305() {
  const str = "a1b2c3d";
  const regexp = /\d/g;
  const matches = [...str.matchAll(regexp)];
  const parts = [];
  let lastIndex = 0;
  matches.forEach(match => {
    parts.push(str.substring(lastIndex, match.index));
    lastIndex = match.index + match[0].length;
  });
  parts.push(str.substring(lastIndex));
  return {
    result: parts,
    expected: ["a", "b", "c", "d"]
  };
}

export function test306() {
  const str = "test1test2";
  const regexp = /test\d/;
  const searchIndex = str.search(regexp);
  const matchAllResults = [...str.matchAll(/test\d/g)];
  return {
    searchIndex: searchIndex,
    matchAllIndex0: matchAllResults[0].index,
    matchAllIndex1: matchAllResults[1].index,
    expectedSearch: 0
  };
}

export function test307() {
  const str = "test1test2";
  const regexp = /test\d/g;
  const replaced = str.replaceAll(regexp, "REPLACED");
  const matches = [...str.matchAll(regexp)];
  return {
    replaced: replaced,
    matchesLength: matches.length,
    expectedReplaced: "REPLACEDREPLACED"
  };
}

export function test308() {
  const str = "test1test2";
  const regexp = /test\d/g;
  const matches = [...str.matchAll(regexp)];
  let result = str;
  matches.reverse().forEach(match => {
    result = result.substring(0, match.index) + "REPLACED" + result.substring(match.index + match[0].length);
  });
  return {
    result: result,
    expected: "REPLACEDREPLACED"
  };
}

export function test309() {
  const str = "name:John age:30";
  const regexp = /(\w+):(\w+)/g;
  const matches = [...str.matchAll(regexp)];
  const data = {};
  matches.forEach(match => {
    data[match[1]] = match[2];
  });
  return {
    resultName: data.name,
    resultAge: data.age,
    expectedName: "John",
    expectedAge: "30"
  };
}

export function test310() {
  const str = "test";
  const regexp = /test/;
  try {
    str.matchAll(regexp);
    return { isTypeError: false };
  } catch (e) {
    return { isTypeError: e instanceof TypeError };
  }
}

export function test311() {
  const str = "Test";
  const regexp = /test/i;
  try {
    str.matchAll(regexp);
    return { isTypeError: false };
  } catch (e) {
    return { isTypeError: e instanceof TypeError };
  }
}

export function test312() {
  const str = "line1\nline2";
  const regexp = /^line/m;
  try {
    str.matchAll(regexp);
    return { isTypeError: false };
  } catch (e) {
    return { isTypeError: e instanceof TypeError };
  }
}

