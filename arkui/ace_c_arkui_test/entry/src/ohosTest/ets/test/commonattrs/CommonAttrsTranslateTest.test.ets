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

export default function commonAttrsTranslateTest() {

  describe('CommonAttrsTranslateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsTranslate001
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0100
     * @tc.desc   testing translate for commonAttrs with inalid value -30,0,0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate002
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0200
     * @tc.desc   testing translate for commonAttrs with inalid value 30,-30,30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate003
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0300
     * @tc.desc   testing translate for commonAttrs with inalid value 30,-30,-30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate004
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0400
     * @tc.desc   testing translate for commonAttrs with valid value 30,30,30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate005
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0500
     * @tc.desc   testing translate for commonAttrs with inalid value 30,30,-30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate006
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0600
     * @tc.desc   testing translate for commonAttrs with inalid value -30,-30,30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate007
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0700
     * @tc.desc   testing translate for commonAttrs with invalid value -30,-30,-30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate008
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0800
     * @tc.desc   testing translate for commonAttrs with valid value 0,0,0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate009
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_0900
     * @tc.desc   testing translate for commonAttrs with valid value 30,0,0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate010
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1000
     * @tc.desc   testing translate for commonAttrs with invalid value -30,0,0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate011
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1100
     * @tc.desc   testing translate for commonAttrs with valid value 0,30,0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate012
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1200
     * @tc.desc   testing translate for commonAttrs with invalid value 0,-30,0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate013
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1300
     * @tc.desc   testing translate for commonAttrs with valid value ,,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate014
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1400
     * @tc.desc   testing translate for commonAttrs with valid value 60,60,60
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate015
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1500
     * @tc.desc   testing translate for commonAttrs with invalid value 400,400,400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTranslate016
     * @tc.number SUB_ARKUI_CAPI_COLUMN_TRANSLATE_1600
     * @tc.desc   testing resetAttribut translate for commonAttrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTranslate016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTranslate016()).assertEqual(0)
      done()
    })
  })
}