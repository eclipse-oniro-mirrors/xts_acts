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

export default function textPickerWidthTest() {

  describe('TextPickerWidthTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTPICKER_WIDTH_0100
     * @tc.name: testTextPickerWidth001
     * @tc.desc: testing width for textPicker with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextPickerWidth001', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerWidth001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTPICKER_WIDTH_0200
     * @tc.name: testTextPickerWidth002
     * @tc.desc: testing width for textPicker with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTextPickerWidth002', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerWidth002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTPICKER_WIDTH_0300
     * @tc.name: testTextPickerWidth003
     * @tc.desc: testing width for textPicker with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextPickerWidth003', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerWidth003()).assertEqual(0)
      done()
    })

  })
}
