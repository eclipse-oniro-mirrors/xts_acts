/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Consume0020Test from './consumeTest/Consume0020Test.test';
import Consume0030Test from './consumeTest/Consume0030Test.test';
import Consume0040Test from './consumeTest/Consume0040Test.test';
import Consume0050Test from './consumeTest/Consume0050Test.test';
import Consume0060Test from './consumeTest/Consume0060Test.test';
import ConsumeDefault0240 from './consumeTest/ConsumeDefault0240.test';
import AddMonitor001 from './uiutilsTest/AddMonitor001.test';
import AddMonitor002 from './uiutilsTest/AddMonitor002.test';
import MakeBinding001 from './uiutilsTest/MakeBinding001.test';
import AddMonitor003 from './uiutilsTest/AddMonitor003.test';
import AddMonitorErrorCode001 from './uiutilsTest/AddMonitorErrorCode001.test';
export default function testsuite() {
    Consume0020Test();
    Consume0030Test();
    Consume0040Test();
    Consume0050Test();
    Consume0060Test();
    ConsumeDefault0240();
    AddMonitor001();
    AddMonitor002();
    MakeBinding001();
    AddMonitor003();
    AddMonitorErrorCode001();
}
