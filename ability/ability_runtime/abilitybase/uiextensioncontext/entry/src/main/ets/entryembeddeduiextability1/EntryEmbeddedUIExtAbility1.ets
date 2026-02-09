/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIExtensionContentSession, Want } from '@kit.AbilityKit';
import EmbeddedUIExtensionAbility from '@ohos.app.ability.EmbeddedUIExtensionAbility';

const DOMAIN = 0x0000;

export default class EntryEmbeddedUIExtAbility1 extends EmbeddedUIExtensionAbility {
  onCreate() {
    hilog.info(DOMAIN, 'testTag', `onCreate`);
  }

  onForeground() {
    hilog.info(DOMAIN, 'testTag', `onForeground`);
  }

  onBackground() {
    hilog.info(DOMAIN, 'testTag', `onBackground`);
  }

  onDestroy() {
    hilog.info(DOMAIN, 'testTag', `onDestroy`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    const storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('session', session);
    session.loadContent('entryembeddeduiextability1/pages/EntryEmbeddedUIExtAbility1Page', storage);
    hilog.info(DOMAIN, 'testTag', `onSessionCreate done`);
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    session.terminateSelf().catch(() => {
      // handle error
    });
    hilog.info(DOMAIN, 'testTag', `onSessionDestroy`);
  }
}
