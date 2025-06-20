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

export default function timePickerDisappearTextStyleTest() {

  describe('TimePickerDisappearTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_0100
     * @tc.name       : testTimePickerDisappearTextStyle001
     * @tc.desc       : testing disappearTextStyle for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerDisappearTextStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_0200
     * @tc.name       : testTimePickerDisappearTextStyle002
     * @tc.desc       : testing disappearTextStyle for TimePicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTimePickerDisappearTextStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_0300
     * @tc.name       : testTimePickerDisappearTextStyle003
     * @tc.desc       : testing disappearTextStyle for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerDisappearTextStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_0400
     * @tc.name       : testTimePickerDisappearTextStyle004
     * @tc.desc       : testing disappearTextStyle for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerDisappearTextStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_0500
     * @tc.name       : testTimePickerDisappearTextStyle005
     * @tc.desc       : testing disappearTextStyle for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerDisappearTextStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_0600
     * @tc.name       : testTimePickerDisappearTextStyle006
     * @tc.desc       : testing disappearTextStyle for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerDisappearTextStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_0700
     * @tc.name       : testTimePickerDisappearTextStyle007
     * @tc.desc       : testing disappearTextStyle for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerDisappearTextStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_0800
     * @tc.name       : testTimePickerDisappearTextStyle008
     * @tc.desc       : testing disappearTextStyle for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerDisappearTextStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_0900
     * @tc.name       : testTimePickerDisappearTextStyle009
     * @tc.desc       : testing disappearTextStyle for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerDisappearTextStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_1000
     * @tc.name       : testTimePickerDisappearTextStyle010
     * @tc.desc       : testing disappearTextStyle for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerDisappearTextStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_1100
     * @tc.name       : testTimePickerDisappearTextStyle011
     * @tc.desc       : testing disappearTextStyle for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerDisappearTextStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_1200
     * @tc.name       : testTimePickerDisappearTextStyle012
     * @tc.desc       : testing disappearTextStyle for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerDisappearTextStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_DISAPPEARTEXTSTYLE_1300
     * @tc.name       : testTimePickerDisappearTextStyle013
     * @tc.desc       : testing disappearTextStyle for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerDisappearTextStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerDisappearTextStyle013()).assertEqual(0)
      done()
    })
  })
}
