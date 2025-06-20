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
import commonEventManager from '@ohos.commonEventManager';
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

export default function ContextDirTest() {
  describe('ContextDirTest', () => {
    beforeAll(async () => {
      let TAG = 'SUB_Ability_AbilityRuntime_Context_Dir_Test';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    })

    beforeEach(async () => {
      try {
        await abilityDelegator.getCurrentTopAbility()
          .then((ability) => {
            ability?.lastRequestWant?.abilityName !== 'TestAbility' && ability?.context?.terminateSelf();
          });
        await sleep(1000);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', "close TopAbility error: " + JSON.stringify(error));
      }
      await abilityDelegator.startAbility({
        bundleName: 'com.example.contextdirtest',
        abilityName: 'TestAbility',
      })
      await sleep(2000);
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityContext_Dir_0100
     * @tc.name       : Test the system application obtains AbilityContext under the same application and module, sets the area to EL3.
     * @tc.desc       : The sandbox path is correct and contains el3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityContext_Dir_0100', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityContext_Dir_0100';
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
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityContext_Dir_0200
     * @tc.name       : Test the system application obtains AbilityContext under the same application and module, sets the area to EL4.
     * @tc.desc       : The sandbox path is correct and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityContext_Dir_0200', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityContext_Dir_0200';
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
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityContext_Dir_0300
     * @tc.name       : Test the system application obtains AbilityContext under the same application but different modules, sets the area to EL3.
     * @tc.desc       : The sandbox path is correct and contains el3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityContext_Dir_0300', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityContext_Dir_0300';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        await abilityDelegator.startAbility({
          bundleName: 'com.example.contextdirtest',
          moduleName: 'application',
          abilityName: 'ApplicationAbility',
        })
        setTimeout(async () => {
          await abilityDelegator.getCurrentTopAbility().then((ability) => {
            let context = ability.context;
            expect(context.currentHapModuleInfo.name).assertEqual('application');
            context.area = contextConstant.AreaMode.EL3;
            areaMode = "el3";
            checkContextDir(context, 'application');
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
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityContext_Dir_0400
     * @tc.name       : Test the system application obtains AbilityContext under the same application but different modules, sets the area to EL4.
     * @tc.desc       : The sandbox path is correct and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityContext_Dir_0400', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityContext_Dir_0400';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        await abilityDelegator.startAbility({
          bundleName: 'com.example.contextdirtest',
          moduleName: 'application',
          abilityName: 'ApplicationAbility',
        })
        setTimeout(async () => {
          await abilityDelegator.getCurrentTopAbility().then((ability) => {
            let context = ability.context;
            expect(context.currentHapModuleInfo.name).assertEqual('application');
            context.area = contextConstant.AreaMode.EL4;
            areaMode = "el4";
            checkContextDir(context, 'application');
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
     * @tc.number     : SUB_Ability_AbilityRuntime_ModuleContext_Dir_0500
     * @tc.name       : Test the system application obtains ModuleContext under the same application but different modules, sets the area to EL3.
     * @tc.desc       : The sandbox path is correct and contains el3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_ModuleContext_Dir_0500', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_ModuleContext_Dir_0500';
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
     * @tc.number     : SUB_Ability_AbilityRuntime_ModuleContext_Dir_0600
     * @tc.name       : Test the system application obtains ModuleContext under the same application but different modules, sets the area to EL4.
     * @tc.desc       : The sandbox path is correct and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_ModuleContext_Dir_0600', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_ModuleContext_Dir_0600';
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
     * @tc.name       : Test the system application obtains ApplicationContext under different applications, sets the area to EL3.
     * @tc.desc       : The sandbox path is correct and contains el3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_Dir_0700', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_ApplicationContext_Dir_0700';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      try {
        await abilityDelegator.getCurrentTopAbility().then(async (ability) => {
          let abilityContext = ability.context;
          await abilityDelegator.startAbility({
            bundleName: 'com.example.contextdirnormaltest',
            abilityName: 'EntryAbility',
          })
          await sleep(300);
          let bundleName = 'com.example.contextdirnormaltest';
          let otherAppContext = abilityContext.createBundleContext(bundleName);
          otherAppContext.getApplicationContext().area = contextConstant.AreaMode.EL3;
          areaMode = "el3";
          let result = checkApplicationContextDir(otherAppContext.getApplicationContext());
          expect(result).assertTrue();
          abilityDelegator.executeShellCommand('aa force-stop com.example.contextdirnormaltest');
          await sleep(300);
          done();
        })
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_ApplicationContext_Dir_0800
     * @tc.name       : Test the system application obtains ApplicationContext under different applications, sets the area to EL4.
     * @tc.desc       : The sandbox path is correct and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_Dir_0800', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_ApplicationContext_Dir_0800';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start')
      try {
        await abilityDelegator.getCurrentTopAbility().then(async (ability) => {
          let abilityContext = ability.context;
          await abilityDelegator.startAbility({
            bundleName: 'com.example.contextdirnormaltest',
            abilityName: 'EntryAbility',
          })
          await sleep(300);
          let bundleName = 'com.example.contextdirnormaltest';
          let otherAppContext = abilityContext.createBundleContext(bundleName);
          otherAppContext.getApplicationContext().area = contextConstant.AreaMode.EL4;
          areaMode = "el4";
          let result = checkApplicationContextDir(otherAppContext.getApplicationContext());
          expect(result).assertTrue();
          abilityDelegator.executeShellCommand('aa force-stop com.example.contextdirnormaltest');
          await sleep(300);
          done();
        })
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityStageContext_Dir_0900
     * @tc.name       : Test the system application obtains AbilityStageContext under the same application and module, sets the area to EL3.
     * @tc.desc       : The sandbox path is correct and contains el3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityStageContext_Dir_0900', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityStageContext_Dir_0900';
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
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityStageContext_Dir_1000
     * @tc.name       : Test the system application obtains AbilityStageContext under the same application and module, sets the area to EL4.
     * @tc.desc       : The sandbox path is correct and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityStageContext_Dir_1000', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityStageContext_Dir_1000';
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

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityContext_GetGroupDir_1100
     * @tc.name       : Two applications applying for the same groupId, set the area to EL3 respectively, can obtain the same shared sandbox path.
     * @tc.desc       : The sandbox path is same and contains el3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityContext_GetGroupDir_1100', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityContext_GetGroupDir_1100';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      let getGroupDirData: string;
      let getGroupDirDataOther: string;
      let Subscriber: commonEventManager.CommonEventSubscriber;

      commonEventManager.createSubscriber({
        events: ["getGroupDirEvent1"],
      }).then(async (data) => {
        console.log(TAG + "Subscriber create");
        Subscriber = data;
        commonEventManager.subscribe(Subscriber, async (_, data) => {
          if (data?.parameters?.result !== undefined) {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + " Subscriber data " + JSON.stringify(data.parameters.result));
            getGroupDirDataOther = data.parameters.result;
            expect(getGroupDirDataOther).assertEqual(getGroupDirData);
            commonEventManager.unsubscribe(Subscriber);
            abilityDelegator.executeShellCommand('aa force-stop com.example.contextdirnormaltest');
            await sleep(300);
            done();
          }
        });

        let abilityContext = AppStorage.get<common.AbilityStageContext>('TestAbilityContext') as common.AbilityStageContext;
        abilityContext.area = contextConstant.AreaMode.EL3;
        abilityContext.getGroupDir("context_test1", (err, data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'this app getGroupDir context_test1 ====> result data ' + JSON.stringify(data));
          getGroupDirData = data;
          expect(getGroupDirData).assertContain("/data/storage/el3/group");
          expect(err).assertNull();
        })
        await sleep(1000);
        try {
          abilityDelegator.startAbility({
            bundleName: "com.example.contextdirnormaltest",
            abilityName: "EntryAbility",
            moduleName: 'entry',
            parameters: {
              isPublish: true,
              areaMode: "el3"
            }
          }, (err) => {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + " startAbility err:" + JSON.stringify(err));
            done();
          })
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityContext_GetGroupDir_1200
     * @tc.name       : Two applications applying for the same groupId, set the area to EL4 respectively, can obtain the same shared sandbox path.
     * @tc.desc       : The sandbox path is same and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityContext_GetGroupDir_1200', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityContext_GetGroupDir_1200';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      let getGroupDirData: string;
      let getGroupDirDataOther: string;
      let Subscriber: commonEventManager.CommonEventSubscriber;

      commonEventManager.createSubscriber({
        events: ["getGroupDirEvent1"],
      }).then(async (data) => {
        console.log(TAG + "Subscriber create");
        Subscriber = data;
        commonEventManager.subscribe(Subscriber, async (_, data) => {
          if (data?.parameters?.result !== undefined) {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + " Subscriber data " + JSON.stringify(data.parameters.result));
            getGroupDirDataOther = data.parameters.result;
            expect(getGroupDirDataOther).assertEqual(getGroupDirData);
            commonEventManager.unsubscribe(Subscriber);
            abilityDelegator.executeShellCommand('aa force-stop com.example.contextdirnormaltest');
            await sleep(300);
            done();
          }
        });

        let abilityContext = AppStorage.get<common.AbilityStageContext>('TestAbilityContext') as common.AbilityStageContext;
        abilityContext.area = contextConstant.AreaMode.EL4;
        abilityContext.getGroupDir("context_test1", (err, data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'this app getGroupDir context_test1 ====> result data ' + JSON.stringify(data));
          getGroupDirData = data;
          expect(getGroupDirData).assertContain("/data/storage/el4/group");
          expect(err).assertNull();
        })
        await sleep(1000);
        try {
          abilityDelegator.startAbility({
            bundleName: "com.example.contextdirnormaltest",
            abilityName: "EntryAbility",
            moduleName: 'entry',
            parameters: {
              isPublish: true,
              areaMode: "el4"
            }
          }, (err) => {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + " startAbility err:" + JSON.stringify(err));
            done();
          })
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityContext_GetGroupDir_1300
     * @tc.name       : Two applications applying for different groupIds, set the area to EL3 respectively, can obtain different shared sandbox path.
     * @tc.desc       : The sandbox path is different and contains el3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityContext_GetGroupDir_1300', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityContext_GetGroupDir_1300';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      let getGroupDirData: string;
      let getGroupDirDataOther: string;
      let Subscriber: commonEventManager.CommonEventSubscriber;

      commonEventManager.createSubscriber({
        events: ["getGroupDirEvent2"],
      }).then(async (data) => {
        console.log(TAG + "Subscriber create");
        Subscriber = data;
        commonEventManager.subscribe(Subscriber, async (_, data) => {
          if (data?.parameters?.result !== undefined) {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + " Subscriber data " + JSON.stringify(data.parameters.result));
            getGroupDirDataOther = data.parameters.result;
            expect(getGroupDirDataOther !== getGroupDirData).assertTrue();
            commonEventManager.unsubscribe(Subscriber);
            abilityDelegator.executeShellCommand('aa force-stop com.example.contextdirnormaltest');
            await sleep(300);
            done();
          }
        });

        let abilityContext = AppStorage.get<common.AbilityStageContext>('TestAbilityContext') as common.AbilityStageContext;
        abilityContext.area = contextConstant.AreaMode.EL3;
        abilityContext.getGroupDir("context_test1", (err, data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'this app getGroupDir context_test1 ====> result data ' + JSON.stringify(data));
          getGroupDirData = data;
          expect(getGroupDirData).assertContain("/data/storage/el3/group");
          expect(err).assertNull();
        })
        await sleep(1000);
        try {
          abilityDelegator.startAbility({
            bundleName: "com.example.contextdirnormaltest",
            abilityName: "EntryAbility",
            moduleName: 'entry',
            parameters: {
              isPublish: true,
              areaMode: "el3"
            }
          }, (err) => {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + " startAbility err:" + JSON.stringify(err));
            done();
          })
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_AbilityContext_GetGroupDir_1400
     * @tc.name       : Two applications applying for different groupIds, set the area to EL4 respectively, can obtain different shared sandbox path.
     * @tc.desc       : The sandbox path is different and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_AbilityContext_GetGroupDir_1400', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityContext_GetGroupDir_1400';
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' --start');
      let getGroupDirData: string;
      let getGroupDirDataOther: string;
      let Subscriber: commonEventManager.CommonEventSubscriber;

      commonEventManager.createSubscriber({
        events: ["getGroupDirEvent2"],
      }).then(async (data) => {
        console.log(TAG + "Subscriber create");
        Subscriber = data;
        commonEventManager.subscribe(Subscriber, async (_, data) => {
          if (data?.parameters?.result !== undefined) {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + " Subscriber data " + JSON.stringify(data.parameters.result));
            getGroupDirDataOther = data.parameters.result;
            expect(getGroupDirDataOther !== getGroupDirData).assertTrue();
            commonEventManager.unsubscribe(Subscriber);
            abilityDelegator.executeShellCommand('aa force-stop com.example.contextdirnormaltest');
            await sleep(300);
            done();
          }
        });

        let abilityContext = AppStorage.get<common.AbilityStageContext>('TestAbilityContext') as common.AbilityStageContext;
        abilityContext.area = contextConstant.AreaMode.EL4;
        abilityContext.getGroupDir("context_test1", (err, data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'this app getGroupDir context_test1 ====> result data ' + JSON.stringify(data));
          getGroupDirData = data;
          expect(getGroupDirData).assertContain("/data/storage/el4/group");
          expect(err).assertNull();
        })
        await sleep(1000);
        try {
          abilityDelegator.startAbility({
            bundleName: "com.example.contextdirnormaltest",
            abilityName: "EntryAbility",
            moduleName: 'entry',
            parameters: {
              isPublish: true,
              areaMode: "el4"
            }
          }, (err) => {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + " startAbility err:" + JSON.stringify(err));
            done();
          })
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + " error: " + JSON.stringify(e));
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number     : SUB_Ability_AbilityRuntime_ApplicationContext_Dir_1500
     * @tc.name       : Test the system application obtains ApplicationContext under the same application, sets the area to EL3.
     * @tc.desc       : The sandbox path is correct and contains el3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_Dir_1500', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_ApplicationContext_Dir_1500';
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
     * @tc.number     : SUB_Ability_AbilityRuntime_ApplicationContext_Dir_1600
     * @tc.name       : Test the system application obtains ApplicationContext under the same application, sets the area to EL4.
     * @tc.desc       : The sandbox path is correct and contains el4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_Dir_1600', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_ApplicationContext_Dir_1600';
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
  })
}