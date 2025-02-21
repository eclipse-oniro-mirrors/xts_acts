/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import commonEventManager from '@ohos.commonEventManager';

var TAG1 = 'StageOnAndOffScreen:MainAbility:';
var listPush1 = "StageOnAndOffScreen_MainAbility_";
var lifeList = [];

export default class MainAbility extends Ability {
  onCreate(want, launchParam) {
    console.log(TAG1 + 'onCreate');
    lifeList.push('onCreate');
  }

  onDestroy() {
    console.log(TAG1 + 'onDestroy');
  }

  onWindowStageCreate(windowStage) {
    console.log(TAG1 + 'onWindowStageCreate');

    windowStage.loadContent("pages/index", (err, data) => {
      if (err.code) {
        console.log(TAG1 + 'Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      console.log(TAG1 + 'Succeeded in loading the content. Data: ' + JSON.stringify(data));
    });
  }

  onWindowStageDestroy() {
    console.log(TAG1 + 'onWindowStageDestroy');
  }

  onForeground() {
    console.log(TAG1 + 'onForeground');
    lifeList.push('onForeground');

    let options = {
      parameters: {
        lifeList: lifeList
      }
    }
    commonEventManager.publish(listPush1 + "onForeground", options, (err) => {
      console.log(TAG1 + listPush1 + "onForeground");
    });
  }

  onBackground() {
    console.log(TAG1 + 'onBackground');
    lifeList.push('onBackground');

    let options = {
      parameters: {
        lifeList: lifeList
      }
    }
    commonEventManager.publish(listPush1 + "onBackground", options, (err) => {
      console.log(TAG1 + listPush1 + "onBackground");
    });
  }
};
