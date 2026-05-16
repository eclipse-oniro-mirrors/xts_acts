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

import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';
import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import application from '@ohos.app.ability.application';
import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';

export function getContext(): common.UIAbilityContext {
  let context = AppStorage.get('context') as common.UIAbilityContext;
  console.info('getContext is ' + context);
  return context;
}

export default class ServiceExtAbility extends ServiceExtensionAbility {
  onCreate(want: Want): void {
    try {
      AppStorage.setOrCreate('context', this.context);
    } catch (err) {
      console.log('AppStorage error: ', JSON.stringify(err));
    }
    try {
      hilog.info(0x0000, 'testTag', 'ServiceExtensionAbility onCreate');
      let context1 = application.getApplicationContext();
      hilog.info(0x0000, 'testTag', 'context1: %{public}s', JSON.stringify(context1));
      let context2: Context = this.context.getApplicationContext();
      hilog.info(0x0000, 'testTag', 'context2: %{public}s', JSON.stringify(context2));
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          data1: {
            'applicationInfoname': context1.applicationInfo.name,
            'applicationInfodescription': context1.applicationInfo.description,
            'applicationInfodescriptionId': context1.applicationInfo.descriptionId,
            'applicationInfoenabled': context1.applicationInfo.enabled,
            'applicationInfolabel': context1.applicationInfo.label,
            'applicationInfolabelId': context1.applicationInfo.labelId,
            'applicationInfoicon': context1.applicationInfo.icon,
            'applicationInfoiconId': context1.applicationInfo.iconId,
            'applicationInfoprocess': context1.applicationInfo.process,
            'applicationInfocodePath': context1.applicationInfo.codePath,
            'applicationInforemovable': context1.applicationInfo.removable,
            'applicationInfoaccessTokenId': context1.applicationInfo.accessTokenId,
            'applicationInfoappDistributionType': context1.applicationInfo.appDistributionType,
            'applicationInfoappProvisionType': context1.applicationInfo.appProvisionType,
            'applicationInfosystemApp': context1.applicationInfo.systemApp,
            'applicationInfodebug': context1.applicationInfo.debug,
            'applicationInfonativeLibraryPath': context1.applicationInfo.nativeLibraryPath,
            'applicationInfoappIndex': context1.applicationInfo.appIndex,
            'applicationInfoinstallSource': context1.applicationInfo.installSource,
            'applicationInforeleaseType': context1.applicationInfo.releaseType,
            'applicationInfocloudFileSyncEnabled': context1.applicationInfo.cloudFileSyncEnabled,
            'cacheDir': context1.cacheDir,
            'tempDir': context1.tempDir,
            'filesDir': context1.filesDir,
            'databaseDir': context1.databaseDir,
            'preferencesDir': context1.preferencesDir,
            'bundleCodeDir': context1.bundleCodeDir,
            'distributedFilesDir': context1.distributedFilesDir,
            'resourceDir': context1.resourceDir,
            'cloudFileDir': context1.cloudFileDir,
          },
          data2: {
            'applicationInfoname': context2.applicationInfo.name,
            'applicationInfodescription': context2.applicationInfo.description,
            'applicationInfodescriptionId': context2.applicationInfo.descriptionId,
            'applicationInfoenabled': context2.applicationInfo.enabled,
            'applicationInfolabel': context2.applicationInfo.label,
            'applicationInfolabelId': context2.applicationInfo.labelId,
            'applicationInfoicon': context2.applicationInfo.icon,
            'applicationInfoiconId': context2.applicationInfo.iconId,
            'applicationInfoprocess': context2.applicationInfo.process,
            'applicationInfocodePath': context2.applicationInfo.codePath,
            'applicationInforemovable': context2.applicationInfo.removable,
            'applicationInfoaccessTokenId': context2.applicationInfo.accessTokenId,
            'applicationInfoappDistributionType': context2.applicationInfo.appDistributionType,
            'applicationInfoappProvisionType': context2.applicationInfo.appProvisionType,
            'applicationInfosystemApp': context2.applicationInfo.systemApp,
            'applicationInfodebug': context2.applicationInfo.debug,
            'applicationInfonativeLibraryPath': context2.applicationInfo.nativeLibraryPath,
            'applicationInfoappIndex': context2.applicationInfo.appIndex,
            'applicationInfoinstallSource': context2.applicationInfo.installSource,
            'applicationInforeleaseType': context2.applicationInfo.releaseType,
            'applicationInfocloudFileSyncEnabled': context2.applicationInfo.cloudFileSyncEnabled,
            'cacheDir': context2.cacheDir,
            'tempDir': context2.tempDir,
            'filesDir': context2.filesDir,
            'databaseDir': context2.databaseDir,
            'preferencesDir': context2.preferencesDir,
            'bundleCodeDir': context2.bundleCodeDir,
            'distributedFilesDir': context2.distributedFilesDir,
            'resourceDir': context2.resourceDir,
            'cloudFileDir': context2.cloudFileDir,
          }
        }
      };
      commonEventManager.publish('0500', commonEventData, (err, data) => {
        hilog.info(0x0000, 'testTag', 'customData, 0500 msg, err=' + JSON.stringify(err));
        hilog.info(0x0000, 'testTag', 'customData, 0500 msg, data=' + JSON.stringify(data));
      })
    } catch (err) {
      hilog.info(0x0000, 'testTag', 'context1: %{public}s', JSON.stringify(err));
    }
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'ServiceExtensionAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'ServiceExtensionAbility onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'ServiceExtensionAbility onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'ServiceExtensionAbility onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'ServiceExtensionAbility onBackground');
  }
}
