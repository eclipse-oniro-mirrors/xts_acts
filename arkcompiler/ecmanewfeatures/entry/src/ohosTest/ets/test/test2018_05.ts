/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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


const matchObj = '---756---'.match(/(?<digits>[0-9]+)/);

const str = "Xabc def";
const pattern1 = /(?<=X)[a-z]+/g;
const pattern2 = /(?<!X)[a-z]+/g;
const match1 = str.match(pattern1);
let strAns1 = ""
if (match1) {
  for (let i = 0; i < match1.length; i++) {
    strAns1 += match1[i];
  }
} else {
  console.log("not match")
}
const match2 = str.match(pattern2);
let strAns2 = ""
if (match1) {
  for (let i = 0; i < match2.length; i++) {
    strAns2 += match2[i];
  }
} else {
  console.log("not match")
}
const ans1 = /./.test('\n');
const ans2 = /./s.test('\n');

const ans3 = /^\p{Lowercase_Letter}+$/u.test('aüπ');
const ans4 = /^\p{White_Space}+$/u.test('\n \t');
const ans5 = /^\p{Script=Greek}+$/u.test('ΩΔΨ');

export const test2018_05_ans = matchObj.groups.digits + strAns1 + strAns2 + ans1 + ans2 + ans3 + ans4 + ans5;