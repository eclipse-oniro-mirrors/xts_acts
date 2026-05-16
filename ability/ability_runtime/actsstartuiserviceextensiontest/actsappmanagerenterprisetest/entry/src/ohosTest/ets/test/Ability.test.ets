import { describe, it, expect, beforeAll, afterEach, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { appManager } from '@kit.AbilityKit';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';

let testAbilityContext: common.UIAbilityContext;
function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async (done:Function) => {
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      await testAbilityContext.startAbility({
        bundleName:"com.acts.startuiserviceextensionrely",
        abilityName:"EntryAbility"
      })
      await sleep(2000);
      done();
    })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_2500
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_2500
     * @tc.desc   Test killProcessesByBundleName with exist bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_2500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_2500";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_2500] start');
      try {
        await appManager.isAppRunning("com.acts.startuiserviceextensionrely").then((data: boolean) => {
          hilog.info(0x0000, 'testTag', `data: ${JSON.stringify(data)}`);
          try{expect(data).assertTrue();}catch{};
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag', `isAppRunning error, code: ${err.code}, msg:${err.message}`);
          try{expect().assertFail();}catch{};
        })
        await appManager.killProcessesByBundleName("com.acts.startuiserviceextensionrely", false, 0).then(()=>{
          hilog.info(0x0000, 'testTag', tag + `killProcessesByBundleName succeed`);
        }).catch((err:BusinessError)=>{
          hilog.info(0x0000, 'testTag', tag + `killProcessesByBundleName err ` + err?.code);
        });
        await sleep(1000);
        await appManager.isAppRunning("com.acts.startuiserviceextensionrely").then((data: boolean) => {
          hilog.info(0x0000, 'testTag', `data: ${JSON.stringify(data)}`);
          try{expect(data).assertFalse();}catch{};
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag', `isAppRunning error, code: ${err.code}, msg:${err.message}`);
          try{expect().assertFail();}catch{};
        })
        done();
      } catch (err) {
        hilog.error(0x0000, 'testTag', tag + `killProcessesByBundleName error: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

  })
}

