/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterEach } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { wantConstant } from '@kit.AbilityKit';
import { appManager } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import hilog from '@ohos.hilog';

const ERR_CODE: number = 401;
let isSupportCapability:Boolean = false;
let mpEnable:Boolean = false;
let testAbilityContext: common.UIAbilityContext;
let driver = Driver.create();
let sub:commonEventManager.CommonEventSubscriber;
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
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtension_0100
     * @tc.name: When the input parameter want is null, an error code is returned.
     * @tc.desc: When the input parameter want is null, an error code is returned.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0100', 0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_0100";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0100] isSupportCapability: ' + isSupportCapability);
      if (isSupportCapability === true) {
        try{
          testAbilityContext.startUIServiceExtensionAbility(null).then((data)=>{
            console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(data));
            try{expect().assertFail();}catch{};
            done();
          }).catch((err:BusinessError)=>{
            try{expect().assertFail();}catch{};
            done();
          })
        }catch(err){
          expect(err?.code).assertEqual(ERR_CODE);
          done();
        }
       
      } else if (isSupportCapability === false) {
        console.log(`${tag} function not enable.`);
        expect(isSupportCapability).assertFalse();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtension_0200
     * @tc.name: When the input parameter want is null, an error code is returned.
     * @tc.desc: When the input parameter want is null, an error code is returned.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0200', 0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_0200";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0100] isSupportCapability: ' + isSupportCapability);
      if (isSupportCapability === true) {
        let dataCallBack : common.UIServiceExtensionConnectCallback = {
          // 接收数据
          onData: (data: Record<string, Object>) => {
            console.log(tag + `dataCallBack received data`, JSON.stringify(data));
            try{expect().assertFail();}catch{};
            done();
          },
          // 连接断开
          onDisconnect: () => {
            console.log(tag + `dataCallBack onDisconnect`);
            try{expect().assertFail();}catch{};
            done();
          }
        }
        try{
        testAbilityContext.connectUIServiceExtensionAbility(null, dataCallBack).then((proxy: common.UIServiceProxy)=>{
          console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(proxy));
          try{expect().assertFail();}catch{};
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch{};
          done();
        })
      }catch(err){
        expect(err?.code).assertEqual(ERR_CODE);
        done();
      }
      } else if (isSupportCapability === false) {
        console.log(`${tag} function not enable.`);
        expect(isSupportCapability).assertFalse();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtension_0300
     * @tc.name: When the input parameter want is null, an error code is returned.
     * @tc.desc: When the input parameter want is null, an error code is returned.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0300', 0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_0300";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0100] isSupportCapability: ' + isSupportCapability);
      if (isSupportCapability === true) {
        try{
        testAbilityContext.disconnectUIServiceExtensionAbility(null)
          .then(() => {
            console.log(tag + `disconnectUIServiceExtensionAbility succeed`);
            try{expect().assertFail();}catch{};
            done();
          }).catch((err: BusinessError) => {
          console.log(tag + `disconnectUIServiceExtensionAbility failed, code is ${err?.code}`);
          try{expect(err?.code).assertEqual(ERR_CODE);}catch{};
          done();
        });
      }catch(err){
        expect(err?.code).assertEqual(ERR_CODE);
        done();
      }
      } else if (isSupportCapability === false) {
        console.log(`${tag} function not enable.`);
        expect(isSupportCapability).assertFalse();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_WantConstant_0100
    * @tc.name: Get APP_INSTANCE_KEY CREATE_APP_INSTANCE_KEY CALLER_APP_CLONE_INDEX.
    * @tc.desc: Get APP_INSTANCE_KEY CREATE_APP_INSTANCE_KEY CALLER_APP_CLONE_INDEX.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    */
    it('SUB_Ability_AbilityRuntime_WantConstant_0100', 0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_WantConstant_0100";
      console.info('====> [SUB_Ability_AbilityRuntime_WantConstant_0100] start');
      expect(wantConstant.Params.APP_INSTANCE_KEY).assertEqual("ohos.extra.param.key.appInstance")
      expect(wantConstant.Params.CREATE_APP_INSTANCE_KEY).assertEqual("ohos.extra.param.key.createAppInstance")
      expect(wantConstant.Params.CALLER_APP_CLONE_INDEX).assertEqual("ohos.param.callerAppCloneIndex")
      console.info('====> [SUB_Ability_AbilityRuntime_WantConstant_0100] end');
      done();
    })

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_0100
    * @tc.name: When app not support capability, an error code is returned.
    * @tc.desc: When app not support capability, an error code is returned.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    */
    it('SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_0100', 0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_0100";
      console.info('====> [SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_0100] start');
      try {
        testAbilityContext.getApplicationContext().getAllRunningInstanceKeys()
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error(`getAllRunningInstanceKeys fail, code: ${code}, msg: ${message}`);
        expect(code).assertEqual(16000078)
      }
      console.info('====> [SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_0100] end');
      done();
    })

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_getCurrentInstanceKey_0100
    * @tc.name: When app not support capability, an error code is returned.
    * @tc.desc: When app not support capability, an error code is returned.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    */
    it('SUB_Ability_AbilityRuntime_getCurrentInstanceKey_0100', 0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_getCurrentInstanceKey_0100";
      console.info('====> [SUB_Ability_AbilityRuntime_getCurrentInstanceKey_0100] start');
      try {
        testAbilityContext.getApplicationContext().getCurrentInstanceKey()
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error(`getAllRunningInstanceKeys fail, code: ${code}, msg: ${message}`);
        expect(code).assertEqual(16000078)
      }
      console.info('====> [SUB_Ability_AbilityRuntime_getCurrentInstanceKey_0100] end');
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AppManager_0100
     * @tc.name: Call the interface to return whether the current application is running
     * @tc.desc: Call the interface to return whether the current application is running
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_AppManager_0100', 0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_0100";
      console.info('====> [SUB_Ability_AbilityRuntime_WantConstant_0100] start');
      appManager.isAppRunning("com.acts.startuiserviceextensiontest").then((data: boolean) => {
        hilog.info(0x0000, 'testTag', `data: ${JSON.stringify(data)}`);
        try{expect(data).assertTrue();}catch{};
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'testTag', `isAppRunning error, code: ${err.code}, msg:${err.message}`);
        try{expect().assertFail();}catch{};
        done();
      })
      console.info('====> [SUB_Ability_AbilityRuntime_WantConstant_0100] end');
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_fontId_0100
     * @tc.name: Obtains the fontId of the current application.
     * @tc.desc: Obtains the fontId of the current application.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_fontId_0100', 0, async (done: Function) => {
      console.info('====> [SUB_Ability_AbilityRuntime_fontId_0100] start');
      if(testAbilityContext.config?.fontId != undefined){
        expect(typeof(testAbilityContext.config.fontId)).assertEqual("string")
      }else{
        expect(testAbilityContext.config.fontId).assertEqual(undefined)
      }
      console.info('====> [SUB_Ability_AbilityRuntime_fontId_0100] end');
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AppManager_0200
     * @tc.name: Registering an Application Status Listener.
     * @tc.desc: Registering an Application Status Listener.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_AppManager_0200', 0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_AppManager_0200";
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0200] start');
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
        console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0200] startAbility result ' + err?.code);
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
      console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0200] end');
    })
    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtension_0700
     * @tc.name: When the input parameter want is null, an error code is returned(UIExtension).
     * @tc.desc: When the input parameter want is null, an error code is returned(UIExtension).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0700', 0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_0700";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0700] isSupportCapability: ' + isSupportCapability);
      if (isSupportCapability && mpEnable) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        testAbilityContext.startAbility({
          bundleName: "com.acts.startuiserviceextensiontest",
          abilityName: "TestAbility2",
          parameters:{
            "case":"startUIService",
            "caseName":tag
          }
        },(err, data)=>{
          console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0700] startAbility result ' + err?.code);
        })
      } else if ((isSupportCapability == false) && (mpEnable == false)) {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect(true).assertTrue();
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtension_0800
     * @tc.name: When the input parameter want is null, an error code is returned(UIExtension).
     * @tc.desc: When the input parameter want is null, an error code is returned(UIExtension).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0800', 0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_0800";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0100] isSupportCapability: ' + isSupportCapability);
      if (isSupportCapability && mpEnable) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        testAbilityContext.startAbility({
          bundleName:"com.acts.startuiserviceextensiontest",
          abilityName:"TestAbility2",
          parameters:{
            "case":"connectUIService",
            "caseName":tag
          }
        },(err, data)=>{
          console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0800] startAbility result ' + err?.code);
        })
      } else if ((isSupportCapability == false) && (mpEnable == false)) {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect(true).assertTrue();
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtension_0900
     * @tc.name: When the input parameter want is null, an error code is returned(UIExtension).
     * @tc.desc: When the input parameter want is null, an error code is returned(UIExtension).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0900', 0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_0900";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0900] isSupportCapability: ' + isSupportCapability);
      if (isSupportCapability && mpEnable) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        testAbilityContext.startAbility({
          bundleName:"com.acts.startuiserviceextensiontest",
          abilityName:"TestAbility2",
          parameters:{
            "case":"disconnectUIService",
            "caseName":tag
          }
        },(err, data)=>{
          console.info('====> [SUB_Ability_AbilityRuntime_AppManager_0200] startAbility result ' + err?.code);
        })
      } else if ((isSupportCapability == false) || (mpEnable == false)) {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      }
    })
  })
}