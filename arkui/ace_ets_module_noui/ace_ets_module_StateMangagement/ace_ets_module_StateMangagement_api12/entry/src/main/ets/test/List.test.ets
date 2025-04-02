/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import getSharedLocalStorageTest from './GetSharedLocalTest/getSharedLocalStorage.test';
import useSharedStorageTest from './GetSharedLocalTest/useSharedStorage.test';
import Monitor1Test from './MonitorTest/Monitor1.test';
import Monitor2Test from './MonitorTest/Monitor2.test';
import Monitor3Test from './MonitorTest/Monitor3.test';
import Monitor4Test from './MonitorTest/Monitor4.test';
import Monitor5Test from './MonitorTest/Monitor5.test';
import Monitor6Test from './MonitorTest/Monitor6.test';
import RepeatEachJsunit from './RepeatTest/RepeatEachJsunit.test';
import persistStorageATest from './GetSharedLocalTest/persistStorageA.test';
import appStorageRefJsunit from './StorageTest/appStorageRefJsunit.test';
import localStorageRefJsunit from './StorageTest/localStorageRefJsunit.test';
import IMonitorTest from './MonitorTest/IMonitor.test';
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
import repeatCountJsunit from './RepeatTest/repeatCountJsunit.test';
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
import getTarget1Test from './getTargetTest/getTarget1.test';
import getTarget2Test from './getTargetTest/getTarget2.test';
import getTarget3Test from './getTargetTest/getTarget3.test';
import getTarget4Test from './getTargetTest/getTarget4.test';
import getTarget5Test from './getTargetTest/getTarget5.test';
import getTarget6Test from './getTargetTest/getTarget6.test';
import ComputedTest from './ComputedTest/Computed.test';
import makeObservedTest from './makeObservedTest/makeObserved.test';
import ParamTest from './ParamTest/Param.test';
import twoWayBindTest from './twoWayBindTest/twoWayBind.test';
import IfElse001Test from './IfElseTest/IfElse001.test';
import IfElse002Test from './IfElseTest/IfElse002.test';
import IfElse003Test from './IfElseTest/IfElse003.test';
import IfElse004Test from './IfElseTest/IfElse004.test';
import IfElse005Test from './IfElseTest/IfElse005.test';
import LifeCycle0120TestJsunit from './lifecycle/LifeCycle0120TestJsunit.test';
import LifeCycle0050TestJsunit from './lifecycle/LifeCycle0050TestJsunit.test';
import WrapBuilder0010TestJsunit from './wrap_builder/WrapBuilder0010TestJsunit.test';
import Builder0080TestJsunit from './builder/Builder0080TestJsunit.test';
import Builder0070TestJsunit from './builder/Builder0070TestJsunit.test';
import Builder0050TestJsunit from './builder/Builder0050TestJsunit.test';
import Builder0120TestJsunit from './builder/Builder0120TestJsunit.test';
import LocalBuilder0040TestJsunit from './local_builder/LocalBuilder0040TestJsunit.test';
import Styles0010TestJsunit from './styles/Styles0010TestJsunit.test';
import Link0100TestJsunit from './link/Link0100TestJsunit.test';
import ProvideConsume0020TestJsunit from './provide_consume/ProvideConsume0020TestJsunit.test';
import ProvideConsume0030TestJsunit from './provide_consume/ProvideConsume0030TestJsunit.test';
import ProvideConsume0040TestJsunit from './provide_consume/ProvideConsume0040TestJsunit.test';
import ProvideConsume0080TestJsunit from './provide_consume/ProvideConsume0080TestJsunit.test';
import ProvideConsume0360TestJsunit from './provide_consume/ProvideConsume0360TestJsunit.test';
import StateMap0010TestJsunit from './state/StateMap0010TestJsunit.test';
import StateSet0010TestJsunit from './state/StateSet0010TestJsunit.test';
import Observed0060TestJsunit from './observed_object/Observed0060TestJsunit.test';

export default function testsuite() {
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
  getSharedLocalStorageTest()
  useSharedStorageTest()
  Monitor1Test()
  Monitor2Test()
  Monitor3Test()
  Monitor4Test()
  Monitor5Test()
  Monitor6Test()
  RepeatEachJsunit();
  persistStorageATest();
  appStorageRefJsunit();
  localStorageRefJsunit();
  IMonitorTest();
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
  repeatCountJsunit();
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
  getTarget1Test();
  getTarget2Test();
  getTarget3Test();
  getTarget4Test();
  getTarget5Test();
  getTarget6Test();
  ComputedTest();
  makeObservedTest();
  ParamTest();
  twoWayBindTest();
  IfElse001Test();
  IfElse002Test();
  IfElse003Test();
  IfElse004Test();
  IfElse005Test();
  LifeCycle0050TestJsunit();
  Builder0080TestJsunit();
  Builder0120TestJsunit();
  Builder0050TestJsunit();
  Builder0070TestJsunit();
  LocalBuilder0040TestJsunit();
  Styles0010TestJsunit();
  Link0100TestJsunit();
  WrapBuilder0010TestJsunit();
  ProvideConsume0020TestJsunit();
  ProvideConsume0030TestJsunit();
  ProvideConsume0040TestJsunit();
  ProvideConsume0080TestJsunit();
  ProvideConsume0360TestJsunit();
  StateMap0010TestJsunit();
  StateSet0010TestJsunit();
  Observed0060TestJsunit();
}