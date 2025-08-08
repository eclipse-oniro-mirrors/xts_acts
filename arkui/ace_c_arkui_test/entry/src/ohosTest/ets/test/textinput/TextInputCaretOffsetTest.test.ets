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

export default function textInputCaretOffsetTest() {

  describe('textInputCaretOffsetTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_CARET_OFFSET_0001
     * @tc.name: testTextInputCaretOffset001
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputCaretOffset001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputCaretOffset001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_CARET_OFFSET_0002
     * @tc.name: testTextInputCaretOffset002
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputCaretOffset002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputCaretOffset002()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_CARET_OFFSET_0003
     * @tc.name: testTextInputCaretOffset003
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputCaretOffset003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputCaretOffset003()).assertEqual(0)
      done();
    });
  })
}
