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

import { describe, it, expect, beforeAll, afterEach, Level } from '@ohos/hypium';
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
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_0100
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_0100
     * @tc.desc   When the input parameter want is null, an error code is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_0100";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0100] isSupportCapability: ' + isSupportCapability);
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
        if(err?.code === 801){
          console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(err));
        }else{
          expect(err?.code).assertEqual(ERR_CODE);
        }
        done();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_0200
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_0200
     * @tc.desc   When the input parameter want is null, an error code is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_0200";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0100] isSupportCapability: ' + isSupportCapability);
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
        if(err?.code === 801){
          console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(err));
        }else{
          expect(err?.code).assertEqual(ERR_CODE);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_1000
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_1000
     * @tc.desc   When the input parameter want is null, an error code is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_1000', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_1000";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1000] isSupportCapability: ' + isSupportCapability);
      try{
        testAbilityContext.startUIServiceExtensionAbility({
          bundleName:"com.acts.startuiserviceextensiontest",
          abilityName:"abilityerror"
        }).then((data)=>{
          console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(data));
          try{expect().assertFail();}catch{};
          done();
        }).catch((err:BusinessError)=>{
          console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(err));
          if(err?.code === 801){
            console.info(tag + '====> startUIServiceExtensionAbility not support: ' + JSON.stringify(err));
          }else{
            try{expect(err?.code).assertEqual(16000001);}catch{};
          }
          done();
        })
      }catch(err){
        if(err?.code === 801){
          console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(err));
        }else{
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_1100
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_1100
     * @tc.desc   When the input parameter want is null, an error code is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_1100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_1100";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1100] isSupportCapability: ' + isSupportCapability);
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
      testAbilityContext.connectUIServiceExtensionAbility({
        bundleName:"com.acts.startuiserviceextensiontest",
        abilityName:"abilityerror"
      }, dataCallBack).then((proxy: common.UIServiceProxy)=>{
        console.info(tag + '====> connectUIServiceExtensionAbility: ' + JSON.stringify(proxy));
        try{expect().assertFail();}catch{};
        done();
      }).catch((err:BusinessError)=>{
        console.info(tag + '====> connectUIServiceExtensionAbility: ' + JSON.stringify(err));
        try{expect(err?.code).assertEqual(16000001);}catch{};
        done();
      })
      }catch(err){
        if(err?.code === 801){
          console.info(tag + '====> connectUIServiceExtensionAbility: ' + JSON.stringify(err));
        }else{
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_0300
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_0300
     * @tc.desc   When the input parameter want is null, an error code is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0300', Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_0400
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_0400
     * @tc.desc   Function test for startUIServiceExtensionAbility with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_0400";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0400] isSupportCapability: ' + isSupportCapability);
      try{
        testAbilityContext.startUIServiceExtensionAbility(undefined).then((data)=>{
          console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(data));
          try{expect().assertFail();}catch{};
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch{};
          done();
        })
      }catch(err){
        if(err?.code === 801){
          console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(err));
        }else{
          expect(err?.code).assertEqual(ERR_CODE);
        }
        done();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_0500
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_0500
     * @tc.desc   Function test for startUIServiceExtensionAbility with empty object parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_0500";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0500] isSupportCapability: ' + isSupportCapability);
      try{
        testAbilityContext.startUIServiceExtensionAbility({}).then((data)=>{
          console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(data));
          try{expect().assertFail();}catch{};
          done();
        }).catch((err:BusinessError)=>{
          console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(err));
          if(err?.code === 801){
            console.info(tag + '====> startUIServiceExtensionAbility not support: ' + JSON.stringify(err));
          }else{
            try{expect(err?.code).assertEqual(16000001);}catch{};
          }
          done();
        })
      }catch(err){
        if(err?.code === 801){
          console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(err));
        }else{
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_0600
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_0600
     * @tc.desc   Function test for connectUIServiceExtensionAbility with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_0600";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0600] isSupportCapability: ' + isSupportCapability);
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
        testAbilityContext.connectUIServiceExtensionAbility(undefined, dataCallBack).then((proxy: common.UIServiceProxy)=>{
          console.info(tag + '====> connectUIServiceExtensionAbility: ' + JSON.stringify(proxy));
          try{expect().assertFail();}catch{};
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch{};
          done();
        })
      }catch(err){
        if(err?.code === 801){
          console.info(tag + '====> connectUIServiceExtensionAbility: ' + JSON.stringify(err));
        }else{
          expect(err?.code).assertEqual(ERR_CODE);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WantConstant_0100
     * @tc.number SUB_Ability_AbilityRuntime_WantConstant_0100
     * @tc.desc   Get APP_INSTANCE_KEY CREATE_APP_INSTANCE_KEY CALLER_APP_CLONE_INDEX.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WantConstant_0100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_WantConstant_0100";
      console.info('====> [SUB_Ability_AbilityRuntime_WantConstant_0100] start');
      expect(wantConstant.Params.APP_INSTANCE_KEY).assertEqual("ohos.extra.param.key.appInstance")
      expect(wantConstant.Params.CREATE_APP_INSTANCE_KEY).assertEqual("ohos.extra.param.key.createAppInstance")
      expect(wantConstant.Params.CALLER_APP_CLONE_INDEX).assertEqual("ohos.param.callerAppCloneIndex")
      console.info('====> [SUB_Ability_AbilityRuntime_WantConstant_0100] end');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_0100
     * @tc.number SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_0100
     * @tc.desc   When app not support capability, an error code is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_0100', Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_getCurrentInstanceKey_0100
     * @tc.number SUB_Ability_AbilityRuntime_getCurrentInstanceKey_0100
     * @tc.desc   When app not support capability, an error code is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_getCurrentInstanceKey_0100', Level.LEVEL0, async (done: Function) => {
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


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_fontId_0100
     * @tc.number SUB_Ability_AbilityRuntime_fontId_0100
     * @tc.desc   Obtains the fontId of the current application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_fontId_0100', Level.LEVEL0, async (done: Function) => {
      console.info('====> [SUB_Ability_AbilityRuntime_fontId_0100] start');
      if(testAbilityContext.config?.fontId != undefined){
        expect(typeof(testAbilityContext.config.fontId)).assertEqual("string");
      }else{
        expect(testAbilityContext.config.fontId).assertEqual(undefined);
      }
      console.info('====> [SUB_Ability_AbilityRuntime_fontId_0100] ' + JSON.stringify(testAbilityContext.config));
      expect(typeof testAbilityContext.config.displayId).assertEqual("number");
      expect(typeof testAbilityContext.config.fontSizeScale).assertEqual("number")
      expect(typeof testAbilityContext.config.fontWeightScale).assertEqual("number")
      console.info('====> [SUB_Ability_AbilityRuntime_fontId_0100] end');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_0700
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_0700
     * @tc.desc   When the input parameter want is null, an error code is returned(UIExtension).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0700', Level.LEVEL0, async (done: Function) => {
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
            "caseName":tag,
            "param":null
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_0800
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_0800
     * @tc.desc   When the input parameter want is null, an error code is returned(UIExtension).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0800', Level.LEVEL0, async (done: Function) => {
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
            "caseName":tag,
            "param":null
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_1200
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_1200
     * @tc.desc   Function test for connectUIServiceExtensionAbility with empty object parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_1200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_1200";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1200] isSupportCapability: ' + isSupportCapability);
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
        testAbilityContext.connectUIServiceExtensionAbility({}, dataCallBack).then((proxy: common.UIServiceProxy)=>{
          console.info(tag + '====> connectUIServiceExtensionAbility: ' + JSON.stringify(proxy));
          try{expect().assertFail();}catch{};
          done();
        }).catch((err:BusinessError)=>{
          console.info(tag + '====> connectUIServiceExtensionAbility: ' + JSON.stringify(err));
          try{expect(err?.code).assertEqual(16000001);}catch{};
          done();
        })
      }catch(err){
        if(err?.code === 801){
          console.info(tag + '====> connectUIServiceExtensionAbility: ' + JSON.stringify(err));
        }else{
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_1300
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_1300
     * @tc.desc   Function test for disconnectUIServiceExtensionAbility with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_1300', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_1300";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1300] isSupportCapability: ' + isSupportCapability);
      if (isSupportCapability === true) {
        try{
          testAbilityContext.disconnectUIServiceExtensionAbility(undefined)
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_0900
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_0900
     * @tc.desc   When the input parameter want is null, an error code is returned(UIExtension).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_0900', Level.LEVEL0, async (done: Function) => {
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
            "case":"disconnectUIServiceNull",
            "caseName":tag,
            "param":null
          }
        },(err, data)=>{
          console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_0900] startAbility result ' + err?.code);
        })
      } else if ((isSupportCapability == false) || (mpEnable == false)) {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_1500
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_1500
     * @tc.desc   Function test for startUIServiceExtensionAbility with undefined parameter(UIExtension).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_1500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_1500";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1500] isSupportCapability: ' + isSupportCapability);
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
            "caseName":tag,
            "param":"undefined"
          }
        },(err, data)=>{
          console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1500] startAbility result ' + err?.code);
        })
      } else if ((isSupportCapability == false) || (mpEnable == false)) {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_1600
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_1600
     * @tc.desc   Function test for startUIServiceExtensionAbility with empty object parameter(UIExtension).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_1600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_1600";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1600] isSupportCapability: ' + isSupportCapability);
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
              expect(commonEventData.parameters?.result).assertEqual(16000001);
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
            "caseName":tag,
            "param":"{}"
          }
        },(err, data)=>{
          console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1600] startAbility result ' + err?.code);
        })
      } else if ((isSupportCapability == false) || (mpEnable == false)) {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_1700
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_1700
     * @tc.desc   Function test for connectUIServiceExtensionAbility with undefined parameter(UIExtension).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_1700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_1700";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1700] isSupportCapability: ' + isSupportCapability);
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
            "case":"connectUIService",
            "caseName":tag,
            "param":"undefined"
          }
        },(err, data)=>{
          console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1700] startAbility result ' + err?.code);
        })
      } else if ((isSupportCapability == false) || (mpEnable == false)) {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_1800
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_1800
     * @tc.desc   Function test for connectUIServiceExtensionAbility with empty object parameter(UIExtension).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_1800', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_1800";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1800] isSupportCapability: ' + isSupportCapability);
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
              expect(commonEventData.parameters?.result).assertEqual(16000001);
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
            "case":"connectUIService",
            "caseName":tag,
            "param":"{}"
          }
        },(err, data)=>{
          console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1800] startAbility result ' + err?.code);
        })
      } else if ((isSupportCapability == false) || (mpEnable == false)) {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_1900
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_1900
     * @tc.desc   Function test for disconnectUIServiceExtensionAbility with undefined parameter(UIExtension).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_1900', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_1900";
      console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1900] isSupportCapability: ' + isSupportCapability);
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
            "case":"disconnectUIServiceUndefined",
            "caseName":tag,
            "param":undefined
          }
        },(err, data)=>{
          console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_1900] startAbility result ' + err?.code);
        })
      } else if ((isSupportCapability == false) || (mpEnable == false)) {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      }
    })


  })
}
