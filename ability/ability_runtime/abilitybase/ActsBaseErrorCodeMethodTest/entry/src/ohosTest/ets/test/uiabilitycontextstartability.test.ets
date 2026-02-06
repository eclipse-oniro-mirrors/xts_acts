/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { common, contextConstant, sendableContextManager, WantAgent, wantAgent, wantConstant } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError, systemParameterEnhance } from '@kit.BasicServicesKit';
let context: common.UIAbilityContext
let mpEnable: string;
let npEnable: string;
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
      try {
        npEnable = systemParameterEnhance.getSync('persist.sys.abilityms.start_options_with_process_option');
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        npEnable = 'fail';
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_0100
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_0100
     * @tc.desc   Expect: 16000073
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_0100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_0100 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName:'com.acts.actsbaseerrrocodemethodtest',
            abilityName:'EntryAbility',
            parameters:{
              [wantConstant.Params.APP_CLONE_INDEX_KEY] : 1001
            }
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0100 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000073);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0100 ${err?.code}`);
          expect().assertFail();
          done();
        }
      }else{
          console.error(`${TAG} current device not support feature.`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_0300
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_0300
     * @tc.desc   Expect: 16000078
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_0300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_0200 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName:'com.acts.ability.baseerrorappclonerely',
            abilityName:'EntryAbility',
            parameters:{
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY] : true
            }
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0300 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000078);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0300 ${err?.code}`);
          expect().assertFail();
          done();
        }
      }else{
          console.error(`${TAG} current device not support feature.`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_0500
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_0500
     * @tc.desc   Expect: 16000080
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_0500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_0500 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName:'com.acts.ability.multiinstaceerrcodetest',
            abilityName:'EntryAbility',
            parameters:{
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY] : true
            }
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0500 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000080);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0500 ${err?.code}`);
          expect().assertFail();
          done();
        }
      }else{
          console.error(`${TAG} current device not support feature.`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_0600
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_0600
     * @tc.desc   Expect: 16000073
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_0600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_0600 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName:'com.acts.actsbaseerrrocodemethodtest',
            abilityName:'EntryAbility',
            parameters:{
              [wantConstant.Params.APP_CLONE_INDEX_KEY] : 1001
            }
          }, {
            windowLeft: 20,
            windowTop: 20
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0600 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000073);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0600 ${err?.code}`);
          expect().assertFail();
          done();
        }
      }else{
          console.error(`${TAG} current device not support feature.`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_0800
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_0800
     * @tc.desc   Expect: 16000078
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_0800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_0800 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName:'com.acts.ability.baseerrorappclonerely',
            abilityName:'EntryAbility',
            parameters:{
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY] : true
            }
          }, {
            windowLeft: 20,
            windowTop: 20
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0800 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000078);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_0800 ${err?.code}`);
          expect().assertFail();
          done();
        }
      }else{
          console.error(`${TAG} current device not support feature.`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_1000
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_1000
     * @tc.desc   Expect: 16000080
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_1000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_1000 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName:'com.acts.ability.multiinstaceerrcodetest',
            abilityName:'EntryAbility',
            parameters:{
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY] : true
            }
          }, {
            windowLeft: 20,
            windowTop: 20
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1000 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000080);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1000 ${err?.code}`);
          expect().assertFail();
          done();
        }
      }else{
          console.error(`${TAG} current device not support feature.`);
        done();
      }

    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_1100
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_1100
     * @tc.desc   Expect: 16000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_1100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_1100 start');
      try {
        context.startAbility({
          bundleName:'com.acts.actsbaseerrrocodemethodtest',
          abilityName:'EntryAbilityerr'
        }, {
          windowLeft: 20,
          windowTop: 20
        }, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1100 ${err?.code}`);
          try{expect(err?.code).assertEqual(16000001);}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1100 catch ${err?.code}`);
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1100 catch ${err?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_1200
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_1200
     * @tc.desc   Expect: 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_1200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_1200 start');
      try {
        context.startAbility({
          bundleName:'com.acts.actsbaseerrrocodemethodtest',
          abilityName:'EntryAbility',
          parameters: {
            'keyFd': { 'type': 'FD', 'value': -1 }
          }
        }, {
          windowLeft: 20,
          windowTop: 20
        }, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1200 ${err?.code}`);
          try{expect(err?.code).assertEqual(16000050);}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1200 ${err?.code}`);
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1100 catch ${err?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_1300
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_1300
     * @tc.desc   Expect: 16000067
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_1300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_1300 start');
      if(npEnable == 'true'){
        try {
          context.startAbility({
            bundleName:'com.acts.actsbaseerrrocodemethodtest',
            abilityName:'EntryAbility'
          }, {
            processMode: contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM,
            startupVisibility: contextConstant.StartupVisibility.STARTUP_SHOW
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1300 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000067);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1200 ${err?.code}`);
          expect().assertFail();
          done();
        }
      }else{
        console.error(`${TAG} startChildProcess error, current device not set param value.`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_1500
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_1500
     * @tc.desc   Expect: 16000072
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_1500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_1500 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName:'com.acts.actsbaseerrrocodemethodtest',
            abilityName:'EntryAbility',
            parameters: {
              [wantConstant.Params.APP_INSTANCE_KEY] : "app_instance_0"
            }
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1500 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000072);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1500 ${err?.code}`);
          expect().assertFail();
          done();
        }
      }else{
          console.error(`${TAG} current device not support feature.`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_1600
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_1600
     * @tc.desc   Expect: 16000072
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_1600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_1600 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName:'com.acts.ability.baseerrorrely',
            abilityName:'EntryAbility',
            parameters: {
              [wantConstant.Params.APP_INSTANCE_KEY] : "app_instance_0"
            }
          }, {
            windowLeft: 20,
            windowTop: 20
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1600 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000072);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1600 ${err?.code}`);
          expect().assertFail();
          done();
        }
      }else{
          console.error(`${TAG} current device not support feature.`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_1700
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_1700
     * @tc.desc   Expect: 16000004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_1700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_StartAbilityError_1700 start');
      if(mpEnable == 'true'){
        try {
          context.startAbility({
            bundleName:'com.acts.ability.baseerrorrely',
            abilityName:'EntryAbility1',
          }, {
            windowLeft: 20,
            windowTop: 20
          }, (err, data)=>{
            hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1700 ${err?.code}`);
            try{expect(err?.code).assertEqual(16000004);}catch(e){}
            done();
          })
        } catch (err) {
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_StartAbilityError_1700 ${err?.code}`);
          expect().assertFail();
          done();
        }
      }else{
        console.error(`${TAG} current device not support feature.`);
        done();
      }
    })

  })
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}
