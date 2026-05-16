/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import uitestComponentErrorTest from './UitestComponentErrorCode.test';
import uitestDriverErrorTest from './UitestDriverErrorCode.test';
import uitestUiWindowErrorTest from './UitestUiWindowErrorCode.test';
import uitestOnErrorTest from './UitestOnErrorCode.test';
import uitest401 from './Uitest401ErrorCode.test';
import UitestBy401ErrorCode from './UitestBy401ErrorCode.test'
import UitestUiComponent401ErrorCode from './UitestUiComponent401ErrorCode.test'
import UitestUiDriver401ErrorCode from './UitestUiDriver401ErrorCode.test'
import UitestOn401ErrorCode from './UitestOn401ErrorCode.test'
import UitestComponent401ErrorCode from './UitestComponent401ErrorCode.test'
import UitestDriver401ErrorCode from './UitestDriver401ErrorCode.test'
import UitestUWindow401ErrorCode from './UitestUWindow401ErrorCode.test'
import uitestApi26ErrorTest from './UitestApi26ErrorCode.test'
export default function testsuite() {
  uitestComponentErrorTest();
  uitestDriverErrorTest();
  uitestUiWindowErrorTest();
  uitestOnErrorTest();
  uitest401();
  UitestBy401ErrorCode();
  UitestUiComponent401ErrorCode();
  UitestUiDriver401ErrorCode();
  UitestOn401ErrorCode();
  UitestComponent401ErrorCode();
  UitestDriver401ErrorCode();
  UitestUWindow401ErrorCode();
  uitestApi26ErrorTest();
}