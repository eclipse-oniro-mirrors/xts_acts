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

import formBindingData from '@ohos.app.form.formBindingData';
import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility';
import formInfo from '@ohos.app.form.formInfo';
import formProvider from '@ohos.app.form.formProvider';
import Want from '@ohos.app.ability.Want';
import { Configuration } from '@ohos.app.ability.Configuration';

export default class EntryFormAbility extends FormExtensionAbility {

  onAddForm(want: Want) {
    console.log('===>  onAddForm')
    try {
      this.context.startAbility({
        bundleName: 'com.example.menuprovider',
        abilityName: 'EntryAbility'
      });
    } catch (e) {
    };
    return formBindingData.createFormBindingData({
    });
  }

  onCastToNormalForm(formId: string) {
  }

  onUpdateForm(formId: string, wantParams?: Record<string, Object>) {
    console.log('===>  onUpdateForm')
    let bindingData = formBindingData.createFormBindingData({
      newValue: 'default updated'
    });
    formProvider.updateForm(formId, bindingData)
      .then(() => {
        console.log('onUpdateForm success')
      })
      .catch((err: Error) => {
        console.log('onUpdateForm failed', JSON.stringify(err))
      });
  }

  onChangeFormVisibility(newStatus: Record<string, number>) {
  }

  onFormEvent(formId: string, message: string) {
  }

  onRemoveForm(formId: string) {
  }

  onAcquireFormState(want: Want) {
    return formInfo.FormState.READY;
  }
  onStop() {
  }

  onConfigurationUpdate(newConfig: Configuration) {

  }
};