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

export default function stackLinearGradientTest() {

  describe('StackLinearGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_LINEARGRADIENT_0100
     * @tc.name       : testStackLinearGradient001
     * @tc.desc       : testing linearGradient for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLinearGradient001', 0, async (done: Function) => {
      expect(nativeFunc.testStackLinearGradient001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_LINEARGRADIENT_0200
     * @tc.name       : testStackLinearGradient002
     * @tc.desc       : testing linearGradient for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLinearGradient002', 0, async (done: Function) => {
      expect(nativeFunc.testStackLinearGradient002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_LINEARGRADIENT_0300
     * @tc.name       : testStackLinearGradient003
     * @tc.desc       : testing linearGradient for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLinearGradient003', 0, async (done: Function) => {
      expect(nativeFunc.testStackLinearGradient003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_LINEARGRADIENT_0400
     * @tc.name       : testStackLinearGradient004
     * @tc.desc       : testing linearGradient for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLinearGradient004', 0, async (done: Function) => {
      expect(nativeFunc.testStackLinearGradient004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_LINEARGRADIENT_0500
     * @tc.name       : testStackLinearGradient005
     * @tc.desc       : testing linearGradient for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLinearGradient005', 0, async (done: Function) => {
      expect(nativeFunc.testStackLinearGradient005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_LINEARGRADIENT_0600
     * @tc.name       : testStackLinearGradient006
     * @tc.desc       : testing linearGradient for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLinearGradient006', 0, async (done: Function) => {
      expect(nativeFunc.testStackLinearGradient006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_LINEARGRADIENT_0700
     * @tc.name       : testStackLinearGradient007
     * @tc.desc       : testing linearGradient for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLinearGradient007', 0, async (done: Function) => {
      expect(nativeFunc.testStackLinearGradient007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_LINEARGRADIENT_0800
     * @tc.name       : testStackLinearGradient008
     * @tc.desc       : testing linearGradient for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLinearGradient008', 0, async (done: Function) => {
      expect(nativeFunc.testStackLinearGradient008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_LINEARGRADIENT_0900
     * @tc.name       : testStackLinearGradient009
     * @tc.desc       : testing linearGradient for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLinearGradient009', 0, async (done: Function) => {
      expect(nativeFunc.testStackLinearGradient009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_LINEARGRADIENT_1000
     * @tc.name       : testStackLinearGradient010
     * @tc.desc       : testing linearGradient for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackLinearGradient010', 0, async (done: Function) => {
      expect(nativeFunc.testStackLinearGradient010()).assertEqual(0)
      done()
    })

  })
}
