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

let count = 0;
const TIME_OUT = 500;
export default class ActsActionExtensionAbility extends ActionExtensionAbility {
  storage: LocalStorage;
  message: string;
  onCreate() {
    console.log('====>ActsActionExtensionAbility onCreate called');
    count++;
  }

  onForeground() {
    console.log('====>ActsActionExtensionAbility onForeground called');
    count++;
    let options = {
      parameters: {
        'count': count
      }
    };
    commonEventManager.publish('ACTS_TEST_FOREGROUND', options, function () {});
  }

  onBackground() {
    console.log('====>ActsActionExtensionAbility onBackground called');
    count++;
    commonEventManager.publish('ACTS_TEST_BACKGROUND', function () {});
    setTimeout(() => {
      globalThis.session.terminateSelf();
    }, TIME_OUT);
  }

  onSessionCreate(want, session) {
    console.log('====>ActsActionExtensionAbility onSessionCreate called');
    count++;
    this.message = want.parameters.shareMessages;
    this.storage = new LocalStorage(
      {
        'session': session,
        'messages': this.message
      });
    session.loadContent('pages/PageThree', this.storage);
    globalThis.session = session;
  }

  onDestroy() {
    console.log('====>ActsActionExtensionAbility onDestroy called');
    count++;
    let options = {
      parameters: {
        'count': count
      }
    };
    commonEventManager.publish('ACTS_TEST_DESTROY', options, function () {});
  }

  onSessionDestroy(session) {
    console.log('====>ActsActionExtensionAbility onSessionDestroy called');
    count++;
  }
}