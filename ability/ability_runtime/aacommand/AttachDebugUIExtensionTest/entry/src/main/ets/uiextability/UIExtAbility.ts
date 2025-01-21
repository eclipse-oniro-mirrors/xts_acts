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

import UIExtensionAbility from '@ohos.app.ability.UIExtensionAbility';
import hilog from '@ohos.hilog';
import type window from '@ohos.window';

const TAG: string = '[UIExtAbility]';

export default class UIExtAbility extends UIExtensionAbility {
  onCreate() {
    console.info(TAG, 'UIExtAbility onCreate');
  }

  onForeground() {
    console.info(TAG, 'UIExtAbility onForeground');
  }

  onBackground() {
    console.info(TAG, 'UIExtAbility onBackground');
  }

  onDestroy() {
    console.info(TAG, 'UIExtAbility onDestroy');
  }

  onSessionCreate(want, session) {
    console.info(TAG, `UIExtAbility onSessionCreate, want: ${JSON.stringify(want)}`);
    let storage = new LocalStorage({
      'session': session
    });
    session.loadContent('pages/Index', storage);
    globalThis.session = session;
  }

  onSessionDestroy(session) {
    console.info(TAG, 'UIExtAbility onSessionDestroy');
  }
}