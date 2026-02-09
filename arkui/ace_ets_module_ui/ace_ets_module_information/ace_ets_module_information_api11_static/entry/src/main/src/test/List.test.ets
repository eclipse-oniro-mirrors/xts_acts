'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import advancedCounter from './advancedCounterTest/advancedCounter.test';
import badge from './BadgeTest/badge.test';
import Badge3Jsunit from './BadgeTest/Badge3Jsunit.test';
import BadgeJsunit from './BadgeTest/BadgeJsunit.test';
import CounterComponentTest from './CounterTest/CounterApiTest/CounterComponentTest.test';
import CounterEnable from './CounterTest/CounterEnable.test';
import CounterJsunit from './CounterTest/CounterJsunit.test';
import datalPanelUIJsunit from './DataPanelTest/datalPanelUIJsunit.test';
import datapanel from './DataPanelTest/datapanel.test';
import DataPanelJsunit from './DataPanelTest/DataPanelJsunit.test';
import gauge1 from './gaugeTest/gauge1.test';
import gauge3Jsunit from './gaugeTest/gauge3Jsunit.test';
import GaugeJsunit from './gaugeTest/GaugeJsunit.test';
import gaugeux from './gaugeTest/gaugeux.test';
import loadingProgress from './LoadingProgressTest/loadingProgress.test';
import PatternLockJsunit from './patternLockTest/PatternLockJsunit.test';
import QrCode3Jsunit from './QrcodeTest/QrCode3Jsunit.test';
import QrcodeJsunit from './QrcodeTest/QrcodeJsunit.test';
import QRCodeUIJsunit from './QrcodeTest/QRCodeUIJsunit.test';
import SearchJsunit from './SearchTest/SearchJsunit.test';
export default function testsuite() {
  advancedCounter();
  CounterComponentTest();
  datapanel();

  gaugeux();
  gauge3Jsunit();
  GaugeJsunit();
  QRCodeUIJsunit();
  SearchJsunit();
  badge();

  Badge3Jsunit();
  BadgeJsunit();
  CounterEnable();
  CounterJsunit();
  datalPanelUIJsunit();
  DataPanelJsunit();
  gauge1();
  loadingProgress();
  PatternLockJsunit();
  QrCode3Jsunit();
  QrcodeJsunit();

}