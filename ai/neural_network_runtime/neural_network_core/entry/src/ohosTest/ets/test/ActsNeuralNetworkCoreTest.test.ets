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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import neuralnetworkcoretest from 'libneuralnetworkcoretest.so'

const OH_NN_SUCCESS = 0;

export default function ActsNeuralNetworkCoreTest() {
  describe('ActsNeuralNetworkCoreTest', () => {

     /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_TENSORDESCDESTROY_0100
     * @tc.name    : NnrtTensorDescDestroy001
     * @tc.desc    : destroy a NN_TensorDesc implement return success code
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtTensorDescDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescDestroy001 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_DestroyA();
        console.info("====>NnrtTensorDescDestroy001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescDestroy001 catch err: " + err);
        done()
      }
    })
  })
}
