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

export default function commonAttrsLinearGradientTest() {

  describe('CommonAttrsLinearGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_LINEARGRADIENT_0100
     * @tc.name       : testCommonAttrsLinearGradient001
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsLinearGradient001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsLinearGradient001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_LINEARGRADIENT_0200
     * @tc.name       : testCommonAttrsLinearGradient002
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsLinearGradient002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsLinearGradient002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_LINEARGRADIENT_0300
     * @tc.name       : testCommonAttrsLinearGradient003
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsLinearGradient003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsLinearGradient003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_LINEARGRADIENT_0400
     * @tc.name       : testCommonAttrsLinearGradient004
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsLinearGradient004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsLinearGradient004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_LINEARGRADIENT_0500
     * @tc.name       : testCommonAttrsLinearGradient005
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsLinearGradient005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsLinearGradient005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_LINEARGRADIENT_0600
     * @tc.name       : testCommonAttrsLinearGradient006
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsLinearGradient006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsLinearGradient006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_LINEARGRADIENT_0700
     * @tc.name       : testCommonAttrsLinearGradient007
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsLinearGradient007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsLinearGradient007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_LINEARGRADIENT_0800
     * @tc.name       : testCommonAttrsLinearGradient008
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsLinearGradient008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsLinearGradient008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_LINEARGRADIENT_0900
     * @tc.name       : testCommonAttrsLinearGradient009
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsLinearGradient009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsLinearGradient009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_LINEARGRADIENT_1000
     * @tc.name       : testCommonAttrsLinearGradient010
     * @tc.desc       : testing linearGradient for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsLinearGradient010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsLinearGradient010()).assertEqual(0)
      done()
    })
  })
}
