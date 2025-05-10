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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function customComponentSepiaTest() {

  describe('CustomComponentSepiaTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SEPIA_0100
     * @tc.name       : testCustomComponentSepia001
     * @tc.desc       : testing sepia for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentSepia001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentSepia001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SEPIA_0200
     * @tc.name       : testCustomComponentSepia002
     * @tc.desc       : testing sepia for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentSepia002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentSepia002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SEPIA_0300
     * @tc.name       : testCustomComponentSepia003
     * @tc.desc       : testing sepia for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentSepia003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentSepia003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SEPIA_0400
     * @tc.name       : testCustomComponentSepia004
     * @tc.desc       : testing sepia for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentSepia004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentSepia004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SEPIA_0500
     * @tc.name       : testCustomComponentSepia005
     * @tc.desc       : testing sepia for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentSepia005', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentSepia005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_SEPIA_0600
     * @tc.name       : testCustomComponentSepia006
     * @tc.desc       : testing sepia for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentSepia006', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentSepia006()).assertEqual(0)
      done()
    })

  })
}
