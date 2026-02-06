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

export default function textAreaTextSelectionTest() {

  describe('textAreaTextSelectionTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextAreaTextSelection001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TEXT_SELECTION_0001
     * @tc.desc   testing textSelection for textArea with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaTextSelection001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextSelection001()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextAreaTextSelection002
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TEXT_SELECTION_0002
     * @tc.desc   testing textSelection for textArea with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaTextSelection002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextSelection002()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextAreaTextSelection003
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TEXT_SELECTION_0003
     * @tc.desc   testing textSelection for textArea with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaTextSelection003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextSelection003()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextAreaTextSelection004
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TEXT_SELECTION_0004
     * @tc.desc   testing textSelection for textArea with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaTextSelection004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextSelection004()).assertEqual(0)
      done();
    });
  })
}
