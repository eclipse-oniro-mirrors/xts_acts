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

export default function textPickerRangeTest() {

  describe('TextPickerRangeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_RANGE_0100
     * @tc.name       : testTextPickerRange001
     * @tc.desc       : testing range for textPicker with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerRange001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerRange001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_RANGE_0200
     * @tc.name       : testTextPickerRange002
     * @tc.desc       : testing range for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerRange002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerRange002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_RANGE_0300
     * @tc.name       : testTextPickerRange003
     * @tc.desc       : testing range for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerRange003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerRange003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_RANGE_0400
     * @tc.name       : testTextPickerRange004
     * @tc.desc       : testing range for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerRange004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerRange004()).assertEqual(0)
      done()
    })
  })
}
