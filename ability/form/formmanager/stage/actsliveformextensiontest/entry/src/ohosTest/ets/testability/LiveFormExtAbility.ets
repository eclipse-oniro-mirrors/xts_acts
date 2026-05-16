/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { formInfo } from '@kit.FormKit';
import { UIExtensionContentSession } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import LiveFormExtensionAbility, { LiveFormInfo } from '@ohos.app.form.LiveFormExtensionAbility';

const TAG = 'LiveFormExtAbility';

export default class LiveFormExtAbility extends LiveFormExtensionAbility {
  onLiveFormCreate(liveFormInfo: LiveFormInfo, session: UIExtensionContentSession) {
    let formId: string = liveFormInfo.formId;
    let rect: formInfo.Rect = liveFormInfo.rect;
    let borderRadius: number = liveFormInfo.borderRadius;
    hilog.info(0x0000, TAG, `onLiveFormCreate, formId: ${formId}, borderRadius: ${borderRadius}, width: ${rect.width}`);

    try {
      this.context.startAbilityByLiveForm({});
    } catch (error) {
      if(error.code === 801) {
        hilog.info(0x0000, TAG, `startAbilityByLiveForm error code: 801`);
      } else if (error.code === 16500050) {
        hilog.info(0x0000, TAG, `startAbilityByLiveForm error code: 16500050`);
      } else if (error.code === 16500100) {
        hilog.info(0x0000, TAG, `startAbilityByLiveForm error code: 16500100`);
      } else if (error.code === 16501000) {
        hilog.info(0x0000, TAG, `startAbilityByLiveForm error code: 16501000`);
      } else if(error.code === 16501011) {
        hilog.info(0x0000, TAG, `startAbilityByLiveForm error code: 16501011`);
      }
    }

    let storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('context', this.context);
    session.loadContent('pages/LiveForm', storage);
  }

  onLiveFormDestroy(liveFormInfo: LiveFormInfo) {
    hilog.info(0x0000, TAG, `onLiveFormDestroy, liveFormInfo: ${JSON.stringify(liveFormInfo)}`);
  }
}