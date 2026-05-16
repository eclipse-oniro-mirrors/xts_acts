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

export default function timePickerTextStyleTest() {

  describe('TimePickerTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTimePickerTextStyle001
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_0100
     * @tc.desc   testing textStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerTextStyle002
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_0200
     * @tc.desc   testing textStyle for TimePicker with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerTextStyle003
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_0300
     * @tc.desc   testing textStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerTextStyle004
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_0400
     * @tc.desc   testing textStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerTextStyle005
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_0500
     * @tc.desc   testing textStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerTextStyle006
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_0600
     * @tc.desc   testing textStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerTextStyle007
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_0700
     * @tc.desc   testing textStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerTextStyle008
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_0800
     * @tc.desc   testing textStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerTextStyle009
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_0900
     * @tc.desc   testing textStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerTextStyle010
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_1000
     * @tc.desc   testing textStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerTextStyle011
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_1100
     * @tc.desc   testing textStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerTextStyle012
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_1200
     * @tc.desc   testing textStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerTextStyle013
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_TEXTSTYLE_1300
     * @tc.desc   testing textStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerTextStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerTextStyle013()).assertEqual(0)
      done()
    })
  })
}
