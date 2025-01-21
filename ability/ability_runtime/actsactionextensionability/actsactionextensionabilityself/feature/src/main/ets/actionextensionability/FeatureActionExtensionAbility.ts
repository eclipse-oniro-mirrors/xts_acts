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
import ActionExtensionAbility from '@ohos.app.ability.ActionExtensionAbility';
import commonEventManager from '@ohos.commonEventManager';

export default class FeatureActionExtensionAbility extends ActionExtensionAbility {
  storage: LocalStorage;
  message: string;
  onCreate() {
  }

  onForeground() {
    console.log('====>FeatureActionExtensionAbility onForeground called');
  }

  onBackground() {
    console.log('====>FeatureActionExtensionAbility onBackground called');
  }

  onSessionCreate(want, session) {
    console.log('====>FeatureActionExtensionAbility onSessionCreate called');
    commonEventManager.publish('ACTS_FEATURE_CREATE', function () {});
    if (want.action === 'Acts_ActionExtensionAbility_0400') {
      this.context.startAbility({
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'FeatureAbility',
        action: 'Acts_ActionExtensionAbility_0400'
      });
    }
    this.message = want.parameters.shareMessages;
    this.storage = new LocalStorage(
      {
        'session': session,
        'messages': this.message
      });
    session.loadContent('pages/Index2', this.storage);
  }

  onDestroy() {
    console.log('====>FeatureActionExtensionAbility onDestroy called');
  }

  onSessionDestroy(session) {
    console.log('====>FeatureActionExtensionAbility onSessionDestroy called');
  }
}
