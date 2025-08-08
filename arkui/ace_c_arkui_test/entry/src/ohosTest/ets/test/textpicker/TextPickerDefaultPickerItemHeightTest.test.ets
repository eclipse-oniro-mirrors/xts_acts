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

export default function textPickerDefaultPickerItemHeightTest() {

  describe('TextPickerDefaultPickerItemHeightTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_0100
     * @tc.name       : testTextPickerDefaultPickerItemHeight001
     * @tc.desc       : testing defaultPickerItemHeight for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerDefaultPickerItemHeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDefaultPickerItemHeight001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_0200
     * @tc.name       : testTextPickerDefaultPickerItemHeight002
     * @tc.desc       : testing defaultPickerItemHeight for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerDefaultPickerItemHeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDefaultPickerItemHeight002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_0300
     * @tc.name       : testTextPickerDefaultPickerItemHeight003
     * @tc.desc       : testing defaultPickerItemHeight for textPicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextPickerDefaultPickerItemHeight003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDefaultPickerItemHeight003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_0400
     * @tc.name       : testTextPickerDefaultPickerItemHeight004
     * @tc.desc       : testing defaultPickerItemHeight for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerDefaultPickerItemHeight004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDefaultPickerItemHeight004()).assertEqual(0)
      done()
    })
  })
}
