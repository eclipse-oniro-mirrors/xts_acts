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

export default function textAreaSelectedBackgroundColorTest() {

  describe('TextAreaSelectedBackgroundColorTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextAreaSelectedBackgroundColor001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_SELECTEDBACKGROUNDCOLOR_0100
     * @tc.desc   testing SelectedBackgroundColor for textArea with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaSelectedBackgroundColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaSelectedBackgroundColor001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaSelectedBackgroundColor002
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_SELECTEDBACKGROUNDCOLOR_0200
     * @tc.desc   testing SelectedBackgroundColor for textArea with black value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaSelectedBackgroundColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaSelectedBackgroundColor002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaSelectedBackgroundColor003
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_SELECTEDBACKGROUNDCOLOR_0300
     * @tc.desc   testing SelectedBackgroundColor for textArea with white value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaSelectedBackgroundColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaSelectedBackgroundColor003()).assertEqual(0)
      done();
    });

  })
}
