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

export default function textInputSelectedBackgroundColorTest() {

  describe('TextInputSelectedBackgroundColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextInputSelectedBackgroundColor001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_SELECTEDBACKGROUNDCOLOR_0100
     * @tc.desc   testing selectedBackgroundColor for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputSelectedBackgroundColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputSelectedBackgroundColor001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputSelectedBackgroundColor002
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_SELECTEDBACKGROUNDCOLOR_0200
     * @tc.desc   testing selectedBackgroundColor for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputSelectedBackgroundColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputSelectedBackgroundColor002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputSelectedBackgroundColor003
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_SELECTEDBACKGROUNDCOLOR_0300
     * @tc.desc   testing selectedBackgroundColor for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputSelectedBackgroundColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputSelectedBackgroundColor003()).assertEqual(0)
      done()
    })

  })
}
