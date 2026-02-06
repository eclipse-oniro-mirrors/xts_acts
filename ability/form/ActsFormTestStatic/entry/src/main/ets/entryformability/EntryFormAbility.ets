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

import hilog from '@ohos.hilog';
import formBindingData from '@ohos.app.form.formBindingData';
import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility';
import formInfo from '@ohos.app.form.formInfo';
import Want from '@ohos.app.ability.Want';
import { Configuration } from '@ohos.app.ability.Configuration';
import CommonEventManager from '@ohos.commonEventManager';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag EntryFormAbility';

function onAcquireFormStateCallback(want: Want): formInfo.FormState {
  try {
    let options: CommonEventManager.CommonEventPublishData = {
      code: 0,			 // Result code of the common event.
      data: 'onAcquireFormState is called',// Result data of the common event.
      isOrdered: true	 // The common event is an ordered one.
    }
    hilog.info(DOMAIN, TAG, 'OnAcquireFormState callback success');
    CommonEventManager.publish('XTS_FormExtensionAbilityOnAcquireFormStateTest_commonEvent', options, () => {
      hilog.info(DOMAIN, TAG, 'OnAcquireFormStateTest001 commonEvent publish');
    })
    hilog.info(DOMAIN, TAG, 'OnAcquireFormState register success');;
    return formInfo.FormState.READY;
  } catch (error) {
    hilog.error(DOMAIN, TAG, `OnAcquireFormState catch error: ${error}`);
    return formInfo.FormState.UNKNOWN;
  }
}

export default class EntryFormAbility extends FormExtensionAbility {

  constructor() {
    hilog.error(DOMAIN, TAG, 'constructor register');

    try {
      this.onStop = () => {
        hilog.info(DOMAIN, TAG, 'OnStop callback success');
        CommonEventManager.publish('XTS_FormExtensionAbilityOnStopTest_commonEvent', () => {
          hilog.info(DOMAIN, TAG, 'OnStopTest001 commonEvent publish');
        })
      }
      hilog.info(DOMAIN, TAG, 'OnStop register success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'OnStop catch error');
    }

    this.onAcquireFormState = onAcquireFormStateCallback;
  }

  onAddForm(want: Want) : formBindingData.FormBindingData {
    hilog.info(DOMAIN, TAG, 'onAddForm testing');
    const formData = '';
    return formBindingData.createFormBindingData(formData);
  }

  onCastToNormalForm(formId: string) {
    hilog.info(DOMAIN, TAG, 'onCastToNormalForm testing');
  }

  onFormEvent(formId: string, message: string) {
    hilog.info(DOMAIN, TAG, 'onFormEvent testing');
  }

  onRemoveForm(formId: string) {
    hilog.info(DOMAIN, TAG, 'onRemoveForm testing');
  }

  onConfigurationUpdate(newConfig: Configuration) {
    hilog.info(DOMAIN, TAG, 'onConfigurationUpdate testing');
    CommonEventManager.publish('XTS_FormExtensionAbilityOnConfigurationUpdate_commonEvent', () => {
      hilog.info(DOMAIN, TAG, 'OnConfigurationUpdateStaticTest001 commonEvent publish');
    });
  }
}
