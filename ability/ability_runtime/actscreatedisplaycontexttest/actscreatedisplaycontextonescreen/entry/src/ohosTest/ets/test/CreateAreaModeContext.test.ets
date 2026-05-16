/*
* Copyright (c) 2024-2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {
  common,
  Context,
  sendableContextManager
} from '@kit.AbilityKit';
import { JSON } from '@kit.ArkTS';

let uiAbilityContext: common.UIAbilityContext | undefined;

export default function abilityTest() {

  const CACHE_DIR = '/data/storage/el2/base/haps/entry_test/cache';
  const FILE_DIR = '/data/storage/el2/base/haps/entry_test/files';
  const TEMP_DIR = '/data/storage/el2/base/haps/entry_test/temp';
  const DATABASE_DIR = '/data/storage/el2/database/entry_test';
  const preferences_DIR = '/data/storage/el2/base/haps/entry_test/preferences';
  const BUNDLE_DIR = '/data/storage/el1/bundle';
  const distributedFilesDir_DIR = '/data/storage/el2/distributedfiles';
  const resourceDir_DIR = '';
  const cloudFile_Dir = '/data/storage/el2/cloud';
  const LogFile_Dir = '/data/storage/el2/log';


  describe('CreateAreaModeContext', () => {
    beforeAll(async () => {
      uiAbilityContext = AppStorage.get('context');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900
     * @tc.number SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900
     * @tc.desc   Retrieve the path property from the areaModeContext created by uiAbilityContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900', Level.LEVEL0, () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900]: start');
      try {
        console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900]: try');
        let areaModeContext:  common.Context | undefined = uiAbilityContext?.createAreaModeContext(1);
        console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900]: uiAbilityContext' +
        JSON.stringify(areaModeContext));
        if (areaModeContext != undefined) {
          expect(areaModeContext.cacheDir).assertEqual(CACHE_DIR);
          expect(areaModeContext.filesDir).assertEqual(FILE_DIR);
          expect(areaModeContext.tempDir).assertEqual(TEMP_DIR);
          expect(areaModeContext.databaseDir).assertEqual(DATABASE_DIR);
          expect(areaModeContext.preferencesDir).assertEqual(preferences_DIR);
          expect(areaModeContext.bundleCodeDir).assertEqual(BUNDLE_DIR);
          expect(areaModeContext.distributedFilesDir).assertEqual(distributedFilesDir_DIR);
          expect(areaModeContext.resourceDir).assertEqual(resourceDir_DIR);
          expect(areaModeContext.cloudFileDir).assertEqual(cloudFile_Dir);
          expect(areaModeContext.logFileDir).assertEqual(LogFile_Dir);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_0900]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000
     * @tc.number SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000
     * @tc.desc   Retrieve the resourceManager property from the areaModeContext created by UIAbilityContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000', Level.LEVEL0, async (done: Function) => {
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000]: start');
      try {
        let areaModeContext: common.Context | undefined = uiAbilityContext?.createAreaModeContext(1);
        if (areaModeContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000]: areaModeContext' +
          JSON.stringify(areaModeContext));
          await resourceManagerTest(areaModeContext).then((data) => {
            console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000] data : ' + data);
            expect(true).assertEqual(data);
          });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000]: ' + err);
        expect().assertFail();
      }
      done();
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1000]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateAreaModeContext_1100
     * @tc.number SUB_Ability_AbilityRuntime_CreateAreaModeContext_1100
     * @tc.desc   Create a Context through the application, then create an Application Context and create a Display Context to obtain the Application Info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateAreaModeContext_1100', Level.LEVEL0, async () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1100]: start');
      try {
        let areaModeContext: common.Context | undefined = uiAbilityContext?.createAreaModeContext(1);
        if (areaModeContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1100]: get ' + JSON.stringify(areaModeContext?.applicationInfo));
          compareInfo(areaModeContext);
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1100]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1100]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateAreaModeContext_1200
     * @tc.number SUB_Ability_AbilityRuntime_CreateAreaModeContext_1200
     * @tc.desc   Retrieve the resourceManager property from the areaModeContext created by UIAbilityContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateAreaModeContext_1200', Level.LEVEL0, async (done: Function) => {
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1200]: start');
      try {
        let moduleContext: Context | undefined = uiAbilityContext?.createModuleContext('entry_test');
        if (moduleContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1200]: moduleContext' +
          JSON.stringify(moduleContext));
          await resourceManagerTest(moduleContext).then((data) => {
            console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1200] data : ' + data);
            expect(true).assertEqual(data);
          });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1200]: ' + err);
        expect().assertFail();
      }
      done();
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1200]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateAreaModeContext_1300
     * @tc.number SUB_Ability_AbilityRuntime_CreateAreaModeContext_1300
     * @tc.desc   Create a Context through the application, then create an Application Context and create a Display Context to obtain the Application Info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateAreaModeContext_1300', Level.LEVEL0, async () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1300]: start');
      try {
        let moduleContext: common.Context | undefined = uiAbilityContext?.createModuleContext('entry_test');
        if (moduleContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1300]: get ' + JSON.stringify(moduleContext?.applicationInfo));
          compareInfo(moduleContext as common.Context);
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1100]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateAreaModeContext_1100]: end');
    })
  })
}

export async function resourceManagerTest(displayContext: Context): Promise<boolean> {
  let result: boolean = true;
  await displayContext.resourceManager.getString($r('app.string.ServiceExtAbility_label').id)
    .then((data) => {
      result &&= (data === 'label');
      console.log(`DisplayContextTest resourceManager.getString, data: ${data}, result: ${result}`);
    }).catch((error: Error) => {
      console.error('DisplayContextTest resourceManager.getString fail' + error.name + error.message);
    });
  if (result) {
    await displayContext.resourceManager.getStringValue($r('app.string.ServiceExtAbility_label'))
      .then((data) => {
        result &&= (data === 'label');
        console.log(`DisplayContextTest resourceManager.getStringValue, data: ${data}, result: ${result}`);
      }).catch((error: Error) => {
        console.error('DisplayContextTest resourceManager.getStringValue fail' + error.name + error.message);
      });
  }
  if (result) {
    await displayContext.resourceManager.getMedia($r('app.media.background').id)
      .then((data) => {
        result &&= (data.length > 0);
        console.log(`DisplayContextTest resourceManager.getMedia, data: ${data}, result: ${result}`);
      }).catch((error: Error) => {
        console.error('DisplayContextTest resourceManager.getMedia fail' + error.name + error.message);
      });
  }
  if (result) {
    await displayContext.resourceManager.getMediaContent($r('app.media.background'))
      .then((data) => {
        result &&= (data.length > 0);
        console.log(`DisplayContextTest resourceManager.getMediaContent, data: ${data}, result: ${result}`);
      }).catch((error: Error) => {
        console.error('DisplayContextTest resourceManager.getMediaContent fail' + error.name + error.message);
      });
  }
  if (result) {
    await displayContext.resourceManager.getColor($r('app.color.start_window_background').id)
      .then((data) => {
        result &&= (data > 0);
        console.log(`DisplayContextTest resourceManager.getColor(resId), data: ${data}, result: ${result}`);
      }).catch((error: Error) => {
        console.error('DisplayContextTest resourceManager.getColor(resId) fail' + error.name + error.message);
      });
  }
  if (result) {
    await displayContext.resourceManager.getColor($r('app.color.start_window_background'))
      .then((data) => {
        result &&= (data > 0);
        console.log(`DisplayContextTest resourceManager.getColor(res), data: ${data}, result: ${result}`);
      }).catch((error: Error) => {
        console.error('DisplayContextTest resourceManager.getColor(res) fail' + error.name + error.message);
      });
  }
  console.log(`DisplayContextTest resourceManagerTest end, result: ${result}`);
  return result;
}


function compareInfo(displayContext: Context) {
  let appInfoName: string = JSON.stringify(uiAbilityContext?.applicationInfo.name);
  let appDisplayInfoName: string = JSON.stringify(displayContext.applicationInfo.name);
  expect(appInfoName).assertEqual(appDisplayInfoName);
  console.log(`DisplayContextTest resourceManager.getStringValue, appDisplayInfoName: ${appDisplayInfoName}`);
  let appInfoLabelId: number | undefined = uiAbilityContext?.applicationInfo.labelId;
  let appDisplayInfoLabelId: number = displayContext.applicationInfo.labelId;
  expect(appInfoLabelId).assertEqual(appDisplayInfoLabelId);
  let appInfoDescription: string = JSON.stringify(uiAbilityContext?.applicationInfo.description);
  let appDisplayInfoDescription: string = JSON.stringify(displayContext.applicationInfo.description);
  expect(appInfoDescription).assertEqual(appDisplayInfoDescription);
  expect(uiAbilityContext?.applicationInfo.descriptionId).assertEqual(displayContext.applicationInfo.descriptionId);
  expect(uiAbilityContext?.applicationInfo.enabled).assertEqual(displayContext.applicationInfo.enabled);
  expect(uiAbilityContext?.applicationInfo.label).assertEqual(displayContext.applicationInfo.label);
  expect(uiAbilityContext?.applicationInfo.icon).assertEqual(displayContext.applicationInfo.icon);
  expect(uiAbilityContext?.applicationInfo.iconId).assertEqual(displayContext.applicationInfo.iconId);
  expect(JSON.stringify(uiAbilityContext?.applicationInfo.permissions)).assertEqual(JSON.stringify(displayContext.applicationInfo.permissions));
  expect(uiAbilityContext?.applicationInfo.process).assertEqual(displayContext.applicationInfo.process);
  expect(uiAbilityContext?.applicationInfo.codePath).assertEqual(displayContext.applicationInfo.codePath);
  expect(JSON.stringify(uiAbilityContext?.applicationInfo.metadataArray)).assertEqual(JSON.stringify(displayContext.applicationInfo.metadataArray));
  expect(uiAbilityContext?.applicationInfo.removable).assertEqual(displayContext.applicationInfo.removable);
  expect(uiAbilityContext?.applicationInfo.accessTokenId).assertEqual(displayContext.applicationInfo.accessTokenId);
  expect(uiAbilityContext?.applicationInfo.uid).assertEqual(displayContext.applicationInfo.uid);
  expect(JSON.stringify(uiAbilityContext?.applicationInfo.iconResource)).assertEqual(JSON.stringify(displayContext.applicationInfo.iconResource));
  expect(JSON.stringify(uiAbilityContext?.applicationInfo.labelResource)).assertEqual(JSON.stringify(displayContext.applicationInfo.labelResource));
  expect(JSON.stringify(uiAbilityContext?.applicationInfo.descriptionResource)).assertEqual(JSON.stringify(displayContext.applicationInfo.descriptionResource));
  expect(uiAbilityContext?.applicationInfo.appDistributionType).assertEqual(displayContext.applicationInfo.appDistributionType);
  expect(uiAbilityContext?.applicationInfo.systemApp).assertEqual(displayContext.applicationInfo.systemApp);
  expect(uiAbilityContext?.applicationInfo.appProvisionType).assertEqual(displayContext.applicationInfo.appProvisionType);
  expect(uiAbilityContext?.applicationInfo.bundleType).assertEqual(displayContext.applicationInfo.bundleType);
  expect(uiAbilityContext?.applicationInfo.debug).assertEqual(displayContext.applicationInfo.debug);
  expect(uiAbilityContext?.applicationInfo.dataUnclearable).assertEqual(displayContext.applicationInfo.dataUnclearable);
  expect(uiAbilityContext?.applicationInfo.nativeLibraryPath).assertEqual(displayContext.applicationInfo.nativeLibraryPath);
  expect(JSON.stringify(uiAbilityContext?.applicationInfo.multiAppMode)).assertEqual(JSON.stringify(displayContext.applicationInfo.multiAppMode));
  expect(uiAbilityContext?.applicationInfo.appIndex).assertEqual(displayContext.applicationInfo.appIndex);
  expect(uiAbilityContext?.applicationInfo.installSource).assertEqual(displayContext.applicationInfo.installSource);
  expect(uiAbilityContext?.applicationInfo.releaseType).assertEqual(displayContext.applicationInfo.releaseType);
  expect(uiAbilityContext?.applicationInfo.cloudFileSyncEnabled).assertEqual(displayContext.applicationInfo.cloudFileSyncEnabled);
  expect(uiAbilityContext?.applicationInfo.flags).assertEqual(displayContext.applicationInfo.flags);
  expect(displayContext.applicationInfo.name).assertEqual('com.acts.createdisplaycontext');
}
