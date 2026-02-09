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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {
  application,
  common,
  ConfigurationConstant,
  Context,
  EnvironmentCallback,
  sendableContextManager
} from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { preferences, relationalStore } from '@kit.ArkData';
import { resourceManager } from '@kit.LocalizationKit';
import { display } from '@kit.ArkUI';
import { JSON, worker } from '@kit.ArkTS';
import { Driver, ON } from '@ohos.UiTest';


const TAG: string = 'DisplayContextTest';
const DOMAIN_NUMBER: number = 0x0000;
let disPlayId: number = -1;
let uiAbilityContext: common.UIAbilityContext | undefined;

@Sendable
export class SendableObject {
  constructor(sendableContext: sendableContextManager.SendableContext, contextName: string) {
    this.sendableContext = sendableContext;
    this.contextName = contextName;
  }

  sendableContext: sendableContextManager.SendableContext;
  contextName: string;
}

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

  const CACHE_DIR_app = '/data/storage/el2/base/cache';
  const FILE_DIR_app = '/data/storage/el2/base/files';
  const TEMP_DIR_app = '/data/storage/el2/base/temp';
  const DATABASE_DIR_app = '/data/storage/el2/database';
  const preferences_DIR_app = '/data/storage/el2/base/preferences';
  const BUNDLE_DIR_app = '/data/storage/el1/bundle';
  const distributedFilesDir_DIR_app = '/data/storage/el2/distributedfiles';
  const resourceDir_DIR_app = '';
  const cloudFile_Dir_app = '/data/storage/el2/cloud';


  describe('ActsAbilityTest', () => {
    beforeAll(async () => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      display.getAllDisplays((err: BusinessError, data: Array<display.Display>) => {
        const errCode: number = err.code;
        if (errCode) {
          hilog.error(DOMAIN_NUMBER, TAG, 'Failed to obtain all the display objects. error: %{public}s',
            JSON.stringify(err));
        } else {
          disPlayId = data[0].id;
          hilog.info(DOMAIN_NUMBER, TAG, 'displayId: %{public}s', JSON.stringify(disPlayId));
        }
      });
      await sleep(1000);
    })
    beforeEach(() => {
      uiAbilityContext = AppStorage.get('context');
      if (!uiAbilityContext) {
        console.error('uiAbilityContext is undefined');
        expect().assertFail();
      }
    })
    afterEach(() => {
      uiAbilityContext = undefined;
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_0900
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_0900
     * @tc.desc   Retrieve the path property from the displayContext created by uiAbilityContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_0900', Level.LEVEL0, () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_0900]: start');
      try {
        console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_0900]: try');
        let displayContext: Context | undefined = uiAbilityContext?.createDisplayContext(disPlayId);
        console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_0900]: uiAbilityContext' +
        JSON.stringify(displayContext));
        if (displayContext != undefined) {
          expect(displayContext.cacheDir).assertEqual(CACHE_DIR);
          expect(displayContext.filesDir).assertEqual(FILE_DIR);
          expect(displayContext.tempDir).assertEqual(TEMP_DIR);
          expect(displayContext.databaseDir).assertEqual(DATABASE_DIR);
          expect(displayContext.preferencesDir).assertEqual(preferences_DIR);
          expect(displayContext.bundleCodeDir).assertEqual(BUNDLE_DIR);
          expect(displayContext.distributedFilesDir).assertEqual(distributedFilesDir_DIR);
          expect(displayContext.resourceDir).assertEqual(resourceDir_DIR);
          expect(displayContext.cloudFileDir).assertEqual(cloudFile_Dir);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_0900]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_0900]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1000
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1000
     * @tc.desc   Retrieve the resourceManager property from the displayContext created by UIAbilityContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1000', Level.LEVEL0, async (done: Function) => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1000]: start');
      try {
        let displayContext: Context | undefined = uiAbilityContext?.createDisplayContext(disPlayId);
        if (displayContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1000]: uiAbilityContext' +
          JSON.stringify(displayContext));
          await resourceManagerTest(displayContext).then((data) => {
            console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1000] data : ' + data);
            expect(true).assertEqual(data);
          });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1000]: ' + err);
        expect().assertFail();
      }
      done();
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1000]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1200
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1200
     * @tc.desc   Create a display context through UIContext to obtain applicationInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1200', Level.LEVEL0, () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1200]: start');
      try {
        let displayContext = uiAbilityContext?.createDisplayContext(disPlayId);
        if (displayContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1200]: uiAbilityContext' +
          JSON.stringify(displayContext));
          compareInfo(displayContext);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1200]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1200]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1300
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1300
     * @tc.desc   Retrieve the processName property from the showContext created by UIAbilityContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1300', Level.LEVEL0, () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1300]: start');
      try {
        let displayContext = uiAbilityContext?.createDisplayContext(disPlayId);
        console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1300]: uiAbilityContext' +
        JSON.stringify(displayContext));
        let displayProName = displayContext?.processName;
        let proName = uiAbilityContext?.processName;
        console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1300]: areaProName' + displayProName);
        console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1300]: proName' + proName);
        expect(displayProName).assertEqual(proName);
        expect(displayProName).assertEqual('com.acts.createdisplaycontext');
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1300]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1300]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1400
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1400
     * @tc.desc   Create a display context through UIContext to obtain default values for screen density and screen orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1400', Level.LEVEL0, async () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1400]: start');
      try {
        let displayContext = uiAbilityContext?.createDisplayContext(disPlayId);
        if (displayContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1400]: uiAbilityContext' +
          JSON.stringify(displayContext));
          let screenDisplayInfo: boolean = await createModuleContextTest(displayContext);
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1400]: screenDisplayInfo' +
            screenDisplayInfo);
          expect(true).assertEqual(screenDisplayInfo);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1400]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1400]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1600
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1600
     * @tc.desc   Create resource management object through displayContext to obtain screen density and screen orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1600', Level.LEVEL0, async (done: Function) => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1600]: start');
      try {
        let groupId = '1';
        let displayContext = uiAbilityContext?.createDisplayContext(disPlayId);
        if (displayContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1600]: uiAbilityContext' +
          JSON.stringify(displayContext));
          let str1: string = '';
          let str2: string = '';
          await uiAbilityContext?.getGroupDir(groupId).then(async data1 => {
            hilog.info(DOMAIN_NUMBER, TAG, 'getGroupDir result:' + data1);
            str1 = JSON.stringify(data1);
          });
          await displayContext?.getGroupDir(groupId).then(data2 => {
            hilog.info(DOMAIN_NUMBER, TAG, 'getGroupDir result:' + data2);
            str2 = JSON.stringify(data2);
          });
          expect(str1).assertEqual(str2);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1600]: ' + err);
        expect().assertFail();
      }
      done();
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1600]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1700
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1700
     * @tc.desc   Using sendable to convert Context in the Display Context created by UIAbilityContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1700', Level.LEVEL0, () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1700]: start');
      try {
        let displayContext = uiAbilityContext?.createDisplayContext(disPlayId);
        if (displayContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1700]: uiAbilityContext' +
          JSON.stringify(displayContext));
          let result = sendableContext(displayContext);
          expect(true).assertEqual(result);
        } else {
          expect().assertFail();
        };
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1700]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1700]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1800
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1800
     * @tc.desc   The display Context created using UIAbilityContext is passed as a parameter to rdbStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1800', Level.LEVEL0, async (done: Function) => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1800]: start');
      try {
        let displayContext = uiAbilityContext?.createDisplayContext(disPlayId);
        if (displayContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1800]: uiAbilityContext' +
          JSON.stringify(displayContext));
          await getRdbStore(displayContext).then((data: relationalStore.RdbStore) => {
            console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1800]: store: ' + data +
            JSON.stringify(data));
            expect(JSON.stringify(data)).assertEqual('{}');
          });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1800]: ' + err);
        expect().assertFail();
      }
      done();
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1800]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1900
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1900
     * @tc.desc   The display Context created by UIAbilityContext is passed in null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1900', Level.LEVEL0, () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1900]: start');
      let errCode: number = -1;
      try {
        let displayContext = uiAbilityContext?.createDisplayContext(null);
        console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1900]: uiAbilityContext' +
        JSON.stringify(displayContext));
        expect().assertFail();
      } catch (err) {
        let code = (err as BusinessError).code;
        errCode = code;
        console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1900]: errCode' +
        JSON.stringify(errCode));
      }
      expect(errCode).assertEqual(401);
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_1900]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2000
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2000
     * @tc.desc   Retrieve the path property from the displayContext created by ApplicationContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2000', Level.LEVEL0, () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2000]: start');
      try {
        console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2000]: try');
        let displayContext = uiAbilityContext?.createDisplayContext(disPlayId).getApplicationContext();
        if (displayContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2000]: uiAbilityContext' +
          JSON.stringify(displayContext));
          expect(displayContext.cacheDir).assertEqual(CACHE_DIR_app);
          expect(displayContext.filesDir).assertEqual(FILE_DIR_app);
          expect(displayContext.tempDir).assertEqual(TEMP_DIR_app);
          expect(displayContext.databaseDir).assertEqual(DATABASE_DIR_app);
          expect(displayContext.preferencesDir).assertEqual(preferences_DIR_app);
          expect(displayContext.bundleCodeDir).assertEqual(BUNDLE_DIR_app);
          expect(displayContext.distributedFilesDir).assertEqual(distributedFilesDir_DIR_app);
          expect(displayContext.resourceDir).assertEqual(resourceDir_DIR_app);
          expect(displayContext.cloudFileDir).assertEqual(cloudFile_Dir_app);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2000]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2000]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2100
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2100
     * @tc.desc   The interface for listening to system environment changes from the displayContext created by ApplicationContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2100', Level.LEVEL0, async (done: Function) => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2100]: start');
      let resultTag = -1;
      let environmentId: number = -1;
      let appContext = uiAbilityContext?.createDisplayContext(disPlayId).getApplicationContext();
      let mode = uiAbilityContext?.config.colorMode;
      let resetEnvironment = () => {
        appContext?.off('environment', environmentId);
        appContext?.setColorMode(mode);
      };
      let environmentCallback: EnvironmentCallback = {
        async onConfigurationUpdated(config) {
          console.log(`[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2100]: envCallback onConfigurationUpdated success: ${JSON.stringify(config)}`);
          resultTag = 0;
          expect(resultTag).assertEqual(0);
          resetEnvironment();
          await sleep(1000);
          done();
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2100]: end');
        },
        onMemoryLevel(level) {
          console.log(`onMemoryLevel level: ${level}`);
        }
      };
      if (appContext != undefined) {
        environmentId = appContext.on('environment', environmentCallback);
        if(mode !== ConfigurationConstant.ColorMode.COLOR_MODE_DARK) {
          appContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        } else {
          appContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
        }
      } else {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2400
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2400
     * @tc.desc   Call setLanguage after creating ApplicationContext through the displayContext created by UIAbilityContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2400', Level.LEVEL0, () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2400]: start');
      try {
        let displayContext = uiAbilityContext?.createDisplayContext(disPlayId);
        if (displayContext != undefined) {
          let appContext = displayContext.getApplicationContext();
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2400]: uiAbilityContext' +
          JSON.stringify(appContext));
          let language = uiAbilityContext?.config.language;
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2400]: language' +
          JSON.stringify(language));
          try {
            if (language !== 'us') {
              appContext.setLanguage('us');
              console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2400]: language' +
              JSON.stringify(uiAbilityContext?.config.language));
              expect(uiAbilityContext?.config.language).assertEqual('us');
              appContext.setLanguage(language);
              console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2400]: language' +
              JSON.stringify(uiAbilityContext?.config.language));
              expect(uiAbilityContext?.config.language).assertEqual(language);
            } else {
              appContext.setLanguage('zh');
              expect(uiAbilityContext?.config.language).assertEqual('zh');
              appContext.setLanguage(language);
              expect(uiAbilityContext?.config.language).assertEqual(language);
            }
          } catch (err) {
            console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2400]: ' + err);
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2400]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2400]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2500
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2500
     * @tc.desc   Create a Context through the application, then create an Application Context and then create a Display Context to obtain the path properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2500', Level.LEVEL0, async () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2500]: start');
      try {
        let displayContext: common.Context;
        let context = await application.createModuleContext(uiAbilityContext, 'entry_test');
        if (context != undefined) {
          displayContext = context.createDisplayContext(disPlayId);
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2500]: displayContext' +
          JSON.stringify(displayContext));
          expect(displayContext.cacheDir).assertEqual(CACHE_DIR_app);
          expect(displayContext.filesDir).assertEqual(FILE_DIR_app);
          expect(displayContext.tempDir).assertEqual(TEMP_DIR_app);
          expect(displayContext.databaseDir).assertEqual(DATABASE_DIR_app);
          expect(displayContext.preferencesDir).assertEqual(preferences_DIR_app);
          expect(displayContext.bundleCodeDir).assertEqual(BUNDLE_DIR_app);
          expect(displayContext.distributedFilesDir).assertEqual(distributedFilesDir_DIR_app);
          expect(displayContext.resourceDir).assertEqual(resourceDir_DIR_app);
          expect(displayContext.cloudFileDir).assertEqual(cloudFile_Dir_app);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2500]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2500]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2600
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2600
     * @tc.desc   Create a Context through the application, then create an Application Context and then create a DisplayContext to obtain the Resource Manager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2600', Level.LEVEL0, async (done: Function) => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2600]: start');
      try {
        let displayContext: common.Context;
        let uiAbilityContext: common.UIAbilityContext | undefined = AppStorage.get('context');
        let context = await application.createModuleContext(uiAbilityContext, 'entry_test');
        if (context != undefined) {
          displayContext = context.createDisplayContext(disPlayId);
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2600]: displayContext' +
          JSON.stringify(displayContext));
          await resourceManagerTest(displayContext).then((data) => {
            console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2600] data : ' + data);
            expect(true).assertEqual(data);
          });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2600]: ' + err);
        expect().assertFail();
      }
      done();
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2600]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2700
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2700
     * @tc.desc   Create a Context through the application, then create an Application Context and create a Display Context to obtain the Application Info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2700', Level.LEVEL0, async () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2700]: start');
      try {
        let displayContext: common.Context;
        let context = await application.createModuleContext(uiAbilityContext, 'entry_test');
        if (context != undefined) {
          displayContext = context.createDisplayContext(disPlayId);
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2700]: uiAbilityContext' +
          JSON.stringify(displayContext));
          compareInfo(displayContext);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2700]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2700]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2800
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2800
     * @tc.desc   Create a Context through the application, then create an Application Context and then create a Display Context to obtain the processName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2800', Level.LEVEL0, async () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2800]: start');
      try {
        let displayContext: common.Context;
        let appContext: common.ApplicationContext;
        let context = await application.createModuleContext(uiAbilityContext, 'entry_test');
        if (context != undefined) {
          displayContext = context.createDisplayContext(disPlayId);
          appContext = displayContext.getApplicationContext();
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2800]: uiAbilityContext' +
          JSON.stringify(appContext));
          let displayProName = displayContext.processName;
          let proName = uiAbilityContext?.processName;
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2800]: areaProName' + displayProName);
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2800]: proName' + proName);
          expect(displayProName).assertContain(proName);
          expect(displayProName).assertEqual('com.acts.createdisplaycontext');
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2800]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2800]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2900
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2900
     * @tc.desc   Create Context through Application, then create an Application Context and create a Display Context. Use Sendable to convert the context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2900', Level.LEVEL0, async () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2900]: start');
      try {
        let context = await application.createModuleContext(uiAbilityContext, 'entry_test');
        let displayContext = context.createDisplayContext(disPlayId);
        if (displayContext != undefined) {
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2900]: displayContext' +
          JSON.stringify(displayContext));
          let result = sendableContext(displayContext);
          expect(true).assertEqual(result);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2900]: ' + err);
        expect().assertFail();
      }
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_2900]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_3000
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_3000
     * @tc.desc   Create a Context using an application, then create an Application Context and create a Display Context, passing it as a parameter to RdbStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_3000', Level.LEVEL0, async (done: Function) => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_3000]: start');
      try {
        let context = await application.createModuleContext(uiAbilityContext, 'entry_test');
        let displayContext = context.createDisplayContext(disPlayId);
        let appContext = displayContext.getApplicationContext();
        await getRdbStore(appContext).then((data: relationalStore.RdbStore) => {
          console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_3000]: store: data' +
          JSON.stringify(data));
          expect(JSON.stringify(data)).assertEqual('{}');
        });
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_3000]: ' + err);
        expect().assertFail();
      }
      done();
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_3000]: end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_5000
     * @tc.number SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_5000
     * @tc.desc   The display Context created by UIAbilityContext is passed in undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_5000', Level.LEVEL0, () => {
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_5000]: start');
      let errCode: number = -1;
      try {
        let displayContext = uiAbilityContext?.createDisplayContext(undefined);
        console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_5000]: uiAbilityContext' +
        JSON.stringify(displayContext));
        expect().assertFail();
      } catch (err) {
        let code = (err as BusinessError).code;
        errCode = code;
        console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_5000]: errCode' +
        JSON.stringify(errCode));
      }
      expect(errCode).assertEqual(401);
      console.log('[SUB_Ability_AbilityRuntime_CreateDisplayContextByDisplayId_5000]: end');
    })
  })
}

export function sendableContext(context: Context): boolean | undefined {
  let dataPreferences: preferences.Preferences;
  let myWorker: worker.ThreadWorker = new worker.ThreadWorker('../workers/Worker.ets');
  let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
  let object: SendableObject = new SendableObject(sendableContext, 'BaseContext');
  let contextAfter: common.Context = sendableContextManager.convertToContext(sendableContext);

  hilog.info(DOMAIN_NUMBER, TAG, 'Ability context after convert: %{public}s', JSON.stringify(contextAfter));
  expect(contextAfter.cacheDir).assertEqual(context.cacheDir);
  expect(contextAfter.tempDir).assertEqual(context.tempDir);

  console.log(`DisplayContextTest postMessageWithSharedSendable begin`);
  try {
    myWorker.postMessageWithSharedSendable(object);
    expect(true).assertTrue();
  } catch (err) {
    hilog.info(DOMAIN_NUMBER, TAG, 'postMessageWithSharedSendable err: %{public}s', JSON.stringify(err));
    expect().assertFail();
  }

  let options: preferences.Options = { name: 'myStore' };
  dataPreferences = preferences.getPreferencesSync(contextAfter, options);
  hilog.info(DOMAIN_NUMBER, TAG, 'getPreferencesSync success: %{public}s', JSON.stringify(dataPreferences));
  if (dataPreferences != undefined) {
    return true;
  } else {
    return;
  }
}

export async function getRdbStore(context: Context): Promise<relationalStore.RdbStore> {
  let store: relationalStore.RdbStore | undefined = undefined;
  const STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'RdbTest.db',
    securityLevel: relationalStore.SecurityLevel.S1
  };
  store = await relationalStore.getRdbStore(context, STORE_CONFIG);
  return store;
}

export async function createModuleContextTest(displayContext: Context): Promise<boolean> {
  const UIAbilityContext = getContext() as common.UIAbilityContext;
  try {
    let displayConfig: resourceManager.Configuration | undefined;
    let uiConfig: resourceManager.Configuration | undefined;
    let displayContextRes = displayContext.createModuleContext('entry_test').resourceManager;
    let uiContextRes = UIAbilityContext.createModuleContext('entry_test').resourceManager;
    displayContextRes.getConfiguration((error: BusinessError, value: resourceManager.Configuration) => {
      if (error != null) {
        console.error('getConfiguration callback error is ' + error);
      } else {
        displayConfig = value
        hilog.info(DOMAIN_NUMBER, TAG, 'value: %{public}s ', JSON.stringify(value));
      }
    });
    await sleep(500);
    hilog.info(DOMAIN_NUMBER, TAG, 'displayConfig | direction: %{public}s | screenDensity: %{public}s',
      JSON.stringify(displayConfig?.direction), JSON.stringify(displayConfig?.screenDensity));
    uiContextRes.getConfiguration((error: BusinessError, value: resourceManager.Configuration) => {
      if (error != null) {
        console.error('getConfiguration callback error is ' + error);
      } else {
        uiConfig = value
        hilog.info(DOMAIN_NUMBER, TAG, 'value: %{public}s ', JSON.stringify(value));
      }
    });
    await sleep(500);
    hilog.info(DOMAIN_NUMBER, TAG, 'uiConfig | direction: %{public}s | screenDensity: %{public}s',
      JSON.stringify(uiConfig?.direction), JSON.stringify(uiConfig?.screenDensity));
    return displayConfig?.direction === uiConfig?.direction && displayConfig?.screenDensity === uiConfig?.screenDensity;
  } catch (error) {
    console.error('Error in createModuleContextTest: ', error);
    return false;
  }
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

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok');
    }, time);
  });
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