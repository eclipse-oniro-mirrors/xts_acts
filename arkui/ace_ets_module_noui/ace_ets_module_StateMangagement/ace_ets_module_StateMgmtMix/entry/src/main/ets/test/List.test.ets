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
import AddMonitor001 from './uiutilsTest/AddMonitor001.test';
import AddMonitor002 from './uiutilsTest/AddMonitor002.test';
import MakeBinding001 from './uiutilsTest/MakeBinding001.test';
import AddMonitor003 from './uiutilsTest/AddMonitor003.test';
import AddMonitorErrorCode001 from './uiutilsTest/AddMonitorErrorCode001.test';
import ApplySync001 from './uiutilsTest/ApplySync001.test';
import FlushUpdates001 from './uiutilsTest/FlushUpdates001.test';
import FlushErrorCode from './uiutilsTest/FlushErrorCode.test';
import getTarget1Test from './getTargetTest/getTarget1.test';
import getTarget2Test from './getTargetTest/getTarget2.test';
import getTarget3Test from './getTargetTest/getTarget3.test';
import getTarget4Test from './getTargetTest/getTarget4.test';
import getTarget5Test from './getTargetTest/getTarget5.test';
import getTarget6Test from './getTargetTest/getTarget6.test';
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
import Rawfile0140 from './useRes/Rawfile0140.test';
import VOneToVTwoTest0010 from './v1tov2/VOneToVTwoTest0010.test';
import VTwoToVOneTest0070 from './v2tov1/VTwoToVOneTest0070.test';
import V1ToV2 from './V1V2Mix/V1ToV2.test';
import V2ToV1 from './V1V2Mix/V2ToV1.test';
import FreezeV2Test from './FreezeV2/Freeze001.test';
import FreezeV2Test03 from './FreezeV2/Freeze002.test';
import FreezeV2Child from './FreezeV2/Freeze003.test';
import FreezeV1Test from './FreezeV1/Freeze001.test';
import FreezeV1Test02 from './FreezeV1/Freeze002.test';
import FreezeV1Test03 from './FreezeV1/Freeze003.test';
import freezeInactive from './FreezeV1/freezeInactive.test';
import twoWayBindTest from './twoWayBindTest/twoWayBind.test';
import twoWayBindTest02 from './twoWayBindTest/twoWayBind02.test';
import bindContentCoverTest from './twoWayBindTest/bindContentCover.test';
import bindSheetTest from './twoWayBindTest/bindSheet.test';
import checkboxTest from './twoWayBindTest/checkbox.test';
import checkboxGroupTest from './twoWayBindTest/checkboxGroup.test';
import MenuItemTest from './twoWayBindTest/MenuItem.test';
import swiperTest from './twoWayBindTest/swiper.test';
import textAreaTest from './twoWayBindTest/textArea.test';
import textInputTest from './twoWayBindTest/textInput.test';
import toggleTest from './twoWayBindTest/toggle.test';
import EnvironmentTest0040 from './Environment/EnvironmentTest0040.test';
import EnvironmentReturnValue from './Environment/EnvironmentReturnValue.test';
import StorageDeprecatedTest from './Environment/StorageDeprecatedTest.test';
import getSharedLocalStorageTest from './GetSharedLocalTest/getSharedLocalStorage.test';
import useSharedStorageTest from './GetSharedLocalTest/useSharedStorage.test';
import persistStorageATest from './GetSharedLocalTest/persistStorageA.test';
import Enum001 from './enum/Enum001.test';
import V1LinkObservedTest from './uiutilsTest/LinkObserved.test';
import V1LocalStoageLinkObservedTest from './uiutilsTest/LocalStoageLinkObserved.test';
import V1LocalStoagePropObservedTest from './uiutilsTest/LocalStoagePropObserved.test';
import V1ObjectLinkObservedTest from './uiutilsTest/ObjectLinkObserved.test';
import V1PropObservedTest from './uiutilsTest/PropObserved.test';
import V1ProvideConsumTest from './uiutilsTest/ProvideConsum.test';
import V1StateObservedTest from './uiutilsTest/StateObserved.test';
import V2ObservedTest from './uiutilsTest/V2Observed.test';
import DecoratorInfoTest from './uiutilsTest/DecoratorInfo.test';

export default function testsuite() {
    V1LinkObservedTest();
    V1LocalStoageLinkObservedTest();
    V1LocalStoagePropObservedTest();
    V1ObjectLinkObservedTest();
    V1PropObservedTest();
    V1ProvideConsumTest();
    V1StateObservedTest();
    V2ObservedTest();
    ApplySync001();
    FlushUpdates001();
    FlushErrorCode();
    Rawfile0140();
    VOneToVTwoTest0010();
    VTwoToVOneTest0070();
    V1ToV2();
    V2ToV1();
    AddMonitor001();
    AddMonitor002();
    MakeBinding001();
    AddMonitor003();
    AddMonitorErrorCode001();
    getTarget1Test();
    getTarget2Test();
    getTarget3Test();
    getTarget4Test();
    getTarget5Test();
    getTarget6Test();
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
    FreezeV2Test();
    FreezeV2Test03();
    FreezeV2Child();
    FreezeV1Test();
    FreezeV1Test02();
    FreezeV1Test03();
    freezeInactive();
    twoWayBindTest();
    twoWayBindTest02();
    bindContentCoverTest();
    bindSheetTest();
    checkboxTest();
    checkboxGroupTest();
    MenuItemTest();
    swiperTest();
    textAreaTest();
    textInputTest();
    toggleTest();
    EnvironmentReturnValue();
    EnvironmentTest0040();
    StorageDeprecatedTest();
    getSharedLocalStorageTest();
    useSharedStorageTest();
    persistStorageATest();
    Enum001();
    DecoratorInfoTest();
}
