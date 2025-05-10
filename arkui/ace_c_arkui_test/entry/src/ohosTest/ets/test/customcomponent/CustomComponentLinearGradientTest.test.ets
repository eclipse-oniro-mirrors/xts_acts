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

export default function customComponentLinearGradientTest() {

  describe('CustomComponentLinearGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LINEARGRADIENT_0100
     * @tc.name       : testCustomComponentLinearGradient001
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentLinearGradient001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentLinearGradient001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LINEARGRADIENT_0200
     * @tc.name       : testCustomComponentLinearGradient002
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentLinearGradient002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentLinearGradient002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LINEARGRADIENT_0300
     * @tc.name       : testCustomComponentLinearGradient003
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentLinearGradient003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentLinearGradient003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LINEARGRADIENT_0400
     * @tc.name       : testCustomComponentLinearGradient004
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentLinearGradient004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentLinearGradient004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LINEARGRADIENT_0500
     * @tc.name       : testCustomComponentLinearGradient005
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentLinearGradient005', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentLinearGradient005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LINEARGRADIENT_0600
     * @tc.name       : testCustomComponentLinearGradient006
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentLinearGradient006', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentLinearGradient006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LINEARGRADIENT_0700
     * @tc.name       : testCustomComponentLinearGradient007
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentLinearGradient007', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentLinearGradient007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LINEARGRADIENT_0800
     * @tc.name       : testCustomComponentLinearGradient008
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentLinearGradient008', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentLinearGradient008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LINEARGRADIENT_0900
     * @tc.name       : testCustomComponentLinearGradient009
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentLinearGradient009', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentLinearGradient009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LINEARGRADIENT_1000
     * @tc.name       : testCustomComponentLinearGradient010
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentLinearGradient010', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentLinearGradient010()).assertEqual(0)
      done()
    })
  })
}
