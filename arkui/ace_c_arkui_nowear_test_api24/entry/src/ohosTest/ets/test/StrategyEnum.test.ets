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

export default function StrategyEnumTest() {
  describe('StrategyEnumTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StrategyEnumTest beforeEach start");
      done();
    })

    // ==================== StrategyEnumTest 枚举值测试 ====================

    /**
     * @tc.name   SUB_ARKUI_COMPETITION_STRATEGY_DEFAULT_VALUE_0100
     * @tc.number SUB_ARKUI_COMPETITION_STRATEGY_DEFAULT_VALUE_0100
     * @tc.desc   Test ARKUI_COMPETITION_STRATEGY_DEFAULT == 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_COMPETITION_STRATEGY_DEFAULT_VALUE_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_COMPETITION_STRATEGY_DEFAULT_VALUE_0100 START');
      expect(nativeFunc.StrategyEnumTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_COMPETITION_STRATEGY_DEFAULT_VALUE_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_COMPETITION_STRATEGY_COMPETITION_VALUE_0100
     * @tc.number SUB_ARKUI_COMPETITION_STRATEGY_COMPETITION_VALUE_0100
     * @tc.desc   Test ARKUI_COMPETITION_STRATEGY_COMPETITION == 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_COMPETITION_STRATEGY_COMPETITION_VALUE_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_COMPETITION_STRATEGY_COMPETITION_VALUE_0100 START');
      expect(nativeFunc.StrategyEnumTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_COMPETITION_STRATEGY_COMPETITION_VALUE_0100 END');
    });
  });
}