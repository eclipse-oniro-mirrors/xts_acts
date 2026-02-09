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
import { Caller, common, OpenLinkOptions, StartOptions, Want, wantConstant } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { systemParameterEnhance } from '@kit.BasicServicesKit';
import { BusinessError } from '@kit.BasicServicesKit';

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}

let mpEnable: string;
let context:common.UIAbilityContext;
let device: string;

export default function UIAbilityContextTest() {
  describe('AbilityUIAbilityContextTest', () => {

    let TAG = 'AbilityUIAbilityContextTest ===>';
    beforeAll(()=>{
      context = AppStorage.get('context') as common.UIAbilityContext;
      try {
        mpEnable = systemParameterEnhance.getSync('const.abilityms.support_multi_instance');
      } catch (err) {
        console.error(`ACTS_AbilityUIAbilityContextTest Get system parameter error: ${JSON.stringify(err)}`);
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
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_0100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_0100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_0100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0100 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely',
        abilityName: 'EntryAbility1' //被拉起的ability设置exported为false
      };
      try {
        context.startAbilityForResult(want,(err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0100 ${err?.code}`);
          try{expect(err?.code).assertEqual(16000004);}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0100 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0100 end');
    })


    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_0200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_0200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_0200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0200 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.actsbaseerrrocodemethodtest',
        action: 'zzabc'
      };
      try {
        context.startAbilityForResult(want,(err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0200 ${err?.code}`);
          try{expect(err?.code).assertEqual(16000019);}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0200 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0200 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_0300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_0300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_0300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0300 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.actsbaseerrrocodemethodtest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_CLONE_INDEX_KEY]:1001
        }
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0300 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000073);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0300 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0300 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_0600
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_0600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_0600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0600 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorappclonerely',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY]:true
        }
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0600 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000078);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0600 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0600 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_0800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_0800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_0800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0800 start');
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
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0800 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000080);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0800 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0800 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_0900
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_0900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_0900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0900 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.actsbaseerrrocodemethodtest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_INSTANCE_KEY]:"app_instance_0"
        }
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0900 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000072);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_0900 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_0900 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_1000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_1000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_1000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1000 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely',
        abilityName: 'EntryAbility',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      };
      try {
        context.startAbilityForResult(want,(err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1000 ${err?.code}`);
          try{expect(err?.code).assertEqual(16000050);}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1000 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1000 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_1100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_1100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_1100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1100 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely',
        abilityName: 'EntryAbility1' //被拉起的ability设置exported为false
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want,options,(err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1100 ${err?.code}`);
          try{expect(err?.code).assertEqual(16000004);}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1100 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1100 end');
    })


    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_1200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_1200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_1200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1200 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.actsbaseerrrocodemethodtest',
        action: 'zzabc'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want,options,(err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1200 ${err?.code}`);
          try{expect(err?.code).assertEqual(16000019);}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1200 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1200 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_1300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_1300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_1300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1300 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.actsbaseerrrocodemethodtest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_CLONE_INDEX_KEY]:1001
        }
      };
      let options: StartOptions = {
        displayId: 0
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,options,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1300 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000073);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1300 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1300 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_1600
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_1600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_1600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1600 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorappclonerely',
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
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1600 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000078);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1600 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1600 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_1800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_1800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_1800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1800 start');
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
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1800 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000080);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1800 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1800 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_1900
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_1900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_1900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1900 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.actsbaseerrrocodemethodtest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_INSTANCE_KEY]:"app_instance_0"
        }
      };
      let options: StartOptions = {
        displayId: 0
      };
      if(mpEnable == 'true'){
        try {
          context.startAbilityForResult(want,options,(err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1900 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000072);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1900 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1900 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_2000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_2000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_2000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2000 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely',
        abilityName: 'EntryAbility',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want,options,(err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2000 ${err?.code}`);
          try{expect(err?.code).assertEqual(16000050);}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2000 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2000 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_2100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_2100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_2100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2100 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely',
        abilityName: 'EntryAbility1' //被拉起的ability设置exported为false
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want,options)
          .then((result: common.AbilityResult) => {
            hilog.info(0x0000, `${TAG}`, '%{public}s', `startAbilityForResult succeed`);
            try{expect().assertFail();}catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2100 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000004);}catch(e){}
            done();
          });
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2100 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2100 end');
    })


    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_2200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_2200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_2200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2200 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.actsbaseerrrocodemethodtest',
        action: 'zzabc'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want,options)
          .then((result: common.AbilityResult) => {
            hilog.info(0x0000, `${TAG}`, '%{public}s', `startAbilityForResult succeed`);
            try{expect().assertFail();}catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2200 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000019);}catch(e){}
            done();
          });
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2200 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2200 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_2300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_2300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_2300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2300 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.actsbaseerrrocodemethodtest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_CLONE_INDEX_KEY]:1001
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
              hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2300 ${err?.code}`);
              try{expect(err?.code).assertEqual(16000073);}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2300 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2300 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_2600
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_2600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_2600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2600 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorappclonerely',
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
              try{expect().assertFail();}catch(e){}
              done();
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2600 ${err?.code}`);
              try{expect(err?.code).assertEqual(16000078);}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2600 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2600 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_2800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_2800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_2800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2800 start');
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
              try{expect().assertFail();}catch(e){}
              done();
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2600 ${err?.code}`);
              try{expect(err?.code).assertEqual(16000080);}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2800 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2800 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_2900
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_2900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_2900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2900 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.actsbaseerrrocodemethodtest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_INSTANCE_KEY]:"app_instance_0"
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
              try{expect(err?.code).assertEqual(16000072);}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2900 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2900 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_3000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_3000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_3000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3000 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely',
        abilityName: 'EntryAbility',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want,options)
          .then((result: common.AbilityResult) => {
            hilog.info(0x0000, `${TAG}`, '%{public}s', `startAbilityForResult succeed`);
            try{expect().assertFail();}catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2600 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000050);}catch(e){}
            done();
          });
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3000 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3000 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_3100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_3100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_3100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3100 start');
      let caller: Caller;
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely',
        abilityName: 'EntryAbilityzzabc',
      };
      try {
        context.startAbilityByCall(want)
          .then((obj: Caller) => {
            caller = obj;
            hilog.info(0x0000, `${TAG}`, '%{public}s', `startAbilityByCall succeed`);
            try{expect().assertFail();}catch(e){}
            done();
          }).catch((err: BusinessError) => {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3100 ${err?.code}`);
          try{expect(err?.code).assertEqual(16000001);}catch(e){}
          done();
        });
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3100 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3100 end');
    })


    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_3300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_3300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_3300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3300 start');
      let caller: Caller;
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely',
        abilityName: 'EntryAbility',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      };
      try {
        context.startAbilityByCall(want)
          .then((obj: Caller) => {
            caller = obj;
            hilog.info(0x0000, `${TAG}`, '%{public}s', `startAbilityByCall succeed`);
            try{expect().assertFail();}catch(e){}
            done();
          }).catch((err: BusinessError) => {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3300 ${err?.code}`);
          try{expect(err?.code).assertEqual(16000050);}catch(e){}
          done();
        });
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3300 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3300 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_3400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_3400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_3400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3400 start');
      let caller: Caller;
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.actsbaseerrrocodemethodtest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_INSTANCE_KEY]:"app_instance_0"
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
              hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3400 ${err?.code}`);
              try{expect(err?.code).assertEqual(16000072);}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3400 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3400 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_3500
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_3500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_3500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3500 start');
      let caller: Caller;
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.actsbaseerrrocodemethodtest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_CLONE_INDEX_KEY]:1001
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
              try{expect(err?.code).assertEqual(16000073);}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3500 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3500 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_3800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_3800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_3800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3800 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorappclonerely',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY]:true
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
              hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3500 ${err?.code}`);
              try{expect(err?.code).assertEqual(16000078);}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_3800 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_3800 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_4000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_4000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContextError_4000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_4000 start');
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.multiinstaceerrcodetest',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY]:true
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
              hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_4000 ${err?.code}`);
              try{expect(err?.code).assertEqual(16000080);}catch(e){}
              done();
            });
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_4000 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${TAG} multiinstance error, current device not set param value.`);
        done();
      }

      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_4000 end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_openLinkError_4200
     * @tc.number SUB_Ability_AbilityBase_openLinkError_4200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_openLinkError_4200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_openLinkError_4200 start');
      let link = 'http1://www.example123123.com'
      try {
        context.openLink(link).then(() => {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `openLink succeed`);
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_openLinkError_4200 ${error?.code}`);
          try{expect(error?.code).assertEqual(16000019);}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_openLinkError_4200 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_openLinkError_4200 end');
    })


  })
}
