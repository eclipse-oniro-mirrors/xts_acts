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
import BuilderParam001 from './BuilderParam/BuilderParam001.test';
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
import Extend0010TestJsunit from './Extend/Extend0010TestJsunit.test';
import FreezeV2Test from './FreezeV2/Freeze001.test';
import FreezeV2Test03 from './FreezeV2/Freeze002.test';
import FreezeV2Child from './FreezeV2/Freeze003.test';
import getSharedLocalStorageTest from './GetSharedLocalTest/getSharedLocalStorage.test';
import useSharedStorageTest from './GetSharedLocalTest/useSharedStorage.test';
import persistStorageATest from './GetSharedLocalTest/persistStorageA.test';
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

export default function testsuite() {
    BuilderParam001();
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
    Extend0010TestJsunit();
    FreezeV2Test();
    FreezeV2Test03();
    FreezeV2Child();
    getSharedLocalStorageTest();
    useSharedStorageTest();
    persistStorageATest();
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
}
