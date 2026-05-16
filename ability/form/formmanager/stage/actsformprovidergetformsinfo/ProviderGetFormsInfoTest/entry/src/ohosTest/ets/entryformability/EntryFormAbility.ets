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
import CommonEventManager from '@ohos.commonEventManager';

export default class EntryFormAbility extends FormExtensionAbility {

  private formOnUpdataSizeEvent = 'FMS_FormOnUpdateSize_commonEvent';
  private formOnLocationChanged = 'FMS_FormOnLocationChanged_commonEvent';

  private publishUpdateSizeCallBack = () => {
    console.debug(`====> formUpdateSizeEventCallBack ====>`);
  }

  private publishFormLocationChanged = () => {
    console.debug(`====> publishFormLocationChanged ====>`);
  }

  onAddForm(want: Want) {
    console.log('===>  onAddForm')
    let param: Record<string, string> = {};
    let wants = want?.parameters;
    if (wants) {
      let launchReason = wants['formInfo.FormParam.LAUNCH_REASON_KEY'] as number;
      let originalFormId = wants[formInfo.FormParam.ORIGINAL_FORM_KEY] as string;
      if (launchReason == formInfo.LaunchReason.FORM_SIZE_CHANGE) {
        param = {'original_formid': originalFormId};
      }
    }
    return formBindingData.createFormBindingData(param);
  }

  onCastToNormalForm(formId: string) {
  }

  onUpdateForm(formId: string) {
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

  onSizeChanged(formId: string, newDimension: formInfo.FormDimension, newRect: formInfo.Rect): void {
    console.info(`onSizeChanged param: formId:${formId} newDimesnion:${newDimension}, newRect:${JSON.stringify(newRect)}`);
    let commonEventPublishData:CommonEventManager.CommonEventPublishData = {
      code: 0
    };
    CommonEventManager.publish(this.formOnUpdataSizeEvent, commonEventPublishData, this.publishUpdateSizeCallBack);
  }

  onFormLocationChanged(formId: string, newFormLocation: formInfo.FormLocation) {
    console.info('EntryFormAbility onFormLocationChanged current location: ' + newFormLocation);
    let commonEventPublishData:CommonEventManager.CommonEventPublishData = {
      code: 0
    };
    CommonEventManager.publish(this.formOnLocationChanged, commonEventPublishData, this.publishFormLocationChanged);
  }
};