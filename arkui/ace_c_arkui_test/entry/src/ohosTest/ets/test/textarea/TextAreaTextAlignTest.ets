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

export default function textAreaTextAlignTest() {

  describe('TextAreaTextAlignTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextAreaTextAlign001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TEXTALIGN_0100
     * @tc.desc   testing textAlign for textArea with enum value ARKUI_TEXT_ALIGNMENT_START
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaTextAlign001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextAlign001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaTextAlign002
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TEXTALIGN_0200
     * @tc.desc   testing textAlign for textArea with enum value ARKUI_TEXT_ALIGNMENT_CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaTextAlign002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextAlign002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaTextAlign003
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TEXTALIGN_0300
     * @tc.desc   testing textAlign for textArea with enum value ARKUI_TEXT_ALIGNMENT_END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaTextAlign003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextAlign003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaTextAlign004
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TEXTALIGN_0400
     * @tc.desc   testing textAlign for textArea with enum value ARKUI_TEXT_ALIGNMENT_JUSTIFY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaTextAlign004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextAlign004()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaTextAlign005
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TEXTALIGN_0500
     * @tc.desc   testing textAlign for textArea with enum value abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaTextAlign005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextAlign005()).assertEqual(0)
      done();
    });
  })
}
