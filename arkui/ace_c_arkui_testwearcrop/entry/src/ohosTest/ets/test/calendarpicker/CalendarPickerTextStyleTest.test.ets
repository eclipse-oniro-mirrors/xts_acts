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

export default function calendarPickerTextStyleTest() {

  describe('CalendarPickerTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCalendarPickerTextStyle001
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_0100
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle001', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle002
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_0200
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle002', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle003
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_0300
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle003', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle004
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_0400
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle004', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle005
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_0500
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle005', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle006
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_0600
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle006', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle007
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_0700
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle007', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle008
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_0800
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle008', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle009
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_0900
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle009', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle010
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_1000
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle010', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle011
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_1100
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle011', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle012
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_1200
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle012', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle013
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_1300
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle013', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle014
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_1400
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle014', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle015
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_1500
     * @tc.desc   testing TextStyle for CalendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle015', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerTextStyle016
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_TEXTSTYLE_1600
     * @tc.desc   testing TextStyle for CalendarPicker with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerTextStyle016', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerTextStyle016()).assertEqual(0)
      done()
    })

  })
}
