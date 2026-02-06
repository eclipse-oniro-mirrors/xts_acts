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
import gaugeJsunit from './gaugeTest/GaugeJsunit.test';
import GaugeUxTest from './gaugeTest/gaugeux.test';
import badgeJsunit from './BadgeTest/BadgeJsunit.test';
import datapanelJsunit from './DataPanelTest/DataPanelJsunit.test';
import qrcodeJsunit from './QrcodeTest/QrcodeJsunit.test';
import badgeTest from './BadgeTest/badge'
import datapanelTest from './DataPanelTest/datapanel'
import QRCodeUIJsunit from './QrcodeTest/QRCodeUIJsunit.test';
import patternLockJsunit from './patternLockTest/PatternLockJsunit.test';
import loadingProgressCircularJsunit from './LoadingProgressTest/loadingProgress.test';
import gaugeColorsJsunit from './gaugeTest/gauge1.test';
import badge3Jsunit from './BadgeTest/Badge3Jsunit.test';
import qrCode3Jsunit from './QrcodeTest/QrCode3Jsunit.test';
import searchJsunit from './SearchTest/SearchJsunit.test';
import gauge3Jsunit from './gaugeTest/gauge3Jsunit.test';
import datalPanelUIJsunit from './DataPanelTest/datalPanelUIJsunit.test';


export default function testsuite() {
  gaugeJsunit();
  badgeJsunit()
  datapanelJsunit()
  qrcodeJsunit()
  badgeTest();
  datapanelTest();
  GaugeUxTest();
  QRCodeUIJsunit();
  patternLockJsunit()
  loadingProgressCircularJsunit()
  gaugeColorsJsunit()
  badge3Jsunit();
  qrCode3Jsunit();
  searchJsunit();
  gauge3Jsunit();
  datalPanelUIJsunit();
}