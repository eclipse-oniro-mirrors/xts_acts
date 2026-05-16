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

var TAG3 = 'StageOnAndOffScreen:MainAbility3:';
var listPush3 = "StageOnAndOffScreen_MainAbility3_";

export default class MainAbility3 extends Ability {
  onCreate(want, launchParam) {
    console.log(TAG3 + 'onCreate');
  }

  onDestroy() {
    console.log(TAG3 + 'onDestroy');
  }

  onWindowStageCreate(windowStage) {
    console.log(TAG3 + 'onWindowStageCreate');

    windowStage.loadContent("pages/third", (err, data) => {
      if (err.code) {
        console.log(TAG3 + 'Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      console.log(TAG3 + 'Succeeded in loading the content. Data: ' + JSON.stringify(data));
    });
  }

  onWindowStageDestroy() {
    console.log(TAG3 + 'onWindowStageDestroy');
  }

  onForeground() {
    console.log(TAG3 + 'onForeground');

    commonEventManager.publish(listPush3 + "onForeground", (err) => {
      console.log(TAG3 + listPush3 + "onForeground");
    });
  }

  onBackground() {
    console.log(TAG3 + 'onBackground');

    commonEventManager.publish(listPush3 + "onBackground", (err) => {
      console.log(TAG3 + listPush3 + "onBackground");
    });
  }
};
