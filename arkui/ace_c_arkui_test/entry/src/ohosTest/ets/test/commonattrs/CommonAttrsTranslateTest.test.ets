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

export default function commonAttrsTranslateTest() {

  describe('CommonAttrsTranslateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0100
     * @tc.name       : testCommonAttrsTranslate001
     * @tc.desc       : testing translate for commonAttrs with inalid value -30,0,0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0200
     * @tc.name       : testCommonAttrsTranslate002
     * @tc.desc       : testing translate for commonAttrs with inalid value 30,-30,30
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0300
     * @tc.name       : testCommonAttrsTranslate003
     * @tc.desc       : testing translate for commonAttrs with inalid value 30,-30,-30
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0400
     * @tc.name       : testCommonAttrsTranslate004
     * @tc.desc       : testing translate for commonAttrs with valid value 30,30,30
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0500
     * @tc.name       : testCommonAttrsTranslate005
     * @tc.desc       : testing translate for commonAttrs with inalid value 30,30,-30
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0600
     * @tc.name       : testCommonAttrsTranslate006
     * @tc.desc       : testing translate for commonAttrs with inalid value -30,-30,30
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0700
     * @tc.name       : testCommonAttrsTranslate007
     * @tc.desc       : testing translate for commonAttrs with invalid value -30,-30,-30
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0800
     * @tc.name       : testCommonAttrsTranslate008
     * @tc.desc       : testing translate for commonAttrs with valid value 0,0,0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0900
     * @tc.name       : testCommonAttrsTranslate009
     * @tc.desc       : testing translate for commonAttrs with valid value 30,0,0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate009', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1000
     * @tc.name       : testCommonAttrsTranslate010
     * @tc.desc       : testing translate for commonAttrs with invalid value -30,0,0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate010', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1100
     * @tc.name       : testCommonAttrsTranslate011
     * @tc.desc       : testing translate for commonAttrs with valid value 0,30,0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate011', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1200
     * @tc.name       : testCommonAttrsTranslate012
     * @tc.desc       : testing translate for commonAttrs with invalid value 0,-30,0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate012', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1300
     * @tc.name       : testCommonAttrsTranslate013
     * @tc.desc       : testing translate for commonAttrs with valid value ,,
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate013', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1400
     * @tc.name       : testCommonAttrsTranslate014
     * @tc.desc       : testing translate for commonAttrs with valid value 60,60,60
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate014', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1500
     * @tc.name       : testCommonAttrsTranslate015
     * @tc.desc       : testing translate for commonAttrs with invalid value 400,400,400
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate015', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1600
     * @tc.name       : testCommonAttrsTranslate016
     * @tc.desc       : testing resetAttribut translate for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsTranslate016', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate016()).assertEqual(0)
      done()
    })
  })
}