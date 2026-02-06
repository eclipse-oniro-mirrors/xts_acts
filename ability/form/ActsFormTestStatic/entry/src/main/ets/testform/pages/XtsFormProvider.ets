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

import { Text, Component, Column, Row, Button, Scroll, ClickEvent, Entry, FormComponent, FormCallbackInfo, Visibility } from '@ohos.arkui.component';
import { BusinessError, RecordData } from '@ohos.base';
import hilog from '@ohos.hilog';
import formBindingData from '@ohos.app.form.formBindingData';
import formHost from '@ohos.app.form.formHost';
import formInfo from '@ohos.app.form.formInfo';
import formProvider from '@ohos.app.form.formProvider';
import Want from '@ohos.app.ability.Want';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';

@Entry
@Component
struct XtsFormProvider {
  formComponentId: string = '0'
  formId: string = '1566228237' //用hap包装好的应用的卡片id
  formId2: string = '21347330770' //用hap包装好的应用的卡片id
  falseFormId: string = '1735111111'
  formName: string = 'widget';
  bundleName: string = 'com.example.actsformtest.static'
  moduleName: string = 'entry'
  abilityName: string = 'EntryFormAbility'
  aboutToAppear() {
    hilog.info(DOMAIN, TAG, 'XtsFormProvider enter');

    try {
      formProvider.setFormNextRefreshTime(this.formId, 2, (error: BusinessError<void> | null) => {
        if (error?.code) {
          hilog.info(DOMAIN, TAG, `XtsFormProvider callback code: ${error?.code}, message: ${error?.message}`);
        }
        hilog.info(DOMAIN, TAG, 'XtsFormProvider setFormNextRefreshTime callback success');
      });
      hilog.info(DOMAIN, TAG, 'XtsFormProvider setFormNextRefreshTime register success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, `XtsFormProvider catch error, code: ${error?.code}, message: ${error?.message}`);
    }

    try {
      formProvider.setFormNextRefreshTime(this.formId2, 3).then(() => {
        hilog.info(DOMAIN, TAG, `XtsFormProvider setFormNextRefreshTime success`);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `XtsFormProvider promise error, code: ${error?.code}, message: ${error?.message}`);
      });
      hilog.info(DOMAIN, TAG, 'XtsFormProvider setFormNextRefreshTime register success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, `XtsFormProvider catch error, code: ${error?.code}, message: ${error?.message}`);
    }
  }

  build() {
    Column() {
      Text('XTS FormProvider').fontSize(20)
      Scroll() {
        Column() {
          Button('openFormManagerCrossBundle success').backgroundColor('#ff35e288')
            .onClick((event: ClickEvent) => {
              hilog.info(DOMAIN, TAG, 'onClick openFormManagerCrossBundle');
              let want: Want = {
                bundleName: 'com.example.actsformtest.static',
                abilityName: 'EntryAbility',
                parameters: {
                  'ohos.extra.param.key.form_dimension': 2,
                  'ohos.extra.param.key.form_name': 'widget',
                  'ohos.extra.param.key.module_name': 'entry'
                } as Record<string, RecordData>
              };
              try {
                formProvider.openFormManagerCrossBundle(want)
                hilog.info(DOMAIN, TAG, '%{public}s', `formProvider openFormManagerCrossBundle success`);
              } catch (error) {
                hilog.error(DOMAIN, TAG, '%{public}s',
                  `openFormManagerCrossBundle error: ${error.code}, ${error.message}`);
              }
            })

          Button('openFormManagerCrossBundle error').backgroundColor('#ff35e288')
            .onClick((event: ClickEvent) => {
              hilog.info(DOMAIN, TAG, 'onClick openFormManagerCrossBundle');
              let want: Want = {};
              try {
                formProvider.openFormManagerCrossBundle(want)
                hilog.info(DOMAIN, TAG, '%{public}s', `formProvider openFormManagerCrossBundle success`);
              } catch (error) {
                hilog.error(DOMAIN, TAG, '%{public}s', `openFormManagerCrossBundle error: ${JSON.stringify(error)}`);
                hilog.error(DOMAIN, TAG, '%{public}s', `openFormManagerCrossBundle error.code: ${error.code}`);
              }
            })

          Button('getFormsInfo Tests').backgroundColor('#ff35e288')
            .onClick((e: ClickEvent) => {
              hilog.info(DOMAIN, TAG, 'onClick getFormsInfo');
              let filter: formInfo.FormInfoFilter = {
                bundleName: this.bundleName,
                moduleName: this.moduleName
              };
              try {
                formProvider.getFormsInfo(filter, (error: BusinessError<void> | null,
                  result: Array<formInfo.FormInfo> | undefined) => {
                  hilog.info(DOMAIN, TAG, JSON.stringify(result));
                  hilog.info(DOMAIN, TAG, 'formProvider getFormsInfo with filter callback success.');
                });
              } catch (error) {
                hilog.error(DOMAIN, TAG,
                  `formProvider getFormsInfo error, code: ${error?.code}, message: ${error?.message}`);
              }

              try {
                formProvider.getFormsInfo().then((result: Array<formInfo.FormInfo> | undefined) => {
                  hilog.info(DOMAIN, TAG, JSON.stringify(result));
                  hilog.info(DOMAIN, TAG, `formProvider getFormsInfo without arguments promise success.`);
                }).catch((error: Error) => {
                  hilog.error(DOMAIN, TAG,
                    `formProvider getFormsInfo without arguments error, code: ${error?.code}, message: ${error?.message}`);
                });
              } catch (error) {
                hilog.error(DOMAIN, TAG,
                  `formProvider getFormsInfo without arguments error, code: ${error?.code}, message: ${error?.message}`);
              }

              try {
                formProvider.getFormsInfo(filter).then((result: Array<formInfo.FormInfo> | undefined) => {
                  hilog.info(DOMAIN, TAG, JSON.stringify(result));
                  hilog.info(DOMAIN, TAG, `formProvider getFormsInfo with filter promise success`);
                }).catch((error: Error) => {
                  hilog.error(DOMAIN, TAG,
                    `formProvider getFormsInfo with filter error, code: ${error?.code}, message: ${error?.message}`);
                });
              } catch (error) {
                hilog.error(DOMAIN, TAG,
                  `formProvider getFormsInfo with filter error, code: ${error?.code}, message: ${error?.message}`);
              }

              try {
                formProvider.getFormsInfo((error: BusinessError<void> | null,
                  result: Array<formInfo.FormInfo> | undefined) => {
                  hilog.info(DOMAIN, TAG, JSON.stringify(result));
                  hilog.info(DOMAIN, TAG, 'formProvider getFormsInfo without filter callback success.');
                });
              } catch (error) {
                hilog.error(DOMAIN, TAG,
                  `formProvider getFormsInfo error, code: ${error?.code}, message: ${error?.message}`);
              }
            })

          Button('requestPublishForm Tests').onClick((e: ClickEvent) => {
            hilog.info(DOMAIN, TAG, 'requestPublishForm Tests triggered.');
            try {
              let wantParams: Record<string, RecordData> = {
                'ohos.extra.param.key.form_dimension': 2,
                'ohos.extra.param.key.form_name': 'widget',
                'ohos.extra.param.key.module_name': 'entry',
                'ohos.extra.param.key.form_is_theme': true,
              }
              let want: Want = {
                bundleName: this.bundleName,
                abilityName: this.abilityName,
                parameters: wantParams
              }
              let param: Record<string, string> = {
                'temperature': '22c',
                'time': '22:00'
              }

              formProvider.requestPublishForm(want).then((data: string | undefined) => {
                hilog.info(DOMAIN, TAG, `formProvider requestPublishForm promise, formId: ${JSON.stringify(data)}`);
              }).catch((error: Error) => {
                hilog.error(DOMAIN, TAG,
                  `formProvider requestPublishForm error, code: ${error?.code}, message: ${error?.message}`);
              });

              let bindingObject: formBindingData.FormBindingData = formBindingData.createFormBindingData(param);
              formProvider.requestPublishForm(want, bindingObject,
                (error: BusinessError | null, data: string | undefined) => {
                  if (error?.code) {
                    hilog.error(DOMAIN, TAG,
                      `formProvider requestPublishForm with bindingData callback error, code: ${error?.code}, message: ${error?.message}`);
                  } else {
                    hilog.info(DOMAIN, TAG,
                      `formProvider requestPublishForm with bindingData callback, formId: ${JSON.stringify(data)}`);
                  }
                });

              formProvider.requestPublishForm(want,
                (error: BusinessError | null, data: string | undefined) => {
                  if (error?.code) {
                    hilog.error(DOMAIN, TAG,
                      `formProvider requestPublishForm error, code: ${error?.code}, message: ${error?.message}`);
                  } else {
                    hilog.info(DOMAIN, TAG,
                      `formProvider requestPublishForm without bindingData callback, formId: ${JSON.stringify(data)}`);
                  }
                });
            } catch (error) {
              hilog.error(DOMAIN, TAG,
                `formProvider requestPublishForm without bindingData error, code: ${error?.code}, message: ${error?.message}`);
            }
          })

          Button('updateForm Tests').onClick((e: ClickEvent) => {
            hilog.info(DOMAIN, TAG, 'updateForm Tests triggered.');
            let bindingData: Record<string, string> = {
              'temperature': '11c',
              'time': '11:00'
            };
            let formBinding = formBindingData.createFormBindingData(bindingData)
            hilog.info(DOMAIN, TAG, 'proxies:' + JSON.stringify(formBinding.proxies));

            try {
              formProvider.updateForm(this.formId, formBinding, () => {
                hilog.info(DOMAIN, TAG, 'formProvider updateForm callback success');
              });
            } catch (error) {
              hilog.error(DOMAIN, TAG,
                `formProvider updateForm error, code: ${error?.code}, message: ${error?.message}`);
            }

            try {
              formProvider.updateForm(this.formId, formBinding).then(() => {
                hilog.info(DOMAIN, TAG, `formProvider updateForm promise success`);
              }).catch((error: Error) => {
                hilog.error(DOMAIN, TAG,
                  `formProvider updateForm promise error, code: ${error?.code}, message: ${error?.message}`);
              });
            } catch (error) {
              hilog.error(DOMAIN, TAG, `formProvider updateForm catch error, code: ${error.code} message: ${error.message}`);
            }
          })

          Button('openFormManager').onClick((e: ClickEvent) => {
            hilog.info(DOMAIN, TAG, 'openFormManager triggered.');
            let want: Want = {
              deviceId: '', // An empty deviceId indicates the local device.
              bundleName: this.bundleName,
              abilityName: this.abilityName
            };
            try {
              formProvider.openFormManager(want);
              hilog.info(DOMAIN, TAG, `formProvider openFormManager success`);
            } catch (error) {
              hilog.error(DOMAIN, TAG,
                `formProvider openFormManager error, code: ${error?.code}, message: ${error?.message}`);
            }
          })

          Button('openFormEditAbility').onClick((e: ClickEvent) => {
            hilog.info(DOMAIN, TAG, 'openFormEditAbility Tests triggered.');
            let editAbilityName: string = 'EntryFormEditAbility';

            try {
              const formIds = [this.formComponentId];
              formHost.notifyVisibleForms(formIds).then(() => {
                formProvider.openFormEditAbility(editAbilityName, this.formComponentId);
                hilog.info(DOMAIN, TAG, `formProvider openFormEditAbility success`);
              }).catch((error: Error) => {
                hilog.error(DOMAIN, TAG,
                  `openFormEditAbility->NotifyVisibleFormsWithPromise error | code: ${error?.code}, message: ${error?.message}`);
              });
            } catch (error) {
              hilog.error(DOMAIN, TAG,
                `formProvider openFormEditAbility error, code : ${error?.code}, message : ${error?.message}`);
            }
          })

          Button('IsRequestPublishFormSupported Tests').onClick((e: ClickEvent) => {
            hilog.info(DOMAIN, TAG, 'IsRequestPublishFormSupported Tests triggered.');
            try {
              formProvider.isRequestPublishFormSupported().then(() => {
                hilog.info(DOMAIN, TAG, `formProvider IsRequestPublishFormSupported success`);
              }).catch((error: Error) => {
                hilog.error(DOMAIN, TAG,
                  `formProvider IsRequestPublishFormSupported error, code: ${error?.code}, message: ${error?.message}`);
              });
            } catch (error) {
              hilog.error(DOMAIN, TAG, `formProvider IsRequestPublishFormSupported catch error, code: ${error.code} message: ${error.message}`);
            }

            try {
              formProvider.isRequestPublishFormSupported((error, result) => {
                if (error?.code) {
                  hilog.error(DOMAIN, TAG,
                    `formProvider IsRequestPublishFormSupported callback error, code: ${error?.code}, message: ${error?.message}`);
                } else {
                  hilog.info(DOMAIN, TAG, `formProvider IsRequestPublishFormSupported callback success`);
                }
              });
            } catch (error) {
              hilog.error(DOMAIN, TAG,
                `formProvider IsRequestPublishFormSupported error, code: ${error?.code}, message: ${error?.message}`);
            }
          })

          Button('getPublishedRunningFormInfos').onClick((e: ClickEvent) => {
            hilog.info(DOMAIN, TAG, 'getPublishedRunningFormInfos triggered.');
            try {
              formProvider.getPublishedRunningFormInfos().then((result: Array<formInfo.RunningFormInfo>) => {
                hilog.info(DOMAIN, TAG, `formProvider getPublishedRunningFormInfos success`);
              }).catch((error: Error) => {
                hilog.error(DOMAIN, TAG,
                  `formProvider getPublishedRunningFormInfos error, code: ${error?.code}, message: ${error?.message}`);
              });
            } catch (error) {
              hilog.error(DOMAIN, TAG,
                `formProvider getPublishedRunningFormInfos error, code: ${error?.code}, message: ${error?.message}`);
            }
          })

          Button('getPublishedRunningFormInfoById').onClick((e: ClickEvent) => {
            hilog.info(DOMAIN, TAG, 'getPublishedRunningFormInfoById triggered.');
            try {
              formProvider.getPublishedRunningFormInfoById(this.formId).then((result: formInfo.RunningFormInfo) => {
                hilog.info(DOMAIN, TAG, `formProvider getPublishedRunningFormInfoById success`);
              }).catch((error: Error) => {
                hilog.error(DOMAIN, TAG,
                  `formProvider getPublishedRunningFormInfoById error, code: ${error?.code}, message: ${error?.message}`);
              });
            } catch (error) {
              hilog.error(DOMAIN, TAG,
                `formProvider getPublishedRunningFormInfoById error, code: ${error?.code}, message: ${error?.message}`);
            }
          })

          Row() {
            FormComponent({
              id: this.formComponentId,
              name: this.formName,
              bundle: this.bundleName,
              ability: this.abilityName,
              module: this.moduleName,
            })
              .allowUpdate(true)
              .visibility(Visibility.Visible)
              .width(300)
              .height(300)
              .onAcquired((formInfo: FormCallbackInfo) => {
                hilog.info(DOMAIN, TAG, `form info: ${JSON.stringify(formInfo)}`);
                // Invalid-form-id
                if (formInfo.id === -1) {
                  this.formComponentId = formInfo.idString;
                } else {
                  this.formComponentId = formInfo.id.toString();
                }
                hilog.info(DOMAIN, TAG, `formComponentId: ${this.formComponentId}`);
              });
          }
        }
      }
    }
  }
}
