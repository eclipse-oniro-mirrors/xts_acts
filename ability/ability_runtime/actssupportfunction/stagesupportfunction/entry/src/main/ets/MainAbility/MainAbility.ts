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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';
import window from '@ohos.window';

const TAG1 = 'StageSupportFunction:MainAbility:';
const listPush1 = "Stage_SupportFunction_MainAbility_";
let status1:boolean = undefined;
let status2:boolean = undefined;
let lifeList: string[] = [];
function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}
export default class MainAbility extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log(TAG1 + 'onCreate : status1 : ' + status1 + ' ,ifeList : ' + JSON.stringify(lifeList));
    status1 = this.context.isTerminating();
    lifeList.push('onCreate');

    commonEvent.publish(listPush1 + "onCreate", (err) => {
      console.log(TAG1 + listPush1 + "onCreate");
    });

    setTimeout(() => {
      if (want.parameters.number == 1) {
        this.context.terminateSelf().then((data) => {
          console.log(TAG1 + "terminateSelfWithResult data = " + JSON.stringify(data));
        }).catch((error:BusinessError) => {
          console.log(TAG1 + "terminateSelfWithResult error = " + JSON.stringify(error));
        })
      }
      if (want.parameters.number == 2) {
        let wantNum:common.AbilityResult = {
          want: {
            bundleName: "ohos.acts.aafwk.test.stagesupportfunction",
            abilityName: "MainAbility"
          },
          resultCode: 12120
        }
        this.context.terminateSelfWithResult(wantNum).then((data) => {
          console.log(TAG1 + "terminateSelfWithResult data = " + JSON.stringify(data));
        }).catch((error:BusinessError) => {
          console.log(TAG1 + "terminateSelfWithResult error = " + JSON.stringify(error));
        })
      }
    }, 2000);
  }

  async onDestroy(): Promise<void>{
    console.log(TAG1 + 'onDestroy');
    lifeList.push('onDestroy');
    status2 = this.context.isTerminating();
    let options:commonEventManager.CommonEventPublishData = {
      parameters: {
        isTerminating1: status1,
        isTerminating2: status2,
        lifeList: lifeList
      }
    }
    commonEvent.publish(listPush1 + "onDestroy", options, (err) => {
      console.log(TAG1 + listPush1 + "onDestroy");
    });
    await sleep(500);
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    console.log(TAG1 + 'onWindowStageCreate');
    lifeList.push('onWindowStageCreate');

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
  }

  onBackground() {
    console.log(TAG1 + 'onBackground');
  }

  onBackPressed(): boolean {
    console.log(TAG1 + 'onBackPressed');
    return false;
  }
};
