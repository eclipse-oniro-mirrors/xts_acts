/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium";
function callbackTest(callback: Callback<void>): void {
  callback();
}
export default function basicJsunit() {
  describe('basicTest', () => {
    let callback: Callback<void> = (data: ESObject) => {
      console.log(data);
      expect(true).assertTrue();
    }
   /*
     * @tc.number     : testBasic01
     * @tc.name       : testBasic01
     * @tc.desc       : testBasic
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it('testBasic01', Level.LEVEL0, async (done: Function) => {
      console.info('[testBasic01] START');
      callbackTest(callback);
      console.info('[testBasic01] END');
      done();
    });
  });
}