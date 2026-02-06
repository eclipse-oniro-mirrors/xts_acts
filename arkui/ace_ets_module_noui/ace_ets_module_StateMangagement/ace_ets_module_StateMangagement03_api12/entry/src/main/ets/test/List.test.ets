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

import Styles0010TestJsunit from './styles/Styles0010TestJsunit.test';
import Link0100TestJsunit from './link/Link0100TestJsunit.test';
import LinkTest0090 from './link/LinkTest0090.test';
import ProvideConsume0020TestJsunit from './provide_consume/ProvideConsume0020TestJsunit.test';
import ProvideConsume0030TestJsunit from './provide_consume/ProvideConsume0030TestJsunit.test';
import ProvideConsume0040TestJsunit from './provide_consume/ProvideConsume0040TestJsunit.test';
import ProvideConsume0050TestJsunit from './provide_consume/ProvideConsume0050TestJsunit.test';
import ProvideConsume0080TestJsunit from './provide_consume/ProvideConsume0080TestJsunit.test';
import ProvideConsume0360TestJsunit from './provide_consume/ProvideConsume0360TestJsunit.test';
import ProvideConsumeTest0010 from './provide_consume/ProvideConsumeTest0010.test';
import StateMap0010TestJsunit from './state/StateMap0010TestJsunit.test';
import StateSet0010TestJsunit from './state/StateSet0010TestJsunit.test';
import stateArr from './state/stateArr.test';
import StateTest0040 from './state/StateTest0040.test';
import StateTest0080 from './state/StateTest0080.test';
import StateTest0070 from './state/StateTest0070.test';
import StateTest0090 from './state/StateTest0090.test';
import StateUndefinedTest0010 from './state/StateUndefinedTest0010.test';
import Observed0060TestJsunit from './observed_object/Observed0060TestJsunit.test';
import LocalStorageLink0310TestJsunit from './local_storage/LocalStorageLink0310TestJsunit.test';
import LocalStorageProp0320TestJsunit from './local_storage/LocalStorageProp0320TestJsunit.test';
import LocalStorageAbsTestJsunit from './local_storage/LocalStorageAbsTestJsunit.test';
import EventTest from './EventTest/Event.test';
import ASV20010Test from './appstoragev2/ASV20010Test.test';
import LocalTest0140 from './local/LocalTest0140.test';
import ForEachTest010 from './foreachTest/ForEachTest010.test';
import ForEachTest030 from './foreachTest/ForEachTest030.test';
import ForEachTest0330 from './foreachTest/ForEachTest0330.test';
import ForEach001 from './foreachTest/ForEach001.test';
import V1ToV2 from './V1V2Mix/V1ToV2.test';
import V2ToV1 from './V1V2Mix/V2ToV1.test';
import WatchLinkTest0050 from './watchTest/WatchLinkTest0050.test';
import EntryParamsTest from './entryTest/EntryParamsTest.test';
export default function testsuite() {
    Styles0010TestJsunit();
    Link0100TestJsunit();
    LinkTest0090();
    ProvideConsume0020TestJsunit();
    ProvideConsume0030TestJsunit();
    ProvideConsume0040TestJsunit();
    ProvideConsume0050TestJsunit();
    ProvideConsume0080TestJsunit();
    ProvideConsume0360TestJsunit();
    ProvideConsumeTest0010();
    StateMap0010TestJsunit();
    StateSet0010TestJsunit();
    stateArr();
    StateTest0040();
    StateTest0080();
    StateTest0070();
    StateTest0090();
    StateUndefinedTest0010();
    Observed0060TestJsunit();
    LocalStorageLink0310TestJsunit();
    LocalStorageProp0320TestJsunit();
    LocalStorageAbsTestJsunit();
    EventTest();
    ASV20010Test();
    LocalTest0140();
    ForEachTest010();
    ForEachTest030();
    ForEachTest0330();
    ForEach001();
    V1ToV2();
    V2ToV1();
    WatchLinkTest0050();
    EntryParamsTest();
}
