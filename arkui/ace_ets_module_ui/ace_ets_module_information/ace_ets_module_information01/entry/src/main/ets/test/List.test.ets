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

import ActsBadgeTest from './BadgeTest/ActsBadgeTest.test';
import Badge3Jsunit from './BadgeTest/Badge3Jsunit.test';
import BadgeJsunitTest from './BadgeTest/BadgeJsunitTest.test';
import BadgeNodeTest from './BadgeTest/BadgeNodeTest.test';
import BadgeResourceTest from './BadgeTest/BadgeResourceTest.test';
import BadgeStyleTest from './BadgeTest/BadgeStyleTest.test';

import ActsDataPanelTest from './DatapPnelTest/ActsDataPanelTest.test';
import DatalPanelUIJsunit from './DatapPnelTest/DatalPanelUIJsunit.test';
import DataPanelContentModifierTest from './DatapPnelTest/DataPanelContentModifier.test';
import DataPanelTest from './DatapPnelTest/DataPanelTest.test';
import DataPanelCloseEffectTest from './DatapPnelTest/DataPanelCloseEffect.test';

import Gauge3Jsunit from './GaugeTest/Gauge3Jsunit.test';
import GaugeColorsTest from './GaugeTest/GaugeColorsTest.test';
import GaugeJsunitTest from './GaugeTest/GaugeJsunitTest.test';
import GaugePrivacySensitiveTest from './GaugeTest/GaugePrivacySensitive.test';
import GaugeUxTest from './GaugeTest/GaugeUxTest.test';
import GaugeContentModifier from './GaugeTest/GaugeContentModifier.test';

import PatternLock11Jsunit from './PatternLockTest/PatternLock11Jsunit.test';
import PatternLockActivateCircleStyle1 from './PatternLockTest/PatternLockActivateCircleStyle1.test';
import PatternLockJsunit from './PatternLockTest/PatternLockJsunit.test';

import QRCodeApiTest from './QRCodeTest/QRCodeApiTest.test';
import QRCodeAttrTest from './QRCodeTest/QRCodeAttrTest.test';
import QRCodeJsunitTest from './QRCodeTest/QRCodeJsunitTest.test';
import QRCodeNodeTest from './QRCodeTest/QRCodeNodeTest.test';
import QRCodeResourceStrTest from './QRCodeTest/QRCodeResourceStrTest.test';
import QRCodeUIJsunit from './QRCodeTest/QRCodeUIJsunit.test';

export default function testsuite() {

    // BadgeTest
    ActsBadgeTest()
    Badge3Jsunit()
    BadgeJsunitTest()
    BadgeNodeTest()
    BadgeResourceTest()
    BadgeStyleTest()
    // DatapanelTest
    ActsDataPanelTest()
    DatalPanelUIJsunit()
    DataPanelContentModifierTest()
    DataPanelTest()
    DataPanelCloseEffectTest()
    // GaugeTest
    Gauge3Jsunit()
    GaugeColorsTest()
    GaugeJsunitTest()
    GaugePrivacySensitiveTest()
    GaugeUxTest()
    GaugeContentModifier()
    // PatternLockTest
    PatternLock11Jsunit()
    PatternLockActivateCircleStyle1()
    PatternLockJsunit()
    // QRCodeTest
    QRCodeApiTest()
    QRCodeAttrTest()
    QRCodeJsunitTest()
    QRCodeNodeTest()
    QRCodeResourceStrTest()
    QRCodeUIJsunit()
}