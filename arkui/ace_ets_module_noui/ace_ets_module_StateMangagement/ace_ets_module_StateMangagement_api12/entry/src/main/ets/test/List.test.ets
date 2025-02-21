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
import getTarget1Test from './getTargetTest/getTarget1.test';
import getTarget2Test from './getTargetTest/getTarget2.test';
import getTarget3Test from './getTargetTest/getTarget3.test';
import getTarget4Test from './getTargetTest/getTarget4.test';
import getTarget5Test from './getTargetTest/getTarget5.test';
import getTarget6Test from './getTargetTest/getTarget6.test';
import makeObservedTest from './makeObservedTest/makeObserved.test';
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
  getTarget1Test();
  getTarget2Test();
  getTarget3Test();
  getTarget4Test();
  getTarget5Test();
  getTarget6Test();
  makeObservedTest();
}