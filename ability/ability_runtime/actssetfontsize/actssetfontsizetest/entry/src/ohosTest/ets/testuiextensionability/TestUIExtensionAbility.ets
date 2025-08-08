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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { common, OpenLinkOptions, UIExtensionContentSession, UIExtensionAbility, Want } from '@kit.AbilityKit';
import { Configuration } from '@ohos.app.ability.Configuration';
import EmbeddedUIExtensionAbility from '@ohos.app.ability.EmbeddedUIExtensionAbility';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { rpc } from '@kit.IPCKit';

const DOMAIN = 0x0000;
const TAG: string = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_TestUIExtensionAbility';


export default class TestUIExtensionAbility extends EmbeddedUIExtensionAbility {
  onCreate() {
    hilog.info(0x0000, TAG, '[%{public}s] TestUIExtensionAbility onCreate', TAG);
  }

  onForeground() {
    hilog.info(0x0000, TAG, '[%{public}s] TestUIExtensionAbility onForeground', TAG);
  }

  onBackground() {
    hilog.info(0x0000, TAG, '[%{public}s] TestUIExtensionAbility onBackground', TAG);
  }

  onDestroy() {
    hilog.info(0x0000, TAG, '[%{public}s] TestUIExtensionAbility onDestroy', TAG);
  }

  async onSessionCreate(want: Want, session: UIExtensionContentSession) {
    hilog.info(0x0000, TAG, '[%{public}s] TestUIExtensionAbility onSessionCreate', TAG);
    const storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('session', session);
    session.loadContent('testuiextensionability/pages/TestUIExtensionAbilityPage', storage);
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    session.terminateSelf().catch(() => {
    });
    hilog.info(0x0000, TAG, '[%{public}s] TestUIExtensionAbility onSessionDestroy', TAG);
  }

  onConfigurationUpdate(config: Configuration) {
    let caseTAG = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp';
    hilog.info(0x0000, TAG, '[%{public}s] TestUIExtensionAbility onConfigurationUpdate, config:  %{public}s', caseTAG, JSON.stringify(config));
    let options: commonEventManager.CommonEventPublishData = {
      code: 1,
      parameters: {
        'from': 'TestUIExtensionAbility_onConfigurationUpdate',
        'fontSize': config.fontSizeScale
      }
    };
    commonEventManager.publish('TestUIExtensionAbility_onConfigurationUpdate', options, (err: BusinessError) => {
      if (err) {
        hilog.info(0x0000, TAG, '[%{public}s] PublishCallBack err: %{public}s', caseTAG, JSON.stringify(err));
      } else {
        hilog.info(0x0000, TAG, '[%{public}s] Publish success', caseTAG);
      }
    });
  }
}
