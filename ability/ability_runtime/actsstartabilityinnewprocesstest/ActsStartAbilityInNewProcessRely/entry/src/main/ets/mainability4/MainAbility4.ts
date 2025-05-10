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
import commonEvent from '@ohos.commonEventManager';

let tag = '[ACTS_StartAbilityInNewProcess MainAbility4]';
let ON_WINDOW_STAGE_CREATE = "on_window_stage_create";
let ON_FOREGROUND = "on_foreground";
let SHOW_ABILITY_EVENT = "show_ability_event";
let HIDE_ABILITY_EVENT = "hide_ability_event";
let START_ABILITY_IN_NEW_PROCESS_EVENT = "start_ability_in_new_process_event";
let commonEventData = {
  parameters: {
    num: -1
  }
};

export default class MainAbility4 extends Ability {
  async onCreate(want, launchParam) {
    console.log(`${tag} onCreate`);
    let subscribeInfo = {
      events: [SHOW_ABILITY_EVENT, HIDE_ABILITY_EVENT],
    };
    let subscriber = await commonEvent.createSubscriber(subscribeInfo);
    commonEvent.subscribe(subscriber, async (err, data) => {
      console.log(`${tag} data: ${JSON.stringify(data)}}`);
      commonEvent.unsubscribe(subscriber, (err, data) => {
        console.info(`${tag} unsubscribe success`);
      })
      switch (data.event) {
        case SHOW_ABILITY_EVENT: {
          console.log(`${tag} showAbility`);
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
        default:
          break;
      }
    });
  }

  onDestroy() {
    console.log(`${tag} onDestroy`);
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
}
