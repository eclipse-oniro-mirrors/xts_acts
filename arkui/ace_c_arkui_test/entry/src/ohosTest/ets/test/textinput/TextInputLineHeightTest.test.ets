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

export default function textInputLineHeightTest() {

  describe('TextInputLineHeightTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextInputLineHeight001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_LINEHEIGHT_0100
     * @tc.desc   testing line height for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputLineHeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputLineHeight001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputLineHeight002
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_LINEHEIGHT_0200
     * @tc.desc   testing line height for textInput with 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputLineHeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputLineHeight002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputLineHeight003
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_LINEHEIGHT_0300
     * @tc.desc   testing line height for textInput with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputLineHeight003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputLineHeight003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputLineHeight004
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_LINEHEIGHT_0400
     * @tc.desc   testing line height for textInput with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputLineHeight004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputLineHeight004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputLineHeight005
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_LINEHEIGHT_0500
     * @tc.desc   testing line height for textInput with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputLineHeight005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputLineHeight005()).assertEqual(0)
      done()
    })
  })
}
