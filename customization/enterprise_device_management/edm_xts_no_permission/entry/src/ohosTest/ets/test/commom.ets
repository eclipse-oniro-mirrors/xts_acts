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

import osAccount from '@ohos.account.osAccount';
import Want from '@ohos.app.ability.Want'
import { BusinessError } from '@ohos.base';
import installer from '@ohos.bundle.installer';
import adminManager from '@ohos.enterprise.adminManager'
import bundleManager from '@ohos.enterprise.bundleManager'
import securityManager from '@ohos.enterprise.securityManager'
import image from '@ohos.multimedia.image';

const BUNDLENAME1: string = "com.example.extensionzerotest"
const ENTINFO1: adminManager.EnterpriseInfo = {
  name: "company",
  description: "edm demo"
};

const SELFWANT: Want = {
  bundleName: "com.edm.acts.nopermission",
  abilityName: "com.example.myapplication.EnterpriseAdminAbility"
};

const INVALID_WANT: Want = {
  bundleName: 'com.example.myapplication'
}

const AUTOSTARTAPP1: Want = {
  bundleName: "com.edm.acts.nopermission",
  abilityName: "com.example.myapplication.MainAbility"
};

const AUTOSTARTAPP2: Want = {
  bundleName: "com.example.extensionzerotest",
  abilityName: "com.example.extensionzerotest.MainAbility"
};
const SELFHAPNAME = "com.edm.acts.nopermission"
const COMPANYNAME2 = "company2"
const DESCRIPTION2 = "edm demo2"
const NOT_EXIST_BUNDLE = "bundle.not.exist"
const PARAM_EDM_MIC_DISABLE = "persist.edm.mic_disable";

const TEST_BUNDLENAME: string = "com.test.bundlename";

const ENTINFO2: adminManager.EnterpriseInfo = {
  name: "company2",
  description: "edm demo2"
};

const NETWORK_ETH_LOCAL = "lo";
const NETWORK_ETH_INVALID = "eth4";

const DEFAULT_USER_ID = 100;
const INVALID_USER_ID: number = -1;

const HAP_FILE_PATH = ['/data/storage/el2/base/haps/entry/testinstall/ExtensionZeroTest.hap'];
const HAP_FILE_PATH_ERROR = ['/data/storage/el2/base/haps/entry/testinstall/error/ExtensionZeroTest.hap'];
const EMPTY_HAP_FILE_PATH = ['/data/storage/el2/base/haps/entry/testinstall/'];
const INSTALL_PARAM: installer.InstallParam = {
  userId: 100,
  isKeepData: false,
  installFlag: 1,
};
let INSTALL_PARAM_WITH_USER_ID: installer.InstallParam = {
  userId: 101,
  isKeepData: false,
  installFlag: 1,
};

const SUBSCRIBE_EVENTS: Array<adminManager.ManagedEvent> = [
  adminManager.ManagedEvent.MANAGED_EVENT_BUNDLE_ADDED,
  adminManager.ManagedEvent.MANAGED_EVENT_BUNDLE_REMOVED,
  adminManager.ManagedEvent.MANAGED_EVENT_APP_START,
  adminManager.ManagedEvent.MANAGED_EVENT_APP_STOP,
  adminManager.ManagedEvent.MANAGED_EVENT_SYSTEM_UPDATE,
  adminManager.ManagedEvent.MANAGED_EVENT_ACCOUNT_ADDED,
  adminManager.ManagedEvent.MANAGED_EVENT_ACCOUNT_SWITCHED,
  adminManager.ManagedEvent.MANAGED_EVENT_ACCOUNT_REMOVED,
];
const SUBSCRIBE_INVALID_EVENTS: Array<number> = [20, 21];

const TEST_APP_ID_1: string = "test_app_id_1";
const TEST_APP_ID_2: string = "test_app_id_2";
const TEST_REAL_APP_ID_1: string = "1220095211531676480";
const TEST_POLICIES: string = "test_policies";
const TEST_POLICY_NAME: string = "test_policy_name";
const TEST_POLICY_VALUE: string = "\"test_policy_value\"";
const TEST_TOKEN_ID: number = 123;
const TEST_CLIPBOARD_POLICY = securityManager.ClipboardPolicy.IN_APP;

const EDM_INSTALL_PARAM : bundleManager.InstallParam = {
  userId: 100,
  installFlag: 0,
};

const APP_IDS_1: Array<string> = [
  "test_appid_1",
  "test_appid_2",
  "test_appid_3",
];

let APP_IDS_200: Array<string> = new Array<string>(200);
let APP_IDS_201: Array<string> = new Array<string>(201);

function appIdsInit(){
  for (let i = 0; i < APP_IDS_201.length; i++) {
    APP_IDS_201[i] = String(i);
    if (i < APP_IDS_200.length) {
      APP_IDS_200[i] = String(i);
    }
  }
}

// upgrade
const INVALID_UPDATE_VERSION: string = "version1.0";
const UPDATE_VERSION: string = "1.0";

function getPixelMap() {
  const color: ArrayBuffer = new ArrayBuffer(96);
  let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
  image.createPixelMap(color, opts, (error: BusinessError, pixelMap: image.PixelMap) => {
    if(error) {
      console.error('Failed to create pixelmap.');
      return;
    } else {
      PIXEL_MAP = pixelMap;
    }
  })
}

function getCurrentUserId() {
  let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
  try {
    accountManager.getOsAccountLocalId((err: BusinessError, localId: number) => {
      if (err) {
        console.log('getOsAccountLocalId failed, error: ' + JSON.stringify(err));
      } else {
        CURRENT_USER_ID = localId;
      }
    });
  } catch (err) {
    console.log('getOsAccountLocalId exception: ' + JSON.stringify(err));
  }
}
let CURRENT_USER_ID: number = 100;
let PIXEL_MAP: image.PixelMap;
const WATERMARK_BUNDLE_NAME = "testBundleName";

let PARAMETERS_LOWER_BOUND: Record<string, string> = {
  "activateId" : "12345678901234567890123456789012"
}

let INVALID_PARAMETERS_LOWER_THAN_UPPER_BOUND: Record<string, string> = {
  "activateId" : "123"
}

let INVALID_PARAMETERS: Record<string, string> = {
  "invalidKey" : "123456"
}

const DEFAULT_ACCOUNT_ID = 100;
const INVALID_ACCOUNT_ID = 200;

const DEFAULT_APP_INDEX = 0;

const TEST_APP_INSTANCE: securityManager.ApplicationInstance = {
  appIdentifier: TEST_REAL_APP_ID_1,
  appIndex: DEFAULT_APP_INDEX,
  accountId: CURRENT_USER_ID
}

const TEST_PERMISSION_MANAGED_STATE_GRANTED: securityManager.PermissionManagedState = securityManager.PermissionManagedState.GRANTED;

const TEST_PERMISSION_LIST_1: Array<string> = ['ohos.permission.CAMERA'];

const TEST_PERMISSION_1: string = 'ohos.permission.CAMERA';

export {
  BUNDLENAME1, ENTINFO1, SELFWANT, AUTOSTARTAPP1, AUTOSTARTAPP2, SELFHAPNAME, COMPANYNAME2, DESCRIPTION2,
  ENTINFO2, NETWORK_ETH_LOCAL, NETWORK_ETH_INVALID, DEFAULT_USER_ID, INVALID_USER_ID,
  SUBSCRIBE_EVENTS, SUBSCRIBE_INVALID_EVENTS, HAP_FILE_PATH, HAP_FILE_PATH_ERROR, EMPTY_HAP_FILE_PATH,
  appIdsInit, EDM_INSTALL_PARAM, APP_IDS_1,
  APP_IDS_200, APP_IDS_201, TEST_APP_ID_1, TEST_APP_ID_2, TEST_POLICIES, TEST_POLICY_NAME, TEST_POLICY_VALUE,
  INVALID_WANT, TEST_TOKEN_ID, TEST_CLIPBOARD_POLICY, UPDATE_VERSION, INVALID_UPDATE_VERSION, getPixelMap,
  PIXEL_MAP, WATERMARK_BUNDLE_NAME, TEST_BUNDLENAME, PARAMETERS_LOWER_BOUND, INVALID_PARAMETERS,
  INVALID_PARAMETERS_LOWER_THAN_UPPER_BOUND, DEFAULT_ACCOUNT_ID, INVALID_ACCOUNT_ID,CURRENT_USER_ID,
  getCurrentUserId, DEFAULT_APP_INDEX, TEST_APP_INSTANCE, TEST_PERMISSION_MANAGED_STATE_GRANTED,
  TEST_PERMISSION_LIST_1, TEST_PERMISSION_1
}