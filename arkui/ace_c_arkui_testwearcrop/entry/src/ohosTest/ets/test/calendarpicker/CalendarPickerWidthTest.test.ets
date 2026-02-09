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

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function calendarPickerWidthTest() {

  describe('CalendarPickerWidthTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCalendarPickerWidth001
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_WIDTH_0100
     * @tc.desc   testing width for calendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerWidth001', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerWidth001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerWidth002
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_WIDTH_0200
     * @tc.desc   testing width for calendarPicker with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerWidth002', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerWidth002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerWidth003
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_WIDTH_0300
     * @tc.desc   testing width for calendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerWidth003', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerWidth003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerWidth004
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_WIDTH_0400
     * @tc.desc   testing calendarPicker with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerWidth004', Level.LEVEL1, async  (done: Function) => {	   
      try {
        let result: number = nativeFunc.testCalendarPickerWidth004()
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done();
      } catch (err) {
        console.error("====>testCalendarPickerWidth004 catch err: " + err);
        expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
      }
    })
  })
}
