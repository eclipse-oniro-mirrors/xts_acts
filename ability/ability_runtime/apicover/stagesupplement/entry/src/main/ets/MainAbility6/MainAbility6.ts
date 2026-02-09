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

import Ability from '@ohos.app.ability.UIAbility';
import commonEvent from '@ohos.commonEvent';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';

const LOG_PREFIX = 'Stage:MainAbility6:';
const EVENT_PREFIX = 'Stage_MainAbility6_';
const MAIN_PAGE_PATH = 'pages/index';
let launchWant;
let lastRequestWant;
let specifiedId;
export default class MainAbility6 extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.info(LOG_PREFIX + 'onCreate');

    launchWant = this.launchWant;
    lastRequestWant = this.lastRequestWant;
    specifiedId = this.specifiedId;
    
    let CommonEventPublishData = {
      parameters: {
        launchWant: launchWant,
        lastRequestWant: lastRequestWant,
        launchReason: launchParam.launchReason,
        lastExitReason: launchParam.lastExitReason,
        specifiedId: specifiedId
      }
    };
    
    commonEvent.publish(EVENT_PREFIX + 'onCreate', CommonEventPublishData, (err) => {
      console.info(LOG_PREFIX + EVENT_PREFIX + 'onCreate');
    });

    setTimeout(() => {
      this.context.terminateSelf()
        .then((data) => {
          console.info(LOG_PREFIX + 'terminateSelf data = ' + JSON.stringify(data));
        })
        .catch((err) => {
          console.info(LOG_PREFIX + 'terminateSelf err = ' + JSON.stringify(err));
        });
    }, 2000);
  }

  onDestroy() {
    console.info(LOG_PREFIX + 'onDestroy');

    commonEvent.publish(EVENT_PREFIX + 'onDestroy', (err) => {
      console.info(LOG_PREFIX + EVENT_PREFIX + 'onDestroy');
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    console.info(LOG_PREFIX + 'onWindowStageCreate');

    windowStage.loadContent(MAIN_PAGE_PATH, undefined)
      .then(() => {
        console.info(LOG_PREFIX + 'loadContent success');
      })
      .catch((err) => {
        console.error(LOG_PREFIX + 'loadContent failed: ' + JSON.stringify(err));
      });
  }

  onWindowStageDestroy() {
    console.info(LOG_PREFIX + 'onWindowStageDestroy');
  }

  onForeground() {
    console.info(LOG_PREFIX + 'onForeground');
  }

  onBackground() {
    console.info(LOG_PREFIX + 'onBackground');
  }
}