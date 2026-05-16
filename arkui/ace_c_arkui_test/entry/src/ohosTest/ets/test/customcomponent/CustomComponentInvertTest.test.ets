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

export default function customComponentInvertTest() {

  describe('CustomComponentInvertTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomComponentInvert001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_INVERT_0100
     * @tc.desc   testing invert for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentInvert001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentInvert001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentInvert002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_INVERT_0200
     * @tc.desc   testing invert for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentInvert002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentInvert002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentInvert003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_INVERT_0300
     * @tc.desc   testing invert for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentInvert003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentInvert003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentInvert004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_INVERT_0400
     * @tc.desc   testing invert for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentInvert004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentInvert004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentInvert005
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_INVERT_0500
     * @tc.desc   testing invert for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentInvert005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentInvert005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentInvert006
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_INVERT_0600
     * @tc.desc   testing invert for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentInvert006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentInvert006()).assertEqual(0)
      done()
    })

  })
}
