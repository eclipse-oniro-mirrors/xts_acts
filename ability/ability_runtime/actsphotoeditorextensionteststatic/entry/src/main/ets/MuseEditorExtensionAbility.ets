/**
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

import Want from '@ohos.app.ability.Want'
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession'
import PhotoEditorExtensionAbility from '@ohos.app.ability.PhotoEditorExtensionAbility'
import { AppStorage, LocalStorage } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog';
import image from '@ohos.multimedia.image'
import common from '@ohos.app.ability.common'

const TAG = 'MuseEditorExtensionAbility';


export default class MuseEditorExtensionAbility extends PhotoEditorExtensionAbility {
  onCreate() {
    hilog.info(0x0000, TAG, 'MuseEditorExtensionAbility onCreate')
  }

  onStartContentEditing(uri: string, want: Want, session: UIExtensionContentSession): void {
    hilog.info(0x0000, TAG, `MuseEditorExtensionAbility startContentEditing want ==> ${JSON.stringify(want)}`)

    const obj: Record<string, Any> = {
      'session': session,
      'uri': uri,
    };
    const storage : LocalStorage = new LocalStorage(obj);
    AppStorage.setOrCreate<string>('entry', 'entry');
    AppStorage.setOrCreate<common.PhotoEditorExtensionContext>('uiextension', this.context);

    session.loadContent('pages/PhotoEditor', storage);

    hilog.info(0x0000, TAG, `MuseEditorExtensionAbility onStartContentEditing loadcontent end`);
  }

  onForeground() {
    hilog.info(0x0000, TAG, 'MuseEditorExtensionAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, TAG, 'MuseEditorExtensionAbility onBackground');
  }

  onDestroy() : Promise<void>|undefined {
    hilog.info(0x0000, TAG, 'MuseEditorExtensionAbility onDestroy');
    return undefined;
  }
}