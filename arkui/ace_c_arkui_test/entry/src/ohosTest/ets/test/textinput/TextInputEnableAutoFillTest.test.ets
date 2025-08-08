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

export default function textInputEnableAutoFillTest() {

  describe('textInputEnableAutoFillTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENABLE_AUTO_FILL_0001
     * @tc.name: testTextInputEnableAutoFill001
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputEnableAutoFill001', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnableAutoFill001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENABLE_AUTO_FILL_0002
     * @tc.name: testTextInputEnableAutoFill002
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputEnableAutoFill002', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnableAutoFill002()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENABLE_AUTO_FILL_0003
     * @tc.name: testTextInputEnableAutoFill003
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputEnableAutoFill003', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnableAutoFill003()).assertEqual(0)
      done();
    });
  })
}
