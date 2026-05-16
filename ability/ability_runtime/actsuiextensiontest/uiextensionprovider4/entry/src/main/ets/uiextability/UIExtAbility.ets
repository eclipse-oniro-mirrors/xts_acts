/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { UIExtensionContentSession, UIExtensionAbility, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import './pages/UIExtAbilityPage';

export default class UIExtAbility extends UIExtensionAbility {
  onCreate() {
    hilog.info(0x0000, 'testTag', `onCreate`);
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', `onForeground`)
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', `onBackground`)
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', `onDestroy`)
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    let storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('session', session);

    let name: string = 'UIExtPage';
    try {
      session.loadContentByName(name, storage);
    } catch (error) {
      let code = (error as BusinessError).code;
      let message = (error as BusinessError).message;
      console.error(`Failed to load content by name ${name}, code: ${code}, msg: ${message}`);
    }
    hilog.info(0x0000, 'testTag', `onSessionCreate done`)
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    hilog.info(0x0000, 'testTag', `onSessionDestroy`)
  }
}
