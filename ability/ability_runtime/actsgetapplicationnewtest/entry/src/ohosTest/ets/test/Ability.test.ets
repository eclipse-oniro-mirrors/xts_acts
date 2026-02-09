import { describe, it, beforeAll, expect, afterEach, Level } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { bundleManager } from '@kit.AbilityKit';

let ACTS_CallFunction: commonEventManager.CommonEventSubscribeInfo = {
  events: ['0100', '0200', '0300', '0400', '0500', '0600', '0700', '0800', '0900', '1000', '1100', '1200', '1300']
};
let ACTS_CallFunction2: commonEventManager.CommonEventSubscribeInfo = {
  events: ['Instance_0100']
};
const TAG = 'ActsGetApplicationNewTest';

let subscriber: commonEventManager.CommonEventSubscriber;

let driver = Driver.create();

console.log(TAG, driver);

export function getContextEntry(): common.UIAbilityContext {
  let context = AppStorage.get('context') as common.UIAbilityContext;
  console.info('getContext is ' + context);
  return context;
}

export default function abilityTest() {
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
    })

    afterEach(async (done: Function) => {
      commonEventManager.unsubscribe(subscriber, () => {
        done();
      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_0100
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0100', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 start');
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 subscribe');
            if (data.event == '0100') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 data event');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0100 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }

      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 StartAbility start');
      let want: Want = {
        bundleName: 'com.example.contexttest',
        abilityName: 'EntryAbility'
      };
      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 getAbilityDelegator end');
      setTimeout(() => {
        AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
          console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 StartAbility successfully');
        }).catch((err: BusinessError) => {
          console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 StartAbility err: ' + err.code);
        })
      }, 1000);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_0200
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0200', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 start');
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 createSubscriber data')
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0200') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 data event');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0200 error: ', JSON.stringify(err))
        expect().assertFail();
        done();
      }

      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 StartAbility start');
      let want: Want = {
        bundleName: 'com.example.contexttest',
        abilityName: 'StartAbility'
      };
      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 getAbilityDelegator end');
      AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 StartAbility successfully');
      }).catch((err: BusinessError) => {
        console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 StartAbility err: ' + err.code);
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_0300
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0300', Level.LEVEL0, async (done: Function) => {
      try {
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0300') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 data event');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });

        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 StartAbility start');
        let want: Want = {
          bundleName: 'com.example.contexttest',
          abilityName: 'EntryAbility'
        };
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 getAbilityDelegator end');
        await AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
          console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 StartAbility successfully');
        }).catch((err: BusinessError) => {
          console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 StartAbility err: ' + err.code);
        });

        try {
          await driver.delayMs(500);
          let name = await driver.waitForComponent(ON.id('getapplicationl1'), 2000);
          console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 name = ', name);
          await driver.delayMs(500);
          await name.click();
        } catch (err) {
          console.log(' driver error: ', JSON.stringify(err));
        }
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0300 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_0400
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_0400
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0400', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 start');
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0600') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 data event');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0400 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }

      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 StartAbility start');
      let want: Want = {
        bundleName: 'com.example.contexttest',
        abilityName: 'SingleStartMultipleAbility'
      };
      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 getAbilityDelegator end');
      AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 StartAbility successfully');
      }).catch((err: BusinessError) => {
        console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0400 StartAbility err: ' + err.code);
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_0500
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_0500
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0500', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0500 start');
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0500 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0900') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0500 data event');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0500 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }

      console.log(TAG, 'StartAbility start');
      let want: Want = {
        bundleName: 'com.example.contexttest',
        abilityName: 'FeatureAbility'
      };
      console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0500 getAbilityDelegator end');
      AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0500 StartAbility successfully');
      }).catch((err: BusinessError) => {
        console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0500 StartAbility err: ' + err.code);
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_0600
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_0600
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0600', Level.LEVEL0, async (done: Function) => {
      try {
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0700') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 data event')
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });

        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 StartAbility start');
        let want: Want = {
          bundleName: 'com.example.contexttest',
          abilityName: 'EntryAbility'
        };
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 getAbilityDelegator end');
        await AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
          console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 StartAbility successfully');
        }).catch((err: BusinessError) => {
          console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 StartAbility err: ' + err.code);
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0600 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_0700
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_0700
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0700', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 start');
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 subscribe');
            if (data.event == '0800') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 data event');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });

        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 StartAbility start');
        let want: Want = {
          bundleName: 'com.example.contexttest',
          abilityName: 'InstanceUIExtensionAbility'
        };
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 getAbilityDelegator end');
        setTimeout(() => {
          AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 StartAbility successfully');
          }).catch((err: BusinessError) => {
            console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0700 StartAbility err: ' + err.code);
          })
        }, 1000);
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0700 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_0800
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_0800
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0800', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 start!!!')
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 subscribe');
            if (data.event == '0400') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 setTimeout');
              let application1: bundleManager.ApplicationInfo = data.parameters?.data1?.applicationInfo;
              let application2: bundleManager.ApplicationInfo = data.parameters?.data2?.applicationInfo;
              expect(application1.name).assertEqual("com.example.contexttest");
              expect(application1.name).assertEqual(application2.name);
              expect(application1.description).assertEqual(application2.description);
              expect(application1.descriptionId).assertEqual(application2.descriptionId);
              expect(application1.enabled).assertEqual(application2.enabled);
              expect(application1.label).assertEqual(application2.label);
              expect(application1.labelId).assertEqual(application2.labelId);
              expect(application1.icon).assertEqual(application2.icon);
              expect(application1.iconId).assertEqual(application2.iconId);
              expect(application1.process).assertEqual(application2.process);
              expect(application1.codePath).assertEqual(application2.codePath);
              expect(application1.removable).assertEqual(application2.removable);
              expect(application1.accessTokenId).assertEqual(application2.accessTokenId);
              expect(application1.appDistributionType).assertEqual(application2.appDistributionType);
              expect(application1.appProvisionType).assertEqual(application2.appProvisionType);
              expect(application1.systemApp).assertEqual(application2.systemApp);
              expect(application1.debug).assertEqual(application2.debug);
              expect(application1.nativeLibraryPath).assertEqual(application2.nativeLibraryPath);
              expect(application1.appIndex).assertEqual(application2.appIndex);
              expect(application1.installSource).assertEqual(application2.installSource);
              expect(application1.releaseType).assertEqual(application2.releaseType);
              expect(application1.cloudFileSyncEnabled).assertEqual(application2.cloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });

        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 StartAbility start');
        let want: Want = {
          bundleName: 'com.example.contexttest',
          abilityName: 'WorkerAbility'
        };
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 getAbilityDelegator end');
        setTimeout(() => {
          AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 StartAbility successfully.');
          }).catch((err: BusinessError) => {
            console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 StartAbility err: ' + err.code);
          })
        }, 1000);
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0800 error: ', JSON.stringify(err))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_0900
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_0900
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0900', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 start')
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 subscribe');
            if (data.event == '0500') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 data event');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });

        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 StartAbility start');
        let want: Want = {
          bundleName: 'com.example.contexttest',
          abilityName: 'ServiceExtAbility'
        };
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 getAbilityDelegator end');
        setTimeout(() => {
          AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 StartAbility successfully');
          }).catch((err: BusinessError) => {
            console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0900 StartAbility err: ' + err.code);
          })
        }, 1000);
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0900 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_1000
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_1000
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_1000', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1000 start');
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1000 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1000 subscribe');
            getContextEntry().terminateSelf();
            if (data.event == '1000') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1000 data event');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });

        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1000 StartAbility start');
        let want: Want = {
          bundleName: 'com.example.contexttest',
          abilityName: 'EntryAbilityTwo'
        };
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1000 getAbilityDelegator end');
        setTimeout(() => {
          AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1000 StartAbility successfully');
          }).catch((err: BusinessError) => {
            console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1000 StartAbility err: ' + err.code);
          })
        }, 1000);
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_1000 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_1100
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_1100
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_1100', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1100 start');
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1100 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1100 subscribe');
            getContextEntry().terminateSelf();
            if (data.event == '1100') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1100 data event');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });

        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1100 StartAbility start');
        let want: Want = {
          bundleName: 'com.example.contexttest',
          abilityName: 'EntryAbilityTwo'
        };
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1100 getAbilityDelegator end');
        setTimeout(() => {
          AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1100 StartAbility successfully');
          }).catch((err: BusinessError) => {
            console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1100 StartAbility err: ' + err.code);
          })
        }, 1000);
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_1100 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_1200
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_1200
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_1200', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1200 start');
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1200 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1200 subscribe');
            getContextEntry().terminateSelf();
            if (data.event == '1200') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1200 data event');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });

        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1200 StartAbility start');
        let want: Want = {
          bundleName: 'com.example.contexttest',
          abilityName: 'EntryAbilityTwo'
        };
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1200 getAbilityDelegator end');
        setTimeout(() => {
          AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1200 StartAbility successfully');
          }).catch((err: BusinessError) => {
            console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1200 StartAbility err: ' + err.code);
          })
        }, 1000);
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_1200 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContext_1300
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContext_1300
     * @tc.desc   Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_1300', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1300 start');
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1300 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1300 subscribe');
            getContextEntry().terminateSelf();
            if (data.event == '1300') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1300 data event');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });

        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1300 StartAbility start');
        let want: Want = {
          bundleName: 'com.example.contexttest',
          abilityName: 'EntryAbilityTwo'
        };
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1300 getAbilityDelegator end');
        setTimeout(() => {
          AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1300 StartAbility successfully.');
          }).catch((err: BusinessError) => {
            console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_1300 StartAbility err: ' + err.code);
          })
        }, 1000);
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_1300 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetApplicationContextInstance_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetApplicationContextInstance_0100
     * @tc.desc   Call the global GetApplicationContextInstance function to obtain applicationInfo and sandbox path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContextInstance_0100', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContextInstance_0100 start');
        commonEventManager.createSubscriber(ACTS_CallFunction2).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContextInstance_0100 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContextInstance_0100 subscribe');
            getContextEntry().terminateSelf();
            if (data.event == 'Instance_0100') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContextInstance_0100 data event');
              expect(data.parameters?.data1?.applicationInfoname).assertEqual("com.example.contexttest");
              expect(data.parameters?.data1?.applicationInfoname).assertEqual(data.parameters?.data2?.applicationInfoname);
              expect(data.parameters?.data1?.applicationInfodescription).assertEqual(data.parameters?.data2?.applicationInfodescription);
              expect(data.parameters?.data1?.applicationInfodescriptionId).assertEqual(data.parameters?.data2?.applicationInfodescriptionId);
              expect(data.parameters?.data1?.applicationInfoenabled).assertEqual(data.parameters?.data2?.applicationInfoenabled);
              expect(data.parameters?.data1?.applicationInfolabel).assertEqual(data.parameters?.data2?.applicationInfolabel);
              expect(data.parameters?.data1?.applicationInfolabelId).assertEqual(data.parameters?.data2?.applicationInfolabelId);
              expect(data.parameters?.data1?.applicationInfoicon).assertEqual(data.parameters?.data2?.applicationInfoicon);
              expect(data.parameters?.data1?.applicationInfoiconId).assertEqual(data.parameters?.data2?.applicationInfoiconId);
              expect(data.parameters?.data1?.applicationInfoprocess).assertEqual(data.parameters?.data2?.applicationInfoprocess);
              expect(data.parameters?.data1?.applicationInfocodePath).assertEqual(data.parameters?.data2?.applicationInfocodePath);
              expect(data.parameters?.data1?.applicationInforemovable).assertEqual(data.parameters?.data2?.applicationInforemovable);
              expect(data.parameters?.data1?.applicationInfoaccessTokenId).assertEqual(data.parameters?.data2?.applicationInfoaccessTokenId);
              expect(data.parameters?.data1?.applicationInfoappDistributionType).assertEqual(data.parameters?.data2?.applicationInfoappDistributionType);
              expect(data.parameters?.data1?.applicationInfoappProvisionType).assertEqual(data.parameters?.data2?.applicationInfoappProvisionType);
              expect(data.parameters?.data1?.applicationInfosystemApp).assertEqual(data.parameters?.data2?.applicationInfosystemApp);
              expect(data.parameters?.data1?.applicationInfodebug).assertEqual(data.parameters?.data2?.applicationInfodebug);
              expect(data.parameters?.data1?.applicationInfonativeLibraryPath).assertEqual(data.parameters?.data2?.applicationInfonativeLibraryPath);
              expect(data.parameters?.data1?.applicationInfoappIndex).assertEqual(data.parameters?.data2?.applicationInfoappIndex);
              expect(data.parameters?.data1?.applicationInfoinstallSource).assertEqual(data.parameters?.data2?.applicationInfoinstallSource);
              expect(data.parameters?.data1?.applicationInforeleaseType).assertEqual(data.parameters?.data2?.applicationInforeleaseType);
              expect(data.parameters?.data1?.applicationInfocloudFileSyncEnabled).assertEqual(data.parameters?.data2?.applicationInfocloudFileSyncEnabled);
              expect(data.parameters?.data1?.cacheDir).assertEqual(data.parameters?.data2?.cacheDir);
              expect(data.parameters?.data1?.tempDir).assertEqual(data.parameters?.data2?.tempDir);
              expect(data.parameters?.data1?.filesDir).assertEqual(data.parameters?.data2?.filesDir);
              expect(data.parameters?.data1?.databaseDir).assertEqual(data.parameters?.data2?.databaseDir);
              expect(data.parameters?.data1?.preferencesDir).assertEqual(data.parameters?.data2?.preferencesDir);
              expect(data.parameters?.data1?.bundleCodeDir).assertEqual(data.parameters?.data2?.bundleCodeDir);
              expect(data.parameters?.data1?.distributedFilesDir).assertEqual(data.parameters?.data2?.distributedFilesDir);
              expect(data.parameters?.data1?.resourceDir).assertEqual(data.parameters?.data2?.resourceDir);
              expect(data.parameters?.data1?.cloudFileDir).assertEqual(data.parameters?.data2?.cloudFileDir);
              done();
            }
          });
        });

        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContextInstance_0100 StartAbility start');
        let want: Want = {
          bundleName: 'com.example.contexttest',
          abilityName: 'EntryAbilityThree'
        };
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContextInstance_0100 getAbilityDelegator end');
        setTimeout(() => {
          AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want).then(() => {
            console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContextInstance_0100 StartAbility successfully.');
          }).catch((err: BusinessError) => {
            console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContextInstance_0100 StartAbility err: ' + err.code);
          })
        }, 1000);
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContextInstance_0100 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}