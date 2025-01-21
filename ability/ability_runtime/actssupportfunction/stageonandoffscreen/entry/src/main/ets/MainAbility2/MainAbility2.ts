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

var TAG2 = 'StageOnAndOffScreen:MainAbility2:';
var listPush2 = "StageOnAndOffScreen_MainAbility2_";

export default class MainAbility2 extends Ability {
  onCreate(want, launchParam) {
    console.log(TAG2 + 'onCreate');

    commonEventManager.publish(listPush2 + "onCreate", (err) => {
      console.log(TAG2 + listPush2 + "onCreate");
    });
  }

  onDestroy() {
    console.log(TAG2 + 'onDestroy');

    commonEventManager.publish(listPush2 + "onDestroy", (err) => {
      console.log(TAG2 + listPush2 + "onDestroy");
    });
  }

  onWindowStageCreate(windowStage) {
    console.log(TAG2 + 'onWindowStageCreate');

    commonEventManager.publish(listPush2 + "onWindowStageCreate", (err) => {
      console.log(TAG2 + listPush2 + "onWindowStageCreate");
    });

    windowStage.loadContent("pages/second", (err, data) => {
      if (err.code) {
        console.log(TAG2 + 'Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      console.log(TAG2 + 'Succeeded in loading the content. Data: ' + JSON.stringify(data));
    });
  }

  onWindowStageDestroy() {
    console.log(TAG2 + 'onWindowStageDestroy');

    commonEventManager.publish(listPush2 + "onWindowStageDestroy", (err) => {
      console.log(TAG2 + listPush2 + "onWindowStageDestroy");
    });
  }

  onForeground() {
    console.log(TAG2 + 'onForeground');

    commonEventManager.publish(listPush2 + "onForeground", (err) => {
      console.log(TAG2 + listPush2 + "onForeground");
    });

    setTimeout(async () => {
      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.stageonandoffscreen",
        abilityName: "MainAbility3"
      }
      this.context.startAbility(wantNum).then((data) => {
        console.log(TAG2 + "startAbility data = " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG2 + "startAbility error = " + JSON.stringify(error));
      })
    }, 1000);
  }

  onBackground() {
    console.log(TAG2 + 'onBackground');

    commonEventManager.publish(listPush2 + "onBackground", (err) => {
      console.log(TAG2 + listPush2 + "onBackground");
    });
  }
};
