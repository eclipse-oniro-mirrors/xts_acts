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

export default function textInputStopEditingTest() {

  describe('TextInputStopEditingTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_STOPEDITING_0100
     * @tc.name: testTextInputStopEditing001
     * @tc.desc: testing stopEditing for textInput with 'true'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputStopEditing001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputStopEditing001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_STOPEDITING_0200
     * @tc.name: testTextInputStopEditing002
     * @tc.desc: testing stopEditing for textInput with 'false'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputStopEditing002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputStopEditing002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_STOPEDITING_0300
     * @tc.name: testTextInputStopEditing003
     * @tc.desc: testing stopEditing for textInput with 'false'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputStopEditing003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputStopEditing003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_STOPEDITING_0400
     * @tc.name: testTextInputStopEditing004
     * @tc.desc: testing stopEditing for textInput with 'false'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTextInputStopEditing004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputStopEditing004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_STOPEDITING_0500
     * @tc.name: testTextInputStopEditing005
     * @tc.desc: testing stopEditing for textInput with 'false'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTextInputStopEditing005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputStopEditing005()).assertEqual(0)
      done()
    })
  })
}
