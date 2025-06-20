/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import EnterpriseAdminExtensionAbility from '@ohos.enterprise.EnterpriseAdminExtensionAbility'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index"
import type systemManager from './@ohos.enterprise.systemManager';

export default class EnterpriseAdminAbility extends EnterpriseAdminExtensionAbility {
  onAdminEnabled() {
      console.log('EnterpriseAdminExtensionAbility onAdminEnabled');
  }
  onAdminDisabled(){
      console.log('EnterpriseAdminExtensionAbility onAdminDisabled');
  }
  onBundleAdded(bundleName: string){
    console.log('EnterpriseAdminExtensionAbility onBundleAdded: ' + bundleName);
  }
  onBundleRemoved(bundleName: string){
    console.log('EnterpriseAdminExtensionAbility onBundleRemoved: ' + bundleName);
  }
  onAppStart(bundleName: string){
    console.log('EnterpriseAdminExtensionAbility onAppStart: ' + bundleName);
  }
  onAppStop(bundleName: string){
    console.log('EnterpriseAdminExtensionAbility onAppStop: ' + bundleName);
  }
  onSystemUpdate(systemUpdateInfo: systemManager.SystemUpdateInfo){
    console.log(`EnterpriseAdminExtensionAbility onSystemUpdate: versionName: ${systemUpdateInfo.versionName},
      firstReceivedTime: ${systemUpdateInfo.firstReceivedTime}, packageType: ${systemUpdateInfo.packageType}`);
  }
  onAccountAdded(accountId: number){
    console.log(`EnterpriseAdminExtensionAbility onAccountAdded accountId: ${accountId}`);
  }
  onAccountSwitched(accountId: number){
    console.log(`EnterpriseAdminExtensionAbility onAccountSwitched accountId: ${accountId}`);
  }
  onAccountRemoved(accountId: number){
    console.log(`EnterpriseAdminExtensionAbility onAccountRemoved accountId: ${accountId}`);
  }
  onStart(){
    console.log('EnterpriseAdminExtensionAbility onStart');
  }
}