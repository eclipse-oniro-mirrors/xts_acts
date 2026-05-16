/**
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

import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import { BusinessError, RecordData } from '@ohos.base';
import hilog from '@ohos.hilog';
import CommonEventManager from '@ohos.commonEventManager';
import StartOptions from '@ohos.app.ability.StartOptions';
import { ProcessInformation } from 'application.ProcessInformation';
import contextConstant from '@ohos.app.ability.contextConstant';

const START_ABILITY_IN_NEW_PROCESS_EVENT = "start_ability_in_new_process_event";
const START_ABILITY_EVENT = "start_ability_event";
const FOREGROUND_EVENT = "foreground_event"
const NOTIFY_PID_EVENT = "notify_pid_event";
const KILL_PROCESS_EVENT = "kill_process_event";
let tag = '[ACTS_StartAbilityInNewProcess EntryAbility]';
let commonEventData: CommonEventManager.CommonEventPublishData = {
  parameters: {
    'num': -1,
    'pid': -1
  } as Record<String, RecordData>
};
let commonEventDataParams = commonEventData?.parameters

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
    let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
      events: [START_ABILITY_EVENT, KILL_PROCESS_EVENT],
    };
    let subscriber: CommonEventManager.CommonEventSubscriber;
    let SubscribeCallBack = (err: BusinessError | null, data: CommonEventManager.CommonEventData | undefined):void => {
      console.log(`${tag} data: ${JSON.stringify(data)}}`);
      switch (data!.event) {
        case START_ABILITY_EVENT: {
          let want: Want = {
            deviceId: '',
            bundleName: 'com.example.startabilityinnewprocesstest.static',
            abilityName: 'EntryAbility1'
          };
          let options: StartOptions = {
            processMode: contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM
          };
          console.log(`${tag} startInNewProcess options: ${JSON.stringify(options)}`);

          try {
            console.log(`${tag} startAbility`);
            commonEventDataParams!['num'] = 0;
            CommonEventManager.publish(START_ABILITY_IN_NEW_PROCESS_EVENT, commonEventData, (err)=>{
              console.log(`${tag} publish err: ${JSON.stringify(err)}`);
            });
            console.log(`${tag} startAbility succeed`);
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(`startAbility failed, code is ${code}, message is ${message}`);
            commonEventDataParams!['num'] = code;
            CommonEventManager.publish(START_ABILITY_IN_NEW_PROCESS_EVENT, commonEventData, (err)=>{
              console.log(`${tag} publish err: ${JSON.stringify(err)}`);
            });
          }
          if (data?.parameters?.['isDone'] as number == 1) {
            CommonEventManager.unsubscribe(subscriber, (err, data) => {
              console.info(`${tag} unsubscribe success`);
            })
          }
        }
          break;
        case KILL_PROCESS_EVENT: {
          if (data?.parameters?.['isDone'] as number == 1) {
            CommonEventManager.unsubscribe(subscriber, (err, data) => {
              console.info(`${tag} unsubscribe success`);
            })
          }
          this.context.terminateSelf();
        }
          break;
        default:
          break;
      }
    }
    CommonEventManager.createSubscriber(subscribeInfo)
    .then((data: CommonEventManager.CommonEventSubscriber | null) => {
      subscriber = data as CommonEventManager.CommonEventSubscriber;
      CommonEventManager.subscribe(subscriber, SubscribeCallBack)
    })
    this.context.getApplicationContext().getRunningProcessInformation((err: BusinessError<void> | null, 
      data: Array<ProcessInformation> | undefined)=> {
      commonEventDataParams!['pid'] == data![0].pid
      console.log(`${tag} pid: ${commonEventDataParams!['pid']}`);
    })
    CommonEventManager.publish(NOTIFY_PID_EVENT, commonEventData, (err)=>{
      console.log(`${tag} publish NOTIFY_PID_EVENT err: ${JSON.stringify(err)}`);
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
      if (err?.code) {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
        return;
      }
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
      hilog.info(0x0000, 'testTag EntryAbility', 'onWindowStageCreate ok');
    });
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onForeground');
    this.context.getApplicationContext().getRunningProcessInformation((err: BusinessError<void> | null, 
      data: Array<ProcessInformation> | undefined)=>{
      commonEventDataParams!['pid'] = data![0].pid;
      commonEventDataParams!['num'] = 0;
      CommonEventManager.publish(FOREGROUND_EVENT, commonEventData, (err)=>{
        console.log(`${tag} publish FOREGROUND_EVENT err: ${JSON.stringify(err)}`);
      });
    })
  }

  onBackground() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onBackground');
  }
}
