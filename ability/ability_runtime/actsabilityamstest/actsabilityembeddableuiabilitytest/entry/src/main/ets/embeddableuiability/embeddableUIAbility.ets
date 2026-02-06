/*
 * Copyright (C) 2024 HiHope Open Source Organization
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
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import EmbeddableUIAbility from '@ohos.app.ability.EmbeddableUIAbility';


const TAG: string = 'EmbeddableToUIAbility';
const DOMAIN_NUMBER: number = 0xFF00;

export default class EmbeddableToUIAbility extends EmbeddableUIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onCreate in embeddableUIAbility');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onDestroy in embeddableUIAbility');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onWindowStageCreate  in embeddableUIAbility');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTAG', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTAG', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onWindowStageDestroy Ability onForeground');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onForeground in embeddableUIAbility');
    let isTerminating: boolean = this.context.isTerminating();
    console.log('start embeddableUIAbility is success');
    console.info(`isTerminating state is ${isTerminating}`);
    let options: commonEventManager.CommonEventPublishData = {
      code: 1,
      data: JSON.stringify(isTerminating),
    };
    console.log('this isTerminating' +options.data)
    commonEventManager.publish('isTerminating', options, async (err: BusinessError) => {
      if (err) {
        hilog.error(DOMAIN_NUMBER, TAG, 'PublishCallBack err = ' + JSON.stringify(err));
      } else {
        hilog.info(DOMAIN_NUMBER, TAG, 'this push data success embeddableUIAbility');
      }
    });
    setTimeout(() => { 
      this.context.terminateSelf(); 
    }, 500);
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onBackground in embeddableUIAbility');
  }
}
