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

export default function textInputAccessibilityTextTest() {

  describe('TextInputAccessibilityTextTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_ACCESSIBILITYTEXT_0100
     * @tc.name       : testTextInputAccessibilityText001
     * @tc.desc       : testing accessibilityText for TextInput with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextInputAccessibilityText001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputAccessibilityText001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_ACCESSIBILITYTEXT_0200
     * @tc.name       : testTextInputAccessibilityText002
     * @tc.desc       : testing accessibilityText for TextInput with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextInputAccessibilityText002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputAccessibilityText002()).assertEqual(0)
      done()
    })
  })
}
