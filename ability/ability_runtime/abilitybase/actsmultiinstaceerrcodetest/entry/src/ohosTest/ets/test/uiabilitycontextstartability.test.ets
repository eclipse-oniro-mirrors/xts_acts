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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
// 加载js测试框架
import { Caller, common, sendableContextManager, WantAgent, wantAgent, wantConstant, StartOptions, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { systemParameterEnhance } from '@kit.BasicServicesKit';
let mpEnable: string;
let context: common.UIAbilityContext
export default function openLinkTest() {
  describe('ActsStartAbilityErrorTest', () => {

    let TAG = 'ActsStartAbilityErrorTest ===>';

    beforeAll(()=>{
      context = AppStorage.get('context') as common.UIAbilityContext;
      try {
        mpEnable = systemParameterEnhance.getSync('const.abilityms.support_multi_instance');
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = 'fail';
      }
    })
    afterEach((done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'Ability afterEach');
      setTimeout(() => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability setTimeout');
        done();
      }, 1000);
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_0200
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_0200
     * @tc.desc   Expect: 16000076
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_0200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_0200 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName: 'com.acts.ability.multiinstaceerrcodetest',
            abilityName: 'EntryAbility',
            parameters:{
              [wantConstant.Params.APP_INSTANCE_KEY] : "app_instance_100"
            }
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0200 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000076);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0200 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} startChildProcess error, current device not support feature.`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_0400
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_0400
     * @tc.desc   Expect: 16000079
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_0400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_0400 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName: 'com.acts.ability.multiinstaceerrcodetest',
            abilityName: 'EntryAbility',
            parameters:{
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY] : true,
              [wantConstant.Params.APP_INSTANCE_KEY] : "app_instance_0"
            }
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0400 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000079);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0400 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} startChildProcess error, current device not support feature.`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_0700
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_0700
     * @tc.desc   Expect: 16000076
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_0700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_0700 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName: 'com.acts.ability.multiinstaceerrcodetest',
            abilityName: 'EntryAbility',
            parameters:{
              [wantConstant.Params.APP_INSTANCE_KEY] : "app_default_100"
            }
          }, {
            windowLeft: 20,
            windowTop: 20
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0700 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000076);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0700 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} startChildProcess error, current device not support feature.`);
        done();
      }

    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_0900
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_0900
     * @tc.desc   Expect: 16000078
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_0900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_0900 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName: 'com.acts.ability.multiinstaceerrcodetest',
            abilityName: 'EntryAbility',
            parameters:{
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY] : true,
              [wantConstant.Params.APP_INSTANCE_KEY] : "app_instance_0"
            }
          }, {
            windowLeft: 20,
            windowTop: 20
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0900 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000079);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0900 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} startChildProcess error, current device not support feature.`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_1800
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_1800
     * @tc.desc   Expect: 16000078
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_1800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_1800 start');
      let tag = 'SUB_Ability_AbilityBase_StartAbilityError_1800';
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName:"com.acts.ability.multiinstaceerrcodetest",
            abilityName:"EntryAbility",
            parameters:{
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY] : true,
            }
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1800 ${err?.code}`);
          })
          await sleep(1000);
          context.startAbility({
            bundleName:"com.acts.ability.multiinstaceerrcodetest",
            abilityName:"EntryAbility",
            parameters:{
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY] : true,
            }
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1800 ${err?.code}`);
            try{
              expect(err?.code).assertEqual(16000077);
              commonEventManager.publish("terminateSelf_multiinstance_ability", (error, result)=>{
                hilog.info(0x0000, `${TAG}`, '%{public}s', tag + ` ${error?.code}`);
                done();
              })
            }catch(e){
              commonEventManager.publish("terminateSelf_multiinstance_ability", (error, result)=>{
                hilog.info(0x0000, `${TAG}`, '%{public}s', tag + ` ${error?.code}`);
                done();
              })            }
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1800 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} startChildProcess error, current device not support feature.`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_1900
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_1900
     * @tc.desc   Expect: 16000077
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_1900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_1900 start');
      let tag = 'SUB_Ability_AbilityBase_StartAbilityError_1900';
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName:"com.acts.ability.multiinstaceerrcodetest",
            abilityName:"EntryAbility",
            parameters:{
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY] : true,
            }
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', tag + ` ${err?.code}`);
          })
          await sleep(1000);
          context.startAbility({
            bundleName:"com.acts.ability.multiinstaceerrcodetest",
            abilityName:"EntryAbility",
            parameters:{
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY] : true,
            }
          }, {
            windowLeft: 20,
            windowTop: 20
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', tag + ` ${err?.code}`);
            try{
              expect(err?.code).assertEqual(16000077);
              commonEventManager.publish("terminateSelf_multiinstance_ability", (error, result)=>{
                hilog.info(0x0000, `${TAG}`, '%{public}s', tag + ` ${error?.code}`);
                done();
              })
            }catch(e){
              commonEventManager.publish("terminateSelf_multiinstance_ability", (error, result)=>{
                hilog.info(0x0000, `${TAG}`, '%{public}s', tag + ` ${error?.code}`);
                done();
              })            }
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', tag + ` ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} startChildProcess error, current device not support feature.`);
        done();
      }
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIAbilityContextError_0500
     * @tc.number SUB_Ability_AbilityRuntime_UIAbilityContextError_0500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIAbilityContextError_0500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityRuntime_UIAbilityContextError_0500 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.multiinstaceerrcodetest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY]:true
        }
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityRuntime_UIAbilityContextError_0500 ${err?.code}`);
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityRuntime_UIAbilityContextError_0500 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
        await sleep(500)
        try {
          context.startAbilityForResult(want,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityRuntime_UIAbilityContextError_0500 ${err?.code}`);
            try{
              expect(err?.code).assertEqual(16000077);
              commonEventManager.publish("terminateSelf_multiinstance_ability", (error, result)=>{
                done()
              })
            }catch(e){
              commonEventManager.publish("terminateSelf_multiinstance_ability", (error, result)=>{
                done()
              })
            }
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityRuntime_UIAbilityContextError_0500 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityRuntime_UIAbilityContextError_0500 end');
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIAbilityContextError_1500
     * @tc.number SUB_Ability_AbilityRuntime_UIAbilityContextError_1500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIAbilityContextError_1500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityRuntime_UIAbilityContextError_1500 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.multiinstaceerrcodetest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY]:true
        }
      };
      let options: StartOptions = {
        displayId: 0
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,options,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityRuntime_UIAbilityContextError_1500 ${err?.code}`);
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityRuntime_UIAbilityContextError_1500 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
        await sleep(500)
        try {
          context.startAbilityForResult(want,options,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityRuntime_UIAbilityContextError_1500 ${err?.code}`);
            try{
              expect(err?.code).assertEqual(16000077);
              commonEventManager.publish("terminateSelf_multiinstance_ability", (error, result)=>{
                done()
              })
            }catch(e){
              commonEventManager.publish("terminateSelf_multiinstance_ability", (error, result)=>{
                done()
              })
            }
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityRuntime_UIAbilityContextError_1500 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityRuntime_UIAbilityContextError_1500 end');
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIAbilityContextError_2500
     * @tc.number SUB_Ability_AbilityRuntime_UIAbilityContextError_2500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIAbilityContextError_2500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityRuntime_UIAbilityContextError_2500 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.multiinstaceerrcodetest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY]:true
        }
      };
      let options: StartOptions = {
        displayId: 0
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,options)
            .then((result: common.AbilityResult) => {
              hilog.info(0x0000, `${TAG}`, '%{public}s', `startAbilityForResult succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityRuntime_UIAbilityContextError_2500 ${err?.code}`);
              try{expect().assertFail();}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityRuntime_UIAbilityContextError_2500 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
        await sleep(500)
        await context.getApplicationContext().getAllRunningInstanceKeys().then((data)=>{
          expect(data.length).assertEqual(2)
        }).catch(()=>{
          try{expect().assertFail();}catch(e){}
        })
        try {
          context.startAbilityForResult(want,options)
            .then((result: common.AbilityResult) => {
              hilog.info(0x0000, `${TAG}`, '%{public}s', `startAbilityForResult succeed`);
              try{expect().assertFail();}catch(e){}
              done();
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityRuntime_UIAbilityContextError_2500 ${err?.code}`);
              try{
                expect(err?.code).assertEqual(16000077);
                commonEventManager.publish("terminateSelf_multiinstance_ability", (error, result)=>{
                  done()
                })
              }catch(e){
                commonEventManager.publish("terminateSelf_multiinstance_ability", (error, result)=>{
                  done()
                })
              }
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityRuntime_UIAbilityContextError_2500 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityRuntime_UIAbilityContextError_2500 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_0400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_0400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_0400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0400 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.multiinstaceerrcodetest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_INSTANCE_KEY]:"app_default_100"
        }
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0400 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000076);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0400 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0400 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_1400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_1400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_1400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1400 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.multiinstaceerrcodetest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_INSTANCE_KEY]:"app_default_100"
        }
      };
      let options: StartOptions = {
        displayId: 0
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,options,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1400 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000076);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1400 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1400 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_2400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_2400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_2400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2400 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.multiinstaceerrcodetest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_INSTANCE_KEY]:"app_default_100"
        }
      };
      let options: StartOptions = {
        displayId: 0
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,options)
            .then((result: common.AbilityResult) => {
              hilog.info(0x0000, `${TAG}`, '%{public}s', `startAbilityForResult succeed`);
              try{expect().assertFail();}catch(e){}
              done();
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2400 ${err?.code}`);
              try{expect(err?.code).assertEqual(16000076);}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2400 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2400 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_3600
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_3600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_3600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3600 start');
      let caller: Caller;
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.multiinstaceerrcodetest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_INSTANCE_KEY]:"app_default_100"
        }
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityByCall(want)
            .then((obj: Caller) => {
              caller = obj;
              hilog.info(0x0000, `${TAG}`, '%{public}s', `startAbilityByCall succeed`);
              try{expect().assertFail();}catch(e){}
              done();
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3500 ${err?.code}`);
              try{expect(err?.code).assertEqual(16000076);}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2400 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3600 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_0700
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_0700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_0700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0700 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.multiinstaceerrcodetest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY]:true,
          [wantConstant.Params.APP_INSTANCE_KEY]:"app_instance_0"
        }
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0700 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000079);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0700 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0700 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_1700
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_1700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_1700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1700 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.multiinstaceerrcodetest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY]:true,
          [wantConstant.Params.APP_INSTANCE_KEY]:"app_default_0"
        }
      };
      let options: StartOptions = {
        displayId: 0
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,options,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1700 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000079);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1700 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1700 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_2700
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_2700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_2700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2700 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.multiinstaceerrcodetest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY]:true,
          [wantConstant.Params.APP_INSTANCE_KEY]:"app_default_0"
        }
      };
      let options: StartOptions = {
        displayId: 0
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,options)
            .then((result: common.AbilityResult) => {
              hilog.info(0x0000, `${TAG}`, '%{public}s', `startAbilityForResult succeed`);
              try{expect().assertFail();}catch(e){}
              done();
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2600 ${err?.code}`);
              try{expect(err?.code).assertEqual(16000079);}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2700 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2700 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_3900
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_3900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_3900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3900 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.multiinstaceerrcodetest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY]:true,
          [wantConstant.Params.APP_INSTANCE_KEY]:"app_default_0"
        }
      };
      let caller: Caller;
      if(mpEnable == 'true'){
        try {
          context.startAbilityByCall(want)
            .then((obj: Caller) => {
              caller = obj;
              hilog.info(0x0000, `${TAG}`, '%{public}s', `startAbilityByCall succeed`);
              try{expect().assertFail();}catch(e){}
              done();
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3900 ${err?.code}`);
              try{expect(err?.code).assertEqual(16000079);}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3900 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3900 end');
    })
  })
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}
