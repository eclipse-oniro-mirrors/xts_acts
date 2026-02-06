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

import CryptoArchitectureTest from './CryptoArchitectureTest.test'
import CryptoArchitecture2Test from './CryptoArchitecture2Test.test'
import CryptoArchitecture3Test from './CryptoArchitecture3Test.test'

export default function testsuite() {
  CryptoArchitectureTest()
  CryptoArchitecture2Test()
  CryptoArchitecture3Test()
}
