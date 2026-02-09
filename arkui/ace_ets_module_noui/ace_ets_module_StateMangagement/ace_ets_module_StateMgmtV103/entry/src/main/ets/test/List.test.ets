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

import Consume0020Test from './Consume/Consume0020Test.test';
import Consume0030Test from './Consume/Consume0030Test.test';
import Consume0040Test from './Consume/Consume0040Test.test';
import Consume0050Test from './Consume/Consume0050Test.test';
import Consume0060Test from './Consume/Consume0060Test.test';
import ConsumeDefault0240 from './Consume/ConsumeDefault0240.test';
import ConsumeArray from './Consume/ConsumeArray.test.ets'
import ConsumeArray1 from './Consume/ConsumeArray1.test.ets'
import ConsumeColor from './Consume/ConsumeColor.test.ets'
import ConsumeHight from './Consume/ConsumeHight.test.ets'
import ConsumeNumber from './Consume/ConsumeNumber.test.ets'
import ProvideArray from './Provide/ProvideArray.test.ets'
import ProvideArray1 from './Provide/ProvideArray1.test.ets'
import ProvideColor from './Provide/ProvideColor.test.ets'
import ProvideHight from './Provide/ProvideHight.test.ets'
import ProvideNumber from './Provide/ProvideNumber.test.ets'

import provideBrother1 from './Provide/provideBrother1.test.ets'
import provideBrother2 from './Provide/provideBrother2.test.ets'
import provideComponent1 from './Provide/provideComponent1.test.ets'
import provideComponent2 from './Provide/provideComponent2.test.ets'
import provideParent2 from './Provide/provideParent2.test.ets'
import provideParent3 from './Provide/provideParent3.test.ets'
import provideParent4 from './Provide/provideParent4.test.ets'
import provideParent5 from './Provide/provideParent5.test.ets'
import provideParent6 from './Provide/provideParent6.test.ets'
import provide1 from './Provide/provide1.test.ets'
import ProvideArrayBoolean from './Provide/ProvideArrayBoolean.test';
import ProvideArrayNumber from './Provide/ProvideArrayNumber.test';
import ProvideArrayObject from './Provide/ProvideArrayObject.test';
import ProvideMap from './Provide/ProvideMap.test';
import ProvideSet from './Provide/ProvideSet.test';
import ProvideConsume0020TestJsunit from './Provide/ProvideConsume0020TestJsunit.test';
import ProvideConsume0030TestJsunit from './Provide/ProvideConsume0030TestJsunit.test';
import ProvideConsume0040TestJsunit from './Provide/ProvideConsume0040TestJsunit.test';
import ProvideConsume0050TestJsunit from './Provide/ProvideConsume0050TestJsunit.test';
import ProvideConsume0080TestJsunit from './Provide/ProvideConsume0080TestJsunit.test';
import ProvideConsume0360TestJsunit from './Provide/ProvideConsume0360TestJsunit.test';
import ProvideConsumeTest0010 from './Provide/ProvideConsumeTest0010.test';
import ProvideJsunit from './Provide/ProvideJsunit.test.ets';
import provide2 from './Provide/provide2.test.ets'

import objectLinkNumber from './ObjectLink/objectLinkNumber.test.ets'
import ObjectLink1 from './ObjectLink/ObjectLink1.test.ets'
import ObjectLinkFirJsunit from './ObjectLink/ObjectLinkFirJsunit.test.ets';
import ObjectLinkSecJsunit from './ObjectLink/ObjectLinkSecJsunit.test.ets';
import ObjectLinkFarJsunit from './ObjectLink/ObjectLinkFarJsunit.test.ets';
import ObjectLinkSplJsunit from './ObjectLink/ObjectLinkSplJsunit.test.ets';
import ObjectLinkCanJsunit from './ObjectLink/ObjectLinkCanJsunit.test.ets';
import ObjectLinkNusJsunit from './ObjectLink/ObjectLinkNusJsunit.test.ets';
import ObjectLinkArrayJsunit from './ObjectLink/ObjectLinkArrayJsunit.test.ets'
import ObjectLinkMap from './ObjectLink/ObjectLinkMap.test';
import ObjectLinkSet from './ObjectLink/ObjectLinkSet.test';
import ObjectLink2 from './ObjectLink/ObjectLink2.test.ets'

import extendTrackTest from './Track/extendTrackTest.test.ets';
import localTrackTest from './Track/localTrackTest.test.ets';
import provideTrackTest from './Track/provideTrackTest.test.ets';
import StateTrackTest from './Track/StateTrackTest.test.ets';
import nestTrackTest from './Track/nestTrackTest.test.ets';
import storageTrackTest from './Track/storageTrackTest.test.ets';
import allowOverride from './allowOverrideTest/allowOverride.test';
import WatchTest from './Watch/Watch.test';
import WatchLinkTest0050 from './Watch/WatchLinkTest0050.test';
import Observed0060TestJsunit from './Observed/Observed0060TestJsunit.test';

export default function testsuite() {
    Consume0020Test();
    Consume0030Test();
    Consume0040Test();
    Consume0050Test();
    Consume0060Test();
    ConsumeDefault0240();
    ConsumeArray();
    ConsumeArray1();
    ConsumeColor();
    ConsumeHight();
    ConsumeNumber();
    ProvideArray();
    ProvideArray1();
    ProvideColor();
    ProvideHight();
    ProvideNumber();
    provideBrother1();
    provideBrother2();
    provideComponent1();
    provideComponent2();
    provideParent2();
    provideParent3();
    provideParent4();
    provideParent5();
    provideParent6();
    provide1();
    ProvideArrayObject();
    ProvideArrayNumber();
    ProvideArrayBoolean();
    ProvideMap();
    ProvideSet();
    ProvideConsume0020TestJsunit();
    ProvideConsume0030TestJsunit();
    ProvideConsume0040TestJsunit();
    ProvideConsume0050TestJsunit();
    ProvideConsume0080TestJsunit();
    ProvideConsume0360TestJsunit();
    ProvideConsumeTest0010();
    ProvideJsunit();
    provide2();
    objectLinkNumber();
    ObjectLink1();
    ObjectLinkFirJsunit();
    ObjectLinkSecJsunit();
    ObjectLinkFarJsunit();
    ObjectLinkSplJsunit();
    ObjectLinkCanJsunit();
    ObjectLinkNusJsunit();
    ObjectLinkArrayJsunit();
    ObjectLinkMap();
    ObjectLinkSet();
    ObjectLink2();
    extendTrackTest();
    localTrackTest();
    provideTrackTest();
    StateTrackTest();
    nestTrackTest();
    storageTrackTest();
    allowOverride();
    WatchTest();
    WatchLinkTest0050();
    Observed0060TestJsunit();


}
