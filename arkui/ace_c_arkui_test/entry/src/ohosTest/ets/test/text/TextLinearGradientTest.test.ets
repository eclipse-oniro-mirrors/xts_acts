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

export default function textLinearGradientTest() {

  describe('TextLinearGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEARGRADIENT_0100
     * @tc.name       : testTextLinearGradient001
     * @tc.desc       : testing linearGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLinearGradient001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextLinearGradient001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEARGRADIENT_0200
     * @tc.name       : testTextLinearGradient002
     * @tc.desc       : testing linearGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLinearGradient002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextLinearGradient002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEARGRADIENT_0300
     * @tc.name       : testTextLinearGradient003
     * @tc.desc       : testing linearGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLinearGradient003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextLinearGradient003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEARGRADIENT_0400
     * @tc.name       : testTextLinearGradient004
     * @tc.desc       : testing linearGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLinearGradient004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextLinearGradient004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEARGRADIENT_0500
     * @tc.name       : testTextLinearGradient005
     * @tc.desc       : testing linearGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLinearGradient005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextLinearGradient005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEARGRADIENT_0600
     * @tc.name       : testTextLinearGradient006
     * @tc.desc       : testing linearGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLinearGradient006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextLinearGradient006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEARGRADIENT_0700
     * @tc.name       : testTextLinearGradient007
     * @tc.desc       : testing linearGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLinearGradient007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextLinearGradient007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEARGRADIENT_0800
     * @tc.name       : testTextLinearGradient008
     * @tc.desc       : testing linearGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLinearGradient008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextLinearGradient008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEARGRADIENT_0900
     * @tc.name       : testTextLinearGradient009
     * @tc.desc       : testing linearGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLinearGradient009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextLinearGradient009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEARGRADIENT_1000
     * @tc.name       : testTextLinearGradient010
     * @tc.desc       : testing linearGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLinearGradient010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextLinearGradient010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEARGRADIENT_1100
     * @tc.name       : testTextLinearGradient011
     * @tc.desc       : testing linearGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLinearGradient011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextLinearGradient011()).assertEqual(0)
      done()
    })
  })
}
