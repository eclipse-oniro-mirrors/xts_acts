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

export default function commonAttrsSizeTest() {

  describe('CommonAttrsSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SIZE_0100
     * @tc.name       : testCommonAttrsSize001
     * @tc.desc       : testing size commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSize001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSize001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SIZE_0200
     * @tc.name       : testCommonAttrsSize002
     * @tc.desc       : testing size commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSize002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSize002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SIZE_0300
     * @tc.name       : testCommonAttrsSize003
     * @tc.desc       : testing size commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSize003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSize003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SIZE_0400
     * @tc.name       : testCommonAttrsSize004
     * @tc.desc       : testing size commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSize004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSize004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SIZE_0500
     * @tc.name       : testCommonAttrsSize005
     * @tc.desc       : testing size commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSize005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSize005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SIZE_0600
     * @tc.name       : testCommonAttrsSize006
     * @tc.desc       : testing size commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSize006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSize006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SIZE_0700
     * @tc.name       : testCommonAttrsSize007
     * @tc.desc       : testing size commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSize007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSize007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SIZE_0800
     * @tc.name       : testCommonAttrsSize008
     * @tc.desc       : testing size commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSize008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSize008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SIZE_0900
     * @tc.name       : testCommonAttrsSize009
     * @tc.desc       : testing size commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSize009', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSize009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SIZE_1000
     * @tc.name       : testCommonAttrsSize010
     * @tc.desc       : testing size commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSize010', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSize010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SIZE_1100
     * @tc.name       : testCommonAttrsSize011
     * @tc.desc       : testing size commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSize011', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSize011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SIZE_1200
     * @tc.name       : testCommonAttrsSize012
     * @tc.desc       : testing resetAttribute size commonattrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSize012', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSize012()).assertEqual(0)
      done()
    })
  })
}