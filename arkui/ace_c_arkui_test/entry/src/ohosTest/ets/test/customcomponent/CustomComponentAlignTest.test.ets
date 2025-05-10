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

export default function customComponentAlignTest() {

  describe('CustomComponentAlignTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0100
     * @tc.name       : testCustomComponentAlign001
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentAlign001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0200
     * @tc.name       : testCustomComponentAlign002
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentAlign002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0300
     * @tc.name       : testCustomComponentAlign003
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentAlign003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0400
     * @tc.name       : testCustomComponentAlign004
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentAlign004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0500
     * @tc.name       : testCustomComponentAlign005
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentAlign005', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0600
     * @tc.name       : testCustomComponentAlign006
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentAlign006', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0700
     * @tc.name       : testCustomComponentAlign007
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentAlign007', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0800
     * @tc.name       : testCustomComponentAlign008
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentAlign008', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_0900
     * @tc.name       : testCustomComponentAlign009
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentAlign009', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_1000
     * @tc.name       : testCustomComponentAlign010
     * @tc.desc       : testing align for button with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentAlign010', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ALIGN_1100
     * @tc.name       : testCustomComponentAlign011
     * @tc.desc       : testing align for button with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentAlign011', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentAlign011()).assertEqual(0)
      done()
    })

  })
}
