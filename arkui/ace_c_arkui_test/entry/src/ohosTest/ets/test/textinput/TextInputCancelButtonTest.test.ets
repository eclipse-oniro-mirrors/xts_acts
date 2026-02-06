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

export default function textInputCancelButtonTest() {

  describe('textInputCancelButtonTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextInputCancelButton001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CANCEL_BUTTON_0001
     * @tc.desc   testing cancelButton for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputCancelButton001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputCancelButton001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextInputCancelButton002
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CANCEL_BUTTON_0002
     * @tc.desc   testing cancelButton for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputCancelButton002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputCancelButton002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextInputCancelButton003
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CANCEL_BUTTON_0003
     * @tc.desc   testing cancelButton for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputCancelButton003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputCancelButton003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextInputCancelButton004
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CANCEL_BUTTON_0004
     * @tc.desc   testing cancelButton for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputCancelButton004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputCancelButton004()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputCancelButton005
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CANCEL_BUTTON_0005
     * @tc.desc   testing cancelButton for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputCancelButton005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputCancelButton005()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputCancelButton006
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CANCEL_BUTTON_0006
     * @tc.desc   testing cancelButton for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputCancelButton006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputCancelButton006()).assertEqual(0)
      done();
    });
  })
}
