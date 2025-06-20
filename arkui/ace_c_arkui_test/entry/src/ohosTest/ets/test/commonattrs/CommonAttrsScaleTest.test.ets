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

export default function commonAttrsScaleTest() {

  describe('CommonAttrsScaleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SCALE_0100
     * @tc.name       : testCommonAttrsScale001
     * @tc.desc       : testing scale for flex with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsScale001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsScale001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SCALE_0200
     * @tc.name       : testCommonAttrsScale002
     * @tc.desc       : testing scale for flex with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsScale002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsScale002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SCALE_0300
     * @tc.name       : testCommonAttrsScale003
     * @tc.desc       : testing scale for flex with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsScale003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsScale003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SCALE_0400
     * @tc.name       : testCommonAttrsScale004
     * @tc.desc       : testing scale for flex with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsScale004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsScale004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SCALE_0500
     * @tc.name       : testCommonAttrsScale005
     * @tc.desc       : testing scale for flex with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsScale005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsScale005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SCALE_0600
     * @tc.name       : testCommonAttrsScale006
     * @tc.desc       : testing scale for flex with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsScale006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsScale006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SCALE_0700
     * @tc.name       : testCommonAttrsScale007
     * @tc.desc       : testing scale for flex with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsScale007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsScale007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SCALE_0800
     * @tc.name       : testCommonAttrsScale008
     * @tc.desc       : testing scale for flex with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsScale008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsScale008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SCALE_0500
     * @tc.name       : testCommonAttrsScale009
     * @tc.desc       : testing scale for flex with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsScale009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsScale009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SCALE_0500
     * @tc.name       : testCommonAttrsScale010
     * @tc.desc       : testing scale for flex with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsScale010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsScale010()).assertEqual(0)
      done()
    })
  })
}