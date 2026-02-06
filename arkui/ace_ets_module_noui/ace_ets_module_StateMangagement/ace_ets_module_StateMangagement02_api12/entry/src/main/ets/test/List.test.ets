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

import appStorageRefJsunit from './StorageTest/appStorageRefJsunit.test';
import AppStorageReturnValue from './StorageTest/AppStorageReturnValue.test';
import PersistentStorageReturnValue from './StorageTest/PersistentStorageReturnValue.test';
import LocalStorageReturnValue from './StorageTest/LocalStorageReturnValue.test';
import localStorageRefJsunit from './StorageTest/localStorageRefJsunit.test';
import appStorageV2 from './StorageTest/appStorageV2.test';
import persistenceV2 from './StorageTest/persistenceV2.test';
import AbstractPropertyRefTest from './StorageTest/AbstractPropertyRefTest.test';
import SubAbstractPropertyLinkTest from './StorageTest/SubAbstractPropertyLinkTest.test';
import EnvironmentTest0040 from './StorageTest/EnvironmentTest0040.test';
import EnvironmentReturnValue from './StorageTest/EnvironmentReturnValue.test';
import LocalStorageDeleteTest0120 from './StorageTest/LocalStorageDeleteTest0120.test';
import Local1Jsunit from './ComponentV2Test/Local1Jsunit.test';
import Local2Jsunit from './ComponentV2Test/Local2Jsunit.test';
import Param1Jsunit from './ComponentV2Test/Param1Jsunit.test';
import Param2Jsunit from './ComponentV2Test/Param2Jsunit.test';
import Param3Jsunit from './ComponentV2Test/Param3Jsunit.test';
import Param4Jsunit from './ComponentV2Test/Param4Jsunit.test';
import Monitor1Jsunit from './ComponentV2Test/Monitor1Jsunit.test';
import Monitor2Jsunit from './ComponentV2Test/Monitor2Jsunit.test';
import Monitor3Jsunit from './ComponentV2Test/Monitor3Jsunit.test';
import Monitor4Jsunit from './ComponentV2Test/Monitor4Jsunit.test';
import LocalTestJsunit from './ComponentV2Test/LocalTestJsunit.test';
import ComponentV2TestJsunit from './ComponentV2Test/ComponentV2TestJsunit.test';
import ParamTestJsunit from './ComponentV2Test/ParamTestJsunit.test';
import ParamTestJsunit1 from './ComponentV2Test/ParamTestJsunit1.test';
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
import getTarget1Test from './getTargetTest/getTarget1.test';
import getTarget2Test from './getTargetTest/getTarget2.test';
import getTarget3Test from './getTargetTest/getTarget3.test';
import getTarget4Test from './getTargetTest/getTarget4.test';
import getTarget5Test from './getTargetTest/getTarget5.test';
import getTarget6Test from './getTargetTest/getTarget6.test';
import ComputedTest from './ComputedTest/Computed.test';
import ComputedLocalTest from './ComputedTest/ComputedLocal.test';
import ComputedMonitorTest from './ComputedTest/ComputedMonitor.test';
import ComputedTraceTest from './ComputedTest/ComputedTrace.test';
import makeObservedTest from './makeObservedTest/makeObserved.test';
import makeObserved0020Test from './makeObservedTest/makeObserved0020Test.test';
import makeObserved0030Test from './makeObservedTest/makeObserved0030Test.test';
import makeObserved0040Test from './makeObservedTest/makeObserved0040Test.test';
import makeObserved0050Test from './makeObservedTest/makeObserved0050Test.test';
import makeObserved0060Test from './makeObservedTest/makeObserved0060Test.test';
import makeObserved0070Test from './makeObservedTest/makeObserved0070Test.test';
import makeObserved0080Test from './makeObservedTest/makeObserved0080Test.test';
import makeObserved0100Test from './makeObservedTest/makeObserved0100Test.test';
import makeObserved0110Test from './makeObservedTest/makeObserved0110Test.test';
import makeObserved0120Test from './makeObservedTest/makeObserved0120Test.test';
import makeObserved0130Test from './makeObservedTest/makeObserved0130Test.test';
import makeObserved0150Test from './makeObservedTest/makeObserved0150Test.test';
import MakeObservedTest0090 from './makeObservedTest/MakeObservedTest0090.test';
import MakeObservedTest0300 from './makeObservedTest/MakeObservedTest0300.test';
import ParamTest from './ParamTest/Param.test';
import ParamAndOnceTest from './ParamTest/ParamAndOnce.test';
import ParamChangeTest from './ParamTest/ParamChange.test';
import ParamTest0020 from './ParamTest/ParamTest0020.test';
import ParamTest0010 from './ParamTest/ParamTest0010.test';
import twoWayBindTest from './twoWayBindTest/twoWayBind.test';
import LifeCycle0120TestJsunit from './lifecycle/LifeCycle0120TestJsunit.test';
import LifeCycle0050TestJsunit from './lifecycle/LifeCycle0050TestJsunit.test';
import WrapBuilder0010TestJsunit from './wrap_builder/WrapBuilder0010TestJsunit.test';
import WrapBuilder0020Test from './wrap_builder/WrapBuilder0020Test.test';
import Builder0080TestJsunit from './builder/Builder0080TestJsunit.test';
import Builder0070TestJsunit from './builder/Builder0070TestJsunit.test';
import Builder0050TestJsunit from './builder/Builder0050TestJsunit.test';
import Builder0120TestJsunit from './builder/Builder0120TestJsunit.test';
import LocalBuilder0040TestJsunit from './local_builder/LocalBuilder0040TestJsunit.test';

export default function testsuite() {
    appStorageRefJsunit();
    AppStorageReturnValue();
    PersistentStorageReturnValue();
    LocalStorageReturnValue();
    localStorageRefJsunit();
    EnvironmentReturnValue();
    appStorageV2();
    persistenceV2();
    AbstractPropertyRefTest();
    SubAbstractPropertyLinkTest();
    EnvironmentTest0040();
    LocalStorageDeleteTest0120();
    Local1Jsunit();
    Local2Jsunit();
    Param1Jsunit();
    Param2Jsunit();
    Param3Jsunit();
    Param4Jsunit();
    Monitor1Jsunit();
    Monitor2Jsunit();
    Monitor3Jsunit();
    Monitor4Jsunit();
    LocalTestJsunit();
    ComponentV2TestJsunit();
    ParamTestJsunit();
    ParamTestJsunit1();
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
    getTarget1Test();
    getTarget2Test();
    getTarget3Test();
    getTarget4Test();
    getTarget5Test();
    getTarget6Test();
    ComputedTest();
    ComputedLocalTest();
    ComputedMonitorTest();
    ComputedTraceTest();
    makeObservedTest();
    makeObserved0020Test();
    makeObserved0030Test();
    makeObserved0040Test();
    makeObserved0050Test();
    makeObserved0060Test();
    makeObserved0070Test();
    makeObserved0080Test();
    makeObserved0100Test();
    makeObserved0110Test();
    makeObserved0120Test();
    makeObserved0130Test();
    makeObserved0150Test();
    MakeObservedTest0090();
    MakeObservedTest0300();
    ParamTest();
    ParamAndOnceTest();
    ParamChangeTest();
    ParamTest0020();
    ParamTest0010();
    twoWayBindTest();
    LifeCycle0050TestJsunit();
    WrapBuilder0010TestJsunit();
    WrapBuilder0020Test();
    Builder0080TestJsunit();
    Builder0120TestJsunit();
    Builder0050TestJsunit();
    Builder0070TestJsunit();
    LocalBuilder0040TestJsunit();
}
