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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, TestType, Size, Level, it } from "@ohos/hypium"
import { hilog } from "@kit.PerformanceAnalysisKit"
import ai_nnrt_stability_test from 'libai_nnrt_stability_test.so'

export default function StabilityTest() {
  describe('StabilityTest', () => {
    
    beforeAll(() => {
      // 所有测试用例开始前执行一次
      hilog.info(0x0000, 'testTag', '========================================');
      hilog.info(0x0000, 'testTag', 'StabilityTest: beforeAll');
      hilog.info(0x0000, 'testTag', '========================================');
    })
    
    beforeEach(() => {
      // 每个测试用例开始前执行
    })
    
    afterEach(() => {
      // 每个测试用例结束后执行
    })
    
    afterAll(() => {
      // 所有测试用例结束后执行一次
      hilog.info(0x0000, 'testTag', '========================================');
      hilog.info(0x0000, 'testTag', 'StabilityTest: afterAll');
      hilog.info(0x0000, 'testTag', '========================================');
    })
    
    /**
     * @tc.name   SUB_AI_NNR_Reliability_North_Stress_0100
     * @tc.number SUB_AI_NNR_Reliability_North_Stress_0100
     * @tc.desc   压力测试：多次创建销毁模型和编译
     * @tc.type   RELIABILITY
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNR_Reliability_North_Stress_0100', Level.LEVEL2, async () => {
      
      try {
        let result: number = await ai_nnrt_stability_test.stabilityTest(0);
        expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }

    })

    /**
     * @tc.name   SUB_AI_NNR_Reliability_North_Stress_0200
     * @tc.number SUB_AI_NNR_Reliability_North_Stress_0200
     * @tc.desc   压力测试：反复创建销毁执行器
     * @tc.type   RELIABILITY
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNR_Reliability_North_Stress_0200', Level.LEVEL2, async () => {
      
      try {
        let result: number = await ai_nnrt_stability_test.stabilityTest(1);
        expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }

    })
  })
}

