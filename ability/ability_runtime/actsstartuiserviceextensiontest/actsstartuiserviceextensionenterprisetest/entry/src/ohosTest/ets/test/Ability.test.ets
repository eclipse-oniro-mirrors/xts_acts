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


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_0100
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_0100
     * @tc.desc   Call the interface to return whether the current application is running
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_0200
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_0200
     * @tc.desc   Call the interface to return whether the current application is running
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_0300
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_0300
     * @tc.desc   Call the interface to 401 when bundlename is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_0400
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_0400
     * @tc.desc   Registering an Application Status Listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
              expect(abilityStateData?.callerBundleName).assertEqual("com.acts.startuiserviceextensiontestenterprise");
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
        let allowed = await driver.waitForComponent(ON.id('advanced_dialog_button_1'), 2000);
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_0500
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_0500
     * @tc.desc   Call interface to return false when checking non-existent application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_0500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_0500";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0500] start');
      try{
        appManager.isAppRunning("com.acts.startuiserviceextensionrely").then((data: boolean) => {
          hilog.info(0x0000, 'testTag', tag + `data: ${JSON.stringify(data)}`);
          try {
            expect(data).assertFalse();
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag', tag + `isAppRunning error, code: ${err.code}, msg:${err.message}`);
          try {
            expect().assertFail();
          } catch {
          }
          done();
        })
      }catch(e){
        hilog.error(0x0000, 'testTag', tag + `isAppRunning catch error, code: ${e.code}, msg:${e.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_0600
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_0600
     * @tc.desc   Call interface to return false when checking non-existent application with appCloneIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_0600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_0600";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0600] start');
      await appManager.isAppRunning("com.acts.startuiserviceextensionrely", 0).then((data: boolean) => {
        hilog.info(0x0000, 'testTag', tag + `data: ${JSON.stringify(data)}`);
        try {
          expect(data).assertFalse();
        } catch {
        }
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'testTag', tag + `isAppRunning error, code: ${err.code}, msg:${err.message}`);
        try {
          expect().assertFail();
        } catch {
        }
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_0700
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_0700
     * @tc.desc   Call interface to return false when checking with empty bundle name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_0700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_0700";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0700] start');
      appManager.isAppRunning("").then((data: boolean) => {
        hilog.info(0x0000, 'testTag', tag + `data: ${JSON.stringify(data)}`);
        try {
          expect().assertFail();
        } catch {
        }
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'testTag', tag + `isAppRunning error, code: ${err.code}, msg:${err.message}`);
        try {
          expect(err.code).assertEqual(16000073);
        } catch {
        }
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_0800
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_0800
     * @tc.desc   Call interface with empty bundle name and various appCloneIndex values test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_0800', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_0800";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0800] start');
      try{
        appManager.isAppRunning("", null).then((data: boolean) => {
          hilog.info(0x0000, 'testTag',
            `empty bundle name with appCloneIndex null, data: ${JSON.stringify(data)}`);
          try {
            expect().assertFail();
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag', tag + `isAppRunning error, code: ${err.code}, msg:${err.message}`);
          try {
            expect().assertFail();
          } catch {
          }
          done();
        })
      }catch(e){
        hilog.error(0x0000, 'testTag', tag + `isAppRunning catch error, code: ${e.code}, msg:${e.message}`);
        expect(e?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_0900
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_0900
     * @tc.desc   Call interface with null bundle name and various appCloneIndex values test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_0900', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_0900";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0900] start');
      try{
        appManager.isAppRunning(null, 0).then((data: boolean) => {
          hilog.info(0x0000, 'testTag',
            `null bundle name with appCloneIndex 0, data: ${JSON.stringify(data)}`);
          try {
            expect().assertFail();
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag', tag + `isAppRunning error, code: ${err.code}, msg:${err.message}`);
          try {
            expect().assertFail();
          } catch {
          }
          done();
        })
      }catch(e){
        hilog.error(0x0000, 'testTag', tag + `isAppRunning catch error, code: ${e.code}, msg:${e.message}`);
        expect(e?.code).assertEqual(401);
        done();
      }
    })

    

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_1000
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_1000
     * @tc.desc   Test isAppRunning with undefined bundleName parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_1000', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_1000";
      console.info('====> [SUB_Ability_Ability_AbilityRuntime_AppManager_isAppRunning_0802] start');
      try {
        const result = await appManager.isAppRunning(undefined, 1);
        hilog.info(0x0000, 'testTag', tag + `isAppRunning undefined appCloneIndex result: ${result}`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.error(0x0000, 'testTag',
          `isAppRunning undefined appCloneIndex error: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_1100
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_1100
     * @tc.desc   Test isAppRunning with valid bundleName and normal appCloneIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_1100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_1100";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_1100] start');
      try {
        const result = await appManager.isAppRunning("com.acts.startuiserviceextensiontestenterprise", 1);
        hilog.info(0x0000, 'testTag', tag + `isAppRunning valid bundleName normal appCloneIndex result: ${result}`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.error(0x0000, 'testTag',
          `isAppRunning valid bundleName normal appCloneIndex error: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(16000073);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_1200
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_1200
     * @tc.desc   Test isAppRunning with null bundleName parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_1200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_1200";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_1200] start');
      try {
        const result = await appManager.isAppRunning(null);
        hilog.info(0x0000, 'testTag', tag + `isAppRunning null result: ${result}`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.error(0x0000, 'testTag', tag + `isAppRunning null error: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_1300
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_1300
     * @tc.desc   Test isAppRunning with undefined bundleName parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_1300', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_1300";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_1300] start');
      try {
        const result = await appManager.isAppRunning(undefined);
        hilog.info(0x0000, 'testTag', tag + `isAppRunning undefined result: ${result}`);
        expect().assertFail();
      } catch (err) {
        hilog.error(0x0000, 'testTag', tag + `isAppRunning undefined error: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_1400
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_1400
     * @tc.desc   Test isAppRunning with valid bundleName and null appCloneIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_1400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_1400";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_1400] start');
      try {
        const result = await appManager.isAppRunning("com.acts.startuiserviceextensiontestenterprise", null);
        hilog.info(0x0000, 'testTag', tag + `isAppRunning valid bundleName null appCloneIndex result: ${result}`);
        expect().assertFail();
      } catch (err) {
        hilog.error(0x0000, 'testTag',
          `isAppRunning valid bundleName null appCloneIndex error: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_1500
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_1500
     * @tc.desc   Test isAppRunning with valid bundleName and undefined appCloneIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_1500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_1500";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_1500] start');
      try {
        const result = await appManager.isAppRunning("com.acts.startuiserviceextensiontestenterprise", undefined);
        hilog.info(0x0000, 'testTag', tag + `isAppRunning valid bundleName undefined appCloneIndex result: ${result}`);
        expect().assertFail();
      } catch (err) {
        hilog.error(0x0000, 'testTag',
          `isAppRunning valid bundleName undefined appCloneIndex error: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_1600
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_1600
     * @tc.desc   Test isAppRunning with valid bundleName and negative appCloneIndex parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_1600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_1600";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_1600] start');
      try {
        const result = await appManager.isAppRunning("com.acts.startuiserviceextensiontestenterprise", -1);
        hilog.info(0x0000, 'testTag', tag + `isAppRunning valid bundleName negative appCloneIndex result: ${result}`);
        expect().assertFail();
      } catch (err) {
        hilog.error(0x0000, 'testTag',
          `isAppRunning valid bundleName negative appCloneIndex error: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(16000073);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_1700
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_1700
     * @tc.desc   Test off applicationState with non-existent observerId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_1700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_1700";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_1700] start');
      let observerId = 999999;
      try {
        appManager.off('applicationState', observerId, (err) => {
          if (err) {
            hilog.info(0x0000, 'testTag', tag + `off error: ${JSON.stringify(err)}`);
            expect().assertFail();
          } else {
            hilog.info(0x0000, 'testTag', tag + `off succeed`);
          }
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', tag + `off error: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_1900
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_1900
     * @tc.desc   Test killProcessesByBundleName with non-existent bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_1900', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_1900";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_1900] start');
      try {
        await appManager.killProcessesByBundleName("com.non.exist.app", false, 0).then(()=>{
          hilog.info(0x0000, 'testTag', tag + `killProcessesByBundleName succeed`);
          expect().assertFail();
          done();
        }).catch((err:BusinessError)=>{
          hilog.info(0x0000, 'testTag', tag + `killProcessesByBundleName err ` + err?.code);
          expect(err.code).assertEqual(16000050);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', tag + `killProcessesByBundleName error: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_2000
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_2000
     * @tc.desc   Test killProcessesByBundleName with non-existent bundleName and appIndex.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_2000', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_2000";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_2000] start');
      try {
        await appManager.killProcessesByBundleName("com.non.exist.app", true, 1).then(()=>{
          hilog.info(0x0000, 'testTag', tag + `killProcessesByBundleName succeed`);
          expect().assertFail();
          done();
        }).catch((err:BusinessError)=>{
          hilog.info(0x0000, 'testTag', tag + `killProcessesByBundleName err ` + err?.code);
          expect(err.code).assertEqual(16000050);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', tag + `killProcessesByBundleName error: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_1800
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_1800
     * @tc.desc   Test off applicationState with non-existent observerId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_1800', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_1800";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_1800] start');
      let observerId = 999999;
      try {
        await appManager.off('applicationState', observerId).then(()=>{
          hilog.info(0x0000, 'testTag', tag + `off succeed`);
          expect().assertFail();
          done();
        }).catch((err:BusinessError)=>{
          hilog.info(0x0000, 'testTag', tag + `off err ` + err?.code);
          expect().assertFail();
          done();
        });

      } catch (err) {
        hilog.error(0x0000, 'testTag', tag + `off error: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityByCall_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityByCall_0100
     * @tc.desc   Test startAbilityByCall to start current app EntryAbility, expected return 16000050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityByCall_0100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_StartAbilityByCall_0100";
      console.info('====> [SUB_Ability_AbilityRuntime_StartAbilityByCall_0100] start');
      try {
        await testAbilityContext.startAbilityByCall({
          bundleName: "com.acts.startuiserviceextensionrely",
          abilityName: "EntryAbility"
        }).then(()=>{
          hilog.info(0x0000, 'testTag', tag + `startAbilityByCall succeed`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError)=>{
          hilog.info(0x0000, 'testTag', tag + `startAbilityByCall error ` + err?.code);
          expect(err.code).assertEqual(16000050);
          done();
        })
      } catch (err) {
        hilog.error(0x0000, 'testTag', tag + `startAbilityByCall error: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

  })
}

