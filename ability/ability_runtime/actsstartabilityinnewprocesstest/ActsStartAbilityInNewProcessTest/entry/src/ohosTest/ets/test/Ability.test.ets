/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import Want from '@ohos.app.ability.Want';
import contextConstant from '@ohos.app.ability.contextConstant';
import { BusinessError } from '@ohos.base';
import commonEvent from '@ohos.commonEventManager';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';

function getCount(str: string, substring: string): number {
  let count = 0;
  while (str.indexOf(substring) != -1) {
    str = str.replace(substring, '');
    count++;
  }
  return count;
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

let driver = Driver.create();

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let functionEnable = '';
    let ON_WINDOW_STAGE_CREATE = "on_window_stage_create";
    let ON_FOREGROUND = "on_foreground";
    let ON_DESTROY = "on_destroy";
    let START_ABILITY_IN_NEW_PROCESS_EVENT = "start_ability_in_new_process_event";
    let START_ABILITY_EVENT = "start_ability_event";
    let FOREGROUND_EVENT = "foreground_event";
    let SHOW_ABILITY_EVENT = "show_ability_event";
    let HIDE_ABILITY_EVENT = "hide_ability_event";
    let NOTIFY_PID_EVENT = "notify_pid_event";
    let KILL_PROCESS_EVENT = "kill_process_event";
    let subscribeInfo:commonEvent.CommonEventSubscribeInfo = {
      events: [ON_WINDOW_STAGE_CREATE, ON_DESTROY, ON_FOREGROUND, START_ABILITY_IN_NEW_PROCESS_EVENT, FOREGROUND_EVENT, NOTIFY_PID_EVENT],
    };
    let subscriber:commonEvent.CommonEventSubscriber | undefined = undefined;
    let abilityDelegator:AbilityDelegatorRegistry.AbilityDelegator;
    let onWindowStageFlag = false;
    let onForegroundFlag = false;
    let onDestroyFlag = false;
    let expectErrorCode = -1;
    let commonEventData:commonEvent.CommonEventPublishData = {
      parameters: {}
    };
    let pids:string[] = [];

    let subscribeCallBack = async (err:BusinessError, data:commonEvent.CommonEventData, done:Function, tag:string, obj:ESObject):Promise<void> => {
      console.log(`${tag} subscribeCallBack err: ${JSON.stringify(err)}, data: ${JSON.stringify(data)}`);
      switch (data.event) {
        case START_ABILITY_IN_NEW_PROCESS_EVENT: {
          expect(data.parameters!.num).assertEqual(expectErrorCode);
          if (expectErrorCode !== 0) {
            done();
          }
        }
          break;
        case ON_WINDOW_STAGE_CREATE:
          onWindowStageFlag = true;
          console.log(`${tag} subscribeCallBack onWindowStageFlag: ${onWindowStageFlag}`);
          break;
        case ON_FOREGROUND:
          onForegroundFlag = true;
          console.log(`${tag} subscribeCallBack onForegroundFlag: ${onForegroundFlag}`);
          break;
        case ON_DESTROY:
          onDestroyFlag = true;
          console.log(`${tag} subscribeCallBack onDestroyFlag: ${onDestroyFlag}`);
          break;
        case FOREGROUND_EVENT: {
          obj.flag = true;
          await sleep(500);
          commonEventData.parameters!["targetPid"] = data.parameters!.pid;
          commonEvent.publish(START_ABILITY_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish START_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }
          break;
        case NOTIFY_PID_EVENT: {
          pids.push(data.parameters!.pid);
        }
          break;
        default:
          console.log(`${tag} subscribeCallBack event error: ${data.event}`);
          break;
      }
    }

    let startAssistAbility = async (tag:string, done:Function):Promise<void> => {
      let obj:ESObject = { flag: false };
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, tag, obj);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.example.startabilityinnewprocessrely',
        abilityName: 'EntryAbility',
      };
      try {
        console.log(`${tag} startAssistAbility, ${JSON.stringify(want)}`);
        globalThis.context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.log(`${tag} startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          console.log(`${tag} startAbility succeed`);
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.log(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    }

    beforeAll(async (done:Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess beforeAll]';
      try {
        functionEnable = systemParameterEnhance.getSync('persist.sys.abilityms.start_options_with_process_option', 'false');
      } catch (err) {
        console.log(`${tag} err is ${JSON.stringify(functionEnable)}`);
      }
      console.log(`${tag} functionEnable is ${functionEnable}`);
      abilityDelegator = await AbilityDelegatorRegistry.getAbilityDelegator();
      done();
    })
    beforeEach(async (done:Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess beforeEach]';
      console.log(`${tag} start`);
      onWindowStageFlag = false;
      onForegroundFlag = false;
      expectErrorCode = -1;
      commonEventData ={
        parameters: {}
      };
      pids = [];
      done();
    })
    afterEach(async (done:Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess afterEach]';
      try {
        if (subscriber) {
          commonEvent.unsubscribe(subscriber, (err, data) => {
            console.info(`${tag} unsubscribe success`);
            subscriber = undefined;
          })
        }
        let forcestop = 'aa force-stop com.example.startabilityinnewprocessrely';
        await abilityDelegator.executeShellCommand(forcestop).catch((err:BusinessError) => {
          console.log(`${tag} executeShellCommand failed.`);
        })
        await sleep(300);
      } catch (err) {
        console.info(`${tag} err: ${JSON.stringify(err)}`);
      }
      done();
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0400
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0400
     * @tc.desc   Start with processMode only.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0400', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0400]';
      expect(contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT).assertEqual(1);
      expect(contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM).assertEqual(2);
      expect(contextConstant.ProcessMode.ATTACH_TO_STATUS_BAR_ITEM).assertEqual(3);
      expect(contextConstant.StartupVisibility.STARTUP_HIDE).assertEqual(0);
      expect(contextConstant.StartupVisibility.STARTUP_SHOW).assertEqual(1);
      if (functionEnable === 'true') {
        expectErrorCode = 401;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0500
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0500
     * @tc.desc   Start with startupVisibility only.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0500', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0500]';
      if (functionEnable === 'true') {
        expectErrorCode = 401;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0700
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0700
     * @tc.desc   Target ability is not self application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0700', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0700]';
      if (functionEnable === 'true') {
        expectErrorCode = 16300003;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.test';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0900
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0900
     * @tc.desc   Start with NEW_PROCESS_ATTACH_TO_PARENT, then call showAbility().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0900', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0900]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 16000067;
          commonEvent.publish(SHOW_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish SHOW_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1000
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1000
     * @tc.desc   Start ability without process options, then call hideAbility().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1000', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1000]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 16000067;
          commonEvent.publish(HIDE_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish HIDE_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1800
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1800
     * @tc.desc   Function not enable. Start with process options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1800', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1800]';
      if (functionEnable !== 'true') {
        expectErrorCode = 801;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
      } else {
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1900
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1900
     * @tc.desc   Function not enable. Start ability without process options, then call showAbility().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1900', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1900]';
      if (functionEnable !== 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 801;
          commonEvent.publish(SHOW_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish SHOW_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else {
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2000
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2000
     * @tc.desc   Function not enable. Start ability without process options, then call hideAbility().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2000', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2000]';
      if (functionEnable !== 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 801;
          commonEvent.publish(HIDE_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish HIDE_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else {
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2100
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2100
     * @tc.desc   Child process exits with parent process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2100', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2100]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility3';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_SHOW;
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expect(pids.length).assertEqual(2);
          commonEventData.parameters!["targetPid"] = pids[1];
          commonEventData.parameters!["isDone"] = 0;
          commonEvent.publish(START_ABILITY_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish START_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
          setTimeout(async ()=>{
            console.log(`${tag} pids.length: ${JSON.stringify(pids)}`);
            expect(pids.length).assertEqual(3);
            commonEventData.parameters!["targetPid"] = pids[1];
            commonEventData.parameters!["isDone"] = 1;
            commonEvent.publish(KILL_PROCESS_EVENT, commonEventData, (err)=>{
              console.log(`${tag} publish KILL_PROCESS_EVENT err: ${JSON.stringify(err)}`);
            });
            console.log(`${tag} kill ${pids[1]}`);
            setTimeout(async ()=>{
              console.log(`${tag} check pid`);
              let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
              let data = await abilityDelegator.executeShellCommand(cmd).catch((err:BusinessError) => {
                console.log(`${tag} executeShellCommand failed.`);
                expect().assertFail();
                done();
              }) as AbilityDelegatorRegistry.ShellCmdResult
              expect(data.stdResult).assertContain(pids[0]);
              expect(data.stdResult.indexOf(pids[1])).assertEqual(-1);
              expect(data.stdResult.indexOf(pids[2])).assertEqual(-1);
              done();
            }, 1000);
          }, 3000);
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2200
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2200
     * @tc.desc   Child process exits with parent process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2200', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2200]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility3';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_SHOW;
        commonEventData.parameters!["isDone"] = 0;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expect(pids.length).assertEqual(2);
          commonEventData.parameters!["targetPid"] = pids[1];
          commonEventData.parameters!["isDone"] = 1;
          commonEvent.publish(START_ABILITY_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish START_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
          setTimeout(async ()=>{
            console.log(`${tag} pids.length: ${JSON.stringify(pids)}`);
            expect(pids.length).assertEqual(3);
            commonEventData.parameters!["targetPid"] = pids[0];
            commonEventData.parameters!["isDone"] = 1;
            commonEvent.publish(KILL_PROCESS_EVENT, commonEventData, (err)=>{
              console.log(`${tag} publish KILL_PROCESS_EVENT err: ${JSON.stringify(err)}`);
            });
            console.log(`${tag} kill ${pids[0]}`);
            setTimeout(async ()=>{
              console.log(`${tag} check pid`);
              let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
              let data = await abilityDelegator.executeShellCommand(cmd).catch((err:BusinessError) => {
                console.log(`${tag} executeShellCommand failed.`);
                expect().assertFail();
                done();
              }) as AbilityDelegatorRegistry.ShellCmdResult
              expect(data.stdResult.indexOf(pids[0])).assertEqual(-1);
              expect(data.stdResult.indexOf(pids[1])).assertEqual(-1);
              expect(data.stdResult.indexOf(pids[2])).assertEqual(-1);
              done();
            }, 1000);
          }, 3000);
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2400
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2400
     * @tc.desc   Child process exits with parent process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2400', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2400]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility3';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_SHOW;
        commonEventData.parameters!["isDone"] = 0;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expect(pids.length).assertEqual(2);
          commonEventData.parameters!["targetPid"] = pids[0];
          commonEventData.parameters!["acts_processMode"] = undefined;
          commonEventData.parameters!["acts_startupVisibility"] = undefined;
          commonEvent.publish(START_ABILITY_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish START_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
          setTimeout(async ()=>{
            console.log(`${tag} pids.length: ${JSON.stringify(pids)}`);
            expect(pids.length).assertEqual(3);
            expect(pids[0]).assertEqual(pids[2]);
            commonEventData.parameters!["targetPid"] = pids[0];
            commonEventData.parameters!["isDone"] = 1;
            commonEvent.publish(KILL_PROCESS_EVENT, commonEventData, (err)=>{
              console.log(`${tag} publish KILL_PROCESS_EVENT err: ${JSON.stringify(err)}`);
            });
            console.log(`${tag} kill ${pids[0]}`);
            setTimeout(async ()=>{
              console.log(`${tag} check pid`);
              let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
              let data = await abilityDelegator.executeShellCommand(cmd).catch((err:BusinessError) => {
                console.log(`${tag} executeShellCommand failed.`);
                expect().assertFail();
                done();
              }) as AbilityDelegatorRegistry.ShellCmdResult
              expect(data.stdResult.indexOf(pids[0])).assertEqual(-1);
              expect(data.stdResult.indexOf(pids[1])).assertEqual(-1);
              done()
            }, 1000);
          }, 3000);
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2500
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2500
     * @tc.desc   Child process exits with parent process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2500', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2500]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility3';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_SHOW;
        commonEventData.parameters!["isDone"] = 0;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expect(pids.length).assertEqual(2);
          commonEventData.parameters!["targetPid"] = pids[0];
          commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
          commonEvent.publish(START_ABILITY_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish START_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
          setTimeout(async ()=>{
            console.log(`${tag} pids.length: ${JSON.stringify(pids)}`);
            expect(pids.length).assertEqual(3);
            commonEventData.parameters!["targetPid"] = pids[0];
            commonEventData.parameters!["isDone"] = 1;
            commonEvent.publish(KILL_PROCESS_EVENT, commonEventData, (err)=>{
              console.log(`${tag} publish KILL_PROCESS_EVENT err: ${JSON.stringify(err)}`);
            });
            console.log(`${tag} kill ${pids[0]}`);
            setTimeout(async ()=>{
              console.log(`${tag} check pid`);
              let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
              let data = await abilityDelegator.executeShellCommand(cmd).catch((err:BusinessError) => {
                console.log(`${tag} executeShellCommand failed.`);
                expect().assertFail();
                done();
              }) as AbilityDelegatorRegistry.ShellCmdResult
              expect(data.stdResult.indexOf(pids[0])).assertEqual(-1);
              expect(data.stdResult.indexOf(pids[1])).assertEqual(-1);
              expect(data.stdResult.indexOf(pids[2])).assertEqual(-1);
              done();
            }, 1000);
          }, 3000);
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2600
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2600
     * @tc.desc   Start with NEW_PROCESS_ATTACH_TO_PARENT and STARTUP_HIDE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2600', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2600]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
          let data = await abilityDelegator.executeShellCommand(cmd).catch((err:BusinessError) => {
            console.log(`${tag} executeShellCommand failed.`);
            expect().assertFail();
            done();
          }) as AbilityDelegatorRegistry.ShellCmdResult
          expect(data.stdResult).assertContain("com.example.startabilityinnewprocessrely:entry:MainAbility2:");
          done();
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2700
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2700
     * @tc.desc   Start with NEW_PROCESS_ATTACH_TO_PARENT and STARTUP_SHOW.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2700', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2700]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_SHOW;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          done();
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2800
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2800
     * @tc.desc   Repeat start ability with NEW_PROCESS_ATTACH_TO_PARENT in singleton mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2800', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2800]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters!["isDone"] = 0;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 16000068;
          commonEventData.parameters!["isDone"] = 1;
          commonEventData.parameters!["targetPid"] = pids[0];
          commonEvent.publish(START_ABILITY_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish START_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2900
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2900
     * @tc.desc   Target ability is not self application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2900', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2900]';
      if (functionEnable === 'true') {
        expectErrorCode = 16300003;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.test';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3000
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3000
     * @tc.desc   Repeat start ability with STARTUP_HIDE in multiton mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3000', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3000]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility3';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters!["isDone"] = 0;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
          let data = await abilityDelegator.executeShellCommand(cmd).catch((err:BusinessError) => {
            console.log(`${tag} executeShellCommand failed.`);
            expect().assertFail();
            done();
          }) as AbilityDelegatorRegistry.ShellCmdResult
          let count = getCount(data.stdResult, 'com.example.startabilityinnewprocessrely:entry:MainAbility3:');
          console.log(`${tag} count is ${count} after show start`);
          expect(count).assertEqual(1);
          expectErrorCode = 0;
          onWindowStageFlag = false;
          onForegroundFlag = false;
          commonEventData.parameters!["isDone"] = 1;
          commonEventData.parameters!["targetPid"] = pids[0];
          commonEvent.publish(START_ABILITY_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish START_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
          setTimeout(async ()=>{
            let flag = onWindowStageFlag && !onForegroundFlag;
            expect(flag).assertEqual(true);
            let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
            let data = await abilityDelegator.executeShellCommand(cmd).catch((err:BusinessError) => {
              console.log(`${tag} executeShellCommand failed.`);
              expect().assertFail();
              done();
            }) as AbilityDelegatorRegistry.ShellCmdResult
            let count = getCount(data.stdResult, 'com.example.startabilityinnewprocessrely:entry:MainAbility3:');
            console.log(`${tag} count is ${count} after show start`);
            expect(count).assertEqual(2);
            done();
          }, 3000)
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3100
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3100
     * @tc.desc   Repeat start ability in specified mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3100', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3100]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility4';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters!["isDone"] = 0;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
          let data = await abilityDelegator.executeShellCommand(cmd).catch((err:BusinessError) => {
            console.log(`${tag} executeShellCommand failed.`);
            expect().assertFail();
            done();
          }) as AbilityDelegatorRegistry.ShellCmdResult
          expect(data.stdResult).assertContain("com.example.startabilityinnewprocessrely:entry:MainAbility4:");
          expectErrorCode = 16000068;
          commonEventData.parameters!["isDone"] = 1;
          commonEventData.parameters!["targetPid"] = pids[0];
          commonEvent.publish(START_ABILITY_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish START_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3200
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3200
     * @tc.desc   Start specified ability without process options, then start the ability with process options again.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3200', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3200]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility4';
        commonEventData.parameters!["isDone"] = 0;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 16000068;
          commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
          commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
          commonEventData.parameters!["isDone"] = 1;
          commonEventData.parameters!["targetPid"] = pids[0];
          commonEvent.publish(START_ABILITY_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish START_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3300
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3300
     * @tc.desc   Start singleton ability without process options, then start the ability with process options again.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3300', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3300]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["isDone"] = 0;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 16000068;
          commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
          commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
          commonEventData.parameters!["isDone"] = 1;
          commonEventData.parameters!["targetPid"] = pids[0];
          commonEvent.publish(START_ABILITY_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish START_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3400
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3400
     * @tc.desc   Repeat start ability with STARTUP_SHOW in multiton mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3400', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3400]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility3';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_SHOW;
        commonEventData.parameters!["isDone"] = 0;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
          let data = await abilityDelegator.executeShellCommand(cmd).catch((err:BusinessError) => {
            console.log(`${tag} executeShellCommand failed.`);
            expect().assertFail();
            done();
          }) as AbilityDelegatorRegistry.ShellCmdResult
          let count = getCount(data.stdResult, 'com.example.startabilityinnewprocessrely:entry:MainAbility3:');
          console.log(`${tag} count is ${count} after show start`);
          expect(count).assertEqual(1);
          expectErrorCode = 0;
          onWindowStageFlag = false;
          onForegroundFlag = false;
          commonEventData.parameters!["isDone"] = 1;
          commonEventData.parameters!["targetPid"] = pids[0];
          commonEvent.publish(START_ABILITY_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish START_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
          setTimeout(async ()=>{
            let flag = onWindowStageFlag && onForegroundFlag;
            expect(flag).assertEqual(true);
            let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
            let data = await abilityDelegator.executeShellCommand(cmd).catch((err:BusinessError) => {
              console.log(`${tag} executeShellCommand failed.`);
              expect().assertFail();
              done();
            }) as AbilityDelegatorRegistry.ShellCmdResult
            let count = getCount(data.stdResult, 'com.example.startabilityinnewprocessrely:entry:MainAbility3:');
            console.log(`${tag} count is ${count} after show start`);
            expect(count).assertEqual(2);
            done();
          }, 3000)
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3500
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3500
     * @tc.desc   Function not enable. Start with process options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3500', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3500]';
      if (functionEnable !== 'true') {
        expectErrorCode = 801;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
      } else {
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3600
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3600
     * @tc.desc   Start with NEW_PROCESS_ATTACH_TO_PARENT, then call hideAbility().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3600', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3600]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters!["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 16000067;
          commonEvent.publish(HIDE_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish HIDE_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000);
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3700
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3700
     * @tc.desc   Start ability without process options, then call showAbility().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3700', Level.LEVEL0, async (done: Function) => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_3700]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters!["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters!["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters!["isDone"] = 1;

        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 16000067;
          commonEvent.publish(SHOW_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish HIDE_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000);
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })
  })
}
