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

import AppStorageReturnValue from './AppStorage/AppStorageReturnValue.test';
import appStorageJsunit from './AppStorage/AppStorageJsunit.test';
import Storage11Jsunit from './AppStorage/Storage11Jsunit.test.ets';
import Storage35Jsunit from './AppStorage/Storage35Jsunit.test.ets';
import Storage36Jsunit from './AppStorage/Storage36Jsunit.test.ets';
import Storage38Jsunit from './AppStorage/Storage38Jsunit.test.ets';
import StorageLinkJsunit1 from './AppStorage/StorageLinkJsunit1.test.ets';
import StorageProp19Jsunit from './AppStorage/StorageProp19Jsunit.test.ets'
import StorageProp20Jsunit from './AppStorage/StorageProp20Jsunit.test.ets'
import StorageProp21Jsunit from './AppStorage/StorageProp21Jsunit.test.ets'
import StorageProp22Jsunit from './AppStorage/StorageProp22Jsunit.test.ets'
import StorageProp25Jsunit from './AppStorage/StorageProp25Jsunit.test.ets'
import StorageProp26Jsunit from './AppStorage/StorageProp26Jsunit.test.ets'
import AbstractPropertyRefTest from './AppStorage/AbstractPropertyRefTest.test';
import appStorageRefJsunit from './AppStorage/appStorageRefJsunit.test';
import SubAbstractPropertyLinkTest from './AppStorage/SubAbstractPropertyLinkTest.test';

import PersistentTest0040 from './persistentStorage/PersistentTest0040.test';
import PersistentStorageReturnValue from './persistentStorage/PersistentStorageReturnValue.test';
import PersistentStorageGlobalConnect from './persistentStorage/PersistentStorageGlobalConnect.test';


import LocalStorageReturnValue from './localStorage/LocalStorageReturnValue.test';
import localStorageRefJsunit from './localStorage/localStorageRefJsunit.test';
import LocalStorageDeleteTest0120 from './localStorage/LocalStorageDeleteTest0120.test';

import LocalStoageLinkOneJsunit from './localStorage/LocalStoageLinkOneJsunit.test.ets';
import LocalStoageLinkTwoJsunit from './localStorage/LocalStoageLinkTwoJsunit.test.ets';
import LocalStoageLinkThreeJsunit from './localStorage/LocalStoageLinkThreeJsunit.test.ets';  
import LocalStoagePropFourJsunit from './localStorage/LocalStoagePropFourJsunit.test.ets';
import LocalStoagePropTwoJsunit from './localStorage/LocalStoagePropTwoJsunit.test.ets';
import LocalStorage39Jsunit from './localStorage/LocalStorage39Jsunit.test.ets';
import LocalStorageLink0310TestJsunit from './localStorage/LocalStorageLink0310TestJsunit.test';
import LocalStorageProp0320TestJsunit from './localStorage/LocalStorageProp0320TestJsunit.test';
import LocalStorageAbsTestJsunit from './localStorage/LocalStorageAbsTestJsunit.test';

import PersistentStoragePersistPropJsunit from './persistentStorage/PersistentStoragePersistPropJsunit.test.ets';


export default function testsuite() {
    AppStorageReturnValue();
    appStorageJsunit();
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
    AbstractPropertyRefTest();
    appStorageRefJsunit();
    SubAbstractPropertyLinkTest();
    PersistentTest0040();
    PersistentStorageReturnValue();
    PersistentStorageGlobalConnect();
    LocalStorageReturnValue();
    localStorageRefJsunit();
    LocalStoageLinkOneJsunit();
    LocalStoageLinkTwoJsunit();
    LocalStoageLinkThreeJsunit();
    LocalStoagePropFourJsunit();
    LocalStoagePropTwoJsunit();
    LocalStorage39Jsunit();
    LocalStorageDeleteTest0120();
    LocalStorageLink0310TestJsunit();
    LocalStorageProp0320TestJsunit();
    LocalStorageAbsTestJsunit();
    PersistentStoragePersistPropJsunit();


}
