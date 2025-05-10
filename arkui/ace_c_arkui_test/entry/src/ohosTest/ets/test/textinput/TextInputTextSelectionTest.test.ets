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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textInputTextSelectionTest() {

  describe('textInputTextSelectionTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TEXT_SELECTION_0001
     * @tc.name: testTextInputTextSelection001
     * @tc.desc: testing textSelection for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputTextSelection001', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputSelection001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TEXT_SELECTION_0002
     * @tc.name: testTextInputTextSelection002
     * @tc.desc: testing textSelection for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputTextSelection002', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputSelection002()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TEXT_SELECTION_0003
     * @tc.name: testTextInputTextSelection003
     * @tc.desc: testing textSelection for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputTextSelection003', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputSelection003()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TEXT_SELECTION_0004
     * @tc.name: testTextInputTextSelection004
     * @tc.desc: testing textSelection for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputTextSelection004', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputSelection004()).assertEqual(0)
      done();
    });
  })
}
