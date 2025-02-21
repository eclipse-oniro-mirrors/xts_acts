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
import allowOverride from './allowOverrideTest/allowOverride.test';
import appStorageJsunit from './AppStorage/AppStorageJsunit.test';
import linkJsunit from './Link/LinkJsunit.test';
import provideBrother1 from './ProvideTest/provideBrother1.test.ets'
import provideBrother2 from './ProvideTest/provideBrother2.test.ets'
import provideComponent1 from './ProvideTest/provideComponent1.test.ets'
import provideComponent2 from './ProvideTest/provideComponent2.test.ets'
import provideParent2 from './ProvideTest/provideParent2.test.ets'
import provideParent3 from './ProvideTest/provideParent3.test.ets'
import provideParent4 from './ProvideTest/provideParent4.test.ets'
import provideParent5 from './ProvideTest/provideParent5.test.ets'
import provideParent6 from './ProvideTest/provideParent6.test.ets'
import LocalStoageLinkOneJsunit from './State/LocalStoageLinkOneJsunit.test.ets';
import LocalStoageLinkTwoJsunit from './State/LocalStoageLinkTwoJsunit.test.ets';
import LocalStoagePropFourJsunit from './State/LocalStoagePropFourJsunit.test.ets';
import LocalStoagePropTwoJsunit from './State/LocalStoagePropTwoJsunit.test.ets';
import LocalStorage39Jsunit from './State/LocalStorage39Jsunit.test.ets';
import PersistentStoragePersistPropJsunit from './State/PersistentStoragePersistPropJsunit.test.ets';
import ProvideJsunit from './State/ProvideJsunit.test.ets';
import Storage11Jsunit from './State/Storage11Jsunit.test.ets';
import Storage35Jsunit from './State/Storage35Jsunit.test.ets';
import Storage36Jsunit from './State/Storage36Jsunit.test.ets';
import Storage38Jsunit from './State/Storage38Jsunit.test.ets';
import StorageLinkJsunit1 from './State/StorageLinkJsunit1.test.ets';
import StorageProp19Jsunit from './State/StorageProp19Jsunit.test.ets'
import StorageProp20Jsunit from './State/StorageProp20Jsunit.test.ets'
import StorageProp21Jsunit from './State/StorageProp21Jsunit.test.ets'
import StorageProp22Jsunit from './State/StorageProp22Jsunit.test.ets'
import StorageProp25Jsunit from './State/StorageProp25Jsunit.test.ets'
import StorageProp26Jsunit from './State/StorageProp26Jsunit.test.ets'
import StateNumberJsunit from './State/StateNumberJsunit.test.ets';
import StateArrayJsunit from './State/StateArrayJsunit.test.ets';
import StateClassObjectJsunit from './State/StateClassObjectJsunit.test.ets';
import StateComponentJsunit from './State/StateComponentJsunit.test.ets';
import StateDate1Jsunit from './State/StateDate1Jsunit.test.ets';
import StateDate2Jsunit from './State/StateDate2Jsunit.test.ets';
import LinkDataJsunit from './State/LinkDataJsunit.test.ets';
import LinkClassArrJsunit from './State/LinkClassArrJsunit.test.ets';
import LinkSonJsunit from './State/LinkSonJsunit.test.ets';
import ObjectLinkFirJsunit from './State/ObjectLinkFirJsunit.test.ets';
import ObjectLinkSecJsunit from './State/ObjectLinkSecJsunit.test.ets';
import ObjectLinkFarJsunit from './State/ObjectLinkFarJsunit.test.ets';
import ObjectLinkSplJsunit from './State/ObjectLinkSplJsunit.test.ets';
import ObjectLinkCanJsunit from './State/ObjectLinkCanJsunit.test.ets';
import ObjectLinkNusJsunit from './State/ObjectLinkNusJsunit.test.ets';
import ObjectLinkArrayJsunit from './State/ObjectLinkArrayJsunit.test.ets'
import CombinationState2Jsunit from './State/CombinationState2Jsunit.test.ets'
import CombinationState3Jsunit from './State/CombinationState3Jsunit.test.ets'
import CombinationState6Jsunit from './State/CombinationState6Jsunit.test.ets'
import CombinationState7Jsunit from './State/CombinationState7Jsunit.test.ets'
import CombinationState8Jsunit from './State/CombinationState8Jsunit.test.ets'
import PropArrayJsunit from './State/PropArrayJsunit.test.ets';
import PropBooleanJsunit from './State/PropBooleanJsunit.test.ets';
import PropClassObjectJsunit from './State/PropClassObjectJsunit.test.ets';
import PropDate2Jsunit from './State/PropDate2Jsunit.test.ets';
import PropEnumJsunit from './State/PropEnumJsunit.test.ets';
import PropInit1Jsunit from './State/PropInit1Jsunit.test.ets';
import PropNumberJsunit from './State/PropNumberJsunit.test.ets';
import PropStringJsunit from './State/PropStringJsunit.test.ets';
import StateArrayNewJsunit from './State/StateArrayNewJsunit.test.ets'
import link1 from './Zhuang/link1.test.ets'
import link2 from './Zhuang/link2.test.ets'
import ObjectLink1 from './Zhuang/ObjectLink1.test.ets'
import ObjectLink2 from './Zhuang/ObjectLink2.test.ets'
import Prop1 from './Zhuang/Prop1.test.ets'
import Prop2 from './Zhuang/Prop2.test.ets'
import provide1 from './Zhuang/provide1.test.ets'
import provide2 from './Zhuang/provide2.test.ets'
import state1 from './Zhuang/state1.test.ets'
import state2 from './Zhuang/state2.test.ets'
import ConsumeArray from './@stateTest/ConsumeArray.test.ets'
import ConsumeArray1 from './@stateTest/ConsumeArray1.test.ets'
import ConsumeColor from './@stateTest/ConsumeColor.test.ets'
import ConsumeHight from './@stateTest/ConsumeHight.test.ets'
import ConsumeNumber from './@stateTest/ConsumeNumber.test.ets'
import LinkArray from './@stateTest/LinkArray.test.ets'
import LinkArray1 from './@stateTest/LinkArray1.test.ets'
import LinkColor from './@stateTest/LinkColor.test.ets'
import LinkHight from './@stateTest/LinkHight.test.ets'
import LinkNumber from './@stateTest/LinkNumber.test.ets'
import objectLinkNumber from './@stateTest/objectLinkNumber.test.ets'
import PropArray from './@stateTest/PropArray.test.ets'
import PropArray1 from './@stateTest/PropArray1.test.ets'
import PropColor from './@stateTest/PropColor.test.ets'
import PropHight from './@stateTest/PropHight.test.ets'
import PropNumber from './@stateTest/PropNumber.test.ets'
import ProvideArray from './@stateTest/ProvideArray.test.ets'
import ProvideArray1 from './@stateTest/ProvideArray1.test.ets'
import ProvideColor from './@stateTest/ProvideColor.test.ets'
import ProvideHight from './@stateTest/ProvideHight.test.ets'
import ProvideNumber from './@stateTest/ProvideNumber.test.ets'
import StateArray from './@stateTest/StateArray.test.ets'
import StateArray1 from './@stateTest/StateArray1.test.ets'
import StateColor from './@stateTest/StateColor.test.ets'
import StateHight from './@stateTest/StateHight.test.ets'
import StateNumber from './@stateTest/StateNumber.test.ets'
import extendTrackTest from './Track/extendTrackTest.test.ets';
import localTrackTest from './Track/localTrackTest.test.ets';
import provideTrackTest from './Track/provideTrackTest.test.ets';
import StateTrackTest from './Track/StateTrackTest.test.ets';
import nestTrackTest from './Track/nestTrackTest.test.ets';
import storageTrackTest from './Track/storageTrackTest.test.ets';

import StateMap from './stateMangagementTest/StateMap.test';
import StateSet from './stateMangagementTest/StateSet.test';
import PropMap from './stateMangagementTest/PropMap.test';
import PropSet from './stateMangagementTest/PropSet.test';
import ProvideMap from './stateMangagementTest/ProvideMap.test';
import ProvideSet from './stateMangagementTest/ProvideSet.test';
import LinkMap from './stateMangagementTest/LinkMap.test';
import LinkSet from './stateMangagementTest/LinkSet.test';
import ObjectLinkMap from './stateMangagementTest/ObjectLinkMap.test';
import ObjectLinkSet from './stateMangagementTest/ObjectLinkSet.test';
import stateManagementDARKJsunit from './stateMangagementTest/stateManagement.test';

import stateManagementGetSharedJsunit from './stateMangagementTest/stateManagementNew.test';
import WatchTest from './Watch/Watch.test';
import twoWayBindTest from './twoWayBindTest/twoWayBind.test';
import bindContentCoverTest from './twoWayBindTest/bindContentCover.test';
import bindSheetTest from './twoWayBindTest/bindSheet.test';
import checkboxTest from './twoWayBindTest/checkbox.test';
import checkboxGroupTest from './twoWayBindTest/checkboxGroup.test';
import MenuItemTest from './twoWayBindTest/MenuItem.test';
import swiperTest from './twoWayBindTest/swiper.test';
import textAreaTest from './twoWayBindTest/textArea.test';
import textInputTest from './twoWayBindTest/textInput.test';
import toggleTest from './twoWayBindTest/toggle.test';

export default function testsuite() {
  allowOverride();
  appStorageJsunit();
  linkJsunit();
  provideBrother1();
  provideBrother2();
  provideComponent1();
  provideComponent2();
  provideParent2();
  provideParent3();
  provideParent4();
  provideParent5();
  provideParent6();
  LocalStoageLinkOneJsunit();
  LocalStoageLinkTwoJsunit();
  LocalStoagePropFourJsunit();
  LocalStoagePropTwoJsunit();
  LocalStorage39Jsunit();
  PersistentStoragePersistPropJsunit();
  ProvideJsunit();
  Storage11Jsunit();
  Storage35Jsunit();
  Storage36Jsunit();
  Storage38Jsunit();
  StorageLinkJsunit1();
  StorageProp19Jsunit();
  StorageProp20Jsunit();
  StorageProp21Jsunit();
  StorageProp22Jsunit();
  StorageProp25Jsunit();
  StorageProp26Jsunit();
  StateNumberJsunit();
  StateArrayJsunit();
  StateClassObjectJsunit();
  StateComponentJsunit();
  StateDate1Jsunit();
  StateDate2Jsunit();
  LinkDataJsunit();
  LinkClassArrJsunit();
  LinkSonJsunit();
  ObjectLinkFirJsunit();
  ObjectLinkSecJsunit();
  ObjectLinkFarJsunit();
  ObjectLinkSplJsunit();
  ObjectLinkCanJsunit();
  ObjectLinkNusJsunit();
  ObjectLinkArrayJsunit();
  CombinationState2Jsunit();
  CombinationState3Jsunit();
  CombinationState6Jsunit();
  CombinationState7Jsunit();
  CombinationState8Jsunit();
  PropArrayJsunit();
  PropBooleanJsunit();
  PropClassObjectJsunit();
  PropDate2Jsunit();
  PropEnumJsunit();
  PropInit1Jsunit();
  PropNumberJsunit();
  PropStringJsunit();
  StateArrayNewJsunit();
  link1();
  link2();
  ObjectLink1();
  ObjectLink2();
  Prop1();
  Prop2();
  provide1();
  provide2();
  state1();
  state2();
  ConsumeArray();
  ConsumeArray1();
  ConsumeColor();
  ConsumeHight();
  ConsumeNumber();
  LinkArray();
  LinkArray1();
  LinkColor();
  LinkHight();
  LinkNumber();
  objectLinkNumber();
  PropArray();
  PropArray1();
  PropColor();
  PropHight();
  PropNumber();
  ProvideArray();
  ProvideArray1();
  ProvideColor();
  ProvideHight();
  ProvideNumber();
  StateArray();
  StateArray1();
  StateColor();
  StateHight();
  StateNumber();
  extendTrackTest();
  localTrackTest();
  provideTrackTest();
  StateTrackTest();
  nestTrackTest();
  storageTrackTest();
  StateMap();
  StateSet();
  PropMap();
  PropSet();
  ProvideMap();
  ProvideSet();
  LinkMap();
  LinkSet();
  ObjectLinkMap();
  ObjectLinkSet();
  stateManagementDARKJsunit();
  stateManagementGetSharedJsunit();
  WatchTest();
  twoWayBindTest();
  bindContentCoverTest();
  bindSheetTest();
  checkboxTest();
  checkboxGroupTest();
  MenuItemTest();
  swiperTest();
  textAreaTest();
  textInputTest();
  toggleTest();
}