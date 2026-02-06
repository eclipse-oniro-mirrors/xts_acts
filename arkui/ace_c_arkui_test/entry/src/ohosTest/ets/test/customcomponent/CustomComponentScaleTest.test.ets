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

export default function customComponentScaleTest() {

  describe('CustomComponentScaleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomComponentScale001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SCALE_0100
     * @tc.desc   testing scale for flex with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentScale001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentScale001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentScale002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SCALE_0200
     * @tc.desc   testing scale for flex with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentScale002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentScale002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentScale003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SCALE_0300
     * @tc.desc   testing scale for flex with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentScale003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentScale003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentScale004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SCALE_0400
     * @tc.desc   testing scale for flex with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentScale004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentScale004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentScale005
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SCALE_0500
     * @tc.desc   testing scale for flex with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentScale005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentScale005()).assertEqual(0)
      done()
    })
  })
}
