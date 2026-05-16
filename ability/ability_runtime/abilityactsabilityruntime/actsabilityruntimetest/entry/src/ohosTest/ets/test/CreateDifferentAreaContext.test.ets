/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import {
  ConfigurationConstant,
  contextConstant,
  EnvironmentCallback, sendableContextManager } from '@kit.AbilityKit';
import { relationalStore } from '@kit.ArkData';

@Sendable
export class SendableObject {
  constructor(sendableContext: sendableContextManager.SendableContext) {
    this.sendableContext = sendableContext;
  }
  sendableContext: sendableContextManager.SendableContext;
}


function sleep(time:number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}


let context:common.UIAbilityContext;
export default function AbilityRuntimeCreateDifferentAreaContext() {
  describe('AbilityRuntimeCreateDifferentAreaContext', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
    })
    beforeEach(async () => {})
    afterEach(() => {})
    afterAll(async () => {})
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1000
     * @tc.number SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1000
     * @tc.desc   Create a creatAreaModeContext of -1 using the UIAbilityContext method to retrieve the dir attribute from the Context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1000', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1000'
      try {
        let areaModeContext = await context.createAreaModeContext(-1)
        console.log(`${testNum},createAreaModeContext success: ${JSON.stringify(areaModeContext)}`)
        expect(areaModeContext.cacheDir).assertEqual('/data/storage/el2/base/haps/entry_test/cache')
        expect(areaModeContext.filesDir).assertEqual('/data/storage/el2/base/haps/entry_test/files')
        expect(areaModeContext.tempDir).assertEqual('/data/storage/el2/base/haps/entry_test/temp')
        expect(areaModeContext.databaseDir).assertEqual('/data/storage/el2/database/entry_test')
        expect(areaModeContext.preferencesDir).assertEqual('/data/storage/el2/base/haps/entry_test/preferences')
        expect(areaModeContext.bundleCodeDir).assertEqual('/data/storage/el1/bundle')
        expect(areaModeContext.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles')
        expect(areaModeContext.resourceDir).assertEqual('')
        expect(areaModeContext.cloudFileDir).assertEqual('/data/storage/el2/cloud')
        expect(areaModeContext.area).assertEqual(1)
        done();
      } catch (err) {
        hilog.error(0x0000, 'testTag', `requestPermissionsFromUser  restart failed: ${err.code}, ${err.message},${testNum}`);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1200
     * @tc.number SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1200
     * @tc.desc   Create a creatAreaModeContext of 3 using the UIAbilityContext method to retrieve the applicationInfo property from the Context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1200', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1200'
      try {
        let areaModeContext = await context.createAreaModeContext(3)
        console.log(testNum,`createAreaModeContext success: ${JSON.stringify(areaModeContext.applicationInfo)}`)
        expect(areaModeContext.applicationInfo.name).assertEqual('com.example.actsabilityruntimetest')
        done();
      } catch (err) {
        hilog.error(0x0000, 'testTag', `requestPermissionsFromUser  restart failed: ${err.code}, ${err.message},${testNum}`);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1400
     * @tc.number SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1400
     * @tc.desc   Create a created AreaModeContext of 3 using the UIAbilityContext method to retrieve the processName property from the Context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1400', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1400'
      try {
        let areaModeContext = await context.createAreaModeContext(3)
        console.log(testNum,`createAreaModeContext success: ${JSON.stringify(areaModeContext.processName)}`)
        expect(areaModeContext.processName).assertEqual('com.example.actsabilityruntimetest')
        done();
      } catch (err) {
        hilog.error(0x0000, 'testTag', `requestPermissionsFromUser  restart failed: ${err.code}, ${err.message},${testNum}`);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1600
     * @tc.number SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1600
     * @tc.desc   Create a created AreaModeContext with 4 using the UIAbilityContext method, and change the Area property in the Context to EL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1600', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1600'
      try {
        let areaModeContext = await context.createAreaModeContext(4)
        console.log(`${testNum},createAreaModeContext success:
        ${JSON.stringify(areaModeContext.cacheDir)},
        ${JSON.stringify(areaModeContext.filesDir)},
        ${JSON.stringify(areaModeContext.tempDir)},
        ${JSON.stringify(areaModeContext.databaseDir)},
        ${JSON.stringify(areaModeContext.preferencesDir)},
        ${JSON.stringify(areaModeContext.bundleCodeDir)},
        ${JSON.stringify(areaModeContext.distributedFilesDir)},
        ${JSON.stringify(areaModeContext.cloudFileDir)},
        ${JSON.stringify(areaModeContext.area)},
        `)
        console.log(`${testNum},createAreaModeContext success: ${JSON.stringify(areaModeContext)}`)
        expect(areaModeContext.cacheDir).assertEqual('/data/storage/el5/base/haps/entry_test/cache')
        expect(areaModeContext.filesDir).assertEqual('/data/storage/el5/base/haps/entry_test/files')
        expect(areaModeContext.tempDir).assertEqual('/data/storage/el5/base/haps/entry_test/temp')
        expect(areaModeContext.databaseDir).assertEqual('/data/storage/el5/database/entry_test')
        expect(areaModeContext.preferencesDir).assertEqual('/data/storage/el5/base/haps/entry_test/preferences')
        expect(areaModeContext.bundleCodeDir).assertEqual('/data/storage/el1/bundle')
        expect(areaModeContext.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles')
        expect(areaModeContext.resourceDir).assertEqual('')
        expect(areaModeContext.cloudFileDir).assertEqual('/data/storage/el2/cloud')
        expect(areaModeContext.area).assertEqual(4)

        areaModeContext.area = contextConstant.AreaMode.EL3
        console.log(`${testNum},createAreaModeContext success:
        ${JSON.stringify(areaModeContext.cacheDir)},
        ${JSON.stringify(areaModeContext.filesDir)},
        ${JSON.stringify(areaModeContext.tempDir)},
        ${JSON.stringify(areaModeContext.databaseDir)},
        ${JSON.stringify(areaModeContext.preferencesDir)},
        ${JSON.stringify(areaModeContext.bundleCodeDir)},
        ${JSON.stringify(areaModeContext.distributedFilesDir)},
        ${JSON.stringify(areaModeContext.cloudFileDir)},
        ${JSON.stringify(areaModeContext.area)},
        `)
        console.log(`${testNum},createAreaModeContext success: ${JSON.stringify(areaModeContext)}`)
        expect(areaModeContext.cacheDir).assertEqual('/data/storage/el3/base/haps/entry_test/cache')
        expect(areaModeContext.filesDir).assertEqual('/data/storage/el3/base/haps/entry_test/files')
        expect(areaModeContext.tempDir).assertEqual('/data/storage/el3/base/haps/entry_test/temp')
        expect(areaModeContext.databaseDir).assertEqual('/data/storage/el3/database/entry_test')
        expect(areaModeContext.preferencesDir).assertEqual('/data/storage/el3/base/haps/entry_test/preferences')
        expect(areaModeContext.bundleCodeDir).assertEqual('/data/storage/el1/bundle')
        expect(areaModeContext.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles')
        expect(areaModeContext.resourceDir).assertEqual('')
        expect(areaModeContext.cloudFileDir).assertEqual('/data/storage/el2/cloud')
        expect(areaModeContext.area).assertEqual(2)
        done();
      } catch (err) {
        hilog.error(0x0000, 'testTag', `requestPermissionsFromUser  restart failed: ${err.code}, ${err.message},${testNum}`);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1700
     * @tc.number SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1700
     * @tc.desc   Create a creatAreaModeContext with 3 as a parameter using the UIAbilityContext method and use the getRdbStore interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1700', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1700'
      let num = 0
      try {
        let areaModeContext = await context.createAreaModeContext(3)
        const STORE_CONFIG: relationalStore.StoreConfig = {
          name: "RdbTest.db",
          securityLevel: relationalStore.SecurityLevel.S3
        };
        relationalStore.getRdbStore(areaModeContext,STORE_CONFIG, async (err: BusinessError, rdbStore: relationalStore.RdbStore) => {
          if (err) {
            console.error(`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail()
            done();
          }else {
            console.info('Get RdbStore successfully.',JSON.stringify(rdbStore.version));
            num++
            expect(num).assertEqual(1)
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum},requestPermissionsFromUser  restart failed: ${err.code}, ${err.message}`);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1800
     * @tc.number SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1800
     * @tc.desc   Create a UI AbilityContext setting to set the area property in the Context to an outlier value of null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1800', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1800'
      try {
        await context.createAreaModeContext(undefined)
        expect().assertFail()
        done();
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum},requestPermissionsFromUser  restart failed: ${err.code}, ${err.message}`);
        expect(err?.code).assertEqual(401)
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1900
     * @tc.number SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1900
     * @tc.desc   Create a creatAreaModeContext of 4 using the UIAbilityContext method to retrieve the dir attribute from the Applicability Context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1900', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_1900'
      try {
        let ApplicationContext = await context.createAreaModeContext(4).getApplicationContext()
        console.log(`${testNum},createAreaModeContext success:
        ${JSON.stringify(ApplicationContext.cacheDir)},
        ${JSON.stringify(ApplicationContext.filesDir)},
        ${JSON.stringify(ApplicationContext.tempDir)},
        ${JSON.stringify(ApplicationContext.databaseDir)},
        ${JSON.stringify(ApplicationContext.preferencesDir)},
        ${JSON.stringify(ApplicationContext.bundleCodeDir)},
        ${JSON.stringify(ApplicationContext.distributedFilesDir)},
        ${JSON.stringify(ApplicationContext.cloudFileDir)},
        ${JSON.stringify(ApplicationContext.area)},
        `)
        console.log(`${testNum},ApplicationContext success: ${JSON.stringify(ApplicationContext)}`)
        expect(ApplicationContext.cacheDir).assertEqual('/data/storage/el2/base/cache')
        expect(ApplicationContext.filesDir).assertEqual('/data/storage/el2/base/files')
        expect(ApplicationContext.tempDir).assertEqual('/data/storage/el2/base/temp')
        expect(ApplicationContext.databaseDir).assertEqual('/data/storage/el2/database')
        expect(ApplicationContext.preferencesDir).assertEqual('/data/storage/el2/base/preferences')
        expect(ApplicationContext.bundleCodeDir).assertEqual('/data/storage/el1/bundle')
        expect(ApplicationContext.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles')
        expect(ApplicationContext.resourceDir).assertEqual('')
        expect(ApplicationContext.cloudFileDir).assertEqual('/data/storage/el2/cloud')
        expect(ApplicationContext.area).assertEqual(1)
        done();
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum},requestPermissionsFromUser  restart failed: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_2000
     * @tc.number SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_2000
     * @tc.desc   Create a creatAreaModeContext of 1 using the UIAbilityContext method to obtain the input parameter 'environment' for the 'on' method in the Applicability Context, and register for monitoring changes in the system environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_2000', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_2000'
      let callbackId: number = 0;
      let environmentCallback: EnvironmentCallback = {
        onConfigurationUpdated(config) {
          console.info(testNum,`onConfigurationUpdated config: ${JSON.stringify(config)}`);
          callbackId++

        },
        onMemoryLevel(level) {
          console.info(testNum,`onMemoryLevel level: ${level}`);
        }
      };
      try {
        let applicationContext = await context.createAreaModeContext(1).getApplicationContext()
        callbackId = applicationContext.on('environment', environmentCallback);
        applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        setTimeout(()=>{
          applicationContext.off('environment', callbackId);
          expect(callbackId).assertEqual(1)
          done();
        }, 1000)
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum},requestPermissionsFromUser  restart failed: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_2300
     * @tc.number SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_2300
     * @tc.desc   Create a created AreaModeContext of 4 using the UIAbilityContext method to retrieve the setLanguage from the Applicability Context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_2300', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_2300'
      let num2300 = 0;
      try {
        let applicationContext = await context.createAreaModeContext(4).getApplicationContext()
        let language = context.config.language;
        console.log(testNum,'language is '+language)
        if (language === 'zh-cn'||language === 'zh-Hans-CN') {
          await applicationContext.setLanguage('en-us');
          num2300++
          expect(num2300).assertEqual(1);
          done();
        }else {
          await applicationContext.setLanguage('zh-cn')
          num2300++
          expect(num2300).assertEqual(1);
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum},requestPermissionsFromUser  restart failed: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_2500
     * @tc.number SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_2500
     * @tc.desc   Create a created AreaModeContext of 2 using the applicationContext.create Module Context method to retrieve the EL3 path attribute information from the Context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_2500', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_2500'
      try {
        let applicationContext = await context.createAreaModeContext(2)
        sleep(1000)
        console.log(`${testNum},createAreaModeContext success:
        ${JSON.stringify(applicationContext.cacheDir)},
        ${JSON.stringify(applicationContext.filesDir)},
        ${JSON.stringify(applicationContext.tempDir)},
        ${JSON.stringify(applicationContext.databaseDir)},
        ${JSON.stringify(applicationContext.preferencesDir)},
        ${JSON.stringify(applicationContext.bundleCodeDir)},
        ${JSON.stringify(applicationContext.distributedFilesDir)},
        ${JSON.stringify(applicationContext.cloudFileDir)},
        ${JSON.stringify(applicationContext.area)},
        `)
        expect(applicationContext.cacheDir).assertEqual('/data/storage/el3/base/haps/entry_test/cache')
        expect(applicationContext.filesDir).assertEqual('/data/storage/el3/base/haps/entry_test/files')
        expect(applicationContext.tempDir).assertEqual('/data/storage/el3/base/haps/entry_test/temp')
        expect(applicationContext.databaseDir).assertEqual('/data/storage/el3/database/entry_test')
        expect(applicationContext.preferencesDir).assertEqual('/data/storage/el3/base/haps/entry_test/preferences')
        expect(applicationContext.bundleCodeDir).assertEqual('/data/storage/el1/bundle')
        expect(applicationContext.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles')
        expect(applicationContext.resourceDir).assertEqual('')
        expect(applicationContext.cloudFileDir).assertEqual('/data/storage/el2/cloud')
        expect(applicationContext.area).assertEqual(2)
        done();
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum},requestPermissionsFromUser  restart failed: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_3200
     * @tc.number SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_3200
     * @tc.desc   Create a 'creatAreaModeContext' with a value of 2 and change the 'area' information in the 'Context' to '4' using the 'applicationContext.create Module Context' method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_3200', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_3200'
      try {
        let applicationContext = await context.createAreaModeContext(2)
        console.log(`${testNum},createAreaModeContext success:
        ${JSON.stringify(applicationContext.cacheDir)},
        ${JSON.stringify(applicationContext.filesDir)},
        ${JSON.stringify(applicationContext.tempDir)},
        ${JSON.stringify(applicationContext.databaseDir)},
        ${JSON.stringify(applicationContext.preferencesDir)},
        ${JSON.stringify(applicationContext.bundleCodeDir)},
        ${JSON.stringify(applicationContext.distributedFilesDir)},
        ${JSON.stringify(applicationContext.cloudFileDir)},
        ${JSON.stringify(applicationContext.area)},
        `)
        expect(applicationContext.cacheDir).assertEqual('/data/storage/el3/base/haps/entry_test/cache')
        expect(applicationContext.filesDir).assertEqual('/data/storage/el3/base/haps/entry_test/files')
        expect(applicationContext.tempDir).assertEqual('/data/storage/el3/base/haps/entry_test/temp')
        expect(applicationContext.databaseDir).assertEqual('/data/storage/el3/database/entry_test')
        expect(applicationContext.preferencesDir).assertEqual('/data/storage/el3/base/haps/entry_test/preferences')
        expect(applicationContext.bundleCodeDir).assertEqual('/data/storage/el1/bundle')
        expect(applicationContext.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles')
        expect(applicationContext.resourceDir).assertEqual('')
        expect(applicationContext.cloudFileDir).assertEqual('/data/storage/el2/cloud')
        expect(applicationContext.area).assertEqual(2)

        applicationContext.area = contextConstant.AreaMode.EL5
        console.log(`${testNum},createAreaModeContext success:
        ${JSON.stringify(applicationContext.cacheDir)},
        ${JSON.stringify(applicationContext.filesDir)},
        ${JSON.stringify(applicationContext.tempDir)},
        ${JSON.stringify(applicationContext.databaseDir)},
        ${JSON.stringify(applicationContext.preferencesDir)},
        ${JSON.stringify(applicationContext.bundleCodeDir)},
        ${JSON.stringify(applicationContext.distributedFilesDir)},
        ${JSON.stringify(applicationContext.cloudFileDir)},
        ${JSON.stringify(applicationContext.area)},
        `)
        expect(applicationContext.cacheDir).assertEqual('/data/storage/el5/base/haps/entry_test/cache')
        expect(applicationContext.filesDir).assertEqual('/data/storage/el5/base/haps/entry_test/files')
        expect(applicationContext.tempDir).assertEqual('/data/storage/el5/base/haps/entry_test/temp')
        expect(applicationContext.databaseDir).assertEqual('/data/storage/el5/database/entry_test')
        expect(applicationContext.preferencesDir).assertEqual('/data/storage/el5/base/haps/entry_test/preferences')
        expect(applicationContext.bundleCodeDir).assertEqual('/data/storage/el1/bundle')
        expect(applicationContext.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles')
        expect(applicationContext.resourceDir).assertEqual('')
        expect(applicationContext.cloudFileDir).assertEqual('/data/storage/el2/cloud')
        expect(applicationContext.area).assertEqual(4)
        done();
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum},requestPermissionsFromUser  restart failed: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_3300
     * @tc.number SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_3300
     * @tc.desc   Create a created AreaModeContext of 2 using the applicationContext.create Module Context method and use it with getRdbStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_3300', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_CreateDifferentAreaContext_3300'
      let num = 0
      try {
        let areaModeContext = await context.createAreaModeContext(2)
        const STORE_CONFIG: relationalStore.StoreConfig = {
          name: "RdbTest.db",
          securityLevel: relationalStore.SecurityLevel.S3
        };
        relationalStore.getRdbStore(areaModeContext,STORE_CONFIG, async (err: BusinessError, rdbStore: relationalStore.RdbStore) => {
          if (err) {
            console.error(`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail()
            done();
          }else {
            console.info('Get RdbStore successfully.',JSON.stringify(rdbStore.version));
            num++
            expect(num).assertEqual(1)
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum},requestPermissionsFromUser  restart failed: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}
