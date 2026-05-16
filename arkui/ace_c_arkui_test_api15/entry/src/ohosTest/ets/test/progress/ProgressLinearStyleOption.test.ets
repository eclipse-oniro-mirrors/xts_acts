/*
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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so';

export default function ProgressLinearStyleOptionTest(){

  describe('ProgressLinearStyleOptionTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   ProgressLinearStyleOptionTest_001
     * @tc.number ProgressLinearStyleOptionTest_001
     * @tc.desc   OH_ArkUI_ProgressLinearStyleOption_GetScanEffectEnabled: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProgressLinearStyleOptionTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ProgressLinearStyleOptionTest_001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   ProgressLinearStyleOptionTest_002
     * @tc.number ProgressLinearStyleOptionTest_002
     * @tc.desc   OH_ArkUI_ProgressLinearStyleOption_GetScanEffectEnabled: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProgressLinearStyleOptionTest_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ProgressLinearStyleOptionTest_002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   ProgressLinearStyleOptionTest_003
     * @tc.number ProgressLinearStyleOptionTest_003
     * @tc.desc   OH_ArkUI_ProgressLinearStyleOption_GetSmoothEffectEnabled: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProgressLinearStyleOptionTest_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ProgressLinearStyleOptionTest_003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   ProgressLinearStyleOptionTest_004
     * @tc.number ProgressLinearStyleOptionTest_004
     * @tc.desc   OH_ArkUI_ProgressLinearStyleOption_GetSmoothEffectEnabled: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProgressLinearStyleOptionTest_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ProgressLinearStyleOptionTest_004()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   ProgressLinearStyleOptionTest_005
     * @tc.number ProgressLinearStyleOptionTest_005
     * @tc.desc   OH_ArkUI_ProgressLinearStyleOption_GetSmoothEffectEnabled: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProgressLinearStyleOptionTest_005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ProgressLinearStyleOptionTest_005()).assertEqual(0)
      done();
    });
  })
}
