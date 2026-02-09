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

export default function  () {

  describe('TextInputTextAlignTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextInputTextAlign001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_TEXTALIGN_0100
     * @tc.desc   testing textAlign for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputTextAlign001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputTextAlign001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputTextAlign002
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_TEXTALIGN_0200
     * @tc.desc   testing textAlign for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputTextAlign002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputTextAlign002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputTextAlign003
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_TEXTALIGN_0300
     * @tc.desc   testing textAlign for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputTextAlign003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputTextAlign003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputTextAlign004
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_TEXTALIGN_0400
     * @tc.desc   testing textAlign for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputTextAlign004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputTextAlign004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputTextAlign005
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_TEXTALIGN_0500
     * @tc.desc   testing textAlign for textInput with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputTextAlign005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputTextAlign005()).assertEqual(0)
      done()
    })

  })
}
