/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { AbilityStage, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Configuration } from '@ohos.app.ability.Configuration';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

const TAG: string = 'testTag-TestAbilityStage';

export default class TestAbilityStage extends AbilityStage {
  onCreate(): void {
    // 应用HAP首次加载时触发，可以在此执行该Module的初始化操作（例如资源预加载、线程创建等）。
    let caseTAG = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp';
    hilog.info(0x0000, TAG, '[%{public}s] TestAbilityStage onCreate', caseTAG);
  }

  onConfigurationUpdate(config: Configuration) {
    let caseTAG = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp';
    hilog.info(0x0000, TAG, '[%{public}s] TestAbilityStage onConfigurationUpdate, config:  %{public}s', caseTAG, JSON.stringify(config));
    let options: commonEventManager.CommonEventPublishData = {
      code: 1,
      parameters: {
        'from': 'TestAbilityStage_onConfigurationUpdate',
        'fontSize': config.fontSizeScale
      }
    };
    commonEventManager.publish('TestAbilityStage_onConfigurationUpdate', options, (err: BusinessError) => {
      if (err) {
        hilog.info(0x0000, TAG, '[%{public}s] PublishCallBack err: %{public}s', caseTAG, JSON.stringify(err));
      } else {
        hilog.info(0x0000, TAG, '[%{public}s] Publish success', caseTAG);
      }
    });
  }
}
