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

import hilog from '@ohos.hilog';
import Ability from '@ohos.app.ability.UIAbility'
import Window from '@ohos.window'
import Want from '@ohos.app.ability.Want';
import StartOptions from '@ohos.app.ability.StartOptions';
import { BusinessError } from '@ohos.base';
import commonEvent from '@ohos.commonEventManager';
import process from '@ohos.process';

let tag = '[ACTS_StartAbilityInNewProcess MainAbility3]';
let ON_WINDOW_STAGE_CREATE = "on_window_stage_create";
let ON_FOREGROUND = "on_foreground";
let ON_DESTROY = "on_destroy";
let SHOW_ABILITY_EVENT = "show_ability_event";
let HIDE_ABILITY_EVENT = "hide_ability_event";
let NOTIFY_PID_EVENT = "notify_pid_event";
let START_ABILITY_EVENT = "start_ability_event";
let START_ABILITY_IN_NEW_PROCESS_EVENT = "start_ability_in_new_process_event";
let KILL_PROCESS_EVENT = "kill_process_event";
let commonEventData = {
  parameters: {
    num: -1,
    pid: -1
  }
};

export default class MainAbility3 extends Ability {
  async onCreate(want, launchParam) {
    console.log(`${tag} onCreate`);
    commonEventData.parameters.pid = process.pid;
    console.log(`${tag} pid: ${commonEventData.parameters.pid}`);
    commonEvent.publish(NOTIFY_PID_EVENT, commonEventData, (err)=>{
      console.log(`${tag} publish NOTIFY_PID_EVENT err: ${JSON.stringify(err)}`);
    });
    let subscribeInfo = {
      events: [SHOW_ABILITY_EVENT, HIDE_ABILITY_EVENT, START_ABILITY_EVENT, KILL_PROCESS_EVENT],
    };
    let subscriber = await commonEvent.createSubscriber(subscribeInfo);
    commonEvent.subscribe(subscriber, async (err, data) => {
      console.log(`${tag} data: ${JSON.stringify(data)}}`);
      switch (data.event) {
        case SHOW_ABILITY_EVENT: {
          console.log(`${tag} showAbility`);
          commonEvent.unsubscribe(subscriber, (err, data) => {
            console.info(`${tag} unsubscribe success`);
          })
          try {
            await this.context.showAbility();
          } catch (err) {
            console.log(`${tag} showAbility err: ${JSON.stringify(err)}`);
            commonEventData.parameters.num = err.code;
            commonEvent.publish(START_ABILITY_IN_NEW_PROCESS_EVENT, commonEventData, (err)=>{
              console.log(`${tag} publish err: ${JSON.stringify(err)}`);
            });
          }
        }
          break;
        case HIDE_ABILITY_EVENT: {
          commonEvent.unsubscribe(subscriber, (err, data) => {
            console.info(`${tag} unsubscribe success`);
          })
          try {
            await this.context.hideAbility();
          } catch (err) {
            console.log(`${tag} showAbility err: ${JSON.stringify(err)}`);
            commonEventData.parameters.num = err.code;
            commonEvent.publish(START_ABILITY_IN_NEW_PROCESS_EVENT, commonEventData, (err)=>{
              console.log(`${tag} publish err: ${JSON.stringify(err)}`);
            });
          }
        }
          break;
        case START_ABILITY_EVENT: {
          if (data.parameters['targetPid'] !== process.pid) {
            return;
          }
          this.startInNewProcess(data);
          if (data.parameters['isDone'] as number == 1) {
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${tag} unsubscribe success`);
            })
          }
        }
          break;
        case KILL_PROCESS_EVENT: {
          if (data.parameters['targetPid'] !== process.pid) {
            return;
          }
          if (data.parameters['isDone'] as number == 1) {
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${tag} unsubscribe success`);
            })
          }
          this.context.terminateSelf();
        }
          break;
        default:
          break;
      }
    });
  }

  onDestroy() {
    console.log(`${tag} onDestroy`);
    commonEvent.publish(ON_DESTROY, (err)=>{
      console.log(`${tag} onDestroy publish err: ${JSON.stringify(err)}`);
    });
  }

  onWindowStageCreate(windowStage: Window.WindowStage) {
    console.log(`${tag} onWindowStageCreate`);
    commonEvent.publish(ON_WINDOW_STAGE_CREATE, (err)=>{
      console.log(`${tag} publish err: ${JSON.stringify(err)}`);
    });

    windowStage.loadContent('pages/p2', (err, data) => {
      if (err.code) {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.ERROR);
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {

  }

  onForeground() {
    console.log(`${tag} onForeground`);
    commonEvent.publish(ON_FOREGROUND, (err)=>{
      console.log(`${tag} publish err: ${JSON.stringify(err)}`);
    });
  }

  onBackground() {
    console.log(`${tag} onBackground`);
  }

  startInNewProcess(data) {
    let want: Want = {
      deviceId: '',
      bundleName: data.parameters['acts_bundleName'] as string,
      abilityName: data.parameters['acts_abilityName'] as string
    };
    let options: StartOptions = {
      processMode: data.parameters['acts_processMode'] as number,
      startupVisibility: data.parameters['acts_startupVisibility'] as number
    };
    if (data.parameters['acts_processMode'] == undefined) {
      delete options.processMode;
    }
    if (data.parameters['acts_startupVisibility'] == undefined) {
      delete options.startupVisibility;
    }
    console.log(`${tag} startInNewProcess options: ${JSON.stringify(options)}`);

    try {
      this.context.startAbility(want, options, (err: BusinessError) => {
        commonEventData.parameters.num = err.code;
        commonEvent.publish(START_ABILITY_IN_NEW_PROCESS_EVENT, commonEventData, (err)=>{
          console.log(`${tag} publish err: ${JSON.stringify(err)}`);
        });
        if (err.code) {
          console.log(`${tag} startAbility failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.log(`${tag} startAbility succeed`);
      });
    } catch (err) {
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      console.error(`startAbility failed, code is ${code}, message is ${message}`);
      commonEventData.parameters.num = code;
      commonEvent.publish(START_ABILITY_IN_NEW_PROCESS_EVENT, commonEventData, (err)=>{
        console.log(`${tag} publish err: ${JSON.stringify(err)}`);
      });
    }
  }
}
