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

export default function datePickerStartTest() {

  describe('DatePickerStartTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_START_0100
     * @tc.name       : testDatePickerStart001
     * @tc.desc       : testing start for DatePicker with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerStart001', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerStart001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_START_0200
     * @tc.name       : testDatePickerStart002
     * @tc.desc       : testing start for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerStart002', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerStart002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_START_0300
     * @tc.name       : testDatePickerStart003
     * @tc.desc       : testing start for DatePicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDatePickerStart003', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerStart003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_START_0400
     * @tc.name       : testDatePickerStart004
     * @tc.desc       : testing start for DatePicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDatePickerStart004', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerStart004()).assertEqual(0)
      done()
    })
  })
}
