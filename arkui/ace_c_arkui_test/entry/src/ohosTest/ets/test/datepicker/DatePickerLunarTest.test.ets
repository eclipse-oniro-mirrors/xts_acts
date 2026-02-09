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

export default function datePickerLunarTest() {

  describe('DatePickerLunarTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testDatePickerLunar001
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_LUNAR_0100
     * @tc.desc   testing lunar for DatePicker with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerLunar001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerLunar001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerLunar002
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_LUNAR_0200
     * @tc.desc   testing lunar for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerLunar002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerLunar002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerLunar003
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_LUNAR_0300
     * @tc.desc   testing lunar for DatePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerLunar003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerLunar003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDatePickerLunar004
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_LUNAR_0300
     * @tc.desc   testing lunar for DatePicker with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDatePickerLunar004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDatePickerLunar003()).assertEqual(0)
      done()
    })
  })
}
