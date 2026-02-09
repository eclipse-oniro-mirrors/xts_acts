/*
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function testWaterFlower() {

  describe('testWaterFlower', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testWaterFlower001
     * @tc.number SUB_ARKUI_CAPI_WaterFlower_0100
     * @tc.desc   testing create for waterFlower with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlower001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testWaterFlower_001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testWaterFlower002
     * @tc.number SUB_ARKUI_CAPI_WaterFlower_0200
     * @tc.desc   testing create for waterFlower with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlower002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testWaterFlower_002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testWaterFlower003
     * @tc.number SUB_ARKUI_CAPI_WaterFlower_0300
     * @tc.desc   testing create for waterFlower with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlower003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testWaterFlower_003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testWaterFlower004
     * @tc.number SUB_ARKUI_CAPI_WaterFlower_0400
     * @tc.desc   testing create for waterFlower with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlower004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testWaterFlower_004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testWaterFlower005
     * @tc.number SUB_ARKUI_CAPI_WaterFlower_0500
     * @tc.desc   testing create for waterFlower with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlower005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testWaterFlower_005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testWaterFlower006
     * @tc.number SUB_ARKUI_CAPI_WaterFlower_0600
     * @tc.desc   testing waterFlowSectionOption with not nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlower006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testWaterFlower_006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testWaterFlower007
     * @tc.number SUB_ARKUI_CAPI_WaterFlower_0700
     * @tc.desc   testing create for waterFlower with OH_ArkUI_WaterFlowSectionOption_GetMargin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlower007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testWaterFlower_007()).assertEqual(0)
      done()
    })

  })
}
