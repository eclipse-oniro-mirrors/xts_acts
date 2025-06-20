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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textAreaEnableKeyboardOnFocusTest() {

  describe('textAreaEnableKeyboardOnFocusTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENABLE_KEYBOARD_ON_FOCUS_0001
     * @tc.name: testTextAreaEnableKeyboardOnFocus001
     * @tc.desc: testing enablekeyboardonfocus for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnableKeyboardOnFocus001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnableKeyboardOnFocus001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENABLE_KEYBOARD_ON_FOCUS_0002
     * @tc.name: testTextAreaEnableKeyboardOnFocus002
     * @tc.desc: testing enablekeyboardonfocus for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnableKeyboardOnFocus002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnableKeyboardOnFocus002()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENABLE_KEYBOARD_ON_FOCUS_0003
     * @tc.name: testTextAreaEnableKeyboardOnFocus003
     * @tc.desc: testing enablekeyboardonfocus for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnableKeyboardOnFocus003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnableKeyboardOnFocus003()).assertEqual(0)
      done();
    }); 
  })
}
