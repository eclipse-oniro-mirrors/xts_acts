'use static';
/*
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
import WatchTest from './Watch/Watch.test';
import StateArrayBoolean from './stateMangagementTest/StateArrayBoolean.test';
import StateArrayNumber from './stateMangagementTest/StateArrayNumber.test';
import StateArrayObject from './stateMangagementTest/StateArrayObject.test';
import StateMap from './stateMangagementTest/StateMap.test';
import StateSet from './stateMangagementTest/StateSet.test';
import PropArrayBoolean from './stateMangagementTest/PropArrayBoolean.test';
import PropArrayNumber from './stateMangagementTest/PropArrayNumber.test';
import PropArrayObject from './stateMangagementTest/PropArrayObject.test';
import PropMap from './stateMangagementTest/PropMap.test';
import PropSet from './stateMangagementTest/PropSet.test';
import ProvideArrayBoolean from './stateMangagementTest/ProvideArrayBoolean.test';
import ProvideArrayNumber from './stateMangagementTest/ProvideArrayNumber.test';
import ProvideArrayObject from './stateMangagementTest/ProvideArrayObject.test';
import ProvideMap from './stateMangagementTest/ProvideMap.test';
import ProvideSet from './stateMangagementTest/ProvideSet.test';
import LinkArrayBoolean from './stateMangagementTest/LinkArrayBoolean.test';
import LinkArrayNumber from './stateMangagementTest/LinkArrayNumber.test';
import LinkArrayObject from './stateMangagementTest/LinkArrayObject.test';
import LinkMap from './stateMangagementTest/LinkMap.test';
import LinkSet from './stateMangagementTest/LinkSet.test';
import ObjectLinkMap from './stateMangagementTest/ObjectLinkMap.test';
import stateManagementDARKJsunit from './stateMangagementTest/stateManagement.test';
import stateManagementGetSharedJsunit from './stateMangagementTest/stateManagementNew.test';

import LocalStoageLinkOneJsunit from './State/LocalStoageLinkOneJsunit.test.ets';
import LocalStoageLinkTwoJsunit from './State/LocalStoageLinkTwoJsunit.test.ets';
import LocalStoageLinkThreeJsunit from './State/LocalStoageLinkThreeJsunit.test.ets';
import LocalStoagePropFourJsunit from './State/LocalStoagePropFourJsunit.test.ets';
import LocalStoagePropTwoJsunit from './State/LocalStoagePropTwoJsunit.test.ets';
import LocalStorage39Jsunit from './State/LocalStorage39Jsunit.test.ets';
import ProvideJsunit from './State/ProvideJsunit.test.ets';
import Storage11Jsunit from './State/Storage11Jsunit.test.ets';
import Storage35Jsunit from './State/Storage35Jsunit.test.ets';
import Storage36Jsunit from './State/Storage36Jsunit.test.ets'; 
import Storage38Jsunit from './State/Storage38Jsunit.test.ets';
import StorageLinkJsunit1 from './State/StorageLinkJsunit1.test.ets';
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
export default function testsuite() {
  StateArrayObject();
  WatchTest();
  StateArrayBoolean();
  StateArrayNumber();
  StateMap();
  StateSet();
  PropArrayBoolean();
  PropArrayNumber();
  PropArrayObject();
  PropMap();
  PropSet();

  ProvideArrayBoolean();
  ProvideArrayNumber();
  ProvideArrayObject();
  ProvideMap();
  ProvideSet();
  LinkArrayBoolean();
  LinkArrayNumber();
  LinkArrayObject();
  LinkMap();
  LinkSet();
  stateManagementDARKJsunit();
  stateManagementGetSharedJsunit();

  LocalStoageLinkTwoJsunit();

  LocalStoageLinkOneJsunit();

  LocalStoageLinkThreeJsunit();

  LocalStoagePropFourJsunit();

  LocalStoagePropTwoJsunit();

  LocalStorage39Jsunit();

  ProvideJsunit();
  Storage11Jsunit();

  Storage35Jsunit();

  Storage36Jsunit(); 
 
  Storage38Jsunit();

  StorageProp21Jsunit();
  StorageLinkJsunit1();
  StorageProp20Jsunit();
  StorageProp22Jsunit();
  StorageProp25Jsunit();
  StorageProp26Jsunit();

  LinkSonJsunit();
  StateNumberJsunit();
  StateArrayJsunit();
  StateClassObjectJsunit();
  StateComponentJsunit();
  StateDate1Jsunit();
  StateDate2Jsunit();
  LinkDataJsunit();
  LinkClassArrJsunit();

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

  ObjectLinkMap();
}
