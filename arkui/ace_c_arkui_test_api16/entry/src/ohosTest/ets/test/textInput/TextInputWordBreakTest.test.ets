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

export default function textInputWordBreakTest() {

  describe('textInputWordBreakTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_WORD_BREAK_0001
     * @tc.name: testTextInputWordBreak001
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputWordBreak001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputWordBreak001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_WORD_BREAK_0002
     * @tc.name: testTextInputWordBreak002
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputWordBreak002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputWordBreak002()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_WORD_BREAK_0003
     * @tc.name: testTextInputWordBreak003
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputWordBreak003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputWordBreak003()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_WORD_BREAK_0004
     * @tc.name: testTextInputWordBreak004
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputWordBreak004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputWordBreak004()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_WORD_BREAK_0005
     * @tc.name: testTextInputWordBreak005
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputWordBreak005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputWordBreak005()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_WORD_BREAK_0006
     * @tc.name: testTextInputWordBreak006
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputWordBreak006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputWordBreak006()).assertEqual(0)
      done();
    });
  })
}
