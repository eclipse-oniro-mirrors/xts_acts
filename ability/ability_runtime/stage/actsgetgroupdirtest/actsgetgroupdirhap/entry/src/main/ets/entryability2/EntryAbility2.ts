/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

function sleep(time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}
export default class EntryAbility2 extends Ability {
  onCreate(want, launchParam) {
    this.context.getGroupDir('context_hap2').then(data => {
      let commonEventData = {
        parameters:{
          res: data,
        }
      };
      console.error('getgroupdirhap2 getGroupDir ====> result data' + data);
      commonEvent.publish('ACTS_GETGROUP2_EVENT', commonEventData, (err) => {
        console.log('getgroupdirhap2 getGroupDir publish err:' + JSON.stringify(err));
      });
    }).catch((error) => {
      console.error('getgroupdirhap2 getGroupDir ====> result err' + JSON.stringify(error));
    });
  }

  onDestroy() {
    console.log('[Demo] EntryAbility2 onDestroy');
  }

  onWindowStageCreate(windowStage) {
    console.log('[Demo] EntryAbility2 onWindowStageCreate');
    windowStage.setUIContent(this.context, 'pages/Index', null);
  }

  onWindowStageDestroy() {
    console.log('[Demo] EntryAbility2 onWindowStageDestroy');
  }

  onForeground() {
    console.log('[Demo] EntryAbility2 onForeground');
  }

  onBackground() {
    console.log('[Demo] EntryAbility2 onBackground');
  }
};
