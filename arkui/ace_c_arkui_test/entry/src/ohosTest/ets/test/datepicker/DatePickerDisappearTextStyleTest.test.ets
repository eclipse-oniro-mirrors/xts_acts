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

export default function datePickerDisappearTextStyleTest() {

  describe('DatePickerDisappearTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testDatePickerDisappearTextStyle001
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0100
     * @tc.desc   testing disappearTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerDisappearTextStyle002
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0200
     * @tc.desc   testing disappearTextStyle for DatePicker with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerDisappearTextStyle003
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0200
     * @tc.desc   testing disappearTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerDisappearTextStyle004
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0400
     * @tc.desc   testing disappearTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerDisappearTextStyle005
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0500
     * @tc.desc   testing disappearTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerDisappearTextStyle006
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0600
     * @tc.desc   testing disappearTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerDisappearTextStyle007
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0700
     * @tc.desc   testing disappearTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerDisappearTextStyle008
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0800
     * @tc.desc   testing disappearTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerDisappearTextStyle009
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0900
     * @tc.desc   testing disappearTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerDisappearTextStyle010
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_1000
     * @tc.desc   testing disappearTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerDisappearTextStyle011
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_1100
     * @tc.desc   testing disappearTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerDisappearTextStyle012
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_1200
     * @tc.desc   testing disappearTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerDisappearTextStyle013
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_1300
     * @tc.desc   testing disappearTextStyle for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerDisappearTextStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle013()).assertEqual(0)
      done()
    })
  })
}
