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
import { AbilityConstant, common, UIAbility, Want, wantConstant } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import EmbeddableUIAbility from '@ohos.app.ability.EmbeddableUIAbility';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

const TAG: string = 'TerminateSelfWithResult';
const DOMAIN_NUMBER: number = 0xFF00;

export default class TerminateSelfWithResult extends EmbeddableUIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void  {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onCreate');
    if (want.parameters) {
      hilog.debug(0x0000, 'testTAG', '%{public}s',
        'Ability onCreate:' + JSON.stringify(want.parameters[wantConstant.Params.SHOW_MODE_KEY]));
      console.log('22222'+JSON.stringify(want));
    }
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTAG', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTAG', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    let want: Want = {
      bundleName: 'com.example.appa',
      abilityName: 'startAbility'
    };
    let resultCode = 100;
    let abilityResult: common.AbilityResult = {
      want,
      resultCode
    };

    try {
      this.context.terminateSelfWithResult(abilityResult, (err: BusinessError) => {
        if (err.code) {
          console.error(`terminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.info('terminateSelfWithResult succeed');
        let options: commonEventManager.CommonEventPublishData = {
          code: 9,
        };
        console.log('this terminateSelfWithResult' +options.data);
        commonEventManager.publish('startAbilityForResult', options, async (err: BusinessError) => {
          if (err) {
            hilog.error(DOMAIN_NUMBER, TAG, 'PublishCallBack err = ' + JSON.stringify(err));
          } else {
            hilog.info(DOMAIN_NUMBER, TAG, 'this push data success terminateSelfWithResult');
          }
        });
      });
    } catch (err) {
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      console.error(`terminateSelfWithResult failed, code is ${code}, message is ${message}`);
    }
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onBackground');

  }
}
