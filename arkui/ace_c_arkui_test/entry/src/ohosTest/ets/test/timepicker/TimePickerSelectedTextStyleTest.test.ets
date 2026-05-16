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

export default function timePickerSelectedTextStyleTest() {

  describe('TimePickerSelectedTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTimePickerSelectedTextStyle001
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_0100
     * @tc.desc   testing selectedTextStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerSelectedTextStyle002
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_0200
     * @tc.desc   testing selectedTextStyle for TimePicker with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerSelectedTextStyle003
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_0300
     * @tc.desc   testing selectedTextStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerSelectedTextStyle004
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_0400
     * @tc.desc   testing selectedTextStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerSelectedTextStyle005
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_0500
     * @tc.desc   testing selectedTextStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerSelectedTextStyle006
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_0600
     * @tc.desc   testing selectedTextStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerSelectedTextStyle007
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_0700
     * @tc.desc   testing selectedTextStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerSelectedTextStyle008
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_0800
     * @tc.desc   testing selectedTextStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerSelectedTextStyle009
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_0900
     * @tc.desc   testing selectedTextStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerSelectedTextStyle010
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_1000
     * @tc.desc   testing selectedTextStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerSelectedTextStyle011
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_1100
     * @tc.desc   testing selectedTextStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerSelectedTextStyle012
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_1200
     * @tc.desc   testing selectedTextStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTimePickerSelectedTextStyle013
     * @tc.number SUB_ARKUI_CAPI_TIMEPICKER_SELECTEDTEXTSTYLE_1300
     * @tc.desc   testing selectedTextStyle for TimePicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimePickerSelectedTextStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerSelectedTextStyle013()).assertEqual(0)
      done()
    })
  })
}
