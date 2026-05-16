/*
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
import Hwh265Hdr2sdrTest from './Hwh265Hdr2sdrTest.test';
import ApiTest from './ApiTest.test';
import Func2Test from './Func2Test.test';
import FuncTest from './FuncTest.test';
import StateTest from './StateTest.test';

export default function testsuite() {
  Hwh265Hdr2sdrTest();
  ApiTest();
  Func2Test();
  FuncTest();
  StateTest();
}