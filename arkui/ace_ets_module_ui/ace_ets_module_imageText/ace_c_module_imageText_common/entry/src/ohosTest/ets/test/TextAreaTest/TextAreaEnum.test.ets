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

export default function TextAreaEnumTest() {
  describe('TextAreaEnumTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaEnumTest beforeEach start");
      done();
    })

    // ==================== TextAreaEnumTest 枚举值测试 ====================

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_AREA_ON_COPY_0100
     * @tc.number SUB_ARKUI_NODE_TEXT_AREA_ON_COPY_0100
     * @tc.desc   Test NODE_TEXT_AREA_ON_COPY == 8014
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_NODE_TEXT_AREA_ON_COPY_0100', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_AREA_ON_COPY_0100 START');
      expect(nativeFunc.TextAreaEnumTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_AREA_ON_COPY_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_AREA_ON_WILL_COPY_0200
     * @tc.number SUB_ARKUI_NODE_TEXT_AREA_ON_WILL_COPY_0200
     * @tc.desc   Test NODE_TEXT_AREA_ON_WILL_COPY == 8015
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_NODE_TEXT_AREA_ON_WILL_COPY_0200', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_AREA_ON_WILL_COPY_0200 START');
      expect(nativeFunc.TextAreaEnumTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_AREA_ON_WILL_COPY_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_AREA_ON_CUT_0300
     * @tc.number SUB_ARKUI_NODE_TEXT_AREA_ON_CUT_0300
     * @tc.desc   Test NODE_TEXT_AREA_ON_CUT == 8016
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_AREA_ON_CUT_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_AREA_ON_CUT_0300 START');
      expect(nativeFunc.TextAreaEnumTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_AREA_ON_CUT_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_AREA_ON_WILL_CUT_0400
     * @tc.number SUB_ARKUI_NODE_TEXT_AREA_ON_WILL_CUT_0400
     * @tc.desc   Test NODE_TEXT_AREA_ON_WILL_CUT == 8017
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_AREA_ON_WILL_CUT_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_AREA_ON_WILL_CUT_0400 START');
      expect(nativeFunc.TextAreaEnumTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_AREA_ON_WILL_CUT_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_AREA_ORPHAN_CHAR_OPTIMIZATION_0500
     * @tc.number SUB_ARKUI_NODE_TEXT_AREA_ORPHAN_CHAR_OPTIMIZATION_0500
     * @tc.desc   Test NODE_TEXT_AREA_ORPHAN_CHAR_OPTIMIZATION == 8039
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_AREA_ORPHAN_CHAR_OPTIMIZATION_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_AREA_ORPHAN_CHAR_OPTIMIZATION_0500 START');
      expect(nativeFunc.TextAreaEnumTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_AREA_ORPHAN_CHAR_OPTIMIZATION_0500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_AREA_DECORATION_0600
     * @tc.number SUB_ARKUI_NODE_TEXT_AREA_DECORATION_0600
     * @tc.desc   Test NODE_TEXT_AREA_DECORATION == 8047
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_AREA_DECORATION_0600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_AREA_DECORATION_0600 START');
      expect(nativeFunc.TextAreaEnumTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_AREA_DECORATION_0600 END');
    });
  });
}