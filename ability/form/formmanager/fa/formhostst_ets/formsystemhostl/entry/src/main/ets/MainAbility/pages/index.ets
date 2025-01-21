/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import commonEvent from '@ohos.commonEvent';
import featureAbility from '@ohos.ability.featureAbility';
import formHost from '@ohos.application.formHost';

@Entry
@Component
struct Index {
  @State formId: number = 0;
  @State bundle: string = `com.acts.form.formsystemtestservicea.hmservice`;
  @State ability: string = `com.acts.form.formsystemtestservicea.hmservice.MainAbility`;
  @State moduleName: string = `entry`;
  @State name: string = `Form_Js001`;
  @State canCreateForm: boolean = false;
  @State allowUpdate: boolean = true;
  @State isShowing: boolean = true;
  @State dimension: FormDimension = FormDimension.Dimension_1_2;
  @State temporary: boolean = false;
  private requestForm = false;
  private requestId = `-1`;
  private subscriberDel;
  private subscriberFormDeleteEvent = {
    events: ["FMS_FormDelete_commonEvent"]
  };
  private TAG = `[FormComponent.host.l]`;
  private formOnAcquiredEvent = `FMS_FormOnAcquired_commonEvent`;
  private formOnRequestEvent = `FMS_FormOnRequest_commonEvent`;
  private formOnDeletedEvent = "FMS_FormOnDeleted_commonEvent";

  private onAcquiredCallback = () => {
    console.info(`====>${this.TAG} onAcquiredCallback====>`);
  }

  private onRequestCallback = () => {
    console.info(`====>${this.TAG} onRequestCallback====>`);
  }

  private unsubscribeDeleteCallback() {
    console.info(`${this.TAG} unSubscribeDeleteCallback====>`);
  }

  async aboutToAppear() {
    const onDeleteEventSubscriber = await commonEvent.createSubscriber(this.subscriberFormDeleteEvent);
    commonEvent.subscribe(onDeleteEventSubscriber, async (err, data) => {
      console.info(`${this.TAG} deleteCallBack start:====> ${JSON.stringify(data)}`);

      data.parameters.formIds.forEach(async (formId) => {
        await formHost.deleteForm(formId)
          .then((res) => {
            console.info(`${this.TAG} deleteForm result: ${JSON.stringify(res)}`);
          });
      });

      commonEvent.unsubscribe(onDeleteEventSubscriber, () => this.unsubscribeDeleteCallback());
      console.info(`${this.TAG} deleteCallBack end ====>`);
    });

    featureAbility.getWant()
      .then((want: any) => {
        console.info(`${this.TAG} getWant: ${JSON.stringify(want)}`);
        this.formId = want.parameters.formId;
        this.name = want.parameters.name;
        this.bundle = want.parameters.bundle;
        this.ability = want.parameters.ability;
        if (want.parameters.moduleName) {
          this.moduleName = want.parameters.moduleName;
        }
        if (want.parameters.temporary) {
          this.temporary = want.parameters.temporary;
        }
        if (want.parameters.dimension) {
          this.dimension = want.parameters.dimension;
        }
        if (want.parameters.requestForm) {
          this.requestForm = want.parameters.requestForm;
        }
        if (want.parameters.requestId) {
          this.requestId = want.parameters.requestId;
        }
        if (want.parameters.isCreate) {
          this.canCreateForm = want.parameters.isCreate;
        }

        if (!this.canCreateForm && this.requestForm) {
          let commonEventPublishData;
          formHost.requestForm(this.requestId)
            .then((data) => {
              console.info(`${this.TAG} requestForm result: ${JSON.stringify(data)}`);
              commonEventPublishData = {
                data: data + "",
                parameters: {
                  "formId": this.requestId
                }
              };
              commonEvent.publish(this.formOnRequestEvent, commonEventPublishData, this.onRequestCallback);
            })
            .catch((error) => {
              console.info(`${this.TAG} requestForm error: ${JSON.stringify(error)}`);
              commonEventPublishData = {
                parameters: {
                  "error": error
                }
              };
              commonEvent.publish(this.formOnRequestEvent, commonEventPublishData, this.onRequestCallback);
            });
        }
      })
      .catch((error: any) => {
        console.error(`${this.TAG} Operation failed. Cause: ${JSON.stringify(error)}`);
      })
  }

  build() {
    Column() {
      Text(`form component test begin`);
      Column() {
        if (this.canCreateForm) {
          FormComponent({
            id: this.formId,
            name: this.name,
            bundle: this.bundle,
            ability: this.ability,
            module: this.moduleName,
            dimension: this.dimension,
            temporary: this.temporary,
          })
            .allowUpdate(this.allowUpdate)
            .visibility(this.isShowing ? Visibility.Visible : Visibility.Hidden)
            .onAcquired((form) => {
              console.info(`${this.TAG} onAcquired, form id: ${form.id}`);
              this.formId = form.id;
              const commonEventPublishData = {
                data: this.formId.toString()
              };
              commonEvent.publish(this.formOnAcquiredEvent, commonEventPublishData, this.onAcquiredCallback);
            })
            .onUninstall((info) => {
              console.info(`${this.TAG} onUninstall: ${JSON.stringify(info)}`);
            })
            .onError((error) => {
              console.error(`${this.TAG} onError: ${JSON.stringify(error)}`);
            });
        }
      }
      .backgroundColor(Color.White)

      Text(`form component test end`);
    }
    .backgroundColor(Color.White)
  }
}
