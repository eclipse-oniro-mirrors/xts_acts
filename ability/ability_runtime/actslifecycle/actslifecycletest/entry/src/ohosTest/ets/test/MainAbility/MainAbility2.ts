/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import UIAbility from '@ohos.app.ability.UIAbility';
import base, { BusinessError } from '@ohos.base';
import { hilog } from '@kit.PerformanceAnalysisKit';
import window from '@ohos.window';
import { Want } from '@kit.AbilityKit';
import { commonEventManager } from '@kit.BasicServicesKit';

const TAG: string = 'testTag-MainAbility2 ';
export default class MainAbility2 extends UIAbility {
    onCreate(want, launchParam): void {
        console.log('[Demo] MainAbility2 onCreate');
        try {
            console.log('js crash success');
            JSON.parse("");
        } catch (error) {
            console.error('JS 崩溃:', error);
        };
    }
    onDestroy(): void {
        hilog.info(0x0000, TAG, '%{public}s', 'MainAbility2 onDestroy');
      }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log('[Demo] MainAbility2 onWindowStageCreate');
        windowStage.loadContent('testability/pages/MainAbility2_pages', (err, data) => {
            if (err.code) {
                hilog.error(0x0000, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.info(0x0000, TAG, 'Succeeded in loading the content. Data: %{public}s',
                JSON.stringify(data) ?? '');
        });
    }
    onWindowStageDestroy(): void {
        hilog.info(0x0000, TAG, '%{public}s', 'MainAbility2 onWindowStageDestroy');
      }
    
      onForeground(): void {
        hilog.info(0x0000, TAG, '%{public}s', 'MainAbility2 onForeground');
      }
    
      onBackground(): void {
        hilog.info(0x0000, TAG, '%{public}s', 'MainAbility2 onBackground');
      }

    onWindowStageWillDestroy(): void {
        console.log('[Demo] MainAbility2 onWindowStageWillDestroy');
        let options: commonEventManager.CommonEventPublishData = {
            code: 1,
        };
        commonEventManager.publish('OnWindowStageWillDestory06', options, (err: BusinessError) => {
            if (err) {
                hilog.info(0x0000, TAG, '[%{public}s] PublishCallBack err: %{public}s', TAG, JSON.stringify(err));
            } else {
                hilog.info(0x0000, TAG, '[%{public}s] Publish success', TAG);
            }
        });
    }
};
