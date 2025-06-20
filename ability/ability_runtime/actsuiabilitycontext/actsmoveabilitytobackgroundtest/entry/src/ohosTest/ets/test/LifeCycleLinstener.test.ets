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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import common from '@ohos.app.ability.common';
import { ApplicationStateChangeCallback } from '@kit.AbilityKit';

let TestAbilityContext:common.UIAbilityContext;
export default function LifeCycleLinstenerTest() {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
  let mpEnable = '';
  describe('LifeCycleLinstenerTest', () => {
    beforeAll(() => {
      TestAbilityContext = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable', 'false');
      } catch(err) {
        console.info(`MoveAbilityToBackground Get system parameter error: ${JSON.stringify(err)}`);
      }
      console.log(`MoveAbilityToBackground Get system parameter mpEnable is ${mpEnable}`);
    });
    beforeEach(() => {
      globalThis.entryAbilityContext1 = undefined;
    });
    afterEach(async () => {
      try{
        await globalThis.entryAbilityContext1?.terminateSelf();
        console.log(`afterEach terminateSelf success`);
      }catch{}
      await sleep(1000);
      await abilityDelegator.executeShellCommand("aa start -b com.acts.moveabilitytobgtest -a TestAbility");
      await sleep(2000);
    });
    afterAll(() => {
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_0100
     * @tc.name   : Call UIAbilityContext moveAbilityToBackground
     * @tc.desc   : expect current ability moved to background and onBackground() called.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_0100`;
      console.log(`${tag}, it begin`);
      try {
        let applicationContext:common.ApplicationContext = TestAbilityContext.getApplicationContext();
        let appCloneIndex:number = applicationContext.getCurrentAppCloneIndex();
      } catch (err) {
        console.info(`${tag} error, errorCode: ${JSON.stringify(err?.message)}`);
        expect(err?.code).assertEqual(16000071);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OnApplicationStateChange_0100
     * @tc.name   : Call UIAbilityContext moveAbilityToBackground
     * @tc.desc   : expect current ability moved to background and onBackground() called.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_OnApplicationStateChange_0100`;
      console.log(`${tag}, it begin`);
      let forgoundFlag = false;
      let backgoundFlag = false;
      if (mpEnable === 'true') {
        try {
          let applicationStateChangeCallback: ApplicationStateChangeCallback = {
            onApplicationForeground() {
              console.info(tag + 'applicationStateChangeCallback onApplicationForeground');
              forgoundFlag = true;
            },
            onApplicationBackground() {
              console.info(tag + 'applicationStateChangeCallback onApplicationBackground');
              backgoundFlag = true;
            }
          }
          let applicationContext:common.ApplicationContext = TestAbilityContext.getApplicationContext();
          try {
            applicationContext.on('applicationStateChange', applicationStateChangeCallback);
          } catch (paramError) {
            console.info(tag + `error: ${(paramError as BusinessError).code}, ${(paramError as BusinessError).message}`);
            expect(1).assertEqual(5);
            done();
          }
          await TestAbilityContext.moveAbilityToBackground();
          await sleep(1000);
          console.info(tag + ` backgoundFlag: ` + backgoundFlag);
          expect(backgoundFlag).assertTrue();
          await abilityDelegator.executeShellCommand("aa start -b com.acts.moveabilitytobgtest -a TestAbility");
          await sleep(2000);
          console.info(tag + ` forgoundFlag: ` + forgoundFlag);
          expect(forgoundFlag).assertTrue();
          try {
            applicationContext.off('applicationStateChange', applicationStateChangeCallback);
          } catch (paramError) {
            console.info(tag + ` off error: ${(paramError as BusinessError).code}, ${(paramError as BusinessError).message}`);
            expect().assertFail();
            done();
          }
          done();
        } catch (err) {
          console.info(`${tag} error, errorCode: ${JSON.stringify(err?.message)}`);
          expect().assertFail();
          done();
        }
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    });


    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OnApplicationStateChange_0200
     * @tc.name   : Call UIAbilityContext moveAbilityToBackground
     * @tc.desc   : expect current ability moved to background and onBackground() called.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_0200', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_OnApplicationStateChange_0200`;
      console.log(`${tag}, it begin`);
      if (mpEnable === 'true') {
        let forgoundFlag = false;
        let backgoundFlag = false;
        try {
          let applicationStateChangeCallback: ApplicationStateChangeCallback = {
            onApplicationForeground() {
              console.info(tag + 'applicationStateChangeCallback onApplicationForeground');
              forgoundFlag = true;
            },
            onApplicationBackground() {
              console.info(tag + 'applicationStateChangeCallback onApplicationBackground');
              backgoundFlag = false;
            }
          }
          let applicationContext:common.ApplicationContext = TestAbilityContext.getApplicationContext();
          try {
            applicationContext.on('applicationStateChange', applicationStateChangeCallback);
          } catch (paramError) {
            console.info(tag + ` error: ${(paramError as BusinessError).code}, ${(paramError as BusinessError).message}`);
            expect().assertFail();
            done();
          }
          try {
            applicationContext.off('applicationStateChange', applicationStateChangeCallback);
          } catch (paramError) {
            console.info(tag + `error: ${(paramError as BusinessError).code}, ${(paramError as BusinessError).message}`);
            expect().assertFail();
            done();
          }
          await TestAbilityContext.startAbility({
            bundleName:'com.acts.moveabilitytobgtest',
            abilityName:'EntryAbility1'
          }).then((data)=>{
            console.info(tag + ` startAbility success`);
          }).catch((error:BusinessError)=>{
            console.info(tag + `error: ${(error as BusinessError).code}, ${(error as BusinessError).message}`);
            try{expect().assertFail();}catch{}
            done();
          })
          await sleep(2000);
          await globalThis.entryAbilityContext1?.moveAbilityToBackground();
          await sleep(2000);
          await TestAbilityContext.moveAbilityToBackground();
          await sleep(2000);
          await abilityDelegator.executeShellCommand("aa start -b com.acts.moveabilitytobgtest -a TestAbility");
          await sleep(2000);
          if (forgoundFlag || backgoundFlag){
            console.info(tag + ` off listener fail`);
            expect().assertFail();
          }else{
            console.info(tag + ` off listener success`);
            done();
          }
        } catch (err) {
          console.info(`${tag} error, errorCode: ${JSON.stringify(err?.message)}`);
          expect().assertFail();
          done();
        }
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    });
  })
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}