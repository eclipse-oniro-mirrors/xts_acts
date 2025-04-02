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

export default function datePickerDisappearTextStyleTest() {

  describe('DatePickerDisappearTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0100
     * @tc.name       : testDatePickerDisappearTextStyle001
     * @tc.desc       : testing disappearTextStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerDisappearTextStyle001', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0200
     * @tc.name       : testDatePickerDisappearTextStyle002
     * @tc.desc       : testing disappearTextStyle for DatePicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDatePickerDisappearTextStyle002', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0200
     * @tc.name       : testDatePickerDisappearTextStyle003
     * @tc.desc       : testing disappearTextStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerDisappearTextStyle003', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0400
     * @tc.name       : testDatePickerDisappearTextStyle004
     * @tc.desc       : testing disappearTextStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerDisappearTextStyle004', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0500
     * @tc.name       : testDatePickerDisappearTextStyle005
     * @tc.desc       : testing disappearTextStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerDisappearTextStyle005', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0600
     * @tc.name       : testDatePickerDisappearTextStyle006
     * @tc.desc       : testing disappearTextStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerDisappearTextStyle006', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0700
     * @tc.name       : testDatePickerDisappearTextStyle007
     * @tc.desc       : testing disappearTextStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerDisappearTextStyle007', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0800
     * @tc.name       : testDatePickerDisappearTextStyle008
     * @tc.desc       : testing disappearTextStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerDisappearTextStyle008', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_0900
     * @tc.name       : testDatePickerDisappearTextStyle009
     * @tc.desc       : testing disappearTextStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerDisappearTextStyle009', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_1000
     * @tc.name       : testDatePickerDisappearTextStyle010
     * @tc.desc       : testing disappearTextStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerDisappearTextStyle010', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_1100
     * @tc.name       : testDatePickerDisappearTextStyle011
     * @tc.desc       : testing disappearTextStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerDisappearTextStyle011', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_1200
     * @tc.name       : testDatePickerDisappearTextStyle012
     * @tc.desc       : testing disappearTextStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerDisappearTextStyle012', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_DISAPPEARTEXTSTYLE_1300
     * @tc.name       : testDatePickerDisappearTextStyle013
     * @tc.desc       : testing disappearTextStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerDisappearTextStyle013', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerDisappearTextStyle013()).assertEqual(0)
      done()
    })
  })
}
