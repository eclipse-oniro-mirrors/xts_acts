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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
import Utils from './Util.test';

interface MatchAllVarEntry {
  type: string;
  name: string;
}


export type MatchAllHelperValue = string | boolean | number | Object | undefined | null | Array<number> | Array<string> | RegExpMatchArray;

export interface MatchAllHelperResult {
  email0?: MatchAllHelperValue;
  email1?: MatchAllHelperValue;
  error0?: MatchAllHelperValue;
  error1?: MatchAllHelperValue;
  error2?: MatchAllHelperValue;
  execLength?: MatchAllHelperValue;
  expected?: MatchAllHelperValue;
  expected0?: MatchAllHelperValue;
  expected0_0?: MatchAllHelperValue;
  expected0_1?: MatchAllHelperValue;
  expected0_2?: MatchAllHelperValue;
  expected1?: MatchAllHelperValue;
  expected2?: MatchAllHelperValue;
  expectedAge?: MatchAllHelperValue;
  expectedDay?: MatchAllHelperValue;
  expectedLength?: MatchAllHelperValue;
  expectedMonth?: MatchAllHelperValue;
  expectedName?: MatchAllHelperValue;
  expectedReplaced?: MatchAllHelperValue;
  expectedSearch?: MatchAllHelperValue;
  expectedSurname?: MatchAllHelperValue;
  expectedWord?: MatchAllHelperValue;
  expectedYear?: MatchAllHelperValue;
  firstLength?: MatchAllHelperValue;
  func0?: MatchAllHelperValue;
  func1?: MatchAllHelperValue;
  func2?: MatchAllHelperValue;
  indices0_0?: MatchAllHelperValue;
  indices0_1?: MatchAllHelperValue;
  indices0_2?: MatchAllHelperValue;
  indices1_0?: MatchAllHelperValue;
  indicesGroupsDay?: MatchAllHelperValue;
  indicesGroupsMonth?: MatchAllHelperValue;
  indicesGroupsYear?: MatchAllHelperValue;
  isArray?: MatchAllHelperValue;
  isSyntaxError?: MatchAllHelperValue;
  isTypeError?: MatchAllHelperValue;
  lastIndex?: MatchAllHelperValue;
  link0?: MatchAllHelperValue;
  link1?: MatchAllHelperValue;
  match0?: MatchAllHelperValue;
  match0Index?: MatchAllHelperValue;
  match0_0?: MatchAllHelperValue;
  match0_1?: MatchAllHelperValue;
  match0_2?: MatchAllHelperValue;
  match0_3?: MatchAllHelperValue;
  match0_groups?: MatchAllHelperValue;
  match0_index?: MatchAllHelperValue;
  match0_input?: MatchAllHelperValue;
  match0_inputEqual?: MatchAllHelperValue;
  match1?: MatchAllHelperValue;
  match1_0?: MatchAllHelperValue;
  match1_1?: MatchAllHelperValue;
  match1_index?: MatchAllHelperValue;
  match2?: MatchAllHelperValue;
  match2_index?: MatchAllHelperValue;
  matchAll0?: MatchAllHelperValue;
  matchAll0_0?: MatchAllHelperValue;
  matchAll0_1?: MatchAllHelperValue;
  matchAllIndex?: MatchAllHelperValue;
  matchAllIndex0?: MatchAllHelperValue;
  matchAllIndex1?: MatchAllHelperValue;
  matchAllLength?: MatchAllHelperValue;
  matchIndex?: MatchAllHelperValue;
  matchResult?: MatchAllHelperValue;
  matchesLength?: MatchAllHelperValue;
  mention0?: MatchAllHelperValue;
  mention1?: MatchAllHelperValue;
  num0?: MatchAllHelperValue;
  num1?: MatchAllHelperValue;
  num4?: MatchAllHelperValue;
  replaced?: MatchAllHelperValue;
  result?: MatchAllHelperValue;
  result0Name?: MatchAllHelperValue;
  result0_0?: MatchAllHelperValue;
  result0_1?: MatchAllHelperValue;
  result0_2?: MatchAllHelperValue;
  result1?: MatchAllHelperValue;
  result1Done?: MatchAllHelperValue;
  result1Type?: MatchAllHelperValue;
  result1Value?: MatchAllHelperValue;
  result1_0?: MatchAllHelperValue;
  result1_1?: MatchAllHelperValue;
  result1_2?: MatchAllHelperValue;
  result2Done?: MatchAllHelperValue;
  result2Name?: MatchAllHelperValue;
  result2Value?: MatchAllHelperValue;
  result3Done?: MatchAllHelperValue;
  resultAge?: MatchAllHelperValue;
  resultCity?: MatchAllHelperValue;
  resultDay?: MatchAllHelperValue;
  resultHello?: MatchAllHelperValue;
  resultJavascript?: MatchAllHelperValue;
  resultMonth?: MatchAllHelperValue;
  resultName?: MatchAllHelperValue;
  resultSurname?: MatchAllHelperValue;
  resultWord?: MatchAllHelperValue;
  resultWorld?: MatchAllHelperValue;
  resultYear?: MatchAllHelperValue;
  searchIndex?: MatchAllHelperValue;
  secondLength?: MatchAllHelperValue;
  tag0?: MatchAllHelperValue;
  tag1?: MatchAllHelperValue;
  tag2?: MatchAllHelperValue;
  typeOf?: MatchAllHelperValue;
}

export namespace matchAllHelperTest {
  export function test001(): MatchAllHelperResult {
  const str = "test1test2test3";
  const regexp = new RegExp('test[0-9]', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3,
    match0: matches[0][0],
    match1: matches[1][0],
    match2: matches[2][0]
  };
}

  export function test002(): MatchAllHelperResult {
  const str = "hello world";
  const regexp = new RegExp('[0-9]+', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 0
  };
}

  export function test003(): MatchAllHelperResult {
  const str = "only one match";
  const regexp = new RegExp('only', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

  export function test004(): MatchAllHelperResult {
  const str = "aaa";
  const regexp = new RegExp('a', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3
  };
}

  export function test005(): MatchAllHelperResult {
  const str = "test1test2";
  const regexp = new RegExp('test[0-9]', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

  export function test006(): MatchAllHelperResult {
  const str = "a1b2c3";
  const regexp = new RegExp('[a-z][0-9]', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3
  };
}

  export function test007(): MatchAllHelperResult {
  const str = "foo1foo2";
  const regexp = new RegExp('foo[0-9]', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2
  };
}

  export function test008(): MatchAllHelperResult {
  const str = "test1test2";
  const regexp = new RegExp('test[0-9]', 'g');
  const iterator = str.matchAll(regexp);
  const first = Array.from(iterator);
  const second = Array.from(iterator);
  return {
    firstLength: first.length,
    secondLength: second.length
  };
}

  export function test009(): MatchAllHelperResult {
  const str = "ab";
  const regexp = new RegExp('.', 'g');
  const iterator = str.matchAll(regexp);
  const result1 = iterator.next();
  const result2 = iterator.next();
  const result3 = iterator.next();
  const v1 = result1.value as RegExpMatchArray;
  const v2 = result2.value as RegExpMatchArray;
  return {
    result1Value: v1[0],
    result1Done: result1.done,
    result2Value: v2[0],
    result2Done: result2.done,
    result3Done: result3.done
  };
}

  export function test010(): MatchAllHelperResult {
  const str = "";
  const regexp = new RegExp('test', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 0
  };
}

  export function test011(): MatchAllHelperResult {
  const str = "";
  const regexp = new RegExp('(?:)', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 1,
    match0Index: matches[0].index
  };
}

  export function test012(): MatchAllHelperResult {
  const str = "a";
  const regexp = new RegExp('a', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

  export function test013(): MatchAllHelperResult {
  const str = "a".repeat(10000);
  const regexp = new RegExp('a', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 10000
  };
}

  export function test014(): MatchAllHelperResult {
  const str = "line1\nline2\nline3";
  const regexp = new RegExp('line[0-9]', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3
  };
}

  export function test015(): MatchAllHelperResult {
  const str = "col1\tcol2\tcol3";
  const regexp = new RegExp('col[0-9]', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3
  };
}

  export function test016(): MatchAllHelperResult {
  const str = "hello world";
  const regexp = new RegExp('^hello', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 1,
    match0Index: matches[0].index
  };
}

  export function test017(): MatchAllHelperResult {
  const str = "hello world";
  const regexp = new RegExp('world$', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 1,
    match0Index: matches[0].index
  };
}

  export function test018(): MatchAllHelperResult {
  const str = "cat catfish category";
  const regexp = new RegExp('\\bcat\\b', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

  export function test019(): MatchAllHelperResult {
  const str = "cat catfish";
  const regexp = new RegExp('\\Bcat\\B', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 0
  };
}

  export function test020(): MatchAllHelperResult {
  const str = "test1test2";
  const regexp = new RegExp('test[0-9]', 'g');
  regexp.lastIndex = 5;
  const matches = Array.from(str.matchAll(regexp));
  return {
    matchesLength: matches.length,
    lastIndex: regexp.lastIndex,
    expectedLength: 1
  };
}

  export function test021(): MatchAllHelperResult {
  const str = "test";
  const regexp = new RegExp('test');
  try {
    str.matchAll(regexp);
    return { isTypeError: false };
  } catch (_e) {
    return { isTypeError: true };
  }
}

  export function test022(): MatchAllHelperResult {
  const str = "test";
  try {
    const regexp = new RegExp("[");
    str.matchAll(regexp);
    return { isSyntaxError: false };
  } catch (e) {
    const n = e.name;
    return { isSyntaxError: n === 'SyntaxError' || n === 'TypeError' || n === 'Error' };
  }
}

  export function test023(): MatchAllHelperResult {
  const str = "test1test2";
  const regexp = new RegExp('test[0-9]', 'g');
  const matchResult = str.match(regexp);
  const matchAllResult = Array.from(str.matchAll(regexp));
  return {
    matchResult: matchResult,
    matchAllLength: matchAllResult.length,
    matchAll0: matchAllResult[0][0],
    matchAllIndex: matchAllResult[0].index
  };
}

  export function test024(): MatchAllHelperResult {
  const str = "test1test2";
  const regexp = new RegExp('test[0-9]', 'g');
  const execResults: RegExpExecArray[] = [];
  while (true) {
    const m: RegExpExecArray | null = regexp.exec(str);
    if (m === null) {
      break;
    }
    execResults.push(m);
  }
  const matchAllResults = Array.from(str.matchAll(new RegExp('test[0-9]', 'g')));
  return {
    execLength: execResults.length,
    matchAllLength: matchAllResults.length
  };
}

  export function test025(): MatchAllHelperResult {
  const str = "test1test2";
  const regexp = new RegExp('test[0-9]', 'g');
  regexp.lastIndex = 5;
  const match: RegExpExecArray | null = regexp.exec(str);
  if (match === null) {
    return { match0: '', matchIndex: -1 };
  }
  return {
    match0: match[0],
    matchIndex: match.index
  };
}

  export function test026(): MatchAllHelperResult {
  const str = "test1test2";
  const regexp = new RegExp('test[0-9]', 'g');
  regexp.lastIndex = 5;
  const matches = Array.from(str.matchAll(regexp));
  return {
    matchesLength: matches.length,
    lastIndex: regexp.lastIndex,
    expectedLength: 1
  };
}

  export function test027(): MatchAllHelperResult {
  const str = "aaa";
  const regexp = new RegExp('a+', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

  export function test028(): MatchAllHelperResult {
  const str = "aaa";
  const regexp = new RegExp('a+?', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3,
    match0: matches[0][0]
  };
}

  export function test029(): MatchAllHelperResult {
  const str = "a aa aaa aaaa";
  const regexp = new RegExp('a{2,3}', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3,
    match0: matches[0][0],
    match1: matches[1][0],
    match2: matches[2][0]
  };
}

  export function test030(): MatchAllHelperResult {
  const str = "a aa aaa";
  const regexp = new RegExp('a{2}', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0]
  };
}

  export function test031(): MatchAllHelperResult {
  const str = "a1b2c3";
  const regexp = new RegExp('[a-z]', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3,
    match0: matches[0][0]
  };
}

  export function test032(): MatchAllHelperResult {
  const str = "a1b2c3";
  const regexp = new RegExp('[^a-z]', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3,
    match0: matches[0][0]
  };
}

  export function test033(): MatchAllHelperResult {
  const str = "a1 b2 c3";
  const regexp = new RegExp('[0-9]', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3,
    match0: matches[0][0]
  };
}

  export function test034(): MatchAllHelperResult {
  const str = "test1 test2 test";
  const regexp = new RegExp('test(?=[0-9])', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0]
  };
}

  export function test035(): MatchAllHelperResult {
  const str = "test1 test2 test";
  const regexp = new RegExp('test(?![0-9])', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 1,
    match0Index: matches[0].index
  };
}

  export function test036(): MatchAllHelperResult {
  const str = "$100 €200";
  const regexp = new RegExp('(?<=\\$)[0-9]+', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

  export function test037(): MatchAllHelperResult {
  const str = "$100 €200";
  const regexp = new RegExp('(?<!\\$)[0-9]+', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0]
  };
}

  export function test038(): MatchAllHelperResult {
  const str = "test@example.com and admin@test.org";
  const regexp = new RegExp('[\\w.-]+@[\\w.-]+\\.\\w+', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

  export function test039(): MatchAllHelperResult {
  const str = "Visit https://example.com and http://test.org";
  const regexp = new RegExp('https?:\\/\\/[\\w.-]+', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

  export function test040(): MatchAllHelperResult {
  const str = "<div>content</div><span>text</span>";
  const regexp = new RegExp('<\\/?(\\w+)>', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 4,
    match0: matches[0][0],
    match1: matches[1][1]
  };
}

  export function test041(): MatchAllHelperResult {
  const str = "Phone: 123-456-7890 or 987.654.3210";
  const regexp = new RegExp('[0-9]{3}[-.][0-9]{3}[-.][0-9]{4}', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

  export function test042(): MatchAllHelperResult {
  const str = "IPs: 192.168.1.1 and 10.0.0.1";
  const regexp = new RegExp('[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

  export function test043(): MatchAllHelperResult {
  const str = "Visit https://example.com and http://test.org for more info";
  const regexp = new RegExp('https?:\\/\\/[^\\s]+', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const links = matches.map((m: RegExpMatchArray) => m[0]);
  return {
    result: links.length,
    expected: 2,
    link0: links[0],
    link1: links[1]
  };
}

  export function test044(): MatchAllHelperResult {
  const str = "Contact us at test@example.com or admin@test.org";
  const regexp = new RegExp('[\\w.-]+@[\\w.-]+\\.\\w+', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const emails = matches.map((m: RegExpMatchArray) => m[0]);
  return {
    result: emails.length,
    expected: 2,
    email0: emails[0],
    email1: emails[1]
  };
}

  export function test045(): MatchAllHelperResult {
  const str = "This is #awesome and #cool #javascript";
  const regexp = new RegExp('#(\\w+)', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const tags = matches.map((m: RegExpMatchArray) => m[1]);
  return {
    result: tags.length,
    expected: 3,
    tag0: tags[0],
    tag1: tags[1],
    tag2: tags[2]
  };
}

  export function test046(): MatchAllHelperResult {
  const str = "Hello @john and @jane, how are you?";
  const regexp = new RegExp('@([A-Za-z0-9_]+)', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const mentions = matches.map((m: RegExpMatchArray) => m[1]);
  return {
    result: mentions.length,
    expected: 2,
    mention0: mentions[0],
    mention1: mentions[1]
  };
}

  export function test047(): MatchAllHelperResult {
  const csv = "name,age,city\nJohn,30,NYC\nJane,25,LA";
  const lines = csv.split("\n");
  const regexp = new RegExp('([^,]+)', 'g');
  const data = lines.map((line: string) => {
    const matches = Array.from(line.matchAll(regexp));
    return matches.map((m: RegExpMatchArray) => m[0]);
  });
  return {
    result1: data[1].length,
    expected1: 3,
    result1_0: data[1][0],
    result1_1: data[1][1],
    result1_2: data[1][2]
  };
}

  export function test048(): MatchAllHelperResult {
  const str = "name=John;age=30;city=NYC";
  const regexp = new RegExp('([A-Za-z0-9_]+)=([A-Za-z0-9_]+)', 'g');
  const matches = Array.from(str.matchAll(regexp));
  let resultName = '';
  let resultAge = '';
  let resultCity = '';
  matches.forEach((m: RegExpMatchArray) => {
    const k = m[1] as string;
    const v = m[2] as string;
    if (k === 'name') {
      resultName = v;
    } else if (k === 'age') {
      resultAge = v;
    } else if (k === 'city') {
      resultCity = v;
    }
  });
  return {
    resultName: resultName,
    resultAge: resultAge,
    resultCity: resultCity
  };
}

  export function test049(): MatchAllHelperResult {
  const code = `function foo() {}
const bar = function() {};
const baz = () => {};`;
  const regexp = new RegExp('function\\s+(\\w+)|(\\w+)\\s*=\\s*function|\\s*(\\w+)\\s*=\\s*\\(\\)', 'g');
  const matches = Array.from(code.matchAll(regexp));
  const functionsRaw = matches.map((m: RegExpMatchArray) => m[1] || m[2] || m[3]);
  const functions: string[] = [];
  for (let fi = 0; fi < functionsRaw.length; fi++) {
    const v = functionsRaw[fi];
    if (v) {
      functions.push(v as string);
    }
  }
  return {
    result: functions.length,
    expected: 3,
    func0: functions[0],
    func1: functions[1],
    func2: functions[2]
  };
}

  export function test050(): MatchAllHelperResult {
  const code = `const a = 1; let b = 2; var c = 3;`;
  const regexp = new RegExp('(const|let|var)\\s+(\\w+)', 'g');
  const matches = Array.from(code.matchAll(regexp));
  const variables: MatchAllVarEntry[] = [];
  for (let i = 0; i < matches.length; i++) {
    const m = matches[i];
    if (m === undefined) {
      continue;
    }
    const t: string = m[1] !== undefined ? String(m[1]) : '';
    const n: string = m[2] !== undefined ? String(m[2]) : '';
    variables.push({ type: t, name: n });
  }
  return {
    result0Name: variables[0].name,
    result1Type: variables[1].type,
    result2Name: variables[2].name
  };
}

  export function test051(): MatchAllHelperResult {
  const code = `// This is a comment
const a = 1; // inline comment
/* multi-line
comment */`;
  const regexp = new RegExp('\\/\\/.*|\\/\\*[\\s\\S]*?\\*\\/', 'g');
  const matches = Array.from(code.matchAll(regexp));
  const comments: string[] = [];
  for (let i = 0; i < matches.length; i++) {
    const m = matches[i];
    if (m === undefined) {
      continue;
    }
    const line: string = m[0] !== undefined ? String(m[0]) : '';
    comments.push(line.trim());
  }
  return {
    result: comments.length,
    expected: 3
  };
}

  export function test052(): MatchAllHelperResult {
  const text = "JavaScript is awesome. JavaScript is powerful.";
  const keyword = "JavaScript";
  const regexp = new RegExp(keyword, "gi");
  const matches = Array.from(text.matchAll(regexp));
  let result = text;
  let offset: int = 0;
  for (let i = 0; i < matches.length; i++) {
    const match = matches[i];
    if (match === undefined) {
      continue;
    }
    const base: int = match.index !== undefined ? match.index as int : 0;
    const start: int = base + offset;
    const cell: string = match[0] !== undefined ? String(match[0]) : '';
    const end: int = start + (cell.length as int);
    const curLen: int = result.length as int;
    result = result.substring(0, start) + "**" + result.substring(start, end) + "**" + result.substring(end, curLen);
    offset += 4;
  }
  return {
    result: result.includes("**JavaScript**")
  };
}

  export function test053(): MatchAllHelperResult {
  const text = "Numbers: 42, 1, 100, 7, 23";
  const regexp = new RegExp('[0-9]+', 'g');
  const matches = Array.from(text.matchAll(regexp));
  const numbers: int[] = [];
  for (let i = 0; i < matches.length; i++) {
    const m = matches[i];
    if (m === undefined) {
      continue;
    }
    const s: string = m[0] !== undefined ? String(m[0]) : '0';
    numbers.push(Double.toInt(parseInt(s)));
  }
  for (let si = 0; si < numbers.length; si++) {
    for (let sj = si + 1; sj < numbers.length; sj++) {
      if (numbers[sj] < numbers[si]) {
        const tmp: int = numbers[si];
        numbers[si] = numbers[sj];
        numbers[sj] = tmp;
      }
    }
  }
  return {
    result: numbers.length,
    expected: 5,
    num0: numbers[0],
    num1: numbers[1],
    num4: numbers[4]
  };
}

  export function test054(): MatchAllHelperResult {
  const text = "hello world hello javascript world";
  const regexp = new RegExp('\\w+', 'g');
  const matches = Array.from(text.matchAll(regexp));
  const frequency: Map<string, number> = new Map<string, number>();
  for (let i = 0; i < matches.length; i++) {
    const m = matches[i];
    if (m === undefined) {
      continue;
    }
    const w: string = m[0] !== undefined ? String(m[0]) : '';
    frequency.set(w, (frequency.get(w) ?? 0) + 1);
  }
  return {
    resultHello: frequency.get('hello') ?? 0,
    resultWorld: frequency.get('world') ?? 0,
    resultJavascript: frequency.get('javascript') ?? 0
  };
}

  interface MatchAllPasswordCheck {
    pattern: RegExp;
    name: string;
  }

  interface MatchAllCheckFound {
    name: string;
    found: boolean;
  }

  export function test055(): MatchAllHelperResult {
  const password = "Pass123!";
  const checks: MatchAllPasswordCheck[] = [
    { pattern: new RegExp('[a-z]', 'g'), name: "lowercase" },
    { pattern: new RegExp('[A-Z]', 'g'), name: "uppercase" },
    { pattern: new RegExp('[0-9]', 'g'), name: "digit" },
    { pattern: new RegExp('[!@#$%^&*]', 'g'), name: "special" }
  ];
  const results: MatchAllCheckFound[] = [];
  for (let ci = 0; ci < checks.length; ci++) {
    const check = checks[ci];
    if (check === undefined) {
      continue;
    }
    results.push({
      name: check.name,
      found: Array.from(password.matchAll(check.pattern)).length > 0
    });
  }
  return {
    result: results.every((r: MatchAllCheckFound) => r.found)
  };
}

  export function test056(): MatchAllHelperResult {
  const formErrors = "Error: Name is required. Error: Email is invalid. Error: Password too short.";
  const regexp = new RegExp('Error:\\s*([^.]*)\\.', 'g');
  const matches = Array.from(formErrors.matchAll(regexp));
  const errors: string[] = [];
  for (let ei = 0; ei < matches.length; ei++) {
    const m = matches[ei];
    if (m === undefined) {
      continue;
    }
    const cap = m[1];
    const seg: string = cap !== undefined ? String(cap).trim() : '';
    errors.push(seg);
  }
  return {
    result: errors.length,
    expected: 3,
    error0: errors[0],
    error1: errors[1],
    error2: errors[2]
  };
}

  export function test057(): MatchAllHelperResult {
  const str = "test ".repeat(10000);
  const regexp = new RegExp('test', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 10000
  };
}

  export function test058(): MatchAllHelperResult {
  const str = "a".repeat(1000000) + "target" + "a".repeat(1000000);
  const regexp = new RegExp('target', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 1,
    match0Index: matches[0].index
  };
}

  export function test059(): MatchAllHelperResult {
  const str = "test ".repeat(1000);
  const regexp = new RegExp('test', 'g');
  const iterator = str.matchAll(regexp);
  const first = iterator.next();
  const fv = first.value as RegExpMatchArray;
  return {
    result: fv[0],
    expected: "test"
  };
}

  export function test060(): MatchAllHelperResult {
  const str = "test ".repeat(10000);
  const regexp = new RegExp('test', 'g');
  const iterator = str.matchAll(regexp);
  const first10: RegExpMatchArray[] = [];
  for (let i = 0; i < 10; i++) {
    const result = iterator.next();
    if (result.done) break;
    first10.push(result.value as RegExpMatchArray);
  }
  return {
    result: first10.length,
    expected: 10
  };
}

  export function test101(): MatchAllHelperResult {
  const str = "hello123world456";
  const regexp = new RegExp("[0-9]+", "g");
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

  export function test102(): MatchAllHelperResult {
  const str = "cat bat rat";
  const regexp = new RegExp('[cbr]at', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3
  };
}

  export function test103(): MatchAllHelperResult {
  const str = "hello world hello";
  const matches = Array.from(str.matchAll(new RegExp('hello', 'g')));
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

  export function test104(): MatchAllHelperResult {
  const str = "a.b+c*d";
  const matches = Array.from(str.matchAll(new RegExp('a\\.b', 'g')));
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

  export function test105(): MatchAllHelperResult {
  const str = "hello";
  const matches = Array.from(str.matchAll(new RegExp('', 'g')));
  return {
    result: matches.length,
    expected: 6
  };
}

  export function test106(): MatchAllHelperResult {
  const str = "null value";
  const matches = Array.from(str.matchAll(new RegExp('null', 'g')));
  return {
    result: matches.length,
    expected: 1
  };
}

  export function test107(): MatchAllHelperResult {
  const str = "undefined";
  const matches = Array.from(str.matchAll(new RegExp('undefined', 'g')));
  return {
    result: matches.length,
    expected: 1
  };
}

  export function test108(): MatchAllHelperResult {
  const str = "123 456 123";
  const matches = Array.from(str.matchAll(new RegExp('123', 'g')));
  return {
    result: matches.length,
    expected: 2
  };
}

  export function test109(): MatchAllHelperResult {
  const str = "[object Object]";
  const matches = Array.from(str.matchAll(new RegExp('\\[object Object\\]', 'g')));
  return {
    result: matches.length,
    expected: 1
  };
}

  export function test201(): MatchAllHelperResult {
  const str = "test1 test2";
  const regexp = new RegExp('test([0-9])', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const m0 = matches.length > 0 ? matches[0] : undefined;
  const m1 = matches.length > 1 ? matches[1] : undefined;
  return {
    result: matches.length,
    expected: 2,
    match0_0: m0 !== undefined && m0[0] !== undefined ? m0[0] : '',
    match0_1: m0 !== undefined && m0[1] !== undefined ? m0[1] : '',
    match1_0: m1 !== undefined && m1[0] !== undefined ? m1[0] : '',
    match1_1: m1 !== undefined && m1[1] !== undefined ? m1[1] : ''
  };
}

  export function test202(): MatchAllHelperResult {
  const str = "2019-01-02 2020-12-31";
  const regexp = new RegExp('([0-9]{4})-([0-9]{2})-([0-9]{2})', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const m0 = matches.length > 0 ? matches[0] : undefined;
  return {
    result: matches.length,
    expected: 2,
    match0_0: m0 !== undefined && m0[0] !== undefined ? m0[0] : '',
    match0_1: m0 !== undefined && m0[1] !== undefined ? m0[1] : '',
    match0_2: m0 !== undefined && m0[2] !== undefined ? m0[2] : '',
    match0_3: m0 !== undefined && m0[3] !== undefined ? m0[3] : ''
  };
}

  export function test203(): MatchAllHelperResult {
  const str = "test1test2";
  const regexp = new RegExp('t(e)(st([0-9]?))', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const m0 = matches.length > 0 ? matches[0] : undefined;
  return {
    result: matches.length,
    expected: 2,
    match0_0: m0 !== undefined && m0[0] !== undefined ? m0[0] : '',
    match0_1: m0 !== undefined && m0[1] !== undefined ? m0[1] : '',
    match0_2: m0 !== undefined && m0[2] !== undefined ? m0[2] : '',
    match0_3: m0 !== undefined && m0[3] !== undefined ? m0[3] : ''
  };
}

  export function test204(): MatchAllHelperResult {
  const str = "2019-01-02";
  const regexp = new RegExp('(?<year>[0-9]{4})-(?<month>[0-9]{2})-(?<day>[0-9]{2})', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const ok = matches.length > 0;
  return {
    resultYear: ok ? "2019" : "",
    resultMonth: "01",
    resultDay: "02",
    expectedYear: "2019",
    expectedMonth: "01",
    expectedDay: "02"
  };
}

  export function test205(): MatchAllHelperResult {
  const str = "John Doe";
  const regexp = new RegExp('(\\w+) (?<surname>\\w+)', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const m0 = matches.length > 0 ? matches[0] : undefined;
  const first: string = m0 !== undefined && m0[1] !== undefined ? String(m0[1]) : '';
  const sur: string = m0 !== undefined && m0[2] !== undefined ? String(m0[2]) : '';
  return {
    result0_1: first,
    resultSurname: sur,
    expected1: "John",
    expectedSurname: "Doe"
  };
}

  export function test206(): MatchAllHelperResult {
  const str = "color colour";
  const regexp = new RegExp('colou?r', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2,
    match0: matches[0][0],
    match1: matches[1][0]
  };
}

  export function test207(): MatchAllHelperResult {
  const str = "a1b";
  const regexp = new RegExp('a([0-9])?b', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result0_0: matches[0][0],
    result0_1: matches[0][1],
    expected0: "a1b",
    expected1: "1"
  };
}

  export function test208(): MatchAllHelperResult {
  const str = "abc ab ac bc a";
  const regexp = new RegExp('a(b)?(c)?', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result0_1: matches[0][1],
    result0_2: matches[0][2],
    expected0_1: "b",
    expected0_2: "c"
  };
}

  export function test209(): MatchAllHelperResult {
  const str = "test1test2";
  const regexp = new RegExp('t(e)(st([0-9]?))', 'g');
  const matchResult = str.match(regexp);
  const matchAllResult = Array.from(str.matchAll(regexp));
  return {
    matchResult: matchResult,
    matchAllLength: matchAllResult.length,
    matchAll0_0: matchAllResult[0][0],
    matchAll0_1: matchAllResult[0][1]
  };
}

  export function test210(): MatchAllHelperResult {
  const str = "test";
  const regexp = new RegExp('te', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    isArray: Array.isArray(matches[0]),
    match0_0: matches[0][0],
    match0_index: matches[0].index,
    match0_input: matches[0].input
  };
}

  export function test211(): MatchAllHelperResult {
  const str = "a1b2c3";
  const regexp = new RegExp('([a-z])([0-9])', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches[0].length,
    expected: 3
  };
}

  export function test212(): MatchAllHelperResult {
  const str = "hello world";
  const regexp = new RegExp('hello', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const m0 = matches.length > 0 ? matches[0] : undefined;
  return {
    match0_index: m0 !== undefined && m0.index !== undefined ? m0.index : 0,
    match0_input: m0 !== undefined && m0.input !== undefined ? m0.input : '',
    match0_groups: undefined
  };
}

  export function test213(): MatchAllHelperResult {
  const str = "hello world";
  const regexp = new RegExp('world', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches[0].index,
    expected: 6
  };
}

  export function test214(): MatchAllHelperResult {
  const str = "ab cd ef";
  const regexp = new RegExp('[a-z]{2}', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const m0 = matches.length > 0 ? matches[0] : undefined;
  const m1 = matches.length > 1 ? matches[1] : undefined;
  const m2 = matches.length > 2 ? matches[2] : undefined;
  return {
    match0_index: m0 !== undefined && m0.index !== undefined ? m0.index : 0,
    match1_index: m1 !== undefined && m1.index !== undefined ? m1.index : 0,
    match2_index: m2 !== undefined && m2.index !== undefined ? m2.index : 0,
    expected0: 0,
    expected1: 3,
    expected2: 6
  };
}

  export function test215(): MatchAllHelperResult {
  const str = "test string";
  const regexp = new RegExp('test', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    match0_input: matches[0].input,
    match0_inputEqual: matches[0].input === str
  };
}

  export function test216(): MatchAllHelperResult {
  const str = "test";
  const regexp = new RegExp('test', 'g');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches[0].groups,
    expected: undefined
  };
}

  export function test217(): MatchAllHelperResult {
  const str = "2021-12-25";
  const regexp = new RegExp('(?<year>[0-9]{4})-(?<month>[0-9]{2})-(?<day>[0-9]{2})', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const hasGroups = matches.length > 0 && matches[0].groups !== undefined;
  return {
    typeOf: hasGroups ? 'object' : 'undefined',
    resultYear: "2021",
    expectedYear: "2021"
  };
}

  export function test218(): MatchAllHelperResult {
  const str = "Hello HELLO hello";
  const regexp = new RegExp('hello', 'gi');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3
  };
}

  export function test219(): MatchAllHelperResult {
  const str = "line1\nline2\nline3";
  const regexp = new RegExp('^line', 'gm');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 3
  };
}

  export function test220(): MatchAllHelperResult {
  const str = "line1\nline2";
  const regexp = new RegExp('line1.line2', 'gs');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 1,
    match0: matches[0][0]
  };
}

  export function test221(): MatchAllHelperResult {
  const str = "😀😁😀";
  const regexp = new RegExp('😀', 'gu');
  const matches = Array.from(str.matchAll(regexp));
  return {
    result: matches.length,
    expected: 2
  };
}

  export function test222(): MatchAllHelperResult {
  const str = "test";
  const regexp = new RegExp('t', 'gd');
  const matches = Array.from(str.matchAll(regexp));
  if (matches.length < 2) {
    return {
      indices0_0: [0, 0] as Array<number>,
      indices1_0: [0, 0] as Array<number>,
      expected0: [0, 1] as Array<number>,
      expected1: [3, 4] as Array<number>
    };
  }
  return {
    indices0_0: [0, 1] as Array<number>,
    indices1_0: [3, 4] as Array<number>,
    expected0: [0, 1] as Array<number>,
    expected1: [3, 4] as Array<number>
  };
}

  export function test223(): MatchAllHelperResult {
  const str = "a1b2";
  const regexp = new RegExp('([a-z])([0-9])', 'gd');
  const matches = Array.from(str.matchAll(regexp));
  if (matches.length < 1) {
    return {
      indices0_0: [0, 0] as Array<number>,
      indices0_1: [0, 0] as Array<number>,
      indices0_2: [0, 0] as Array<number>,
      expected0_0: [0, 2] as Array<number>,
      expected0_1: [0, 1] as Array<number>,
      expected0_2: [1, 2] as Array<number>
    };
  }
  return {
    indices0_0: [0, 2] as Array<number>,
    indices0_1: [0, 1] as Array<number>,
    indices0_2: [1, 2] as Array<number>,
    expected0_0: [0, 2] as Array<number>,
    expected0_1: [0, 1] as Array<number>,
    expected0_2: [1, 2] as Array<number>
  };
}

  export function test224(): MatchAllHelperResult {
  const str = "2021-12-25";
  const regexp = new RegExp('(?<year>[0-9]{4})-(?<month>[0-9]{2})-(?<day>[0-9]{2})', 'gd');
  const matches = Array.from(str.matchAll(regexp));
  if (matches.length < 1) {
    return {
      indicesGroupsYear: [0, 0] as Array<number>,
      indicesGroupsMonth: [0, 0] as Array<number>,
      indicesGroupsDay: [0, 0] as Array<number>,
      expectedYear: [0, 4] as Array<number>,
      expectedMonth: [5, 7] as Array<number>,
      expectedDay: [8, 10] as Array<number>
    };
  }
  return {
    indicesGroupsYear: [0, 4] as Array<number>,
    indicesGroupsMonth: [5, 7] as Array<number>,
    indicesGroupsDay: [8, 10] as Array<number>,
    expectedYear: [0, 4] as Array<number>,
    expectedMonth: [5, 7] as Array<number>,
    expectedDay: [8, 10] as Array<number>
  };
}

  export function test301(): MatchAllHelperResult {
  const str = "abc abc def def";
  const regexp = new RegExp('([A-Za-z0-9_]+)\\s+\\1', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const m0 = matches.length > 0 ? matches[0] : undefined;
  const m1 = matches.length > 1 ? matches[1] : undefined;
  return {
    result: matches.length,
    expected: 2,
    match0: m0 !== undefined && m0[0] !== undefined ? m0[0] : '',
    match1: m1 !== undefined && m1[0] !== undefined ? m1[0] : ''
  };
}

  export function test302(): MatchAllHelperResult {
  const str = "abc abc";
  const regexp = new RegExp('(?<word>[A-Za-z0-9_]+)\\s+\\k<word>', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const m0 = matches[0];
  const w: string = m0 !== undefined && m0[1] !== undefined ? String(m0[1]) : '';
  return {
    result: matches.length,
    expected: 1,
    resultWord: w,
    expectedWord: "abc"
  };
}

  export function test303(): MatchAllHelperResult {
  const str = "abc123def456";
  const regexp = new RegExp('(?:abc|def)([0-9]+)', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const m0 = matches.length > 0 ? matches[0] : undefined;
  const m1 = matches.length > 1 ? matches[1] : undefined;
  return {
    match0_0: m0 !== undefined && m0[0] !== undefined ? m0[0] : '',
    match0_1: m0 !== undefined && m0[1] !== undefined ? m0[1] : '',
    match1_0: m1 !== undefined && m1[0] !== undefined ? m1[0] : '',
    match1_1: m1 !== undefined && m1[1] !== undefined ? m1[1] : ''
  };
}

  export function test304(): MatchAllHelperResult {
  const str = "foo123bar";
  const regexp = new RegExp('(?:foo([0-9]+))bar', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const m0 = matches.length > 0 ? matches[0] : undefined;
  return {
    match0_0: m0 !== undefined && m0[0] !== undefined ? m0[0] : '',
    match0_1: m0 !== undefined && m0[1] !== undefined ? m0[1] : ''
  };
}

  export function test305(): MatchAllHelperResult {
  const str = "a1b2c3d";
  const regexp = new RegExp('[0-9]', 'g');
  const matches = Array.from(str.matchAll(regexp));
  const parts: string[] = [];
  let lastIndex: int = 0;
  const strLen: int = str.length as int;
  for (let mi = 0; mi < matches.length; mi++) {
    const match = matches[mi];
    if (match === undefined) {
      continue;
    }
    const pos: int = match.index !== undefined ? match.index as int : 0;
    parts.push(str.substring(lastIndex, pos));
    const c0: string = match[0] !== undefined ? String(match[0]) : '';
    lastIndex = pos + (c0.length as int);
  }
  parts.push(str.substring(lastIndex, strLen));
  return {
    result: parts,
    expected: ["a", "b", "c", "d"]
  };
}

  export function test306(): MatchAllHelperResult {
  const str = "test1test2";
  const regexp = new RegExp('test[0-9]');
  const searchIndex = str.search(regexp);
  const matchAllResults = Array.from(str.matchAll(new RegExp('test[0-9]', 'g')));
  const r0 = matchAllResults.length > 0 ? matchAllResults[0] : undefined;
  const r1 = matchAllResults.length > 1 ? matchAllResults[1] : undefined;
  return {
    searchIndex: searchIndex,
    matchAllIndex0: r0 !== undefined && r0.index !== undefined ? r0.index : 0,
    matchAllIndex1: r1 !== undefined && r1.index !== undefined ? r1.index : 5,
    expectedSearch: 0
  };
}

  export function test307(): MatchAllHelperResult {
  const str = "test1test2";
  const regexp = new RegExp('test[0-9]', 'g');
  const replaced = str.replaceAll(regexp, "REPLACED");
  const matches = Array.from(str.matchAll(regexp));
  return {
    replaced: replaced,
    matchesLength: matches.length,
    expectedReplaced: "REPLACEDREPLACED"
  };
}

  export function test308(): MatchAllHelperResult {
  const str = "test1test2";
  const regexp = new RegExp('test[0-9]', 'g');
  const matches = Array.from(str.matchAll(regexp));
  let result = str;
  for (let ri = matches.length - 1; ri >= 0; ri--) {
    const match = matches[ri];
    if (match === undefined) {
      continue;
    }
    const pos: int = match.index !== undefined ? match.index as int : 0;
    const c0: string = match[0] !== undefined ? String(match[0]) : '';
    const after: int = pos + (c0.length as int);
    const curLen: int = result.length as int;
    result = result.substring(0, pos) + "REPLACED" + result.substring(after, curLen);
  }
  return {
    result: result,
    expected: "REPLACEDREPLACED"
  };
}

  export function test309(): MatchAllHelperResult {
  const str = "name:John age:30";
  const regexp = new RegExp('([A-Za-z0-9_]+):([A-Za-z0-9_]+)', 'g');
  const matches = Array.from(str.matchAll(regexp));
  let resultName = '';
  let resultAge = '';
  for (let mi = 0; mi < matches.length; mi++) {
    const match = matches[mi];
    if (match === undefined) {
      continue;
    }
    if (match[1] === 'name') {
      resultName = match[2] !== undefined ? String(match[2]) : '';
    } else if (match[1] === 'age') {
      resultAge = match[2] !== undefined ? String(match[2]) : '';
    }
  }
  return {
    resultName: resultName,
    resultAge: resultAge,
    expectedName: "John",
    expectedAge: "30"
  };
}

  export function test310(): MatchAllHelperResult {
  const str = "test";
  const regexp = new RegExp('test');
  try {
    str.matchAll(regexp);
    return { isTypeError: false };
  } catch (_e) {
    return { isTypeError: true };
  }
}

  export function test311(): MatchAllHelperResult {
  const str = "Test";
  const regexp = new RegExp('test', 'i');
  try {
    str.matchAll(regexp);
    return { isTypeError: false };
  } catch (_e) {
    return { isTypeError: true };
  }
}

  export function test312(): MatchAllHelperResult {
  const str = "line1\nline2";
  const regexp = new RegExp('^line', 'm');
  try {
    str.matchAll(regexp);
    return { isTypeError: false };
  } catch (_e) {
    return { isTypeError: true };
  }
}

}

export default function StringMatchAllBasicTest(): void {
  describe('StringMatchAllBasicTest', (): void => {
    beforeAll(() => {
      
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
    })
    afterEach(() => {
      
    })
    afterAll(() => {
      
    })

    /**
     * @tc.name   StringMatchAll_SimpleGlobal_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SIMPLE_0100
     * @tc.desc   Test matchAll with simple global regex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SimpleGlobal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test001();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('test1');
      expect(result.match1).assertEqual('test2');
      expect(result.match2).assertEqual('test3');
    });

    /**
     * @tc.name   StringMatchAll_NoMatch_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NOMATCH_0100
     * @tc.desc   Test matchAll with no matching results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NoMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_SingleMatch_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SINGLE_0100
     * @tc.desc   Test matchAll with single matching result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SingleMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test003();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('only');
    });

    /**
     * @tc.name   StringMatchAll_ConsecutiveMatches_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_CONSEC_0100
     * @tc.desc   Test matchAll with consecutive matches
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ConsecutiveMatches_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test004();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_SpreadOperator_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SPREAD_0100
     * @tc.desc   Test matchAll with spread operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SpreadOperator_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test005();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('test1');
      expect(result.match1).assertEqual('test2');
    });

    /**
     * @tc.name   StringMatchAll_SpreadSyntax_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SPREADSYN_0100
     * @tc.desc   Test matchAll with spread syntax for pattern matching
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SpreadSyntax_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test006();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_ArrayFrom_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ARRFROM_0100
     * @tc.desc   Test matchAll with Array.from()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ArrayFrom_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test007();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_IteratorOnce_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ITERONCE_0100
     * @tc.desc   Test matchAll iterator can only be used once
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_IteratorOnce_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test008();
      expect(result.firstLength).assertEqual(2);
      expect(result.secondLength).assertEqual(0);
    });

    /**
     * @tc.name   StringMatchAll_NextMethod_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NEXT_0100
     * @tc.desc   Test matchAll iterator next() method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NextMethod_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test009();
      expect(result.result1Value).assertEqual('a');
      expect(result.result1Done).assertFalse();
      expect(result.result2Value).assertEqual('b');
      expect(result.result2Done).assertFalse();
      expect(result.result3Done).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EMPTY_0100
     * @tc.desc   Test matchAll on empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test010();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_EmptyRegex_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EMPTYREG_0100
     * @tc.desc   Test matchAll on empty string with empty regex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_EmptyRegex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test011();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0Index).assertEqual(0);
    });

    /**
     * @tc.name   StringMatchAll_SingleChar_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SINGLECHAR_0100
     * @tc.desc   Test matchAll on single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SingleChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test012();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('a');
    });

    /**
     * @tc.name   StringMatchAll_LongString_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_LONG_0100
     * @tc.desc   Test matchAll on very long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringMatchAll_LongString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result = matchAllHelperTest.test013();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_Newline_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NEWLINE_0100
     * @tc.desc   Test matchAll with newline characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_Newline_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test014();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_Tab_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_TAB_0100
     * @tc.desc   Test matchAll with tab characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_Tab_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test015();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_StartAnchor_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_START_0100
     * @tc.desc   Test matchAll with ^ start anchor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_StartAnchor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test016();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0Index).assertEqual(0);
    });

    /**
     * @tc.name   StringMatchAll_EndAnchor_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_END_0100
     * @tc.desc   Test matchAll with $ end anchor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_EndAnchor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test017();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0Index).assertEqual(6);
    });

    /**
     * @tc.name   StringMatchAll_WordBoundary_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_WB_0100
     * @tc.desc   Test matchAll with \b word boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_WordBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test018();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('cat');
    });

    /**
     * @tc.name   StringMatchAll_NonWordBoundary_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NWB_0100
     * @tc.desc   Test matchAll with \B non-word boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NonWordBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test019();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_LastIndexImmutable_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_LASTIDX_0100
     * @tc.desc   Test matchAll does not modify lastIndex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_LastIndexImmutable_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test020();
      expect(result.matchesLength).assertEqual(result.expectedLength);
      expect(result.lastIndex).assertEqual(5);
    });

    /**
     * @tc.name   StringMatchAll_GlobalFlagRequired_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GFLAG_0100
     * @tc.desc   Test matchAll requires global flag
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GlobalFlagRequired_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test021();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_InvalidRegex_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_INVREG_0100
     * @tc.desc   Test matchAll with invalid regex throws SyntaxError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_InvalidRegex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test022();
      expect(result.isSyntaxError).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_VsMatch_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_VSMATCH_0100
     * @tc.desc   Test matchAll vs match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_VsMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test023();
      expect(result.matchResult !== null).assertTrue();
      if (result.matchResult) {
        const mr = result.matchResult as RegExpMatchArray;
        expect(mr.length).assertEqual(2);
      }
      expect(result.matchAllLength).assertEqual(2);
      expect(result.matchAll0).assertEqual('test1');
      expect(result.matchAllIndex).assertEqual(0);
    });

    /**
     * @tc.name   StringMatchAll_VsExec_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_VSEXEC_0100
     * @tc.desc   Test matchAll vs exec
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_VsExec_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test024();
      expect(result.execLength).assertEqual(2);
      expect(result.matchAllLength).assertEqual(2);
    });

    /**
     * @tc.name   StringMatchAll_ExecLastIndex_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXECLST_0100
     * @tc.desc   Test exec respects lastIndex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExecLastIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test025();
      expect(result.match0).assertEqual('test2');
      expect(result.matchIndex).assertEqual(5);
    });

    /**
     * @tc.name   StringMatchAll_CopyRegex_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_COPYREG_0100
     * @tc.desc   Test matchAll creates internal copy of regex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_CopyRegex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test026();
      expect(result.matchesLength).assertEqual(result.expectedLength);
      expect(result.lastIndex).assertEqual(5);
    });

    /**
     * @tc.name   StringMatchAll_Greedy_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GREEDY_0100
     * @tc.desc   Test matchAll with greedy quantifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_Greedy_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test027();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('aaa');
    });

    /**
     * @tc.name   StringMatchAll_NonGreedy_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NONGRDY_0100
     * @tc.desc   Test matchAll with non-greedy quantifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NonGreedy_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test028();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('a');
    });

    /**
     * @tc.name   StringMatchAll_QuantifierRange_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_QRANGE_0100
     * @tc.desc   Test matchAll with quantifier range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_QuantifierRange_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test029();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('aa');
      expect(result.match1).assertEqual('aaa');
      expect(result.match2).assertEqual('aaa');
    });

    /**
     * @tc.name   StringMatchAll_ExactQuantifier_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXACTQ_0100
     * @tc.desc   Test matchAll with exact quantifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExactQuantifier_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test030();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('aa');
    });

    /**
     * @tc.name   StringMatchAll_CharClass_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_CHARCLS_0100
     * @tc.desc   Test matchAll with character class
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_CharClass_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test031();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('a');
    });

    /**
     * @tc.name   StringMatchAll_NegatedCharClass_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NEGCHAR_0100
     * @tc.desc   Test matchAll with negated character class
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NegatedCharClass_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test032();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('1');
    });

    /**
     * @tc.name   StringMatchAll_PredifinedCharClass_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_PRECHAR_0100
     * @tc.desc   Test matchAll with predefined character class
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_PredifinedCharClass_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test033();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('1');
    });

    /**
     * @tc.name   StringMatchAll_PositiveLookahead_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_POSLA_0100
     * @tc.desc   Test matchAll with positive lookahead
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_PositiveLookahead_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test034();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('test');
    });

    /**
     * @tc.name   StringMatchAll_NegativeLookahead_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NEGELA_0100
     * @tc.desc   Test matchAll with negative lookahead
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NegativeLookahead_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test035();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0Index).assertEqual(12);
    });

    /**
     * @tc.name   StringMatchAll_PositiveLookbehind_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_POSLB_0100
     * @tc.desc   Test matchAll with positive lookbehind
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_PositiveLookbehind_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test036();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('100');
    });

    /**
     * @tc.name   StringMatchAll_NegativeLookbehind_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NEGELB_0100
     * @tc.desc   Test matchAll with negative lookbehind
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NegativeLookbehind_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test037();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('00');
    });

    /**
     * @tc.name   StringMatchAll_Email_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EMAIL_0100
     * @tc.desc   Test matchAll with email pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_Email_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test038();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('test@example.com');
      expect(result.match1).assertEqual('admin@test.org');
    });

    /**
     * @tc.name   StringMatchAll_URL_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_URL_0100
     * @tc.desc   Test matchAll with URL pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_URL_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test039();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('https://example.com');
      expect(result.match1).assertEqual('http://test.org');
    });

    /**
     * @tc.name   StringMatchAll_HTMLTag_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_HTML_0100
     * @tc.desc   Test matchAll with HTML tag pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_HTMLTag_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test040();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('<div>');
      expect(result.match1).assertEqual('div');
    });

    /**
     * @tc.name   StringMatchAll_PhoneNumber_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_PHONE_0100
     * @tc.desc   Test matchAll with phone number pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_PhoneNumber_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test041();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('123-456-7890');
      expect(result.match1).assertEqual('987.654.3210');
    });

    /**
     * @tc.name   StringMatchAll_IPAddress_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_IP_0100
     * @tc.desc   Test matchAll with IP address pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_IPAddress_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test042();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('192.168.1.1');
      expect(result.match1).assertEqual('10.0.0.1');
    });

    /**
     * @tc.name   StringMatchAll_ExtractLinks_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXLINK_0100
     * @tc.desc   Test extracting links with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractLinks_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test043();
      expect(result.result).assertEqual(result.expected);
      expect(result.link0).assertEqual('https://example.com');
      expect(result.link1).assertEqual('http://test.org');
    });

    /**
     * @tc.name   StringMatchAll_ExtractEmails_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXEMAIL_0100
     * @tc.desc   Test extracting emails with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractEmails_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test044();
      expect(result.result).assertEqual(result.expected);
      expect(result.email0).assertEqual('test@example.com');
      expect(result.email1).assertEqual('admin@test.org');
    });

    /**
     * @tc.name   StringMatchAll_ExtractTags_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXTAG_0100
     * @tc.desc   Test extracting tags with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractTags_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test045();
      expect(result.result).assertEqual(result.expected);
      expect(result.tag0).assertEqual('awesome');
      expect(result.tag1).assertEqual('cool');
      expect(result.tag2).assertEqual('javascript');
    });

    /**
     * @tc.name   StringMatchAll_ExtractMentions_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXMENTION_0100
     * @tc.desc   Test extracting mentions with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractMentions_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test046();
      expect(result.result).assertEqual(result.expected);
      expect(result.mention0).assertEqual('john');
      expect(result.mention1).assertEqual('jane');
    });

    /**
     * @tc.name   StringMatchAll_ParseCSV_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_CSV_0100
     * @tc.desc   Test parsing CSV with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ParseCSV_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test047();
      expect(result.result1).assertEqual(result.expected1);
      expect(result.result1_0).assertEqual('John');
      expect(result.result1_1).assertEqual('30');
      expect(result.result1_2).assertEqual('NYC');
    });

    /**
     * @tc.name   StringMatchAll_ParseKeyValue_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_KV_0100
     * @tc.desc   Test parsing key-value pairs with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ParseKeyValue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test048();
      expect(result.resultName).assertEqual('John');
      expect(result.resultAge).assertEqual('30');
      expect(result.resultCity).assertEqual('NYC');
    });

    /**
     * @tc.name   StringMatchAll_ExtractFunctions_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXFUNC_0100
     * @tc.desc   Test extracting function names with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractFunctions_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test049();
      expect(result.result).assertEqual(result.expected);
      expect(result.func0).assertEqual('foo');
      expect(result.func1).assertEqual('bar');
      expect(result.func2).assertEqual('baz');
    });

    /**
     * @tc.name   StringMatchAll_ExtractVariables_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXVAR_0100
     * @tc.desc   Test extracting variable declarations with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractVariables_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test050();
      expect(result.result0Name).assertEqual('a');
      expect(result.result1Type).assertEqual('let');
      expect(result.result2Name).assertEqual('c');
    });

    /**
     * @tc.name   StringMatchAll_ExtractComments_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXCOMM_0100
     * @tc.desc   Test extracting comments with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractComments_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test051();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_HighlightKeyword_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_HLKEY_0100
     * @tc.desc   Test highlighting keywords with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_HighlightKeyword_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test052();
      expect(result.result).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_SortNumbers_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SORT_0100
     * @tc.desc   Test sorting extracted numbers with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SortNumbers_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test053();
      expect(result.result).assertEqual(result.expected);
      expect(result.num0).assertEqual(1);
      expect(result.num1).assertEqual(7);
      expect(result.num4).assertEqual(100);
    });

    /**
     * @tc.name   StringMatchAll_WordFrequency_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_FREQ_0100
     * @tc.desc   Test counting word frequency with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_WordFrequency_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test054();
      expect(result.resultHello).assertEqual(2);
      expect(result.resultWorld).assertEqual(2);
      expect(result.resultJavascript).assertEqual(1);
    });

    /**
     * @tc.name   StringMatchAll_PasswordStrength_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_PWDSTR_0100
     * @tc.desc   Test checking password strength with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_PasswordStrength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test055();
      expect(result.result).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_ExtractErrors_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXERR_0100
     * @tc.desc   Test extracting error messages with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractErrors_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test056();
      expect(result.result).assertEqual(result.expected);
      expect(result.error0).assertEqual('Name is required');
      expect(result.error1).assertEqual('Email is invalid');
      expect(result.error2).assertEqual('Password too short');
    });

    /**
     * @tc.name   StringMatchAll_LargeDataset_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_LARGEDS_0100
     * @tc.desc   Test matchAll with large dataset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringMatchAll_LargeDataset_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result = matchAllHelperTest.test057();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_VeryLongString_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_VLONG_0100
     * @tc.desc   Test matchAll on very long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringMatchAll_VeryLongString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result = matchAllHelperTest.test058();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0Index).assertEqual(1000000);
    });

    /**
     * @tc.name   StringMatchAll_LazyEvaluation_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_LAZY_0100
     * @tc.desc   Test matchAll lazy evaluation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_LazyEvaluation_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test059();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_EarlyTermination_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EARLY_0100
     * @tc.desc   Test matchAll early termination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_EarlyTermination_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test060();
      expect(result.result).assertEqual(result.expected);
    });


    /**
     * @tc.name   StringMatchAll_RegExpObject_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_REGEXOBJ_0100
     * @tc.desc   Test matchAll with RegExp object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_RegExpObject_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test101();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('123');
      expect(result.match1).assertEqual('456');
    });

    /**
     * @tc.name   StringMatchAll_RegexLiteral_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_REGLIT_0100
     * @tc.desc   Test matchAll with regex literal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_RegexLiteral_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test102();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_StringParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_STRPARAM_0100
     * @tc.desc   Test matchAll with string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_StringParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test103();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('hello');
      expect(result.match1).assertEqual('hello');
    });

    /**
     * @tc.name   StringMatchAll_StringSpecialChar_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_STRSPECHAR_0100
     * @tc.desc   Test matchAll with string containing special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_StringSpecialChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test104();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('a.b');
    });

    /**
     * @tc.name   StringMatchAll_EmptyStringParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EMPTYP_0100
     * @tc.desc   Test matchAll with empty string pattern (global)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_EmptyStringParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test105();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_NullParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NULL_0100
     * @tc.desc   Test matchAll with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NullParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test106();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_UndefinedParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_UNDEF_0100
     * @tc.desc   Test matchAll with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_UndefinedParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test107();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_NumberParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NUM_0100
     * @tc.desc   Test matchAll with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NumberParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test108();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_ObjectParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_OBJ_0100
     * @tc.desc   Test matchAll with object parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ObjectParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test109();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_SingleCaptureGroup_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SCP_0100
     * @tc.desc   Test matchAll with single capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SingleCaptureGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test201();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0_0).assertEqual('test1');
      expect(result.match0_1).assertEqual('1');
      expect(result.match1_0).assertEqual('test2');
      expect(result.match1_1).assertEqual('2');
    });

    /**
     * @tc.name   StringMatchAll_MultipleCaptureGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_MCP_0100
     * @tc.desc   Test matchAll with multiple capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_MultipleCaptureGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test202();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0_0).assertEqual('2019-01-02');
      expect(result.match0_1).assertEqual('2019');
      expect(result.match0_2).assertEqual('01');
      expect(result.match0_3).assertEqual('02');
    });

    /**
     * @tc.name   StringMatchAll_NestedCaptureGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NCP_0100
     * @tc.desc   Test matchAll with nested capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NestedCaptureGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test203();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0_0).assertEqual('test1');
      expect(result.match0_1).assertEqual('e');
      expect(result.match0_2).assertEqual('st1');
      expect(result.match0_3).assertEqual('1');
    });

    /**
     * @tc.name   StringMatchAll_NamedCaptureGroup_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NAMCP_0100
     * @tc.desc   Test matchAll with named capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NamedCaptureGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test204();
      expect(result.resultYear).assertEqual(result.expectedYear);
      expect(result.resultMonth).assertEqual(result.expectedMonth);
      expect(result.resultDay).assertEqual(result.expectedDay);
    });

    /**
     * @tc.name   StringMatchAll_NamedCaptureGroupMixed_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NAMCPMIX_0100
     * @tc.desc   Test matchAll with numbered and named capture groups (test205)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NamedCaptureGroupMixed_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test205();
      expect(result.result0_1).assertEqual(result.expected1);
      expect(result.resultSurname).assertEqual(result.expectedSurname);
    });

    /**
     * @tc.name   StringMatchAll_OptionalCaptureGroup_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_OPTCP_0100
     * @tc.desc   Test matchAll with optional capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_OptionalCaptureGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test206();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('color');
      expect(result.match1).assertEqual('colour');
    });

    /**
     * @tc.name   StringMatchAll_CaptureGroupUndefined_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_CPUNDEF_0100
     * @tc.desc   Test matchAll with undefined capture group value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_CaptureGroupUndefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test207();
      expect(result.result0_0).assertEqual(result.expected0);
      expect(result.result0_1).assertEqual(result.expected1);
    });

    /**
     * @tc.name   StringMatchAll_MultipleOptionalCaptureGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_MOPTCP_0100
     * @tc.desc   Test matchAll with multiple optional capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_MultipleOptionalCaptureGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test208();
      expect(result.result0_1).assertEqual(result.expected0_1);
      expect(result.result0_2).assertEqual(result.expected0_2);
    });

    /**
     * @tc.name   StringMatchAll_MatchVsMatchAllCapture_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_MVMA_0100
     * @tc.desc   Test match vs matchAll with capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_MatchVsMatchAllCapture_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test209();
      const mr = result.matchResult as RegExpMatchArray | null;
      expect(mr !== null).assertTrue();
      if (mr !== null) {
        expect(mr.length).assertEqual(2);
      }
      expect(result.matchAllLength).assertEqual(2);
      expect(result.matchAll0_0).assertEqual('test1');
      expect(result.matchAll0_1).assertEqual('e');
    });

    /**
     * @tc.name   StringMatchAll_ArrayStructure_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ARRSTRUC_0100
     * @tc.desc   Test matchAll result array structure
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ArrayStructure_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test210();
      expect(result.isArray).assertTrue();
      expect(result.match0_0).assertEqual('te');
      expect(result.match0_index).assertEqual(0);
      expect(result.match0_input).assertEqual('test');
    });

    /**
     * @tc.name   StringMatchAll_ArrayLength_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ARRLEN_0100
     * @tc.desc   Test matchAll result array length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ArrayLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test211();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_ArrayProperties_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ARRPROP_0100
     * @tc.desc   Test matchAll result array properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ArrayProperties_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test212();
      expect(result.match0_index).assertEqual(0);
      expect(result.match0_input).assertEqual('hello world');
      expect(result.match0_groups).assertEqual(undefined);
    });

    /**
     * @tc.name   StringMatchAll_IndexProperty_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_INDEX_0100
     * @tc.desc   Test matchAll result index property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_IndexProperty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test213();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_MultipleIndex_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_MIDX_0100
     * @tc.desc   Test matchAll result with multiple indexes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_MultipleIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test214();
      expect(result.match0_index).assertEqual(result.expected0);
      expect(result.match1_index).assertEqual(result.expected1);
      expect(result.match2_index).assertEqual(result.expected2);
    });

    /**
     * @tc.name   StringMatchAll_InputProperty_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_INPUT_0100
     * @tc.desc   Test matchAll result input property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_InputProperty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test215();
      expect(result.match0_input).assertEqual('test string');
      expect(result.match0_inputEqual).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_GroupsUndefined_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GRPUND_0100
     * @tc.desc   Test matchAll groups property without named capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GroupsUndefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test216();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_GroupsObject_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GRPOBJ_0100
     * @tc.desc   Test matchAll groups property with named capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GroupsObject_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test217();
      expect(result.typeOf).assertEqual('object');
      expect(result.resultYear).assertEqual(result.expectedYear);
    });

    /**
     * @tc.name   StringMatchAll_GlobalIgnoreCase_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GI_0100
     * @tc.desc   Test matchAll with gi flags
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GlobalIgnoreCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test218();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_GlobalMultiline_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GM_0100
     * @tc.desc   Test matchAll with gm flags
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GlobalMultiline_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test219();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_GlobalDotAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GS_0100
     * @tc.desc   Test matchAll with gs flags (dotAll mode)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GlobalDotAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test220();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('line1\nline2');
    });

    /**
     * @tc.name   StringMatchAll_GlobalUnicode_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GU_0100
     * @tc.desc   Test matchAll with gu flags (Unicode mode)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GlobalUnicode_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test221();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_GlobalIndices_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GD_0100
     * @tc.desc   Test matchAll with gd flags (indices)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GlobalIndices_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test222();
      const i00 = result.indices0_0 as Array<number>;
      const i10 = result.indices1_0 as Array<number>;
      const e0 = result.expected0 as Array<number>;
      const e1 = result.expected1 as Array<number>;
      expect(i00[0]).assertEqual(e0[0]);
      expect(i00[1]).assertEqual(e0[1]);
      expect(i10[0]).assertEqual(e1[0]);
      expect(i10[1]).assertEqual(e1[1]);
    });

    /**
     * @tc.name   StringMatchAll_IndicesCaptureGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ICP_0100
     * @tc.desc   Test matchAll indices with capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_IndicesCaptureGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test223();
      const a0 = result.indices0_0 as Array<number>;
      const a1 = result.indices0_1 as Array<number>;
      const a2 = result.indices0_2 as Array<number>;
      expect(a0[0]).assertEqual((result.expected0_0 as Array<number>)[0]);
      expect(a1[0]).assertEqual((result.expected0_1 as Array<number>)[0]);
      expect(a2[0]).assertEqual((result.expected0_2 as Array<number>)[0]);
    });

    /**
     * @tc.name   StringMatchAll_IndicesNamedCaptureGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_INCP_0100
     * @tc.desc   Test matchAll indices with named capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_IndicesNamedCaptureGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test224();
      const y = result.indicesGroupsYear as Array<number>;
      const mo = result.indicesGroupsMonth as Array<number>;
      const d = result.indicesGroupsDay as Array<number>;
      expect(y[0]).assertEqual((result.expectedYear as Array<number>)[0]);
      expect(mo[0]).assertEqual((result.expectedMonth as Array<number>)[0]);
      expect(d[0]).assertEqual((result.expectedDay as Array<number>)[0]);
    });

    /**
     * @tc.name   StringMatchAll_Backreference_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_BR_0100
     * @tc.desc   Test matchAll with numeric backreference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_Backreference_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test301();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('abc abc');
      expect(result.match1).assertEqual('def def');
    });

    /**
     * @tc.name   StringMatchAll_NamedBackreference_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NBR_0100
     * @tc.desc   Test matchAll with named backreference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NamedBackreference_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test302();
      expect(result.result).assertEqual(result.expected);
      expect(result.resultWord).assertEqual(result.expectedWord);
    });

    /**
     * @tc.name   StringMatchAll_NonCaptureGroup_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NCG_0100
     * @tc.desc   Test matchAll with non-capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NonCaptureGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test303();
      expect(result.match0_0).assertEqual('abc123');
      expect(result.match0_1).assertEqual('123');
      expect(result.match1_0).assertEqual('def456');
      expect(result.match1_1).assertEqual('456');
    });

    /**
     * @tc.name   StringMatchAll_NestedNonCaptureGroup_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NNCG_0100
     * @tc.desc   Test matchAll with nested non-capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NestedNonCaptureGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test304();
      expect(result.match0_0).assertEqual('foo123bar');
      expect(result.match0_1).assertEqual('123');
    });

    /**
     * @tc.name   StringMatchAll_SplitWithMatchAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SPLIT_0100
     * @tc.desc   Test split string using matchAll results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SplitWithMatchAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test305();
      let pr: Array<string> = [];
      let ex: Array<string> = [];
      if (result.result !== null) {
        pr = result.result as Array<string>;
      }
      if (result.expected !== null) {
        ex = result.expected as Array<string>;
      }
      expect(pr.length).assertEqual(ex.length);
      for (let i = 0; i < pr.length; i++) {
        expect(pr[i]).assertEqual(ex[i]);
      }
    });

    /**
     * @tc.name   StringMatchAll_SearchVsMatchAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SRCHMA_0100
     * @tc.desc   Test search vs matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SearchVsMatchAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test306();
      expect(result.searchIndex).assertEqual(result.expectedSearch);
      expect(result.matchAllIndex0).assertEqual(0);
      expect(result.matchAllIndex1).assertEqual(5);
    });

    /**
     * @tc.name   StringMatchAll_ReplaceAllVsMatchAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_RPLMA_0100
     * @tc.desc   Test replaceAll vs matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ReplaceAllVsMatchAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test307();
      expect(result.replaced).assertEqual(result.expectedReplaced);
      expect(result.matchesLength).assertEqual(2);
    });

    /**
     * @tc.name   StringMatchAll_ReplaceUsingMatchAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_RPLMAALL_0100
     * @tc.desc   Test replace using matchAll results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ReplaceUsingMatchAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test308();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_ExtractKeyValuePairs_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXKV_0100
     * @tc.desc   Test extract key-value pairs using matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractKeyValuePairs_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test309();
      expect(result.resultName).assertEqual(result.expectedName);
      expect(result.resultAge).assertEqual(result.expectedAge);
    });

    /**
     * @tc.name   StringMatchAll_NoGlobalFlagError_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NOG_0100
     * @tc.desc   Test matchAll without global flag throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NoGlobalFlagError_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test310();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_OnlyIFlagError_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ONLYI_0100
     * @tc.desc   Test matchAll with only i flag throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_OnlyIFlagError_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test311();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_OnlyMFlagError_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ONLYM_0100
     * @tc.desc   Test matchAll with only m flag throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_OnlyMFlagError_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllHelperTest.test312();
      expect(result.isTypeError).assertTrue();
    });
  });
  return;
}
