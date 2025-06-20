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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import contextConstant from '@ohos.app.ability.contextConstant';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let areaMode: string;

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

function checkContextDir(context: common.Context, moduleName: string): boolean {
  hilog.info(0x0000, 'testTag', '%{public}s', ' checkContextDir' + JSON.stringify(context.cacheDir));
  expect(context.cacheDir).assertEqual("/data/storage/" + areaMode + "/base/haps/" + moduleName + "/cache");
  expect(context.tempDir).assertEqual("/data/storage/" + areaMode + "/base/haps/" + moduleName + "/temp");
  expect(context.filesDir).assertEqual("/data/storage/" + areaMode + "/base/haps/" + moduleName + "/files");
  expect(context.distributedFilesDir).assertEqual("/data/storage/" + "el2" + "/distributedfiles");
  expect(context.databaseDir).assertEqual("/data/storage/" + areaMode + "/database/" + moduleName);
  expect(context.preferencesDir)
    .assertEqual("/data/storage/" + areaMode + "/base/haps/" + moduleName + "/preferences");
  expect(context.bundleCodeDir).assertEqual("/data/storage/el1/bundle");
  expect(fs.accessSync(context.cacheDir)).assertTrue();
  expect(fs.accessSync(context.tempDir)).assertTrue();
  expect(fs.accessSync(context.filesDir)).assertTrue();
  expect(fs.accessSync(context.distributedFilesDir)).assertTrue();
  expect(fs.accessSync(context.databaseDir)).assertTrue();
  expect(fs.accessSync(context.preferencesDir)).assertTrue();
  expect(fs.accessSync(context.bundleCodeDir)).assertTrue();
  return true;
}

function checkApplicationContextDir(applicationContext: common.ApplicationContext): boolean {
  hilog.info(0x0000, 'testTag', '%{public}s', ' checkApplicationContextDir' + JSON.stringify(applicationContext.cacheDir));
  expect(applicationContext.cacheDir).assertEqual("/data/storage/" + areaMode + "/base/cache");
  expect(applicationContext.tempDir).assertEqual("/data/storage/" + areaMode + "/base/temp");
  expect(applicationContext.filesDir).assertEqual("/data/storage/" + areaMode + "/base/files");
  expect(applicationContext.distributedFilesDir).assertEqual("/data/storage/" + "el2" + "/distributedfiles");
  expect(applicationContext.databaseDir).assertEqual("/data/storage/" + areaMode + "/database");
  expect(applicationContext.preferencesDir).assertEqual("/data/storage/" + areaMode + "/base/preferences");
  expect(applicationContext.bundleCodeDir).assertEqual("/data/storage/el1/bundle");
  expect(fs.accessSync(applicationContext.cacheDir)).assertTrue();
  expect(fs.accessSync(applicationContext.tempDir)).assertTrue();
  expect(fs.accessSync(applicationContext.filesDir)).assertTrue();
  expect(fs.accessSync(applicationContext.distributedFilesDir)).assertTrue();
  expect(fs.accessSync(applicationContext.databaseDir)).assertTrue();
  expect(fs.accessSync(applicationContext.preferencesDir)).assertTrue();
  expect(fs.accessSync(applicationContext.bundleCodeDir)).assertTrue();
  return true;
}

function checkModuleContextDir(moduleContext: common.Context): boolean {
  hilog.info(0x0000, 'testTag', '%{public}s', ' checkModuleContextDir' + JSON.stringify(moduleContext.cacheDir));
  expect(moduleContext.cacheDir).assertEqual("/data/storage/" + areaMode + "/base/cache");
  expect(moduleContext.tempDir).assertEqual("/data/storage/" + areaMode + "/base/temp");
  expect(moduleContext.filesDir).assertEqual("/data/storage/" + areaMode + "/base/files");
  expect(moduleContext.distributedFilesDir).assertEqual("/data/storage/" + "el2" + "/distributedfiles");
  expect(moduleContext.databaseDir).assertEqual("/data/storage/" + areaMode + "/database");
  expect(moduleContext.preferencesDir).assertEqual("/data/storage/" + areaMode + "/base/preferences");
  expect(moduleContext.bundleCodeDir).assertEqual("/data/storage/el1/bundle");
  expect(fs.accessSync(moduleContext.cacheDir)).assertTrue();
  expect(fs.accessSync(moduleContext.tempDir)).assertTrue();
  expect(fs.accessSync(moduleContext.filesDir)).assertTrue();
  expect(fs.accessSync(moduleContext.distributedFilesDir)).assertTrue();
  expect(fs.accessSync(moduleContext.databaseDir)).assertTrue();
  expect(fs.accessSync(moduleContext.preferencesDir)).assertTrue();
  expect(fs.accessSync(moduleContext.bundleCodeDir)).assertTrue();
  return true;
}

export default function ContextDirNormalTest() {
  describe('ContextDirNormalTest', () => {
    beforeAll(async () => {
      let TAG = 'SUB_Ability_AbilityRuntime_Context_Dir_Test';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await sleep(300);
    })
    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityContext_Dir_Normal_0100
     * @tc.name       : Test the third-party application obtains AbilityContext under the same application and module, sets the area to EL3.
     * @tc.desc       : The sandbox path is correct and contains el3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityContext_Dir_Normal_0100', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityContext_Dir_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        await abilityDelegator.getCurrentTopAbility().then((ability) => {
          let context = ability.context;
          context.area = contextConstant.AreaMode.EL3;
          areaMode = "el3";
          let result = checkContextDir(context, 'entry');
          expect(result).assertTrue();
          done();
        })
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityContext_Dir_Normal_0200
     * @tc.name       : Test the third-party application obtains AbilityContext under the same application and module, sets the area to EL4.
     * @tc.desc       : The sandbox path is correct and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityContext_Dir_Normal_0200', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityContext_Dir_Normal_0200';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        await abilityDelegator.getCurrentTopAbility().then((ability) => {
          let context = ability.context;
          context.area = contextConstant.AreaMode.EL4;
          areaMode = "el4";
          let result = checkContextDir(context, 'entry');
          expect(result).assertTrue();
          done();
        })
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityContext_Dir_Normal_0300
     * @tc.name       : Test the third-party application obtains AbilityContext under the same application but different modules, sets the area to EL3.
     * @tc.desc       : The sandbox path is correct and contains el3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityContext_Dir_Normal_0300', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityContext_Dir_Normal_0300';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        await abilityDelegator.startAbility({
          bundleName: 'com.example.contextdirnormaltest',
          moduleName: 'application',
          abilityName: 'ApplicationAbility',
        })
        setTimeout(async () => {
          await abilityDelegator.getCurrentTopAbility().then((ability) => {
            let context = ability.context;
            expect(context.currentHapModuleInfo.name).assertEqual('application');
            context.area = contextConstant.AreaMode.EL3;
            areaMode = "el3";
            let result = checkContextDir(context, 'application');
            expect(result).assertTrue();
            done();
          })
        }, 300)
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityContext_Dir_Normal_0400
     * @tc.name       : Test the third-party application obtains AbilityContext under the same application but different modules, sets the area to EL4.
     * @tc.desc       : The sandbox path is correct and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityContext_Dir_Normal_0400', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityContext_Dir_Normal_0400';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        await abilityDelegator.startAbility({
          bundleName: 'com.example.contextdirnormaltest',
          moduleName: 'application',
          abilityName: 'ApplicationAbility',
        })
        setTimeout(async () => {
          await abilityDelegator.getCurrentTopAbility().then((ability) => {

            let context = ability.context;
            expect(context.currentHapModuleInfo.name).assertEqual('application');
            context.area = contextConstant.AreaMode.EL4;
            areaMode = "el4";
            let result = checkContextDir(context, 'application');
            expect(result).assertTrue();
            done();
          })
        }, 300)
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_ModuleContext_Dir_Normal_0500
     * @tc.name       : Test the third-party application obtains ModuleContext under the same application but different modules, sets the area to EL3.
     * @tc.desc       : The sandbox path is correct and contains el3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */ 
    it('SUB_Ability_AbilityRuntime_ModuleContext_Dir_Normal_0500', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_ModuleContext_Dir_Normal_0500';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        let abilityUIAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
        let context = abilityUIAbilityContext.createModuleContext('application');
        context.area = contextConstant.AreaMode.EL3;
        areaMode = "el3";
        let result = checkModuleContextDir(context);
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_ModuleContext_Dir_Normal_0600
     * @tc.name       : Test the third-party application obtains ModuleContext under the same application but different modules, sets the area to EL4.
     * @tc.desc       : The sandbox path is correct and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_ModuleContext_Dir_Normal_0600', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_ModuleContext_Dir_Normal_0600';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        let abilityUIAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
        let context = abilityUIAbilityContext.createModuleContext('application');
        context.area = contextConstant.AreaMode.EL4;
        areaMode = "el4";
        let result = checkModuleContextDir(context);
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_ApplicationContext_Dir_0700
     * @tc.name       : Test the third-party application obtains ApplicationContext under the same application, sets the area to EL3.
     * @tc.desc       : The sandbox path is correct and contains el3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_Dir_Normal_0700', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_ApplicationContext_Dir_Normal_0700';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        await abilityDelegator.getCurrentTopAbility().then(async (ability) => {
          let abilityContext = ability.context;
          abilityContext.getApplicationContext().area = contextConstant.AreaMode.EL3;
          areaMode = "el3";
          let result = checkApplicationContextDir(abilityContext.getApplicationContext());
          expect(result).assertTrue();
          done();
        })
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_ApplicationContext_Dir_Normal_0800
     * @tc.name       : Test the third-party application obtains ApplicationContext under the same application, sets the area to EL4.
     * @tc.desc       : The sandbox path is correct and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_Dir_Normal_0800', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_ApplicationContext_Dir_Normal_0800';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        await abilityDelegator.getCurrentTopAbility().then(async (ability) => {
          let abilityContext = ability.context;
          abilityContext.getApplicationContext().area = contextConstant.AreaMode.EL4;
          areaMode = "el4";
          let result = checkApplicationContextDir(abilityContext.getApplicationContext());
          expect(result).assertTrue();
          done();
        })
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityStageContext_Dir_Normal_0900
     * @tc.name       : Test the third-party application obtains AbilityStageContext under the same application and module, sets the area to EL4.
     * @tc.desc       : The sandbox path is correct and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityStageContext_Dir_Normal_0900', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityStageContext_Dir_Normal_0900';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        let abilityStageContext = AppStorage.get<common.AbilityStageContext>('myAbilityStageContext') as common.AbilityStageContext;
        console.log('testTag stageContext ', JSON.stringify(abilityStageContext.cacheDir))
        abilityStageContext.area = contextConstant.AreaMode.EL3;
        areaMode = "el3";
        let result = checkContextDir(abilityStageContext, 'entry');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityStageContext_Dir_Normal_1000
     * @tc.name       : Test the third-party application obtains AbilityStageContext under the same application and module, sets the area to EL4.
     * @tc.desc       : The sandbox path is correct and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityStageContext_Dir_Normal_1000', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityStageContext_Dir_Normal_1000';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        let abilityStageContext = AppStorage.get<common.AbilityStageContext>('myAbilityStageContext') as common.AbilityStageContext;
        console.log('testTag stageContext ', JSON.stringify(abilityStageContext.cacheDir))
        abilityStageContext.area = contextConstant.AreaMode.EL4;
        areaMode = "el4";
        let result = checkContextDir(abilityStageContext, 'entry');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })
  })
}