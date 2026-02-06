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

export default function textAreaCaretColorTest() {

  describe('TextAreaCaretColorTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextAreaCaretColor001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_CARETCOLOR_0100
     * @tc.desc   testing caretColor for textArea with red value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaCaretColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaCaretColor001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaCaretColor002
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_CARETCOLOR_0200
     * @tc.desc   testing caretColor for textArea with black value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaCaretColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaCaretColor002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaCaretColor003
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_CARETCOLOR_0300
     * @tc.desc   testing caretColor for textArea with white value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaCaretColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaCaretColor003()).assertEqual(0)
      done();
    });
  })
}
