'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index";
import { Callback } from '@ohos.arkui.component'
function callbackTest(callback: Callback<void>): void {
  callback(undefined);
}
export default function basicJsunit() {
  describe('basicTest', () => {
    let callback: Callback<void> = (data:undefined):void => {
      console.log(data);
      expect(true).assertTrue();
    }
    
    



/**
     * @tc.number   testBasic_static_01
     * @tc.name     testBasic_static_01
     * @tc.desc     testBasic_static_01
     * @tc.level    Level.LEVEL0
     */
it('testBasic_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBasic_static_01] START');
      try {
        callbackTest(callback);
      }catch(Error) {
          expect().assertFail();
      }
      console.info('[testBasic_static_01] END');
      done();
    });
  });
}