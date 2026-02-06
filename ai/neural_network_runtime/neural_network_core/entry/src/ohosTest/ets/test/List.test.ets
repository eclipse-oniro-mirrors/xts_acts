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

import ActsNeuralNetworkCoreTest from './ActsNeuralNetworkCoreTest.test'
import ActsNeuralNetworkRuntimeTest from './ActsNeuralNetworkRuntimeTest.test'
import ActsNeuralNetworkRuntimeTypeTest1 from './ActsNeuralNetworkRuntimeTypeTest1.test'
import ActsNeuralNetworkRuntimeTypeTest2 from './ActsNeuralNetworkRuntimeTypeTest2.test'
import ActsNeuralNetworkTensorTypeTest1 from './ActsNeuralNetworkTensorTypeTest1.test'
import ActsNeuralNetworkTensorTypeTest2 from './ActsNeuralNetworkTensorTypeTest2.test'

export default function testsuite() {
  ActsNeuralNetworkCoreTest()
  ActsNeuralNetworkRuntimeTest()
  ActsNeuralNetworkRuntimeTypeTest1()
  ActsNeuralNetworkRuntimeTypeTest2()
  ActsNeuralNetworkTensorTypeTest1()
  ActsNeuralNetworkTensorTypeTest2()
}
