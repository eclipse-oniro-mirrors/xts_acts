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

export default function commonAttrsCustomShadowTest() {
    
  describe('CommonAttrsCustomShadowTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CUSTOMSHADOW_0100
     * @tc.name       : testCommonAttrsCustomShadow001
     * @tc.desc       : testing customShadow for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsCustomShadow001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsCustomShadow001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CUSTOMSHADOW_0200
     * @tc.name       : testCommonAttrsCustomShadow002
     * @tc.desc       : testing customShadow for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsCustomShadow002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsCustomShadow002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CUSTOMSHADOW_0300
     * @tc.name       : testCommonAttrsCustomShadow003
     * @tc.desc       : testing customShadow for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsCustomShadow003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsCustomShadow003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CUSTOMSHADOW_0400
     * @tc.name       : testCommonAttrsCustomShadow004
     * @tc.desc       : testing customShadow for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsCustomShadow004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsCustomShadow004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CUSTOMSHADOW_0500
     * @tc.name       : testCommonAttrsCustomShadow005
     * @tc.desc       : testing customShadow for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsCustomShadow005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsCustomShadow005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CUSTOMSHADOW_0600
     * @tc.name       : testCommonAttrsCustomShadow006
     * @tc.desc       : testing customShadow for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsCustomShadow006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsCustomShadow006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CUSTOMSHADOW_0700
     * @tc.name       : testCommonAttrsCustomShadow007
     * @tc.desc       : testing customShadow for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsCustomShadow007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsCustomShadow007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CUSTOMSHADOW_0800
     * @tc.name       : testCommonAttrsCustomShadow008
     * @tc.desc       : testing customShadow for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsCustomShadow008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsCustomShadow008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CUSTOMSHADOW_0900
     * @tc.name       : testCommonAttrsCustomShadow009
     * @tc.desc       : testing resetAttribute customShadow for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsCustomShadow009', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsCustomShadow009()).assertEqual(0)
      done()
    })
  })
}
