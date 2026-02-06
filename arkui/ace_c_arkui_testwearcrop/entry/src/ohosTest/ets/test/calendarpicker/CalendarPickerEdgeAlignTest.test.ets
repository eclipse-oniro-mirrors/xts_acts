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

export default function calendarPickerEdgeAlignTest() {

  describe('CalendarPickerEdgeAlignTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CALENDARPICKER_EDGEALIGN_0100
     * @tc.name       : testCalendarPickerEdgeAlign001
     * @tc.desc       : testing edgeAlign for CalendarPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCalendarPickerEdgeAlign001', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerEdgeAlign001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CALENDARPICKER_EDGEALIGN_0200
     * @tc.name       : testCalendarPickerEdgeAlign002
     * @tc.desc       : testing edgeAlign for CalendarPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCalendarPickerEdgeAlign002', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerEdgeAlign002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CALENDARPICKER_EDGEALIGN_0300
     * @tc.name       : testCalendarPickerEdgeAlign003
     * @tc.desc       : testing edgeAlign for CalendarPicker with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCalendarPickerEdgeAlign003', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerEdgeAlign003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CALENDARPICKER_EDGEALIGN_0400
     * @tc.name       : testCalendarPickerEdgeAlign004
     * @tc.desc       : testing edgeAlign for CalendarPicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCalendarPickerEdgeAlign004', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerEdgeAlign004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CALENDARPICKER_EDGEALIGN_0500
     * @tc.name       : testCalendarPickerEdgeAlign005
     * @tc.desc       : testing edgeAlign for CalendarPicker with boundary value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCalendarPickerEdgeAlign005', Level.LEVEL1, async  (done: Function) => {
      expect(nativeFunc.testCalendarPickerEdgeAlign005()).assertEqual(0)
      done()
    })

  })
}
