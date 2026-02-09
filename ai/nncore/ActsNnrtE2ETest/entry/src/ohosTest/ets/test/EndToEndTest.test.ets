/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect ,Level} from '@ohos/hypium';
import testNapi from 'libnnrt_e2e_test.so';

export default function EndToEndTest() {
  describe('NeuralNetworkRuntimeEndToEndTest', () => {
    
    /**
     * @tc.name   sub_AI_NNRt_Core_Func_North_EndToEnd_0100
     * @tc.number sub_AI_NNRt_Core_Func_North_EndToEnd_0100
     * @tc.desc   定长模型编译端到端测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sub_AI_NNRt_Core_Func_North_EndToEnd_0100', Level.LEVEL1, () => {
      let result: number = testNapi.sub_AI_NNRt_Core_Func_North_EndToEnd(100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   sub_AI_NNRt_Core_Func_North_EndToEnd_0300
     * @tc.number sub_AI_NNRt_Core_Func_North_EndToEnd_0300
     * @tc.desc   定长模型编译带量化参数端到端测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sub_AI_NNRt_Core_Func_North_EndToEnd_0300', Level.LEVEL1, () => {
      let result: number = testNapi.sub_AI_NNRt_Core_Func_North_EndToEnd(300);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   sub_AI_NNRt_Core_Func_North_Reliability_0100
     * @tc.number sub_AI_NNRt_Core_Func_North_Reliability_0100
     * @tc.desc   定长模型编译长稳测试（异步Promise执行）
     * @tc.type   RELIABILITY
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('sub_AI_NNRt_Core_Func_North_Reliability_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.sub_AI_NNRt_Core_Func_North_Reliability();
      expect(result).assertEqual(0);
    });
  });
}
