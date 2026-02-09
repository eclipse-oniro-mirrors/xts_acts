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

export default function textInputClearButtonModeTest() {

  describe('TextInputClearButtonModeTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextInputClearButtonMode001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CLEARBUTTONMODE_0100
     * @tc.desc   testing clearButtonMode for TextInput with ARKUI_CANCELBUTTON_STYLE_INPUT value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputClearButtonMode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputClearButtonMode001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextInputClearButtonMode002
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CLEARBUTTONMODE_0200
     * @tc.desc   testing clearButtonMode for TextInput with ARKUI_CANCELBUTTON_STYLE_INVISIBLE value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputClearButtonMode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputClearButtonMode002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextInputClearButtonMode003
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CLEARBUTTONMODE_0300
     * @tc.desc   testing clearButtonMode for TextInput with ARKUI_CANCELBUTTON_STYLE_CONSTANT value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputClearButtonMode003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputClearButtonMode003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextInputClearButtonMode004
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CLEARBUTTONMODE_0400
     * @tc.desc   testing clearButtonMode for TextInput with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputClearButtonMode004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputClearButtonMode004()).assertEqual(0)
      done();
    });
  })
}
