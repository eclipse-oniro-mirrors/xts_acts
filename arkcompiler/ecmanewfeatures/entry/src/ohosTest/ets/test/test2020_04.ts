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


let test2020_04_ans = "";
let obj = {
  name: 'jone',
  age: 16,
  school: {
    name: 'University',
    address: 'shanghai',
  }
}

function test(obj: any) {
  test2020_04_ans += obj.school?.name;
  test2020_04_ans += obj.home?.address;
}

test(obj)

const key = 'prop';
test2020_04_ans += { prop: 1 }?.[key].toString();

interface Person {
  name: String;

  sayHello?(): String;
}

const person1: Person = {
  name: "lily",
}
const person2: Person = {
  name: "Tom",
  sayHello(): String {
    return "HelloTom"
  }
}

test2020_04_ans += person1?.sayHello?.()
test2020_04_ans += person2?.sayHello?.()

export { test2020_04_ans }
