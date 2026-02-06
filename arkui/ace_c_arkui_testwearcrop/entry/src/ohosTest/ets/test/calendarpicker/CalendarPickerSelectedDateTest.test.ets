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

export default function calendarPickerSelectedDateTest() {

  describe('CalendarPickerSelectedDateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_CALENDARPICKER_SELECTED_DATE_0100
     * @tc.name: testCalendarPickerSelectedDate001
     * @tc.desc: testing SelectedDate for calendarPicker with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCalendarPickerSelectedDate001', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerSelectedDate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_CALENDARPICKER_SELECTED_DATE_0200
     * @tc.name: testCalendarPickerSelectedDate002
     * @tc.desc: testing SelectedDate for calendarPicker with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCalendarPickerSelectedDate002', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerSelectedDate002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_CALENDARPICKER_SELECTED_DATE_0300
     * @tc.name: testCalendarPickerSelectedDate003
     * @tc.desc: testing SelectedDate for calendarPicker with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCalendarPickerSelectedDate003', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerSelectedDate003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_CALENDARPICKER_SELECTED_DATE_0400
     * @tc.name: testCalendarPickerSelectedDate004
     * @tc.desc: testing SelectedDate for calendarPicker with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCalendarPickerSelectedDate004', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerSelectedDate004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_CALENDARPICKER_SELECTED_DATE_0500
     * @tc.name: testCalendarPickerSelectedDate005
     * @tc.desc: testing SelectedDate for calendarPicker with Default
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCalendarPickerSelectedDate005', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerSelectedDate005()).assertEqual(0)
      done()
    })

  })
}
