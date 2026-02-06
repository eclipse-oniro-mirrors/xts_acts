/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import Want from '@ohos.app.ability.Want';
import contextConstant from '@ohos.app.ability.contextConstant';
import { BusinessError } from '@ohos.base';
import commonEvent from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
interface Flag {
  flag: boolean
}
interface Params {
  pid: string
  num: number
}
interface ParametersObj  {
  acts_bundleName: string
  acts_abilityName: string
  acts_processMode: number | undefined
  isDone: number
  acts_startupVisibility: number | undefined
  targetPid: string
}
let domain: number = 0x0000;
let testTag: string = 'testTag';

function getCount(str: string, substring: string): number {
  let count = 0;
  while (str.indexOf(substring) != -1) {
    str = str.replace(substring, '');
    count++;
  }
  return count;
}
const ON_WINDOW_STAGE_CREATE = "on_window_stage_create";
const ON_FOREGROUND = "on_foreground";
const ON_DESTROY = "on_destroy";
const START_ABILITY_IN_NEW_PROCESS_EVENT = "start_ability_in_new_process_event";
const START_ABILITY_EVENT = "start_ability_event";
const FOREGROUND_EVENT = "foreground_event";
const SHOW_ABILITY_EVENT = "show_ability_event";
const HIDE_ABILITY_EVENT = "hide_ability_event";
const NOTIFY_PID_EVENT = "notify_pid_event";
const KILL_PROCESS_EVENT = "kill_process_event";
let context:common.UIAbilityContext;
let functionEnable = '';
let eventsAry = new Array<string>(ON_WINDOW_STAGE_CREATE,ON_DESTROY,ON_FOREGROUND,START_ABILITY_IN_NEW_PROCESS_EVENT,FOREGROUND_EVENT,NOTIFY_PID_EVENT)
let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
  events: eventsAry
};
let subscriber: commonEvent.CommonEventSubscriber ;
let abilityDelegator:AbilityDelegatorRegistry.AbilityDelegator;
let onWindowStageFlag = false;
let onForegroundFlag = false;
let onDestroyFlag = false;
let expectErrorCode = -1;
let parametersObj: Record<String, Object> = {};
let commonEventData: commonEvent.CommonEventPublishData = {
  parameters: parametersObj
};
let commonEventDataParams = commonEventData?.parameters
let pids = new Array<string>()
let subscribeCallBack = async (err:BusinessError<void> | null, data: commonEvent.CommonEventData | undefined, done:()=> void, tag:string, obj:Flag):Promise<void> => {
  hilog.info(domain, testTag, '%{public}s', `${tag} subscribeCallBack err: ${JSON.stringify(err)}, data: ${JSON.stringify(data)}`);
  let parametersPid = data?.parameters as Params
  switch (data!.event) {
    case START_ABILITY_IN_NEW_PROCESS_EVENT: {
      let numStr = parametersPid!.num
      expect(numStr).assertEqual(expectErrorCode);
      if (expectErrorCode !== 0) {
        done();
      }
    }
      break;
    case ON_WINDOW_STAGE_CREATE:
      onWindowStageFlag = true;
      hilog.info(domain, testTag, '%{public}s', `${tag} subscribeCallBack onWindowStageFlag: ${onWindowStageFlag}`);
      break;
    case ON_FOREGROUND:
      onForegroundFlag = true;
      hilog.info(domain, testTag, '%{public}s', `${tag} subscribeCallBack onForegroundFlag: ${onForegroundFlag}`);
      break;
    case ON_DESTROY:
      onDestroyFlag = true;
      hilog.info(domain, testTag, '%{public}s', `${tag} subscribeCallBack onDestroyFlag: ${onDestroyFlag}`);
      break;
    case FOREGROUND_EVENT: {
      obj.flag = true;
      await Utils.msSleep(500);
      (commonEventDataParams as ParametersObj)!.targetPid = parametersPid!.pid;
      commonEvent.publish(START_ABILITY_EVENT, commonEventData, (err: BusinessError<void> | null) => {
        hilog.info(domain, testTag, '%{public}s', `${tag} publish START_ABILITY_EVENT err: ${JSON.stringify(err)}`);
      });
    }
      break;
    case NOTIFY_PID_EVENT: {
      let pidPush = parametersPid!.pid
      pids.push(pidPush);
    }
      break;
  }
}

let startAssistAbility = async (tag:string, done: ()=> void):Promise<void> => {
  let obj: Flag = { flag: false };
  subscriber = await commonEvent.createSubscriber(subscribeInfo);
  commonEvent.subscribe(subscriber, (err, data) => {
    subscribeCallBack(err, data, done, tag, obj);
  });
  let want: Want = {
    deviceId: '',
    bundleName: 'com.example.com.example.startabilityinnewprocesstest.static',
    abilityName: 'EntryAbility',
  };
  try {
    hilog.info(domain, testTag, '%{public}s', `${tag} startAssistAbility, ${JSON.stringify(want)}`);
    context.startAbility(want, (err: BusinessError<void> | null) => {
      if (err?.code) {
        hilog.info(domain, testTag, '%{public}s', `${tag} startAbility failed, code is ${err?.code}, message is ${err?.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, testTag, '%{public}s', `${tag} startAbility succeed`);
    });
    await Utils.msSleep(2000);
    if (obj.flag) {
      hilog.info(domain, testTag, '%{public}s', `${tag} no need to click button`);
    }
  } catch (err: BusinessError) {
    let code = (err as BusinessError).code;
    let message = (err as BusinessError).message;
    hilog.info(domain, testTag, '%{public}s', `${tag} startAbility failed, code is ${code}, message is ${message}`);
    expect().assertFail();
    done();
  }
}
export default function abilitystaticTest() {
  describe("abilitystaticTest", (): void => {
    hilog.info(domain, testTag, '%{public}s', 'describe start');

    beforeAll(async (): Promise<void> => {
      hilog.info(domain, testTag, '%{public}s', 'beforeAll start');
      let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "TestAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          context = abilitys.context
          hilog.info(domain, testTag, '%{public}s', 'onAbilityCreate end');

        },
      }, (err: BusinessError) : void => {
        if (err != null ) {
          hilog.info(domain, testTag, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, testTag, '%{public}s', 'BusinessError  end');
      });
      hilog.info(domain, testTag, '%{public}s', 'abilityDelegator start');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a TestAbility -b com.example.startabilityinnewprocesstest.static")
      await Utils.msSleep(2000)
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_Static beforeAll]';
      try {
        functionEnable = systemParameterEnhance.getSync('persist.sys.abilityms.start_options_with_process_option', 'false');
      } catch (err: BusinessError) {
        hilog.info(domain, testTag, '%{public}s', `${tag} err is ${JSON.stringify(functionEnable)}`);
      }
      hilog.info(domain, testTag, '%{public}s', `${tag} functionEnable is ${functionEnable}`);
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, testTag, '%{public}s', 'beforeAll end');
    })
    beforeEach( async (): Promise<void> => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_Static beforeEach]';
      let paramsObj: Record<String, Object> = {}
      hilog.info(domain, testTag, '%{public}s', `${tag} start`);
      onWindowStageFlag = false;
      onForegroundFlag = false;
      expectErrorCode = -1;
      commonEventData ={
        parameters: paramsObj
      };
      pids = new Array<string>();
    })
    afterEach(async (): Promise<void> => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_Static afterEach]';
      try {
        if (subscriber) {
          commonEvent.unsubscribe(subscriber, (err: BusinessError<void> | null) => {
            hilog.info(domain, testTag, '%{public}s', `${tag} unsubscribe success`);
          })
        }
        let forcestop = 'aa force-stop com.example.startabilityinnewprocesstest.static';
        abilityDelegator.executeShellCommand(forcestop).catch<void>((err:BusinessError): void => {
          hilog.info(domain, testTag, '%{public}s', `${tag} executeShellCommand failed.`);
        })
        await Utils.msSleep(1000);
      } catch (err: BusinessError) {
        hilog.info(domain, testTag, '%{public}s', `${tag} err: ${JSON.stringify(err)}`);
      }
    })


    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_Static_0400
     * @tc.name SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_Static_0400
     * @tc.desc Start with processMode only.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_Static_0400', Level.LEVEL0, async (done: ()=> void): Promise<void> => {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_Static_0400]';
      expect(String(contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT)).assertEqual("1");
      expect(String(contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM)).assertEqual("2");
      expect(String(contextConstant.ProcessMode.ATTACH_TO_STATUS_BAR_ITEM)).assertEqual("3");
      expect(String(contextConstant.StartupVisibility.STARTUP_HIDE)).assertEqual("0");
      expect(String(contextConstant.StartupVisibility.STARTUP_SHOW)).assertEqual("1");
      if (functionEnable === 'true') {
        expectErrorCode = 401;
        (commonEventDataParams as ParametersObj)!.acts_bundleName = 'com.example.com.example.startabilityinnewprocesstest.static';
        (commonEventDataParams as ParametersObj)!.acts_abilityName = 'MainAbility2';
        (commonEventDataParams as ParametersObj)!.acts_processMode = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        (commonEventDataParams as ParametersObj)!.isDone = 1;

        startAssistAbility(tag, done);
      } else if (functionEnable === 'false') {
        hilog.info(domain, testTag, '%{public}s', `${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        hilog.info(domain, testTag, '%{public}s', `${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })
  })
  hilog.info(domain, testTag, '%{public}s', 'abilityTest end');

}