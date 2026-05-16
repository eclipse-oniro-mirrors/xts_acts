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

export default function textInputBlurOnSubmitTest() {

  describe('TextInputBlurOnSubmitTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextInputBlurOnSubmit001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_BLURONSUBMIT_0100
     * @tc.desc   testing BlurOnSubmit for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputBlurOnSubmit001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputBlurOnSubmit001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextInputBlurOnSubmit002
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_BLURONSUBMIT_0200
     * @tc.desc   testing BlurOnSubmit for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputBlurOnSubmit002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputBlurOnSubmit002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextInputBlurOnSubmit003
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_BLURONSUBMIT_0300
     * @tc.desc   testing BlurOnSubmit for textInput with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputBlurOnSubmit003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputBlurOnSubmit003()).assertEqual(0)
      done();
    });
  })
}
