/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { AbilityStage, appRecovery, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { commonEventManager } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;

export default class MyAbilityStage extends AbilityStage {
  private event4: string = 'com.acts.ability.asynclifecycletest.event4';
  private event5: string = 'com.acts.ability.asynclifecycletest.event5';

  onCreate(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'entry.MyAbilityStage onCreate');
    appRecovery.enableAppRecovery();
  }

  onAcceptWant(want: Want): string {
    hilog.info(DOMAIN, 'testTag', '%{public}s', `entry.MyAbilityStage onAcceptWant. want: ${JSON.stringify(want)}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      data: 'onAcceptWant',
      parameters: {
        want: JSON.stringify(want)
      }
    };
    commonEventManager.publish(this.event4, commonEventData, (err) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish: ${commonEventData.data}`);
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish ${this.event4}. result: ${JSON.stringify(err)}`);
    });
    return 'Entry.MyAbilityStage.onAcceptWant';
  }

  onNewProcessRequest(want: Want): string {
    hilog.info(DOMAIN, 'testTag', '%{public}s', `entry.MyAbilityStage onNewProcessRequest. want: ${JSON.stringify(want)}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      data: 'onNewProcessRequest'
    };
    commonEventManager.publish(this.event5, commonEventData, (err) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish: ${commonEventData.data}`);
      hilog.info(DOMAIN, 'testTag', '%{public}s', `MyAbilityStage publish ${this.event5}. result: ${JSON.stringify(err)}`);
    });
    return 'Entry.MyAbilityStage.MyUIAbilityProcess';
  }
}