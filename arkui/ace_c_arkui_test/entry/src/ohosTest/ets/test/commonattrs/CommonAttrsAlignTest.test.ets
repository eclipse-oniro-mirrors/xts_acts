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

export default function commonAttrsAlignTest() {

  describe('CommonAttrsAlignTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0100
     * @tc.name       : testCommonAttrsAlign001
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0200
     * @tc.name       : testCommonAttrsAlign002
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0300
     * @tc.name       : testCommonAttrsAlign003
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0400
     * @tc.name       : testCommonAttrsAlign004
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0500
     * @tc.name       : testCommonAttrsAlign005
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0600
     * @tc.name       : testCommonAttrsAlign006
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0700
     * @tc.name       : testCommonAttrsAlign007
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0800
     * @tc.name       : testCommonAttrsAlign008
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0900
     * @tc.name       : testCommonAttrsAlign009
     * @tc.desc       : testing align for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign009', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_1000
     * @tc.name       : testCommonAttrsAlign010
     * @tc.desc       : testing align for button with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAlign010', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_1100
     * @tc.name       : testCommonAttrsAlign011
     * @tc.desc       : testing align for button with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsAlign011', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlign011()).assertEqual(0)
      done()
    })

  })
}
