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

import proxyTest from './Proxy/Porxy.test';
import proxy2Test from './Proxy/Porxy2.test';
import proxy3Test from './Proxy/Porxy3.test';
import proxy4Test from './Proxy/Porxy4.test';
import promise1Test from './Promise/Promise1.test';
import reflect1Test from './Reflect/Reflect1.test';
import reflect2Test from './Reflect/Reflect2.test';
import reflect3Test from './Reflect/Reflect3.test';
import reflect5Test from './Reflect/Reflect5.test';
import reflect6Test from './Reflect/Reflect6.test';
import reflect7Test from './Reflect/Reflect7.test';
import reflect8Test from './Reflect/Reflect8.test';
import reflect9Test from './Reflect/Reflect9.test';
import reflect10Test from './Reflect/Reflect10.test';
import reflect11Test from './Reflect/Reflect11.test';

export default function testsuite() {
  proxyTest();
  proxy2Test();
  proxy3Test();
  proxy4Test();
  promise1Test();

  reflect1Test();
  reflect2Test();
  reflect3Test();
  reflect5Test();
  reflect6Test();
  reflect7Test();
  reflect8Test();
  reflect9Test();
  reflect10Test();
  reflect11Test();
}