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

export default function customComponentSepiaTest() {

  describe('CustomComponentSepiaTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomComponentSepia001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SEPIA_0100
     * @tc.desc   testing sepia for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentSepia001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentSepia001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentSepia002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SEPIA_0200
     * @tc.desc   testing sepia for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentSepia002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentSepia002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentSepia003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SEPIA_0300
     * @tc.desc   testing sepia for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentSepia003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentSepia003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentSepia004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SEPIA_0400
     * @tc.desc   testing sepia for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentSepia004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentSepia004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentSepia005
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SEPIA_0500
     * @tc.desc   testing sepia for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentSepia005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentSepia005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentSepia006
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SEPIA_0600
     * @tc.desc   testing sepia for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentSepia006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentSepia006()).assertEqual(0)
      done()
    })

  })
}
