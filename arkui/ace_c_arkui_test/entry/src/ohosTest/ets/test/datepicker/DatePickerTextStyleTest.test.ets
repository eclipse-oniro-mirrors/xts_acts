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

export default function datePickerTextStyleTest() {

  describe('DatePickerTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_0100
     * @tc.name       : testDatePickerTextStyle001
     * @tc.desc       : testing textStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerTextStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_0200
     * @tc.name       : testDatePickerTextStyle002
     * @tc.desc       : testing textStyle for DatePicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDatePickerTextStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_0300
     * @tc.name       : testDatePickerTextStyle003
     * @tc.desc       : testing textStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerTextStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_0400
     * @tc.name       : testDatePickerTextStyle004
     * @tc.desc       : testing textStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerTextStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_0500
     * @tc.name       : testDatePickerTextStyle005
     * @tc.desc       : testing textStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerTextStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_0600
     * @tc.name       : testDatePickerTextStyle006
     * @tc.desc       : testing textStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerTextStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_0700
     * @tc.name       : testDatePickerTextStyle007
     * @tc.desc       : testing textStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerTextStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_0800
     * @tc.name       : testDatePickerTextStyle008
     * @tc.desc       : testing textStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerTextStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_0900
     * @tc.name       : testDatePickerTextStyle009
     * @tc.desc       : testing textStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerTextStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_1000
     * @tc.name       : testDatePickerTextStyle010
     * @tc.desc       : testing textStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerTextStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_1100
     * @tc.name       : testDatePickerTextStyle011
     * @tc.desc       : testing textStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerTextStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_1200
     * @tc.name       : testDatePickerTextStyle012
     * @tc.desc       : testing textStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerTextStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_TEXTSTYLE_1300
     * @tc.name       : testDatePickerTextStyle013
     * @tc.desc       : testing textStyle for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerTextStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerTextStyle013()).assertEqual(0)
      done()
    })
  })
}
