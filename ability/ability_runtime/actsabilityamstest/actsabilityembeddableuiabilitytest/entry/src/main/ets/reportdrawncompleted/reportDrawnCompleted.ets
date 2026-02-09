/*
 * Copyright (C) 2024 HiHope Open Source Organization
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { AbilityConstant, UIAbility, Want, UIExtensionAbility, UIExtensionContentSession } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import EmbeddableUIAbility from '@ohos.app.ability.EmbeddableUIAbility';
const TAG0: string = '[testTAG] UIExtAbility';
const TAG: string = 'ReportDrawnCompleted';

const DOMAIN_NUMBER: number = 0xFF00;

export default class ReportDrawnCompleted extends  EmbeddableUIAbility{
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onWindowStageCreate');
    let reportKey:number=0;
    windowStage.loadContent('pages/reportdrawncompleted', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTAG', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      try {
        this.context.reportDrawnCompleted((err) => {
          if (err.code) {
            console.error(`reportDrawnCompleted failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          reportKey++;
          let options: commonEventManager.CommonEventPublishData = {
            code: 3,
            data: JSON.stringify(reportKey),
          };
          console.log('this moveAbilityToBackground' +options.data);
          commonEventManager.publish('reportDrawn', options, async (err: BusinessError) => {
            if (err) {
              hilog.error(DOMAIN_NUMBER, TAG, 'PublishCallBack err = ' + JSON.stringify(err));
            } else {
              hilog.info(DOMAIN_NUMBER, TAG, 'this push data success reportDrawn');
            }
          });
          console.info('reportDrawnCompleted succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`reportDrawnCompleted failed, code is ${code}, message is ${message}`);
      }
    });
    console.log('MainAbility onWindowStageCreate');
  };

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onForeground');
    setTimeout(() => { 
      this.context.terminateSelf(); 
    }, 500);
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onBackground');
  }


}
