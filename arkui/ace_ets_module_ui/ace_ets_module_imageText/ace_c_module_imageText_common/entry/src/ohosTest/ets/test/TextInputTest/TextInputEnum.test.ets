/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import nativeFunc from 'libnativefunc.so'

export default function TextInputEnumTest() {
  describe('TextInputEnumTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputEnumTest beforeEach start");
      done();
    })

    // ==================== TextInputEnumTest 枚举值测试 ====================

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_INPUT_ON_COPY_0100
     * @tc.number SUB_ARKUI_NODE_TEXT_INPUT_ON_COPY_0100
     * @tc.desc   Test NODE_TEXT_INPUT_ON_COPY == 7015
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_NODE_TEXT_INPUT_ON_COPY_0100', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_INPUT_ON_COPY_0100 START');
      expect(nativeFunc.TextInputEnumTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_INPUT_ON_COPY_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_INPUT_ON_WILL_COPY_0200
     * @tc.number SUB_ARKUI_NODE_TEXT_INPUT_ON_WILL_COPY_0200
     * @tc.desc   Test NODE_TEXT_INPUT_ON_WILL_COPY == 7016
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_NODE_TEXT_INPUT_ON_WILL_COPY_0200', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_INPUT_ON_WILL_COPY_0200 START');
      expect(nativeFunc.TextInputEnumTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_INPUT_ON_WILL_COPY_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_INPUT_ON_WILL_CUT_0300
     * @tc.number SUB_ARKUI_NODE_TEXT_INPUT_ON_WILL_CUT_0300
     * @tc.desc   Test NODE_TEXT_INPUT_ON_WILL_CUT == 7017
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_INPUT_ON_WILL_CUT_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_INPUT_ON_WILL_CUT_0300 START');
      expect(nativeFunc.TextInputEnumTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_INPUT_ON_WILL_CUT_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_INPUT_ORPHAN_CHAR_OPTIMIZATION_0400
     * @tc.number SUB_ARKUI_NODE_TEXT_INPUT_ORPHAN_CHAR_OPTIMIZATION_0400
     * @tc.desc   Test NODE_TEXT_INPUT_ORPHAN_CHAR_OPTIMIZATION == 7043
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_INPUT_ORPHAN_CHAR_OPTIMIZATION_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_INPUT_ORPHAN_CHAR_OPTIMIZATION_0400 START');
      expect(nativeFunc.TextInputEnumTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_INPUT_ORPHAN_CHAR_OPTIMIZATION_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_INPUT_DECORATION_0500
     * @tc.number SUB_ARKUI_NODE_TEXT_INPUT_DECORATION_0500
     * @tc.desc   Test NODE_TEXT_INPUT_DECORATION == 7050
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_INPUT_DECORATION_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_INPUT_DECORATION_0500 START');
      expect(nativeFunc.TextInputEnumTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_INPUT_DECORATION_0500 END');
    });
  });
}