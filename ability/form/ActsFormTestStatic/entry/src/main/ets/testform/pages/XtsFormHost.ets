/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Text,
  Button,
  ClickEvent,
  Column,
  Row,
  Scroll,
  FormComponent,
  FormComponentAttribute,
  FormCallbackInfo,
  Visibility,
  FormDimension,
  Component,
  Entry,
  Callback
} from '@ohos.arkui.component';
import { BusinessError, RecordData } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import formHost from '@ohos.app.form.formHost';
import formInfo from '@ohos.app.form.formInfo';
import formProvider from '@ohos.app.form.formProvider';
import formBindingData from '@ohos.app.form.formBindingData';
import emitter from '@ohos.events.emitter';
import { EventIdMap, FormHostTestController } from '../controller/FormHostTestController';

const DOMAIN: Int = 0x0000;
const TAG: string = 'XtsFormHost';
const FORM_COMPONENT_COUNT = 40;
const TEMP_FORM_COMPONENT_COUNT = 5;
const FORM_NAME: string = 'widget';
const BUNDLE_NAME: string = 'com.example.actsformtest.static';
const ABILITY_NAME: string = 'EntryFormAbility';
const MODULE_NAME: string = 'entry';

@Component
struct FormHostComponent {
  formComponentId: string = '0';
  formName: string = FORM_NAME;
  bundleName: string = BUNDLE_NAME;
  abilityName: string = ABILITY_NAME;
  moduleName: string = MODULE_NAME;
  isTemporary: boolean = false;
  callback: (formId: string) => void = (formId: string) => {
    hilog.info(DOMAIN, TAG, `formHostComponent formId: ${formId}`);
  }

  build() {
    FormComponent({
      id: this.formComponentId,
      name: this.formName,
      bundle: this.bundleName,
      ability: this.abilityName,
      module: this.moduleName,
      temporary: this.isTemporary
    })
      .allowUpdate(true)
      .visibility(Visibility.Visible)
      .width(300)
      .height(300)
      .onAcquired((formInfo: FormCallbackInfo) => {
        hilog.info(DOMAIN, TAG, `form info: ${JSON.stringify(formInfo)}`);
        // Invalid-form-id
        if (formInfo.id == -1) {
          this.formComponentId = formInfo.idString;
        } else {
          this.formComponentId = formInfo.id.toString();
        }
        hilog.info(DOMAIN, TAG, `formComponentId: ${this.formComponentId}`);

        this.callback(this.formComponentId);
      });
  }
}

@Entry
@Component
struct XtsFormHost {
  formName: string = FORM_NAME;
  bundleName: string = BUNDLE_NAME;
  abilityName: string = ABILITY_NAME;
  moduleName: string = MODULE_NAME;
  falseFormId: string = '123123123';
  emptyFormId: string = '';
  emptyFormIds: string[] = [] as Array<string>;
  formHostTestController: FormHostTestController = new FormHostTestController();
  formComponentIds: string[] = [] as Array<string>;
  tempFormComponentIds: string[] = [] as Array<string>;

  aboutToAppear() {
    hilog.info(DOMAIN, TAG, 'XtsFormHost1 enter');
    this.registerTestEvents();
  }

  createWantParams(): Record < string, RecordData > {
    let wantParams: Record<string, RecordData> = {
      'ohos.extra.param.key.form_dimension': 2,
      'ohos.extra.param.key.form_name': this.formName,
      'ohos.extra.param.key.module_name': this.moduleName,
      'ohos.extra.param.key.form_is_theme': true,
    }
    return wantParams;
  }

  createWant() {
    let want: Want = {
      bundleName: this.bundleName,
      abilityName: this.abilityName,
      parameters: this.createWantParams()
    };
    return want;
  }

  createFalseWant() {
    let want: Want = {};
    return want;
  }

  getFormComponentId(): string {
    return this.formComponentIds.pop() ?? this.falseFormId;
  }

  getTempFormComponentId(): string {
    return this.tempFormComponentIds.pop() ?? this.falseFormId;
  }

  registerTestEvents() {
    hilog.info(DOMAIN, TAG, 'registering start events...');

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.AddFormWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AddFormWithPromise start event triggered.');
        this.runAddFormWithPromise(this.createWant());
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.AddFormWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AddFormWithPromise false test start event triggered.');
        this.runAddFormWithPromise(this.createFalseWant());
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.DeleteFormWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteFormWithCallback start event triggered.');
        const formId = this.getFormComponentId();
        this.runDeleteFormWithCallback(formId);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.DeleteFormWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteFormWithCallback start event triggered.');
        this.runDeleteFormWithCallback(this.emptyFormId);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.DeleteFormWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteFormWithPromise start event triggered.');
        const formId = this.getFormComponentId();
        this.runDeleteFormWithPromise(formId);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.DeleteFormWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteFormWithPromise start event triggered.');
        this.runDeleteFormWithPromise(this.emptyFormId);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.ReleaseFormWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithPromise start event triggered.');
        const formId = this.getFormComponentId();
        this.runReleaseFormWithPromise(formId);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.ReleaseFormWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithPromise start event triggered.');
        this.runReleaseFormWithPromise(this.falseFormId);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.ReleaseFormWithCacheCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithCacheCallback start event triggered.');
        const formId = this.getFormComponentId();
        this.runReleaseFormWithCacheCallback(formId, true);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.ReleaseFormWithCacheCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithCacheCallback start event triggered.');
        this.runReleaseFormWithCacheCallback(this.falseFormId, true);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.ReleaseFormWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithCallback start event triggered.');
        const formId = this.getFormComponentId();
        this.runReleaseFormWithCallback(formId);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.ReleaseFormWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithCallback start event triggered.');
        this.runReleaseFormWithCallback(this.falseFormId);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.RequestFormWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithPromise start event triggered.');
        const formId = this.getFormComponentId();
        this.runRequestFormWithPromise(formId);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.RequestFormWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithPromise start event triggered.');
        this.runRequestFormWithPromise(this.emptyFormId);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.RequestFormWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithCallback start event triggered.');
        const formId = this.getFormComponentId();
        this.runRequestFormWithCallback(formId);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.RequestFormWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithCallback start event triggered.');
        this.runRequestFormWithCallback(this.emptyFormId);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.RequestFormWithParamsPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithParamsPromise start event triggered.');
        const formId = this.getFormComponentId();
        this.runRequestFormWithParamsPromise(formId);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.RequestFormWithParamsPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithParamsPromise start event triggered.');
        this.runRequestFormWithParamsPromise(this.emptyFormId);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.CastToNormalFormWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'CastToNormalFormWithCallback start event triggered.');
        const formId = this.getTempFormComponentId();
        this.runCastToNormalFormWithCallback(formId);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.CastToNormalFormWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'CastToNormalFormWithCallback start event triggered.');
        this.runCastToNormalFormWithCallback(this.emptyFormId);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.CastToNormalFormWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'CastToNormalFormWithPromise start event triggered.');
        const formId = this.getTempFormComponentId();
        this.runCastToNormalFormWithPromise(formId);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.CastToNormalFormWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'CastToNormalFormWithPromise start event triggered.');
        this.runCastToNormalFormWithPromise(this.emptyFormId);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.NotifyVisibleFormsWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runNotifyVisibleFormsWithPromise(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.NotifyVisibleFormsWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithPromise start event triggered.');
        this.runNotifyVisibleFormsWithPromise(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.NotifyVisibleFormsWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithCallback start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runNotifyVisibleFormsWithCallback(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.NotifyVisibleFormsWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithCallback start event triggered.');
        this.runNotifyVisibleFormsWithCallback(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.NotifyInvisibleFormsWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runNotifyInvisibleFormsWithPromise(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.NotifyInvisibleFormsWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithPromise start event triggered.');
        this.runNotifyInvisibleFormsWithPromise(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.NotifyInvisibleFormsWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithCallback start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runNotifyInvisibleFormsWithCallback(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.NotifyInvisibleFormsWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithCallback start event triggered.');
        this.runNotifyInvisibleFormsWithCallback(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.EnableFormsUpdateWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithCallback start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runEnableFormsUpdateWithCallback(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.EnableFormsUpdateWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithCallback start false event triggered.');
        this.runEnableFormsUpdateWithCallback(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.EnableFormsUpdateWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runEnableFormsUpdateWithPromise(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.EnableFormsUpdateWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithPromise start false event triggered.');
        this.runEnableFormsUpdateWithPromise(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.DisableFormsUpdateWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runDisableFormsUpdateWithPromise(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.DisableFormsUpdateWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithPromise start false event triggered.');
        this.runDisableFormsUpdateWithPromise(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.DisableFormsUpdateWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithCallback start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runDisableFormsUpdateWithCallback(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.DisableFormsUpdateWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithCallback start false event triggered.');
        this.runDisableFormsUpdateWithCallback(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.IsSystemReadyWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'IsSystemReadyWithCallback start event triggered.');
        this.runIsSystemReadyWithCallback();
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.IsSystemReadyWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'IsSystemReadyWithPromise start event triggered.');
        this.runIsSystemReadyWithPromise();
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.GetAllFormsInfoWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetAllFormsInfoWithPromise start event triggered.');
        this.runGetAllFormsInfoWithPromise();
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.GetAllFormsInfoWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetAllFormsInfoWithCallback start event triggered.');
        this.runGetAllFormsInfoWithCallback();
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.GetFormsInfoWithFilterPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithFilterPromise start event triggered.');
        const filter: formInfo.FormInfoFilter = {
          bundleName: this.bundleName,
          moduleName: this.moduleName
        };
        this.runGetFormsInfoWithFilterPromise(filter);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.GetFormsInfoWithBundleModuleCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModuleCallback start event triggered.');
        this.runGetFormsInfoWithBundleModuleCallback(this.bundleName, this.moduleName);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.GetFormsInfoWithBundleModuleCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModuleCallback start event triggered.');
        let falseBundleName: string = ''
        let falseModuleName: string = ''
        this.runGetFormsInfoWithBundleModuleCallback(falseBundleName, falseModuleName);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.GetFormsInfoWithBundleModulePromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModulePromise start event triggered.');
        this.runGetFormsInfoWithBundleModulePromise(this.bundleName, this.moduleName);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.GetFormsInfoWithBundleModulePromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModulePromise start event triggered.');
        let falseBundleName: string = ''
        let falseModuleName: string = ''
        this.runGetFormsInfoWithBundleModulePromise(falseBundleName, falseModuleName);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.GetFormsInfoWithBundleCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleCallback start event triggered.');
        this.runGetFormsInfoWithBundleCallback(this.bundleName);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.GetFormsInfoWithBundleCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleCallback start event triggered.');
        this.runGetFormsInfoWithBundleCallback('');
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.DeleteInvalidFormsWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runDeleteInvalidFormsWithPromise(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.DeleteInvalidFormsWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithPromise start event triggered.');
        this.runDeleteInvalidFormsWithPromise(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.DeleteInvalidFormsWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithCallback start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runDeleteInvalidFormsWithCallback(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.DeleteInvalidFormsWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithCallback start event triggered.');
        this.runDeleteInvalidFormsWithCallback(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.AcquireFormStateWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormStateWithPromise start event triggered.');
        this.runAcquireFormStateWithPromise(this.createWant());
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.AcquireFormStateWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormStateWithPromise start event triggered.');
        this.runAcquireFormStateWithPromise(this.createFalseWant());
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.OnFormUninstallWithoutString),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'onFormUninstallWithoutString start event triggered.');
        this.runOnFormUninstallWithoutString((formId: string) => {
          hilog.info(DOMAIN, TAG, 'Form onFormUninstallWithoutString:', formId);
        });
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.OffFormUninstallWithoutString),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'offFormUninstallWithoutString start event triggered.');
        this.runOffFormUninstallWithoutString((formId: string) => {
          hilog.info(DOMAIN, TAG, 'Form offFormUninstallWithoutString:', formId);
        });
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.AcquireFormStateWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormStateWithCallback start event triggered.');
        this.runAcquireFormStateWithCallback(this.createWant());
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.AcquireFormStateWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormStateWithCallback start event triggered.');
        this.runAcquireFormStateWithCallback(this.createFalseWant());
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.NotifyFormsVisibleWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithCallback start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runNotifyFormsVisibleWithCallback(formIds, true);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.NotifyFormsVisibleWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithCallback start false event triggered.');
        this.runNotifyFormsVisibleWithCallback(this.emptyFormIds, true);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.NotifyFormsVisibleWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runNotifyFormsVisibleWithPromise(formIds, true);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.NotifyFormsVisibleWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithPromise start false event triggered.');
        this.runNotifyFormsVisibleWithPromise(this.emptyFormIds, true);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.NotifyFormsEnableUpdateWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runNotifyFormsEnableUpdateWithPromise(formIds, true);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.NotifyFormsEnableUpdateWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithPromise start event triggered.');
        this.runNotifyFormsEnableUpdateWithPromise(this.emptyFormIds, true);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.NotifyFormsEnableUpdateWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithCallback start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runNotifyFormsEnableUpdateWithCallback(formIds, true);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.NotifyFormsEnableUpdateWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithCallback start false event triggered.');
        this.runNotifyFormsEnableUpdateWithCallback(this.emptyFormIds, true);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.ShareFormWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ShareFormWithPromise start event triggered.');
        const formId = this.getFormComponentId();
        this.runShareFormWithPromise(formId, '0');
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.ShareFormWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ShareFormWithPromise start false event triggered.');
        this.runShareFormWithPromise(this.falseFormId, '0');
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.ShareFormWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ShareFormWithCallback start event triggered.');
        const formId = this.getFormComponentId();
        this.runShareFormWithCallback(formId, '0');
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.ShareFormWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ShareFormWithCallback start false event triggered.');
        this.runShareFormWithCallback(this.falseFormId, '0');
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.NotifyFormsPrivacyProtectedWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithCallback start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runNotifyFormsPrivacyProtectedWithCallback(formIds, true);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.NotifyFormsPrivacyProtectedWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithCallback start false event triggered.');
        this.runNotifyFormsPrivacyProtectedWithCallback(this.emptyFormIds, true);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.NotifyFormsPrivacyProtectedWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runNotifyFormsPrivacyProtectedWithPromise(formIds, true);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.NotifyFormsPrivacyProtectedWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithPromise start false event triggered.');
        this.runNotifyFormsPrivacyProtectedWithPromise(this.emptyFormIds, true);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.AcquireFormDataWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormDataWithCallback start event triggered.');
        const formId = this.getFormComponentId();
        this.runAcquireFormDataWithCallback(formId);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.AcquireFormDataWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormDataWithCallback start false event triggered.');
        this.runAcquireFormDataWithCallback(this.emptyFormId);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.AcquireFormDataWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormDataWithPromise start event triggered.');
        const formId = this.getFormComponentId();
        this.runAcquireFormDataWithPromise(formId);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.AcquireFormDataWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormDataWithPromise start event triggered.');
        this.runAcquireFormDataWithPromise(this.emptyFormId);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.SetRouterProxyWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetRouterProxyWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runSetRouterProxyWithPromise(formIds, (want: Want) => {
          hilog.info(DOMAIN, TAG, 'Router proxy callback:', want);
        });
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.SetRouterProxyWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetRouterProxyWithPromise start event triggered.');
        this.runSetRouterProxyWithPromise(this.emptyFormIds, (want: Want) => {
          hilog.info(DOMAIN, TAG, 'Router proxy callback:', want);
        });
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.SetRouterProxyWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetRouterProxyWithCallback start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runSetRouterProxyWithCallback(formIds, (want: Want) => {
          hilog.info(DOMAIN, TAG, 'Router proxy callback:', want);
        });
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.SetRouterProxyWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetRouterProxyWithCallback start event triggered.');
        this.runSetRouterProxyWithCallback(this.emptyFormIds, (want: Want) => {
          hilog.info(DOMAIN, TAG, 'Router proxy callback:', want);
        });
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.ClearRouterProxyWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithCallback start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runClearRouterProxyWithCallback(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.ClearRouterProxyWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithCallback start event triggered.');
        this.runClearRouterProxyWithCallback(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.ClearRouterProxyWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runClearRouterProxyWithPromise(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.ClearRouterProxyWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithPromise start event triggered.');
        this.runClearRouterProxyWithPromise(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.SetPublishFormResult),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetPublishFormResult start event triggered.');
        let publishResult: formInfo.PublishFormResult = {
          code: formInfo.PublishFormErrorCode.SUCCESS,
          message: 'Form published!'
        };
        try {
          const formId = this.getFormComponentId();
          this.runSetPublishFormResult(formId, publishResult);
        } catch (error) {
          hilog.error(DOMAIN, TAG, `SetPublishFormResult error | code: ${error?.code}, message: ${error?.message}`);
        }
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.SetPublishFormResult),
      (eventData: emitter.EventData) => {
        let publishResult: formInfo.PublishFormResult = {
          code: formInfo.PublishFormErrorCode.PARAM_ERROR,
          message: 'Parameter check fails!'
        };
        this.runSetPublishFormResult(this.emptyFormId, publishResult);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.SetFormsRecyclableWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runSetFormsRecyclableWithPromise(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.SetFormsRecyclableWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithPromise start false event triggered.');
        this.runSetFormsRecyclableWithPromise(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.SetFormsRecyclableWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithCallback start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runSetFormsRecyclableWithCallback(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.SetFormsRecyclableWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithCallback start event triggered.');
        this.runSetFormsRecyclableWithCallback(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.RecycleFormsWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RecycleFormsWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runRecycleFormsWithPromise(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.RecycleFormsWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RecycleFormsWithPromise start event triggered.');
        this.runRecycleFormsWithPromise(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.RecoverFormsWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RecoverFormsWithPromise start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runRecoverFormsWithPromise(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.RecoverFormsWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RecoverFormsWithPromise start event triggered.');
        this.runRecoverFormsWithPromise(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.RecoverFormsWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RecoverFormsWithCallback start event triggered.');
        const formIds = [this.getFormComponentId()];
        this.runRecoverFormsWithCallback(formIds);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.RecoverFormsWithCallback),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RecoverFormsWithCallback start event triggered.');
        this.runRecoverFormsWithCallback(this.emptyFormIds);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.UpdateFormLocation),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'UpdateFormLocation start event triggered.');
        const formId = this.getFormComponentId();
        this.runUpdateFormLocation(formId);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.UpdateFormLocation),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'UpdateFormLocation false start event triggered.');
        this.runUpdateFormLocation(this.falseFormId);
      })

    emitter.once(this.formHostTestController.getTestEvent(EventIdMap.UpdateFormLockedStateWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'UpdateFormLockedStateWithPromise start event triggered.');
        const formId = this.getFormComponentId();
        this.runUpdateFormLockedStateWithPromise(formId, false);
      })

    emitter.once(this.formHostTestController.getFalseTestEvent(EventIdMap.UpdateFormLockedStateWithPromise),
      (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'UpdateFormLockedStateWithPromise false start event triggered.');
        this.runUpdateFormLockedStateWithPromise(this.falseFormId, false);
      })

    hilog.info(DOMAIN, TAG, 'all start events registered successfully.');
  }

  runAddFormWithPromise(want: Want) {
    try {
      formHost.addForm(want).then((runningFormInfo: formInfo.RunningFormInfo) => {
        hilog.info(DOMAIN, TAG, 'AddFormWithPromise success:' + JSON.stringify(runningFormInfo));
        this.formHostTestController.emitFinished(EventIdMap.AddFormWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `AddFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.AddFormWithPromise, false)
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `AddFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.AddFormWithPromise, false);
    }
  }

  runDeleteFormWithCallback(formId: string) {
    try {
      formHost.deleteForm(formId, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `DeleteFormWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.DeleteFormWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'DeleteFormWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.DeleteFormWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `DeleteFormWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.DeleteFormWithCallback, false);
    }
  }

  runDeleteFormWithPromise(formId: string) {
    try {
      formHost.deleteForm(formId).then(() => {
        hilog.info(DOMAIN, TAG, 'DeleteFormWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.DeleteFormWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `DeleteFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.DeleteFormWithPromise, false)
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `DeleteFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.DeleteFormWithPromise, false);
    }
  }

  runReleaseFormWithPromise(formId: string) {
    try {
      formHost.releaseForm(formId).then(() => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.ReleaseFormWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `ReleaseFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.ReleaseFormWithPromise, false)
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `ReleaseFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.ReleaseFormWithPromise, false);
    }
  }

  runReleaseFormWithCacheCallback(formId: string, isReleaseCache: boolean) {
    try {
      formHost.releaseForm(formId, isReleaseCache, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `ReleaseFormWithCacheCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.ReleaseFormWithCacheCallback, false)
        } else {
          hilog.info(DOMAIN, TAG, 'ReleaseFormWithCacheCallback success');
          this.formHostTestController.emitFinished(EventIdMap.ReleaseFormWithCacheCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `ReleaseFormWithCacheCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.ReleaseFormWithCacheCallback, false);
    }
  }

  runReleaseFormWithCallback(formId: string) {
    try {
      formHost.releaseForm(formId, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `ReleaseFormWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.ReleaseFormWithCallback, false)
        } else {
          hilog.info(DOMAIN, TAG, 'ReleaseFormWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.ReleaseFormWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `ReleaseFormWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.ReleaseFormWithCallback, false);
    }
  }

  runRequestFormWithPromise(formId: string) {
    try {
      formHost.requestForm(formId).then(() => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.RequestFormWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `RequestFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.RequestFormWithPromise, false)
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `RequestFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.RequestFormWithPromise, false);
    }
  }

  runRequestFormWithCallback(formId: string) {
    try {
      formHost.requestForm(formId, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `RequestFormWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.RequestFormWithCallback, false)
        } else {
          hilog.info(DOMAIN, TAG, 'RequestFormWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.RequestFormWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `RequestFormWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.RequestFormWithCallback, false);
    }
  }

  runRequestFormWithParamsPromise(formId: string) {
    try {
      let wantParams: Record<string, Object> = {
        'ohos.extra.param.key.form_dimension': formInfo.FormDimension.Dimension_2_2,
        'ohos.extra.param.key.form_name': this.formName,
        'ohos.extra.param.key.module_name': this.moduleName,
        'ohos.extra.param.key.form_is_theme': true,
      }
      formHost.requestFormWithParams(formId, wantParams).then(() => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithParamsPromise success');
        this.formHostTestController.emitFinished(EventIdMap.RequestFormWithParamsPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `RequestFormWithParamsPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.RequestFormWithParamsPromise, false)
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `RequestFormWithParamsPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.RequestFormWithParamsPromise, false);
    }
  }

  runCastToNormalFormWithCallback(formId: string) {
    try {
      formHost.castToNormalForm(formId, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `CastToNormalFormWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.CastToNormalFormWithCallback, false)
        } else {
          hilog.info(DOMAIN, TAG, 'CastToNormalFormWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.CastToNormalFormWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `CastToNormalFormWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.CastToNormalFormWithCallback, false);
    }
  }

  runCastToNormalFormWithPromise(formId: string) {
    try {
      formHost.castToNormalForm(formId).then(() => {
        hilog.info(DOMAIN, TAG, 'CastToNormalFormWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.CastToNormalFormWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `CastToNormalFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.CastToNormalFormWithPromise, false)
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `CastToNormalFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.CastToNormalFormWithPromise, false);
    }
  }

  runNotifyVisibleFormsWithPromise(formIds: Array<string>) {
    try {
      formHost.notifyVisibleForms(formIds).then(() => {
        hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.NotifyVisibleFormsWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `NotifyVisibleFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.NotifyVisibleFormsWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `NotifyVisibleFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.NotifyVisibleFormsWithPromise, false);
    }
  }

  runNotifyVisibleFormsWithCallback(formIds: Array<string>) {
    try {
      formHost.notifyVisibleForms(formIds, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `NotifyVisibleFormsWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.NotifyVisibleFormsWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.NotifyVisibleFormsWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `NotifyVisibleFormsWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.NotifyVisibleFormsWithCallback, false);
    }
  }

  runNotifyInvisibleFormsWithPromise(formIds: Array<string>) {
    try {
      formHost.notifyInvisibleForms(formIds).then(() => {
        hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.NotifyInvisibleFormsWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `NotifyInvisibleFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.NotifyInvisibleFormsWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `NotifyInvisibleFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.NotifyInvisibleFormsWithPromise, false);
    }
  }

  runNotifyInvisibleFormsWithCallback(formIds: Array<string>) {
    try {
      formHost.notifyInvisibleForms(formIds, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `NotifyInvisibleFormsWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.NotifyInvisibleFormsWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.NotifyInvisibleFormsWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `NotifyInvisibleFormsWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.NotifyInvisibleFormsWithCallback, false);
    }
  }

  runEnableFormsUpdateWithCallback(formIds: Array<string>) {
    try {
      formHost.enableFormsUpdate(formIds, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `EnableFormsUpdateWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.EnableFormsUpdateWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.EnableFormsUpdateWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `EnableFormsUpdateWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.EnableFormsUpdateWithCallback, false);
    }
  }

  runEnableFormsUpdateWithPromise(formIds: Array<string>) {
    try {
      formHost.enableFormsUpdate(formIds).then(() => {
        hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.EnableFormsUpdateWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `EnableFormsUpdateWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.EnableFormsUpdateWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `EnableFormsUpdateWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.EnableFormsUpdateWithPromise, false);
    }
  }

  runDisableFormsUpdateWithPromise(formIds: Array<string>) {
    try {
      formHost.disableFormsUpdate(formIds).then(() => {
        hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.DisableFormsUpdateWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `DisableFormsUpdateWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.DisableFormsUpdateWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `DisableFormsUpdateWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.DisableFormsUpdateWithPromise, false);
    }
  }

  runDisableFormsUpdateWithCallback(formIds: Array<string>) {
    try {
      formHost.disableFormsUpdate(formIds, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `DisableFormsUpdateWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.DisableFormsUpdateWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.DisableFormsUpdateWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `DisableFormsUpdateWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.DisableFormsUpdateWithCallback, false);
    }
  }

  runIsSystemReadyWithCallback() {
    try {
      formHost.isSystemReady((error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `IsSystemReadyWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.IsSystemReadyWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'IsSystemReadyWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.IsSystemReadyWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `IsSystemReadyWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.IsSystemReadyWithCallback, false);
    }
  }

  runIsSystemReadyWithPromise() {
    try {
      formHost.isSystemReady().then(() => {
        hilog.info(DOMAIN, TAG, 'IsSystemReadyWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.IsSystemReadyWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `IsSystemReadyWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.IsSystemReadyWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `IsSystemReadyWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.IsSystemReadyWithPromise, false);
    }
  }

  runGetAllFormsInfoWithPromise() {
    try {
      formHost.getAllFormsInfo().then((infos: Array<formInfo.FormInfo>) => {
        hilog.info(DOMAIN, TAG, `GetAllFormsInfoWithPromise success`);
        this.formHostTestController.emitFinished(EventIdMap.GetAllFormsInfoWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `GetAllFormsInfoWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.GetAllFormsInfoWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `GetAllFormsInfoWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.GetAllFormsInfoWithPromise, false);
    }
  }

  runGetAllFormsInfoWithCallback() {
    try {
      formHost.getAllFormsInfo((error: BusinessError | null, infos?: Array<formInfo.FormInfo>) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `GetAllFormsInfoWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.GetAllFormsInfoWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'GetAllFormsInfoWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.GetAllFormsInfoWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `GetAllFormsInfoWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.GetAllFormsInfoWithCallback, false);
    }
  }

  runGetFormsInfoWithFilterPromise(filter: formInfo.FormInfoFilter) {
    try {
      formHost.getFormsInfo(filter).then((infos: Array<formInfo.FormInfo>) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithFilterPromise success');
        this.formHostTestController.emitFinished(EventIdMap.GetFormsInfoWithFilterPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `GetFormsInfoWithFilterPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.GetFormsInfoWithFilterPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `GetFormsInfoWithFilterPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.GetFormsInfoWithFilterPromise, false);
    }
  }

  runGetFormsInfoWithBundleModuleCallback(bundleName: string, moduleName: string) {
    try {
      formHost.getFormsInfo(bundleName, moduleName, (error: BusinessError | null, infos?: Array<formInfo.FormInfo>) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `GetFormsInfoWithBundleModuleCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.GetFormsInfoWithBundleModuleCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModuleCallback success');
          this.formHostTestController.emitFinished(EventIdMap.GetFormsInfoWithBundleModuleCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `GetFormsInfoWithBundleModuleCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.GetFormsInfoWithBundleModuleCallback, false);
    }
  }

  runGetFormsInfoWithBundleModulePromise(bundleName: string, moduleName: string) {
    try {
      formHost.getFormsInfo(bundleName, moduleName).then((infos: Array<formInfo.FormInfo>) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModulePromise success');
        this.formHostTestController.emitFinished(EventIdMap.GetFormsInfoWithBundleModulePromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `GetFormsInfoWithBundleModulePromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.GetFormsInfoWithBundleModulePromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `GetFormsInfoWithBundleModulePromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.GetFormsInfoWithBundleModulePromise, false);
    }
  }

  runGetFormsInfoWithBundleCallback(bundleName: string) {
    try {
      formHost.getFormsInfo(bundleName, (error: BusinessError | null, infos?: Array<formInfo.FormInfo>) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `GetFormsInfoWithBundleCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.GetFormsInfoWithBundleCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleCallback success');
          this.formHostTestController.emitFinished(EventIdMap.GetFormsInfoWithBundleCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `GetFormsInfoWithBundleCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.GetFormsInfoWithBundleCallback, false);
    }
  }

  runDeleteInvalidFormsWithPromise(formIds: Array<string>) {
    try {
      formHost.setFormsRecyclable(formIds).then(() => {
        formHost.recycleForms(formIds).then(() => {
          formHost.deleteInvalidForms(formIds).then((count: Int) => {
            hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithPromise success');
            this.formHostTestController.emitFinished(EventIdMap.DeleteInvalidFormsWithPromise, true);
          }).catch((error: Error) => {
            hilog.error(DOMAIN, TAG, `DeleteInvalidFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
            this.formHostTestController.emitFinished(EventIdMap.DeleteInvalidFormsWithPromise, false);
          });
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `RecycleFormsWithPromise->DeleteInvalidFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.DeleteInvalidFormsWithPromise, false);
        });
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `setFormsRecyclable->RecycleFormsWithPromise->DeleteInvalidFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.DeleteInvalidFormsWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `DeleteInvalidFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.DeleteInvalidFormsWithPromise, false);
    }
  }

  runDeleteInvalidFormsWithCallback(formIds: Array<string>) {
    try {
      formHost.setFormsRecyclable(formIds).then(() => {
        formHost.recycleForms(formIds).then(() => {
          formHost.deleteInvalidForms(formIds, (error: BusinessError | null, count?: Int) => {
            if (error?.code) {
              hilog.error(DOMAIN, TAG, `DeleteInvalidFormsWithCallback error | code: ${error?.code}, message: ${error?.message}`);
              this.formHostTestController.emitFinished(EventIdMap.DeleteInvalidFormsWithCallback, false);
            } else {
              hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithCallback success');
              this.formHostTestController.emitFinished(EventIdMap.DeleteInvalidFormsWithCallback, true);
            }
          });
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `RecycleFormsWithPromise->DeleteInvalidFormsWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.DeleteInvalidFormsWithCallback, false);
        });
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `setFormsRecyclable->RecycleFormsWithPromise->DeleteInvalidFormsWithCallback error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.DeleteInvalidFormsWithCallback, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `DeleteInvalidFormsWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.DeleteInvalidFormsWithCallback, false);
    }
  }

  runAcquireFormStateWithPromise(want: Want) {
    try {
      formHost.acquireFormState(want).then((state: formInfo.FormStateInfo) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormStateWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.AcquireFormStateWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `AcquireFormStateWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.AcquireFormStateWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `AcquireFormStateWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.AcquireFormStateWithPromise, false);
    }
  }

  runAcquireFormStateWithCallback(want: Want) {
    try {
      formHost.acquireFormState(want, (error: BusinessError | null, state?: formInfo.FormStateInfo) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `AcquireFormStateWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.AcquireFormStateWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'AcquireFormStateWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.AcquireFormStateWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `AcquireFormStateWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.AcquireFormStateWithCallback, false);
    }
  }

  runOnFormUninstallWithoutString(callback: Callback<string>) {
    try {
      formHost.onFormUninstall(callback);
      hilog.info(DOMAIN, TAG, 'OnFormUninstallWithoutString register success');
      this.formHostTestController.emitFinished(EventIdMap.OnFormUninstallWithoutString, true);
    } catch (error) {
      hilog.error(DOMAIN, TAG, `OnFormUninstallWithoutString error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.OnFormUninstallWithoutString, false);
    }
  }

  runOffFormUninstallWithoutString(callback ?: Callback<string>) {
    try {
      if (callback != undefined) {
        formHost.onFormUninstall(callback);
      }
      formHost.offFormUninstall(callback);
      hilog.info(DOMAIN, TAG, 'formUninstallWithoutString clear success');
      this.formHostTestController.emitFinished(EventIdMap.OffFormUninstallWithoutString, true);
    } catch (error) {
      hilog.error(DOMAIN, TAG, `formUninstallWithoutString error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.OffFormUninstallWithoutString, false);
    }
  }

  runNotifyFormsVisibleWithCallback(formIds: Array<string>, isVisible: boolean) {
    try {
      formHost.notifyFormsVisible(formIds, isVisible, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `NotifyFormsVisibleWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.NotifyFormsVisibleWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.NotifyFormsVisibleWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `NotifyFormsVisibleWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.NotifyFormsVisibleWithCallback, false);
    }
  }

  runNotifyFormsVisibleWithPromise(formIds: Array<string>, isVisible: boolean) {
    try {
      formHost.notifyFormsVisible(formIds, isVisible).then(() => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.NotifyFormsVisibleWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `NotifyFormsVisibleWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.NotifyFormsVisibleWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `NotifyFormsVisibleWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.NotifyFormsVisibleWithPromise, false);
    }
  }

  runNotifyFormsEnableUpdateWithPromise(formIds: Array<string>, isEnableUpdate: boolean) {
    try {
      formHost.notifyFormsEnableUpdate(formIds, isEnableUpdate).then(() => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.NotifyFormsEnableUpdateWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `NotifyFormsEnableUpdateWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.NotifyFormsEnableUpdateWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `NotifyFormsEnableUpdateWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.NotifyFormsEnableUpdateWithPromise, false);
    }
  }

  runNotifyFormsEnableUpdateWithCallback(formIds: Array<string>, isEnableUpdate: boolean) {
    try {
      formHost.notifyFormsEnableUpdate(formIds, isEnableUpdate, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `NotifyFormsEnableUpdateWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.NotifyFormsEnableUpdateWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.NotifyFormsEnableUpdateWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `NotifyFormsEnableUpdateWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.NotifyFormsEnableUpdateWithCallback, false);
    }
  }

  runShareFormWithPromise(formId: string, deviceId: string) {
    try {
      formHost.shareForm(formId, deviceId).then(() => {
        hilog.info(DOMAIN, TAG, 'ShareFormWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.ShareFormWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `ShareFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.ShareFormWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `ShareFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.ShareFormWithPromise, false);
    }
  }

  runShareFormWithCallback(formId: string, deviceId: string) {
    try {
      formHost.shareForm(formId, deviceId, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `ShareFormWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.ShareFormWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'ShareFormWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.ShareFormWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `ShareFormWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.ShareFormWithCallback, false);
    }
  }

  runNotifyFormsPrivacyProtectedWithCallback(formIds: Array<string>, isProtected: boolean) {
    try {
      formHost.notifyFormsPrivacyProtected(formIds, isProtected, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `NotifyFormsPrivacyProtectedWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.NotifyFormsPrivacyProtectedWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.NotifyFormsPrivacyProtectedWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `NotifyFormsPrivacyProtectedWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.NotifyFormsPrivacyProtectedWithCallback, false);
    }
  }

  runNotifyFormsPrivacyProtectedWithPromise(formIds: Array<string>, isProtected: boolean) {
    try {
      formHost.notifyFormsPrivacyProtected(formIds, isProtected).then(() => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.NotifyFormsPrivacyProtectedWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `NotifyFormsPrivacyProtectedWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.NotifyFormsPrivacyProtectedWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `NotifyFormsPrivacyProtectedWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.NotifyFormsPrivacyProtectedWithPromise, false);
    }
  }

  runAcquireFormDataWithCallback(formId: string) {
    try {
      formHost.acquireFormData(formId, (error: BusinessError | null, data?: Record<string, Object>) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `AcquireFormDataWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.AcquireFormDataWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'AcquireFormDataWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.AcquireFormDataWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `AcquireFormDataWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.AcquireFormDataWithCallback, false);
    }
  }

  runAcquireFormDataWithPromise(formId: string) {
    try {
      formHost.acquireFormData(formId).then((data: Record<string, Object>) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormDataWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.AcquireFormDataWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `AcquireFormDataWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.AcquireFormDataWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `AcquireFormDataWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.AcquireFormDataWithPromise, false);
    }
  }

  runSetRouterProxyWithPromise(formIds: Array<string>, callback: Callback<Want>) {
    try {
      formHost.setRouterProxy(formIds, callback).then(() => {
        hilog.info(DOMAIN, TAG, 'SetRouterProxyWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.SetRouterProxyWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `SetRouterProxyWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.SetRouterProxyWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `SetRouterProxyWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.SetRouterProxyWithPromise, false);
    }
  }

  runSetRouterProxyWithCallback(formIds: Array<string>, callback: Callback<Want>) {
    try {
      formHost.setRouterProxy(formIds, callback, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `SetRouterProxyWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.SetRouterProxyWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'SetRouterProxyWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.SetRouterProxyWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `SetRouterProxyWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.SetRouterProxyWithCallback, false);
    }
  }

  runClearRouterProxyWithCallback(formIds: Array<string>) {
    try {
      formHost.clearRouterProxy(formIds, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `ClearRouterProxyWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.ClearRouterProxyWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.ClearRouterProxyWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `ClearRouterProxyWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.ClearRouterProxyWithCallback, false);
    }
  }

  runClearRouterProxyWithPromise(formIds: Array<string>) {
    try {
      formHost.clearRouterProxy(formIds).then(() => {
        hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.ClearRouterProxyWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `ClearRouterProxyWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.ClearRouterProxyWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `ClearRouterProxyWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.ClearRouterProxyWithPromise, false);
    }
  }

  runSetPublishFormResult(formId: string, publishResult: formInfo.PublishFormResult) {
    try {
      formHost.setPublishFormResult(formId, publishResult);
      hilog.info(DOMAIN, TAG, 'SetPublishFormResult success');
      this.formHostTestController.emitFinished(EventIdMap.SetPublishFormResult, true);
    } catch (error) {
      hilog.error(DOMAIN, TAG, `SetPublishFormResult error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.SetPublishFormResult, false);
    }
  }

  runSetFormsRecyclableWithPromise(formIds: Array<string>) {
    try {
      formHost.setFormsRecyclable(formIds).then(() => {
        hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.SetFormsRecyclableWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `SetFormsRecyclableWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.SetFormsRecyclableWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `SetFormsRecyclableWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.SetFormsRecyclableWithPromise, false);
    }
  }

  runSetFormsRecyclableWithCallback(formIds: Array<string>) {
    try {
      formHost.setFormsRecyclable(formIds, (error: BusinessError | null) => {
        if (error?.code) {
          hilog.error(DOMAIN, TAG, `SetFormsRecyclableWithCallback error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.SetFormsRecyclableWithCallback, false);
        } else {
          hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithCallback success');
          this.formHostTestController.emitFinished(EventIdMap.SetFormsRecyclableWithCallback, true);
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `SetFormsRecyclableWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.SetFormsRecyclableWithCallback, false);
    }
  }

  runRecycleFormsWithPromise(formIds: Array<string>) {
    try {
      formHost.setFormsRecyclable(formIds).then(() => {
        formHost.recycleForms(formIds).then(() => {
          hilog.info(DOMAIN, TAG, 'RecycleFormsWithPromise success');
          this.formHostTestController.emitFinished(EventIdMap.RecycleFormsWithPromise, true);
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `RecycleFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.RecycleFormsWithPromise, false);
        });
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `setFormsRecyclable->RecycleFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.RecycleFormsWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `RecycleFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.RecycleFormsWithPromise, false);
    }
  }

  runRecoverFormsWithPromise(formIds: Array<string>) {
    try {
      formHost.setFormsRecyclable(formIds).then(() => {
        formHost.recycleForms(formIds).then(() => {
          formHost.recoverForms(formIds).then(() => {
            hilog.info(DOMAIN, TAG, 'RecoverFormsWithPromise success');
            this.formHostTestController.emitFinished(EventIdMap.RecoverFormsWithPromise, true);
          }).catch((error: Error) => {
            hilog.error(DOMAIN, TAG, `RecoverFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
            this.formHostTestController.emitFinished(EventIdMap.RecoverFormsWithPromise, false);
          });
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `RecycleFormsWithPromise->RecoverFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.RecoverFormsWithPromise, false);
        });
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `setFormsRecyclable->RecycleFormsWithPromise->RecoverFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.RecoverFormsWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `RecoverFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.RecoverFormsWithPromise, false);
    }
  }

  runRecoverFormsWithCallback(formIds: Array<string>) {
    try {
      formHost.setFormsRecyclable(formIds).then(() => {
        formHost.recycleForms(formIds).then(() => {
          formHost.recoverForms(formIds, (error: BusinessError | null) => {
            if (error?.code) {
              hilog.error(DOMAIN, TAG, `RecoverFormsWithCallback error | code: ${error?.code}, message: ${error?.message}`);
              this.formHostTestController.emitFinished(EventIdMap.RecoverFormsWithCallback, false);
            } else {
              hilog.info(DOMAIN, TAG, 'RecoverFormsWithCallback success');
              this.formHostTestController.emitFinished(EventIdMap.RecoverFormsWithCallback, true);
            }
          });
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `RecycleFormsWithPromise->RecoverFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
          this.formHostTestController.emitFinished(EventIdMap.RecoverFormsWithCallback, false);
        });
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `setFormsRecyclable->RecycleFormsWithPromise->RecoverFormsWithCallback error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.RecoverFormsWithCallback, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `RecoverFormsWithCallback error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.RecoverFormsWithCallback, false);
    }
  }

  runUpdateFormLocation(formId: string) {
    try {
      formHost.updateFormLocation(formId, formInfo.FormLocation.SCREEN_LOCK);
      hilog.info(DOMAIN, TAG, 'UpdateFormLocation success');
      this.formHostTestController.emitFinished(EventIdMap.UpdateFormLocation, true);
    } catch (error) {
      hilog.error(DOMAIN, TAG, `UpdateFormLocation error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.UpdateFormLocation, false);
    }
  }

  runUpdateFormLockedStateWithPromise(formId: string, isLocked: boolean) {
    try {
      formHost.updateFormLockedState(formId, isLocked).then(() => {
        hilog.info(DOMAIN, TAG, 'UpdateFormLockedStateWithPromise success');
        this.formHostTestController.emitFinished(EventIdMap.UpdateFormLockedStateWithPromise, true);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `UpdateFormLockedStateWithPromise error | code: ${error?.code}, message: ${error?.message}`);
        this.formHostTestController.emitFinished(EventIdMap.UpdateFormLockedStateWithPromise, false);
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, `UpdateFormLockedStateWithPromise error | code: ${error?.code}, message: ${error?.message}`);
      this.formHostTestController.emitFinished(EventIdMap.UpdateFormLockedStateWithPromise, false);
    }
  }

  build() {
    Column() {
      Text('XTS FormHost').fontSize(20)
      Scroll() {
        Column() {
          Button('AddFormWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            this.runAddFormWithPromise(this.createWant());
          })
          Button('DeleteFormWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            formHost.addForm(this.createWant()).then((runningFormInfo: formInfo.RunningFormInfo) => {
              hilog.info(DOMAIN, TAG, 'AddFormWithPromise success:' + JSON.stringify(runningFormInfo));
              const formId = runningFormInfo.formId;
              this.runDeleteFormWithCallback(formId);
            }).catch((error: Error) => {
              hilog.error(DOMAIN, TAG, `AddFormWithPromise->DeleteFormWithCallback error | code: ${error?.code}, message: ${error?.message}`);
            });
          })
          Button('DeleteFormWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            formHost.addForm(this.createWant()).then((runningFormInfo: formInfo.RunningFormInfo) => {
              hilog.info(DOMAIN, TAG, 'AddFormWithPromise success:' + JSON.stringify(runningFormInfo));
              const formId = runningFormInfo.formId;
              this.runDeleteFormWithPromise(formId);
            }).catch((error: Error) => {
              hilog.error(DOMAIN, TAG, `AddFormWithPromise->DeleteFormWithPromise error | code: ${error?.code}, message: ${error?.message}`);
            });
          })
          Button('ReleaseFormWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getFormComponentId();
            this.runReleaseFormWithPromise(formId);
          })
          Button('ReleaseFormWithCacheCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getFormComponentId();
            this.runReleaseFormWithCacheCallback(formId, true);
          })
          Button('ReleaseFormWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getFormComponentId();
            this.runReleaseFormWithCallback(formId);
          })
          Button('RequestFormWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getFormComponentId();
            this.runRequestFormWithPromise(formId);
          })
          Button('RequestFormWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getFormComponentId();
            this.runRequestFormWithCallback(formId);
          })
          Button('RequestFormWithParamsPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getFormComponentId();
            this.runRequestFormWithParamsPromise(formId);
          })
          Button('CastToNormalFormWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getTempFormComponentId();
            this.runCastToNormalFormWithCallback(formId);
          })
          Button('CastToNormalFormWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getTempFormComponentId();
            this.runCastToNormalFormWithPromise(formId);
          })
          Button('NotifyVisibleFormsWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runNotifyVisibleFormsWithPromise(formIds);
          })
          Button('NotifyVisibleFormsWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runNotifyVisibleFormsWithCallback(formIds);
          })
          Button('NotifyInvisibleFormsWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runNotifyInvisibleFormsWithPromise(formIds);
          })
          Button('NotifyInvisibleFormsWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runNotifyInvisibleFormsWithCallback(formIds);
          })
          Button('EnableFormsUpdateWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runEnableFormsUpdateWithCallback(formIds);
          })
          Button('EnableFormsUpdateWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runEnableFormsUpdateWithPromise(formIds);
          })
          Button('DisableFormsUpdateWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runDisableFormsUpdateWithPromise(formIds);
          })
          Button('DisableFormsUpdateWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runDisableFormsUpdateWithCallback(formIds);
          })
          Button('IsSystemReadyWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            this.runIsSystemReadyWithCallback();
          })
          Button('IsSystemReadyWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            this.runIsSystemReadyWithPromise();
          })
          Button('GetAllFormsInfoWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            this.runGetAllFormsInfoWithPromise();
          })
          Button('GetAllFormsInfoWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            this.runGetAllFormsInfoWithCallback();
          })
          Button('GetFormsInfoWithFilterPromise').fontSize(10).onClick((e: ClickEvent) => {
            const filter: formInfo.FormInfoFilter = {
              bundleName: this.bundleName,
              moduleName: this.moduleName
            };
            this.runGetFormsInfoWithFilterPromise(filter);
          })
          Button('GetFormsInfoWithBundleModuleCallback').fontSize(10).onClick((e: ClickEvent) => {
            this.runGetFormsInfoWithBundleModuleCallback(this.bundleName, this.moduleName);
          })
          Button('GetFormsInfoWithBundleModulePromise').fontSize(10).onClick((e: ClickEvent) => {
            this.runGetFormsInfoWithBundleModulePromise(this.bundleName, this.moduleName);
          })
          Button('GetFormsInfoWithBundleCallback').fontSize(10).onClick((e: ClickEvent) => {
            this.runGetFormsInfoWithBundleCallback(this.bundleName);
          })
          Button('DeleteInvalidFormsWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runDeleteInvalidFormsWithPromise(formIds);
          })
          Button('DeleteInvalidFormsWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runDeleteInvalidFormsWithCallback(formIds);
          })
          Button('AcquireFormStateWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            this.runAcquireFormStateWithPromise(this.createWant());
          })
          Button('AcquireFormStateWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            this.runAcquireFormStateWithCallback(this.createWant());
          })
          Button('OnFormUninstallWithoutString').fontSize(10).onClick((e: ClickEvent) => {
            this.runOnFormUninstallWithoutString((formId: string) => {
            hilog.info(DOMAIN, TAG, `Form onFormUninstallWithoutString: ${formId}` );
            });
           })
           Button('OffFormUninstallWithoutString').fontSize(10).onClick((e: ClickEvent) => {
            this.runOffFormUninstallWithoutString((formId: string) => {
            hilog.info(DOMAIN, TAG, `Form OffFormUninstallWithoutString: ${formId}` );
            });
           })
          Button('NotifyFormsVisibleWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runNotifyFormsVisibleWithCallback(formIds, true);
          })
          Button('NotifyFormsVisibleWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runNotifyFormsVisibleWithPromise(formIds, true);
          })
          Button('NotifyFormsEnableUpdateWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runNotifyFormsEnableUpdateWithPromise(formIds, true);
          })
          Button('NotifyFormsEnableUpdateWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runNotifyFormsEnableUpdateWithCallback(formIds, true);
          })
          Button('ShareFormWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getFormComponentId();
            this.runShareFormWithPromise(formId, '0');
          })
          Button('ShareFormWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getFormComponentId();
            this.runShareFormWithCallback(formId, '0');
          })
          Button('NotifyFormsPrivacyProtectedWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runNotifyFormsPrivacyProtectedWithCallback(formIds, true);
          })
          Button('NotifyFormsPrivacyProtectedWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runNotifyFormsPrivacyProtectedWithPromise(formIds, true);
          })
          Button('AcquireFormDataWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getFormComponentId();
            this.runAcquireFormDataWithCallback(formId);
          })
          Button('AcquireFormDataWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getFormComponentId();
            this.runAcquireFormDataWithPromise(formId);
          })
          Button('SetRouterProxyWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runSetRouterProxyWithPromise(formIds, (want: Want) => {
              hilog.info(DOMAIN, TAG, 'Router proxy callback:', want);
            });
          })
          Button('SetRouterProxyWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runSetRouterProxyWithCallback(formIds, (want: Want) => {
              hilog.info(DOMAIN, TAG, 'Router proxy callback:', want);
            });
          })
          Button('ClearRouterProxyWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runClearRouterProxyWithCallback(formIds);
          })
          Button('ClearRouterProxyWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runClearRouterProxyWithPromise(formIds);
          })
          Button('SetPublishFormResult').fontSize(10).onClick((e: ClickEvent) => {
            let publishResult: formInfo.PublishFormResult = {
              code: formInfo.PublishFormErrorCode.SUCCESS,
              message: 'Form published!'
            };
            try {
              formProvider.requestPublishForm(this.createWant()).then((formId: string) => {
                this.runSetPublishFormResult(formId, publishResult);
              }).catch((error: Error) => {
                hilog.error(DOMAIN, TAG,
                  `requestPublishForm->SetPublishFormResult error | code: ${error?.code}, message: ${error?.message}`);
              });
            } catch (error) {
              hilog.error(DOMAIN, TAG, `SetPublishFormResult error | code: ${error?.code}, message: ${error?.message}`);
            }
          })
          Button('SetFormsRecyclableWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runSetFormsRecyclableWithPromise(formIds);
          })
          Button('SetFormsRecyclableWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runSetFormsRecyclableWithCallback(formIds);
          })
          Button('RecycleFormsWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runRecycleFormsWithPromise(formIds);
          })
          Button('RecoverFormsWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runRecoverFormsWithPromise(formIds);
          })
          Button('RecoverFormsWithCallback').fontSize(10).onClick((e: ClickEvent) => {
            const formIds = [this.getFormComponentId()];
            this.runRecoverFormsWithCallback(formIds);
          })
          Button('UpdateFormLocation').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getFormComponentId();
            this.runUpdateFormLocation(formId);
          })
          Button('UpdateFormLockedStateWithPromise').fontSize(10).onClick((e: ClickEvent) => {
            const formId = this.getFormComponentId();
            this.runUpdateFormLockedStateWithPromise(formId, false);
          })
          Row() {
            for (let i = 0; i < FORM_COMPONENT_COUNT; i++) {
              FormHostComponent({
                callback: (formId: string) => {
                  this.formComponentIds.push(formId);
                  hilog.info(DOMAIN, TAG, `formHostComponent formId: ${formId}`);
                }
              })
            }
            for (let i = 0; i < TEMP_FORM_COMPONENT_COUNT; i++) {
              FormHostComponent({
                isTemporary: true,
                callback: (formId: string) => {
                  this.tempFormComponentIds.push(formId);
                  hilog.info(DOMAIN, TAG, `formHostComponent formId: ${formId}`);
                }
              })
            }
          }
        }
      }
    }
  }
}