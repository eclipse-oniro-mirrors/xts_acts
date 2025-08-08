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

export default function textInputEnableKeyboardOnFocusTest() {

  describe('TextInputEnableKeyboardOnFocusTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENABLEKEYBOARDONFOCUS_0001
     * @tc.name: testTextInputEnableKeyboardOnFocus001
     * @tc.desc: testing enableKeyboardOnFocus for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputEnableKeyboardOnFocus001', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnableKeyboardOnFocus001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENABLEKEYBOARDONFOCUS_0002
     * @tc.name: testTextInputEnableKeyboardOnFocus002
     * @tc.desc: testing enableKeyboardOnFocus for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputEnableKeyboardOnFocus002', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnableKeyboardOnFocus002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENABLEKEYBOARDONFOCUS_0003
     * @tc.name: testTextInputEnableKeyboardOnFocus003
     * @tc.desc: testing enableKeyboardOnFocus for textInput with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTextInputEnableKeyboardOnFocus003', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnableKeyboardOnFocus003()).assertEqual(0)
      done()
    })
  })
}
