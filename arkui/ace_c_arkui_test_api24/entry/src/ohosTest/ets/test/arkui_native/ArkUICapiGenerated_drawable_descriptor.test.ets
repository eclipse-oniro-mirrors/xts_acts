/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import arkuiCapiTest from 'libarkuicapigen.so'


export default function arkuiNativeCapiDrawableDescriptor() {
  describe('DrawableDescriptor (drawable_descriptor)', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(50);
      done();
    });

    /**
     * @tc.number  TestArkUICapi_003
     * @tc.name    TestArkUICapi_003
     * @tc.desc    Case: TestArkUICapi_003. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_003', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_004
     * @tc.name    TestArkUICapi_004
     * @tc.desc    Case: TestArkUICapi_004. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_004', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_004()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_005
     * @tc.name    TestArkUICapi_005
     * @tc.desc    Case: TestArkUICapi_005. API: OH_ArkUI_DrawableDescriptor_SetAnimationStopMode. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_005', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_005()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_006
     * @tc.name    TestArkUICapi_006
     * @tc.desc    Case: TestArkUICapi_006. API: OH_ArkUI_DrawableDescriptor_GetAnimationStopMode. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_006', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_006()).assertEqual(0)
      done()
    })

  });
}
