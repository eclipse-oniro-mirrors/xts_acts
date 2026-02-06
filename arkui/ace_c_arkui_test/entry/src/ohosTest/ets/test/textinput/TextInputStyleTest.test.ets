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

export default function textInputStyleTest() {

  describe('textInputStyleTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextInputStyle001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_STYLE_0001
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputStyle001()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputStyle002
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_STYLE_0002
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputStyle002()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputStyle003
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_STYLE_0003
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputStyle003()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputStyle004
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_STYLE_0004
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputStyle004()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputStyle005
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_STYLE_0005
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputStyle005()).assertEqual(0)
      done();
    });
  })
}
