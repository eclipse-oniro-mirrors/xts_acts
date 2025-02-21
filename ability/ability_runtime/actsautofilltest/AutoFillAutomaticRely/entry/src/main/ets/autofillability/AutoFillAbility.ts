/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import type autoFillManager from '@ohos.app.ability.autoFillManager';
import AutoFillExtensionAbility from '@ohos.app.ability.AutoFillExtensionAbility';
import commonEventManager from '@ohos.commonEventManager';
import type UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import emitter from '@ohos.events.emitter';

let onCreate = 0;
let onFillRequest = 0;
let onForeground = 0;
let onSaveRequest = 0;
let onSessionDestroy = 0;
let onDestroy = 0;
let onBackground = 0;
let commonEventData = {
  parameters: {
    onCreate: onCreate,
    onFillRequest: onFillRequest,
    onForeground: onForeground,
    onSaveRequest: onSaveRequest,
    onSessionDestroy: onSessionDestroy,
    onDestroy: onDestroy,
    onBackground: onBackground,
  }
};
let autoFillContextData = {
  parameters: {
    currentHapModuleInfoName: '',
    configLanguage: '',
    extensionAbilityInfoBundleName: '',
    resourceManagerStringByName: '',
    applicationInfoName: '',
    applicationContextCacheDir: '',
    applicationContextTempDir: '',
    applicationContextFilesDir: '',
    applicationContextDatabaseDir: '',
    applicationContextPreferencesDir: '',
    applicationContextBundleCodeDir: '',
    applicationContextDistributedFilesDir: '',
    eventHubEventMessage: '',
    applicationContextArea: '',
    bundleContextApplicationInfo: '',
    moduleContextApplicationInfoFirst: '',
    moduleContextApplicationInfoSecond: '',
    stageMode: false
  }
};
let MAX_STR_LENGTH = 100;

export default class AutoFillAbility extends AutoFillExtensionAbility {
  storage: LocalStorage;
  message: string;

  onCreate(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', '====ActsAutoFillExtension onCreate====');
    commonEventData.parameters.onCreate = 1;
  }

  onFillRequest(session: UIExtensionContentSession, request: autoFillManager.FillRequest,
    callback: autoFillManager.FillRequestCallback): void {
    hilog.info(0x0000, 'testTag', '%{public}s', '====ActsAutoFillExtension onFillRequest====');
    hilog.info(0x0000, 'testTag', 'fill requestCallback: %{public}s', JSON.stringify(callback));
    console.log('get request viewData: ', JSON.stringify(request.viewData));
    verifyContextProperties(this.context);
    commonEventData.parameters.onFillRequest = 1;
    try {
      let fillStorage = new LocalStorage(
        {
          'session': session,
          'message': 'AutoFill Page',
          'fillCallback': callback,
          'viewData': request.viewData,
          'pageNodeInfos': request.viewData.pageNodeInfos
        });
      session.loadContent('pages/SelectorList', fillStorage);
    } catch (err) {
      hilog.error(0x0000, 'testTag', '%{public}s', '====ActsAutoFillExtension failed to load content====');
    }
  }

  onSaveRequest(session: UIExtensionContentSession, request: autoFillManager.SaveRequest,
    callback: autoFillManager.SaveRequestCallback): void {
    hilog.info(0x0000, 'testTag', '%{public}s', '====ActsAutoFillExtension onSaveRequest====');
    commonEventData.parameters.onSaveRequest = 1;
    let saveStorage = new LocalStorage(
      {
        'session': session,
        'message': 'AutoFill Page',
        'saveCallback': callback,
        'viewData': request.viewData
      });
    session.loadContent('pages/SavePage', saveStorage);
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', '====ActsAutoFillExtension onForeground====');
    commonEventData.parameters.onForeground = 1;
    commonEventManager.publish('AutoFillExtensionTest0100', commonEventData, (err) => {
      console.info('====>AutoFillExtensionTest0100 publish err: ' + JSON.stringify(err));
    });
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', '====ActsAutoFillExtension onBackground====');
    commonEventData.parameters.onBackground = 1;
    commonEventManager.publish('AutoFillExtensionTest0300', commonEventData, (err) => {
      console.info('====>AutoFillExtensionTest0200 publish err: ' + JSON.stringify(err));
    });
  }

  onSessionDestroy(session: UIExtensionContentSession): void {
    hilog.info(0x0000, 'testTag', '%{public}s', '====ActsAutoFillExtension onSessionDestroy====');
    commonEventData.parameters.onSessionDestroy = 1;
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', '====ActsAutoFillExtension onDestroy====');
    console.info('====>AutoFillExtensionTest0400 publish data: ' + JSON.stringify(autoFillContextData));
    commonEventData.parameters.onDestroy = 1;
    commonEventManager.publish('AutoFillExtensionTest0200', commonEventData, (err) => {
      console.info('====>AutoFillExtensionTest0200 publish err: ' + JSON.stringify(err));
    });
    commonEventManager.publish('AutoFillExtensionTest0400', autoFillContextData, (err) => {
      console.info('====>AutoFillExtensionTest0400 publish err: ' + JSON.stringify(err));
    });
  }
}

async function verifyContextProperties(context): Promise<void> {
  autoFillContextData.parameters.currentHapModuleInfoName = context.currentHapModuleInfo.name;
  autoFillContextData.parameters.configLanguage = context.config.language;
  autoFillContextData.parameters.extensionAbilityInfoBundleName = context.extensionAbilityInfo.bundleName;
  context.resourceManager.getStringByName('EntryAbility_label', (error, string) => {
    autoFillContextData.parameters.resourceManagerStringByName = string;
    console.log('resourceManager getStringByName: ', JSON.stringify(string));
  });
  autoFillContextData.parameters.applicationInfoName = context.applicationInfo.name;
  try {
    let applicationContext = context.getApplicationContext();
    autoFillContextData.parameters.applicationContextCacheDir = applicationContext.cacheDir;
    autoFillContextData.parameters.applicationContextTempDir = applicationContext.tempDir;
    autoFillContextData.parameters.applicationContextFilesDir = applicationContext.filesDir;
    autoFillContextData.parameters.applicationContextDatabaseDir = applicationContext.databaseDir;
    autoFillContextData.parameters.applicationContextPreferencesDir = applicationContext.preferencesDir;
    autoFillContextData.parameters.applicationContextBundleCodeDir = applicationContext.bundleCodeDir;
    autoFillContextData.parameters.applicationContextDistributedFilesDir = applicationContext.distributedFilesDir;
    applicationContext.eventHub.on('myEvent', () => {
      autoFillContextData.parameters.eventHubEventMessage = '====eventHub Success=== call anonymous eventFunc';
    });
    applicationContext.eventHub.emit('myEvent');

    autoFillContextData.parameters.applicationContextArea = applicationContext.area;
  } catch (error) {
    console.error(`getApplicationContext failed, error.code: ${error.code}, error.message: ${error.message}`);
  }
  try {
    let bundleContext = context.createBundleContext('com.ohos.passwordbox');
    autoFillContextData.parameters.bundleContextApplicationInfo =
      JSON.stringify(bundleContext.applicationInfo).substring(0, MAX_STR_LENGTH);
  } catch (error) {
    console.error(`createBundleContext failed, error.code: ${error.code}, error.message: ${error.message}`);
  }
  console.log('inner verify middle4');
  try {
    let moduleContextA = context.createModuleContext('entry');
    autoFillContextData.parameters.moduleContextApplicationInfoFirst =
      JSON.stringify(moduleContextA.applicationInfo).substring(0, MAX_STR_LENGTH);

    let moduleContextB = context.createModuleContext('com.ohos.passwordbox', 'entry');
    autoFillContextData.parameters.moduleContextApplicationInfoSecond =
      JSON.stringify(moduleContextB.applicationInfo).substring(0, MAX_STR_LENGTH);
  } catch (error) {
    console.error(`createModuleContext failed, error.code: ${error.code}, error.message: ${error.message}`);
  }
  autoFillContextData.parameters.stageMode = context.stageMode;
}
