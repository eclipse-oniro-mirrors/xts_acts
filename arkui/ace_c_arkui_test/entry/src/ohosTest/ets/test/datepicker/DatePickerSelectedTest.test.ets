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

export default function datePickerSelectedTest() {

  describe('DatePickerSelectedTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_SELECTED_0100
     * @tc.name       : testDatePickerSelected001
     * @tc.desc       : testing selected for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerSelected001', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelected001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_SELECTED_0200
     * @tc.name       : testDatePickerSelected002
     * @tc.desc       : testing selected for DatePicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDatePickerSelected002', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelected002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_SELECTED_0300
     * @tc.name       : testDatePickerSelected003
     * @tc.desc       : testing selected for DatePicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDatePickerSelected003', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelected003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_SELECTED_0400
     * @tc.name       : testDatePickerSelected004
     * @tc.desc       : testing selected for DatePicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDatePickerSelected004', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerSelected004()).assertEqual(0)
      done()
    })
  })
}
