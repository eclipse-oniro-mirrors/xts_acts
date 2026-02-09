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
import { systemManager } from '@kit.MDMKit';
import common from '@ohos.enterprise.common';

export default class EnterpriseAdminAbility extends EnterpriseAdminExtensionAbility {
  onAdminEnabled() {
      console.log('EnterpriseAdminExtensionAbility onAdminEnabled');
  }
  onAdminDisabled() {
      console.log('EnterpriseAdminExtensionAbility onAdminDisabled');
  }
  onBundleAdded(bundleName: string, accountId?: number) {
    console.log(`EnterpriseAdminExtensionAbility onBundleAdded: ${bundleName}, accountId: ${accountId}`);
  }
  onBundleRemoved(bundleName: string, accountId?: number) {
    console.log(`EnterpriseAdminExtensionAbility onBundleRemoved: ${bundleName}, accountId: ${accountId}`);
  }
  onAppStart(bundleName: string) {
    console.log('EnterpriseAdminExtensionAbility onAppStart: ' + bundleName);
  }
  onAppStop(bundleName: string) {
    console.log('EnterpriseAdminExtensionAbility onAppStop: ' + bundleName);
  }
  onSystemUpdate(systemUpdateInfo: systemManager.SystemUpdateInfo) {
    console.log(`EnterpriseAdminExtensionAbility onSystemUpdate: versionName: ${systemUpdateInfo.versionName},
      firstReceivedTime: ${systemUpdateInfo.firstReceivedTime}, packageType: ${systemUpdateInfo.packageType}`);
  }
  onAccountAdded(accountId: number) {
    console.log(`EnterpriseAdminExtensionAbility onAccountAdded accountId: ${accountId}`);
  }
  onAccountSwitched(accountId: number): void {
    console.log(`EnterpriseAdminExtensionAbility onAccountSwitched accountId: ${accountId}`);
  }
  onAccountRemoved(accountId: number) {
    console.log(`EnterpriseAdminExtensionAbility onAccountRemoved accountId: ${accountId}`);
  }
  onDeviceAdminEnabled(bundleName: string): void {
    console.log(`EnterpriseAdminExtensionAbility onDeviceAdminEnabled bundleName: ${bundleName}`);
  }
  onDeviceAdminDisabled(bundleName: string): void {
    console.log(`EnterpriseAdminExtensionAbility onDeviceAdminDisabled bundleName: ${bundleName}`);
  }
  onStart(): void {
    console.log('EnterpriseAdminExtensionAbility onStart');
  }
  onMarketAppInstallResult(bundleName: string, installResult: common.InstallationResult): void {
    console.log(`onMarketAppInstallResult bundleName : ${bundleName}, result : ${installResult.message}`);
    console.log(`onMarketAppInstallResult bundleName : ${bundleName}, result is FAIL? : ${installResult.result === common.Result.FAIL}`);
    console.log(`onMarketAppInstallResult bundleName : ${bundleName}, result is SUCCESS? : ${installResult.result === common.Result.SUCCESS}`);
  }
  onKeyEvent(keyEvent: systemManager.KeyEvent): void {
    console.log(`EnterpriseAdminExtensionAbility onKeyEvent: keyCode: ${keyEvent.keyCode}`);
    console.log(`EnterpriseAdminExtensionAbility onKeyEvent: keyAction: ${keyEvent.keyAction === systemManager.KeyAction.UNKNOWN}`);
    console.log(`EnterpriseAdminExtensionAbility onKeyEvent: keyAction: ${keyEvent.keyAction === systemManager.KeyAction.DOWN}`);
    console.log(`EnterpriseAdminExtensionAbility onKeyEvent: keyAction: ${keyEvent.keyAction === systemManager.KeyAction.UP}`);
    console.log(`EnterpriseAdminExtensionAbility onKeyEvent: actionTime: ${keyEvent.actionTime}`);
    console.log(`EnterpriseAdminExtensionAbility onKeyEvent: keyItem.keyCode: ${keyEvent.keyItems[0].keyCode}`);
    console.log(`EnterpriseAdminExtensionAbility onKeyEvent: keyItem.pressed: ${keyEvent.keyItems[0].pressed}`);
    console.log(`EnterpriseAdminExtensionAbility onKeyEvent: keyItem.downTime: ${keyEvent.keyItems[0].downTime}`);
  }
  onLogCollected(result: common.Result): void {
 	  console.log(`onLogCollected result is FAIL? : ${result === common.Result.FAIL}`);
 	  console.log(`onLogCollected result is SUCCESS? : ${result === common.Result.SUCCESS}`);
 	}
  onStartupGuideCompleted(scene: common.StartupScene): void {
    console.info(`onStartupGuideCompleted scene is USER_SETUP?: ${scene === common.StartupScene.USER_SETUP}`);
    console.info(`onStartupGuideCompleted scene is OTA?: ${scene === common.StartupScene.OTA}`);
    console.info(`onStartupGuideCompleted scene is DEVICE_PROVISION?: ${scene === common.StartupScene.DEVICE_PROVISION}`);
  }
  onDeviceBootCompleted(): void {
    console.info('EnterpriseAdminExtensionAbility onDeviceBootCompleted');
  }
}