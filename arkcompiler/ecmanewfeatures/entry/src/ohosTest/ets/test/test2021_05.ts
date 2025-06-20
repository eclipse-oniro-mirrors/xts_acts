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


let test2021_05_ans = "";

interface weakRefObj {
  id: number
  ref: undefined | WeakRef<weakRefObj>
};
let obj1: weakRefObj | null = { id: 1, ref: undefined };
let obj2: weakRefObj | null = { id: 2, ref: undefined };
let weakRef1: WeakRef<weakRefObj> = new WeakRef(obj2);
let weakRef2: WeakRef<weakRefObj> = new WeakRef(obj1);
obj1.ref = weakRef1;
obj2.ref = weakRef2;

obj1 = null;
obj2 = null;
test2021_05_ans += weakRef1.deref()?.id
test2021_05_ans += weakRef2.deref()?.id
setTimeout(() => {
  //@ts-ignore
  ArkTools.forceFullGC();
  setTimeout(() => {
    if (weakRef1.deref()?.id) {
      test2021_05_ans += weakRef1.deref()?.id
    }
    if (weakRef2.deref()?.id) {
      test2021_05_ans += weakRef2.deref()?.id
    }
  }, 100);
}, 100);

export { test2021_05_ans }