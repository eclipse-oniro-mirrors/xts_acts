/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import intelligentScene from '@ohos.intelligentScene';

export default function intelligentSceneNopJsunit() {
  describe('IntelligentSceneNopTest', ()=> {
    console.log("************* intelligentSceneNop Test start*************");
    /**
     * @tc.name   Test_isDoNotDisturbEnabled_001
     * @tc.number SUB_Applications_IntelligentScene_IsDoNotDisturbEnabled_001
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_isDoNotDisturbEnabled_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: Function) => {
      try {
        let flag: boolean = await intelligentScene.isDoNotDisturbEnabled();
        expect(flag).assertEqual(false);
      } catch (error) {
        expect(error?.code).assertEqual(201);
        console.info(`Test_isDoNotDisturbEnabled_001 error: ${error?.code} ${error?.message}`);
      }
      done();
    });

    /**
     * @tc.name   Test_isNotifyAllowedInDoNotDisturb_001
     * @tc.number SUB_Applications_IntelligentScene_IsNotifyAllowedInDoNotDisturb_001
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_isNotifyAllowedInDoNotDisturb_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: Function) => {
      try {
        let flag: boolean = await intelligentScene.isNotifyAllowedInDoNotDisturb();
        expect(flag).assertEqual(false);
      } catch (error) {
        expect(error?.code).assertEqual(201);
        console.info(`Test_isNotifyAllowedInDoNotDisturb_001 error: ${error?.code} ${error?.message}`);
      }
      done();
    });
  })
}