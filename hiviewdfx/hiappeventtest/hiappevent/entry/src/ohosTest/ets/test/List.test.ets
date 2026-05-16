/*
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

import PerformanceAnalysisKit from './PerformanceAnalysisKit.test'
import PerformanceAnalyhicollie from './PerformanceAnalyhicollie.test'
import PerformanceTest from './PerformanceTest.test';
import AppRecoveryTest from './AppRecovery.test';
import BytraceTest from './ByTrace.test';
import FaultLoggerTest from './FaultLogger.test';
import HiAppEvent1 from './HiAppEventDfx.test'
import hiTraceChainTest from './HiTraceChain.test'
import HitraceMeterTest from './HiTraceMeter.test'
import HiAppEvent from './HiAppEvent.test';
import Hichecker from './HiChecker.test';
import Hilog from'./HiLog.test'
import ErrorObserver from './ErrorObserver.test';
import jsLeakWatcher from './JsLeakWatcher.test'
import HilogApi from './HilogApi.test'
import JsLeakWatcherParamSpecTest from './JsLeakWatcherParamSpec.test'
import HiAppEventParamSpecTest from './HiAppEventParamSpec.test';
import HiAppEventV9ParamSpecTest from './HiAppEventV9ParamSpec.test'

export default function testsuite() {
  PerformanceAnalysisKit();
  PerformanceAnalyhicollie();
  PerformanceTest();
  AppRecoveryTest();
  BytraceTest();
  FaultLoggerTest();
  HiAppEvent1();
  hiTraceChainTest();
  HitraceMeterTest();
  HiAppEvent();
  Hichecker();
  Hilog();
  ErrorObserver();
  jsLeakWatcher();
  HiAppEventParamSpecTest();
  HiAppEventV9ParamSpecTest();
  HilogApi();
  JsLeakWatcherParamSpecTest();
}
