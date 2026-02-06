import { describe, it, expect, beforeAll, afterEach, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { appManager } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import common from '@ohos.app.ability.common';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import hilog from '@ohos.hilog';

let isSupportCapability:Boolean = false;
let mpEnable:Boolean = false;
let testAbilityContext: common.UIAbilityContext;
let driver = Driver.create();
function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll((done:Function) => {
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      isSupportCapability = systemParameterEnhance.getSync('const.abilityms.enable_uiservice') == 'true';
      mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model') == 'true';
      console.info('====> [test ] isSupportCapability: ' + isSupportCapability +  " mpEnable:" + mpEnable);
      if(isSupportCapability != true && isSupportCapability != false){
        expect().assertFail();
        done();
      }
      if(mpEnable != true && mpEnable != false){
        expect().assertFail();
        done();
      }
    })
    afterEach(async (done:Function) => {
      await sleep(2000);
      done();
    })


    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AppManager_0100
     * @tc.name: SUB_Ability_AbilityRuntime_AppManager_0100
     * @tc.desc: Call the interface to return whether the current application is running
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_AppManager_0100', Level.LEVEL0, async (done: Function) => {
  let tag = "SUB_Ability_AbilityRuntime_AppManager_0100";
  console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0100] start');
  appManager.isAppRunning("com.acts.startuiserviceextensiontestenterprise").then((data: boolean) => {
    hilog.info(0x0000, 'testTag', `data: ${JSON.stringify(data)}`);
    try{expect(data).assertTrue();}catch{};
    done();
  }).catch((err: BusinessError) => {
    hilog.error(0x0000, 'testTag', `isAppRunning error, code: ${err.code}, msg:${err.message}`);
    try{expect().assertFail();}catch{};
    done();
  })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AppManager_0200
     * @tc.name: SUB_Ability_AbilityRuntime_AppManager_0200
     * @tc.desc: Call the interface to return whether the current application is running
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_AppManager_0200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_0200";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0200] start');
      appManager.isAppRunning("com.acts.startuiserviceextensiontestenterprise", 1001).then((data: boolean) => {
        hilog.info(0x0000, 'testTag', `data: ${JSON.stringify(data)}`);
        try{expect().assertFail();}catch{};
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'testTag', `isAppRunning error, code: ${err.code}, msg:${err.message}`);
        try{expect(err?.code).assertEqual(16000073);}catch{};
        done();
      })
    })

        /*
     * @tc.number: SUB_Ability_AbilityRuntime_AppManager_0300
     * @tc.name: SUB_Ability_AbilityRuntime_AppManager_0300
     * @tc.desc: Call the interface to 401 when bundlename is undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_AppManager_0300', Level.LEVEL0, async (done: Function) => {
          let tag = "SUB_Ability_AbilityRuntime_AppManager_0300";
          console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0300] start');
          try{
            await appManager.isAppRunning(undefined, 0).then((data: boolean) => {
              hilog.info(0x0000, 'testTag', `data: ${JSON.stringify(data)}`);
              try{expect().assertFail();}catch{};
              done();
            }).catch((err: BusinessError) => {
              hilog.error(0x0000, 'testTag', tag + `isAppRunning error, code: ${err.code}, msg:${err.message}`);
              try{expect().assertFail();}catch{};
              done();
            })
          }catch(e){
            hilog.error(0x0000, 'testTag', tag + `isAppRunning catch error, code: ${e.code}, msg:${e.message}`);
            expect(e?.code).assertEqual(401);
            done();
          }
          
    })

            /*
     * @tc.number: SUB_Ability_AbilityRuntime_AppManager_0400
     * @tc.name: SUB_Ability_AbilityRuntime_AppManager_0400
     * @tc.desc: Registering an Application Status Listener.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_AppManager_0400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_0400";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0400] start');
      let pid = 0;
      let applicationStateObserver: appManager.ApplicationStateObserver = {
        onForegroundApplicationChanged(appStateData) {
          console.log(tag + `onForegroundApplicationChanged appStateData: ${JSON.stringify(appStateData)}`);
          if(appStateData?.bundleName == "com.acts.startuiserviceextensionrely"){
            try{
              expect(appStateData?.bundleName).assertEqual("com.acts.startuiserviceextensionrely");
              expect(appStateData?.uid).assertLarger(0);
              expect(appStateData?.state).assertLarger(0);
              expect(appStateData?.isSplitScreenMode).assertFalse();
              expect(appStateData?.isFloatingWindowMode).assertFalse();
            }catch(e){}
          }
        },
        onAbilityStateChanged(abilityStateData) {
          console.log(tag + `onAbilityStateChanged onAbilityStateChanged: ${JSON.stringify(abilityStateData)}`);
          if(abilityStateData?.bundleName == "com.acts.startuiserviceextensionrely"){
            try{
              expect(abilityStateData?.bundleName).assertEqual("com.acts.startuiserviceextensionrely");
              expect(abilityStateData?.uid).assertLarger(0);
              expect(typeof(abilityStateData?.state)).assertEqual("number");
              expect(abilityStateData?.abilityName).assertEqual("EntryAbility");
              expect(abilityStateData?.pid).assertEqual(pid);
              expect(abilityStateData?.moduleName).assertEqual("entry");
              expect(abilityStateData?.abilityType).assertEqual(1);
              expect(abilityStateData?.isAtomicService).assertFalse();
              expect(abilityStateData?.appCloneIndex).assertEqual(undefined);
            }catch(e){}
          }
        },
        onProcessCreated(processData) {
          console.log(`onProcessCreated onProcessCreated: ${JSON.stringify(processData)}`);
          if(processData?.bundleName == "com.acts.startuiserviceextensionrely"){
            pid = processData.pid
            try{
            expect(processData?.pid).assertLarger(0);
            expect(processData?.bundleName).assertEqual("com.acts.startuiserviceextensionrely");
            expect(processData?.uid).assertLarger(0);
            expect(processData?.isContinuousTask).assertFalse();
            expect(processData?.isKeepAlive).assertFalse();
			expect(typeof(processData?.state)).assertEqual("number");
          }catch(e){}
          }
        },
        onProcessDied(processData) {
          console.log(tag + `onProcessDied onProcessDied: ${JSON.stringify(processData)}`);
          if(processData?.bundleName == "com.acts.startuiserviceextensionrely"){
            done();
          }
        },
        onProcessStateChanged(processData) {
          console.log(tag + `onProcessStateChanged onProcessStateChanged: ${JSON.stringify(processData)}`);
        },
        onAppStarted(appStateData) {
          console.log(tag + `onAppStarted appStateData: ${JSON.stringify(appStateData)}`);
        },
        onAppStopped(appStateData) {
          console.log(tag + `onAppStopped appStateData: ${JSON.stringify(appStateData)}`);
        }
      };
      appManager.on('applicationState', applicationStateObserver);
      testAbilityContext.startAbility({
        bundleName: "com.acts.startuiserviceextensionrely",
        abilityName: "EntryAbility"
      },(err, data)=>{
        console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0400] startAbility result ' + err?.code);
      })
      await sleep(1000);
      try {
        let allowed = await driver.waitForComponent(ON.text("打开"), 2000);
        if (allowed) {
          console.log("find button");
          let point = await allowed.getBoundsCenter();
          console.log('point.x : ' + point.x + 'point.y : ' + point.y);
          await driver.click(point.x, point.y);
        }
      } catch (err) {
        console.error('waitForComponent error' + JSON.stringify(err));
        done();
      }
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0400] end');
    })

  })

}

