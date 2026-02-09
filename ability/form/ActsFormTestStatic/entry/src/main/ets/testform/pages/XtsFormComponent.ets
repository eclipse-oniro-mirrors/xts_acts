/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { Text, Column,
  FormComponent, FormCallbackInfo, Visibility, FormDimension,
  Component, Entry, Button, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import formHost from '@ohos.app.form.formHost';
import formInfo from '@ohos.app.form.formInfo';
import formProvider from '@ohos.app.form.formProvider';
import formObserver from '@ohos.app.form.formObserver';


const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';

@Entry
@Component
struct XtsFormComponent {
  aboutToAppear() {
    hilog.info(DOMAIN, TAG, 'XtsFormComponent enter');
  }
  @State formId: string = '0';
  @State deviceId: string = '0';

  build() {
    Column() {
      Text('XTS FormComponent')
        .fontSize(20)
      Button('getFormId').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick getFormId');
          try {
            formObserver.getRunningFormInfos().then((data: formInfo.RunningFormInfo[]) => {
              console.log(`formObserver getRunningFormInfos, data: ${JSON.stringify(data)}`);
              if (data.length === 0) {
                hilog.info(DOMAIN, TAG, 'getRunningFormInfos no data');
              } else {
                this.formId = data[0].formId
                hilog.info(DOMAIN, TAG, 'getRunningFormInfos formId is ' + this.formId);
              }
            }).catch((error: Error) => {
              let code = (error as BusinessError).code;
              let message = (error as BusinessError).message;
              console.error(`error, code: ${code}, message: ${message}`);
            });
          } catch (err) {
            hilog.info(DOMAIN, TAG, `getRunningFormInfos error code: ${err?.code}, error message: ${err?.message}`);
          }
        })

      Button('requestOverflow').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick requestOverflow');
          try {
            let rect: formInfo.Rect = {
              left: -30,
              top: -30,
              width: 200,
              height: 200
            };
            let overflowInfo: formInfo.OverflowInfo = {
              area: rect,
              duration: 3500,
              useDefaultAnimation: false
            };
            formProvider.requestOverflow(this.formId, overflowInfo).then(() => {
              hilog.info(DOMAIN, TAG, 'requestOverflow succeed');
            }).catch((error: Error): void => {
              hilog.info(DOMAIN, TAG, `requestOverflow err: code is ${error.code}, message ${error.message}`);
            })
          } catch (error) {
            hilog.info(DOMAIN, TAG, `requestOverflow err: code is ${(error as BusinessError).code}, message ${(error as BusinessError).message}`);
          }
        })

      Button('cancelOverflow').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick cancelOverflow');
          try {
            formProvider.cancelOverflow(this.formId).then(() => {
              hilog.info(DOMAIN, TAG, 'cancelOverflow succeed');
            }).catch((error: Error): void => {
              hilog.info(DOMAIN, TAG, `cancelOverflow err: code is ${error.code}, message ${error.message}`);
            })
          } catch (error) {
            hilog.info(DOMAIN, TAG, `cancelOverflow err: code is ${(error as BusinessError).code}, message ${(error as BusinessError).message}`);
          }
        })

      Button('activateSceneAnimation').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick activateSceneAnimation');
          try {
            formProvider.activateSceneAnimation(this.formId).then(() => {
              hilog.info(DOMAIN, TAG, 'activateSceneAnimation succeed');
            }).catch((error: Error): void => {
              hilog.info(DOMAIN, TAG, `activateSceneAnimation err: code is ${error.code}, message ${error.message}`);
            })
          } catch (error) {
            hilog.info(DOMAIN, TAG, `activateSceneAnimation err: code is ${(error as BusinessError).code}, message ${(error as BusinessError).message}`);
          }
        })

      Button('deactivateSceneAnimation').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick deactivateSceneAnimation');
          try {
            formProvider.deactivateSceneAnimation(this.formId).then(() => {
              hilog.info(DOMAIN, TAG, 'deactivateSceneAnimation succeed');
            }).catch((error: Error): void => {
              hilog.info(DOMAIN, TAG, `deactivateSceneAnimation err: code is ${error.code}, message ${error.message}`);
            })
          } catch (error) {
            hilog.info(DOMAIN, TAG, `deactivateSceneAnimation err: code is ${(error as BusinessError).code}, message ${(error as BusinessError).message}`);
          }
        })

      Button('getFormRect').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick getFormRect');
          hilog.info(DOMAIN, TAG, 'getFormRect formId is ' + this.formId);
          try {
            formProvider.getFormRect(this.formId).then((data: formInfo.Rect) => {
              hilog.info(DOMAIN, TAG, `getFormRect succeed, data: ${JSON.stringify(data)}`);
            }).catch((error: Error): void => {
              hilog.info(DOMAIN, TAG, `getFormRect err: code is ${error.code}, message ${error.message}`);
            })
          } catch (error) {
            hilog.info(DOMAIN, TAG, `getFormRect err: code is ${(error as BusinessError).code}, message ${(error as BusinessError).message}`);
          }
        })

      Button('on formOverflow').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick on formOverflow');
          let callback = (data: formInfo.OverflowRequest) => {
            hilog.info(0x0000, 'testTag', `formOverflow OverflowRequest, data: ${JSON.stringify(data)}`);
            hilog.info(0x0000, 'testTag', `formOverflow OverflowRequest, data.formId: ${data.formId}`);
            hilog.info(0x0000, 'testTag', `formOverflow OverflowRequest, data.isOverflow: ${data.isOverflow}`);
            hilog.info(0x0000, 'testTag', `formOverflow OverflowRequest, data.overflowInfo: ${data.overflowInfo}`);
          }
          try {
            formHost.onFormOverflow(callback);
            hilog.info(0x0000, 'testTag EntryFormAbility', 'formOverflow success');
          } catch (error) {
            hilog.info(0x0000, 'testTag EntryFormAbility', `formOverflow catch error ${error.code}, ${error.message}`);
          }
        })

      Button('off formOverflow').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick off formOverflow');
          let callback = (data: formInfo.OverflowRequest) => {
            hilog.info(0x0000, 'testTag', `formOverflow OverflowRequest, data: ${JSON.stringify(data)}`);
            hilog.info(0x0000, 'testTag', `formOverflow OverflowRequest, data.formId: ${data.formId}`);
            hilog.info(0x0000, 'testTag', `formOverflow OverflowRequest, data.isOverflow: ${data.isOverflow}`);
            hilog.info(0x0000, 'testTag', `formOverflow OverflowRequest, data.overflowInfo: ${data.overflowInfo}`);
          }
          try {
            formHost.offFormOverflow(callback);
            hilog.info(0x0000, 'testTag EntryFormAbility', 'formOverflow success');
          } catch (error) {
            hilog.info(0x0000, 'testTag EntryFormAbility', `formOverflow catch error ${error.code}, ${error.message}`);
          }
        })

      Button('on changeSceneAnimationState').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick on changeSceneAnimationState');
          let callback = (data: formInfo.ChangeSceneAnimationStateRequest) => {
            hilog.info(0x0000, 'testTag', `changeSceneAnimationState ChangeSceneAnimationStateRequest, data: ${JSON.stringify(data)}`);
            hilog.info(0x0000, 'testTag', `changeSceneAnimationState ChangeSceneAnimationStateRequest, data.formId: ${data.formId}`);
            hilog.info(0x0000, 'testTag', `changeSceneAnimationState ChangeSceneAnimationStateRequest, data.state: ${data.state}`);
          }
          try {
            formHost.onChangeSceneAnimationState(callback);
            hilog.info(0x0000, 'testTag EntryFormAbility', 'changeSceneAnimationState on success');
          } catch (error) {
            hilog.info(0x0000, 'testTag EntryFormAbility', `changeSceneAnimationState on catch error ${error.code}, ${error.message}`);
          }
        })

      Button('off changeSceneAnimationState').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick on changeSceneAnimationState');
          let callback = (data: formInfo.ChangeSceneAnimationStateRequest) => {
            hilog.info(0x0000, 'testTag', `changeSceneAnimationState ChangeSceneAnimationStateRequest, data: ${JSON.stringify(data)}`);
            hilog.info(0x0000, 'testTag', `changeSceneAnimationState ChangeSceneAnimationStateRequest, data.formId: ${data.formId}`);
            hilog.info(0x0000, 'testTag', `changeSceneAnimationState ChangeSceneAnimationStateRequest, data.state: ${data.state}`);
          }
          try {
            formHost.offChangeSceneAnimationState(callback);
            hilog.info(0x0000, 'testTag EntryFormAbility', 'changeSceneAnimationState off success');
          } catch (error) {
            hilog.info(0x0000, 'testTag EntryFormAbility', `changeSceneAnimationState off catch error ${error.code}, ${error.message}`);
          }
        })

      FormComponent({
        id: this.formId,
        name: 'widget',
        bundle: 'com.example.actsformtest.static',
        ability: 'EntryFormAbility',
        module: 'entry',
        dimension: FormDimension.Dimension_2_2,
        temporary: true
      })
        .allowUpdate(true)
        .visibility(Visibility.Visible)
        .width(300)
        .height(300)
        .onAcquired((form: FormCallbackInfo) => {
          hilog.info(DOMAIN, TAG, `form info: ${JSON.stringify(form)}`);
          // Invalid form id
          if (form.id == -1) {
            this.formId = form.idString;
          } else {
            this.formId = form.id.toString();
          }
        })
        .onUninstall((form: FormCallbackInfo) => {
          hilog.info(DOMAIN, TAG, `uninstall form success : ${JSON.stringify(form)}`);
          // Invalid form id
          if (form.id == -1) {
            this.formId = form.idString;
          } else {
            this.formId = form.id.toString();
          }
        })
        .onUpdate((form: FormCallbackInfo) => {
          hilog.info(DOMAIN, TAG, `form update done : ${JSON.stringify(form)}`);
        })
    }
  }
}
