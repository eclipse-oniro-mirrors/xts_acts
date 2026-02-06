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

export default function textInputAccessibilityLevelTest() {

  describe('TextInputAccessibilityLevelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextInputAccessibilityLevel001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ACCESSIBILITYLEVEL_0100
     * @tc.desc   testing accessibilityLevel for TextInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputAccessibilityLevel001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputAccessibilityLevel001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputAccessibilityLevel002
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ACCESSIBILITYLEVEL_0200
     * @tc.desc   testing accessibilityLevel for TextInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputAccessibilityLevel002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputAccessibilityLevel002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputAccessibilityLevel003
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ACCESSIBILITYLEVEL_0300
     * @tc.desc   testing accessibilityLevel for TextInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputAccessibilityLevel003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputAccessibilityLevel003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputAccessibilityLevel004
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ACCESSIBILITYLEVEL_0400
     * @tc.desc   testing accessibilityLevel for TextInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputAccessibilityLevel004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputAccessibilityLevel004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputAccessibilityLevel005
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ACCESSIBILITYLEVEL_0500
     * @tc.desc   testing accessibilityLevel for TextInput with alnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputAccessibilityLevel005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputAccessibilityLevel005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputAccessibilityLevel006
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ACCESSIBILITYLEVEL_0600
     * @tc.desc   testing accessibilityLevel for TextInput with alnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputAccessibilityLevel006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
