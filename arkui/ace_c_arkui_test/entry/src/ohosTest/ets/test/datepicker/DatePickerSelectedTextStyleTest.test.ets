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

export default function datePickerSelectedTextStyleTest() {

  describe('DatePickerSelectedTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testDatePickerSelectedTextStyle001
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_0100
     * @tc.desc   testing selectedTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerSelectedTextStyle002
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_0200
     * @tc.desc   testing selectedTextStyle for DatePicker with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerSelectedTextStyle003
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_0300
     * @tc.desc   testing selectedTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerSelectedTextStyle004
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_0400
     * @tc.desc   testing selectedTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerSelectedTextStyle005
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_0500
     * @tc.desc   testing selectedTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerSelectedTextStyle006
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_0600
     * @tc.desc   testing selectedTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerSelectedTextStyle007
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_0700
     * @tc.desc   testing selectedTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerSelectedTextStyle008
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_0800
     * @tc.desc   testing selectedTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerSelectedTextStyle009
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_0900
     * @tc.desc   testing selectedTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerSelectedTextStyle010
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_1000
     * @tc.desc   testing selectedTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerSelectedTextStyle011
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_1100
     * @tc.desc   testing selectedTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerSelectedTextStyle012
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_1200
     * @tc.desc   testing selectedTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerSelectedTextStyle013
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_SELECTEDTEXTSTYLE_1300
     * @tc.desc   testing selectedTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerSelectedTextStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelectedTextStyle013()).assertEqual(0)
      done()
    })
  })
}
