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

export default function calendarPickerHintRadiusTest() {

  describe('CalendarPickerHintRadiusTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCalendarPickerHintRadius001
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_HINT_RADIUS_0100
     * @tc.desc   testing HintRadius for calendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerHintRadius001', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerHintRadius001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerHintRadius002
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_HINT_RADIUS_0200
     * @tc.desc   testing HintRadius for calendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerHintRadius002', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerHintRadius002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerHintRadius003
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_HINT_RADIUS_0300
     * @tc.desc   testing HintRadius for calendarPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerHintRadius003', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerHintRadius003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerHintRadius004
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_HINT_RADIUS_0400
     * @tc.desc   testing HintRadius for calendarPicker with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerHintRadius004', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerHintRadius004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerHintRadius005
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_HINT_RADIUS_0500
     * @tc.desc   testing HintRadius for calendarPicker with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerHintRadius005', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerHintRadius005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerHintRadius006
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_HINT_RADIUS_0600
     * @tc.desc   testing HintRadius for calendarPicker with NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerHintRadius006', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerHintRadius006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerHintRadius007
     * @tc.number SUB_ARKUI_CAPI_CALENDARPICKER_HINT_RADIUS_0700
     * @tc.desc   testing HintRadius for calendarPicker with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerHintRadius007', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerHintRadius007()).assertEqual(0)
      done()
    })
  })
}
