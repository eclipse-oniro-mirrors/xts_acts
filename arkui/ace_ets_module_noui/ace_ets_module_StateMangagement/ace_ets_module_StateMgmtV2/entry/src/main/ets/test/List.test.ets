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

import ArrayLikeStringTest from './ArrayLikeTest/ArrayLikeStringTest.test';
import Env001 from './envTest/Env001.test';
import PerGlobalConnectTest from './PersistenceV2Test/PerGlobalConnectTest.test';
import ReuseV2Test0030 from './ReuseV2Test/ReuseV2Test0030.test';
import Monitor1Test from './MonitorTest/Monitor1.test';
import Monitor2Test from './MonitorTest/Monitor2.test';
import Monitor3Test from './MonitorTest/Monitor3.test';
import Monitor4Test from './MonitorTest/Monitor4.test';
import Monitor5Test from './MonitorTest/Monitor5.test';
import Monitor6Test from './MonitorTest/Monitor6.test';
import IMonitorTest from './MonitorTest/IMonitor.test';
import Monitor0031Test from './MonitorTest/Monitor0031Test.test';
import Monitor0034Test from './MonitorTest/Monitor0034Test.test';
import Monitor0260Test from './MonitorTest/Monitor0260Test.test';
import Monitor0280Test from './MonitorTest/Monitor0280Test.test';
import Monitor0290Test from './MonitorTest/Monitor0290Test.test';
import Monitor0300Test from './MonitorTest/Monitor0300Test.test';
import Monitor_NullTest from './MonitorTest/Monitor_Null.test';
import ExtendTrackTest from './ObservedV2Test/ExtendTrackTest.test';
import NestTrackTest from './ObservedV2Test/NestTrackTest.test';
import ObjectArrayTest from './ObservedV2Test/ObjectArrayTest.test';
import OnlyObserveTest from './ObservedV2Test/OnlyObserveTest.test';
import StaticTrackTest from './ObservedV2Test/StaticTrackTest.test';
import TrackDateTest from './ObservedV2Test/TrackDateTest.test';
import TrackMapTest from './ObservedV2Test/TrackMapTest.test';
import TrackSetTest from './ObservedV2Test/TrackSetTest.test';
import TwoNestTrackTest from './ObservedV2Test/TwoNestTrackTest.test';
import ArrayTrackTest from './ObservedV2Test/ArrayTrackTest.test';
import ComputedTest from './ComputedTest/Computed.test';
import ComputedLocalTest from './ComputedTest/ComputedLocal.test';
import ComputedMonitorTest from './ComputedTest/ComputedMonitor.test';
import ComputedTraceTest from './ComputedTest/ComputedTrace.test';
import ParamTest from './ParamTest/Param.test';
import ParamAndOnceTest from './ParamTest/ParamAndOnce.test';
import ParamChangeTest from './ParamTest/ParamChange.test';
import ParamTest0020 from './ParamTest/ParamTest0020.test';
import ParamTest0010 from './ParamTest/ParamTest0010.test';
import Provider1Test from './ProviderTest/Provider1.test';
import Provider2Test from './ProviderTest/Provider2.test';
import Provider3Test from './ProviderTest/Provider3.test';
import Provider4Test from './ProviderTest/Provider4.test';
import Provider5Test from './ProviderTest/Provider5.test';
import Provider14Test from './ProviderTest/Provider14.test';
import Provider15Test from './ProviderTest/Provider15.test';
import Provider18Test from './ProviderTest/Provider18.test';
import Provider0300Test from './ProviderTest/Provider0300Test.test';
import ProviderTest0270 from './ProviderTest/ProviderTest0270.test';
import appStorageV2 from './StorageTest/appStorageV2.test';
import ASV20010Test from './appstoragev2/ASV20010Test.test';
import persistenceV2 from './StorageTest/persistenceV2.test';
import EventTest from './EventTest/Event.test';
import LocalTest0140 from './local/LocalTest0140.test';
import Consumer0130Test from './consumerTest/Consumer0130Test.test';
import Consumer0140Test from './consumerTest/Consumer0140Test.test';
import Consumer0170Test from './consumerTest/Consumer0170Test.test';
import SyncMonitor0010Test from './SyncMonitorTest/SyncMonitor0010Test.test';
import SyncMonitor0020Test from './SyncMonitorTest/SyncMonitor0020Test.test';
export default function testsuite() {
	ArrayLikeStringTest();
    Env001();
    PerGlobalConnectTest();
    ReuseV2Test0030();
    Monitor1Test();
    Monitor2Test();
    Monitor3Test();
    Monitor4Test();
    Monitor5Test();
    Monitor6Test();
    IMonitorTest();
    Monitor0031Test();
    Monitor0034Test();
    Monitor0260Test();
    Monitor0280Test();
    Monitor0290Test();
    Monitor0300Test();
    Monitor_NullTest();
    ExtendTrackTest();
    NestTrackTest();
    ObjectArrayTest();
    OnlyObserveTest();
    StaticTrackTest();
    TrackDateTest();
    TrackMapTest();
    TrackSetTest();
    TwoNestTrackTest();
    ArrayTrackTest();
    ComputedTest();
    ComputedLocalTest();
    ComputedMonitorTest();
    ComputedTraceTest();
    ParamTest();
    ParamAndOnceTest();
    ParamChangeTest();
    ParamTest0020();
    ParamTest0010();
    Provider1Test();
    Provider2Test();
    Provider3Test();
    Provider4Test();
    Provider5Test();
    Provider14Test();
    Provider15Test();
    Provider18Test();
    Provider0300Test();
    ProviderTest0270();
    appStorageV2();
    ASV20010Test();
    persistenceV2();
    EventTest();
    LocalTest0140();
    Consumer0130Test();
    Consumer0140Test();
    Consumer0170Test();
    SyncMonitor0010Test();
    SyncMonitor0020Test();
}
