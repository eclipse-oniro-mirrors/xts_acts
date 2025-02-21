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
import featureAbility from "@ohos.ability.featureAbility";
import formHost from '@ohos.application.formHost';

@Entry
@Component
struct Index {
  @State formId: number = 0;
  @State bundle: string = "com.acts.form.formsystemtestservicea.hmservice";
  @State ability: string = "MainAbility";
  @State moduleName: string = "entry";
  @State name: string = "Form_Js001";
  @State allowUpate: boolean = true;
  @State isShowing: boolean = true;
  @State canCreateForm: boolean = false;
  private dimension: FormDimension = FormDimension.Dimension_1_2;

  private TAG = `[FormComponent.host.a]`;
  private deleteForm = false;
  private deleteId = "-1";
  private temporaryId = "-1";
  private temporary = false;
  private castForm = false;

  private formOnAcquiredEvent = "FMS_FormOnAcquired_commonEvent";
  private formCastEvent = "FMS_FormCast_commonEvent";
  private formOnErrorEvent = "FMS_FormOnError_commonEvent";
  private formOnUninstallEvent = "FMS_FormOnUninstall_commonEvent";

  private subscriberDel;
  private subscriberFormDeleteEvent = {
    events: ["FMS_FormDelete_commonEvent"],
  };

  private publishOnErrorCallBack = () => {
    this.canCreateForm = false;
    console.debug(`====>${this.TAG} formOnErrorEvent Publish CallBack ====>`);
  }
  private publishOnAcquiredCallBack = () => {
    console.debug(`====>${this.TAG} formOnAcquiredEvent Publish CallBack ====>`);
  }
  private publishCastCallBack = () => {
    console.debug(`====>${this.TAG} formCastEvent Publish CallBack ====>`);
  }

  private publishOnUninstallCallBack = () => {
    console.debug(`====>${this.TAG} formOnUninstallEvent Publish CallBack ====>`);
  }

  private deleteCallBack = (err, data) => {
    console.info(`!!!====>${this.TAG} formsystemhost deleteCallBack start:====>` + JSON.stringify(data));
    if (data.bundleName && data.bundleName != "com.ohos.st.formsystemhost") {
      return;
    }
    formHost.deleteForm(data.data)
      .then((data2) => {
        console.info(`${this.TAG} deleteForm result:` + data2);
      });

    this.canCreateForm = false;
    console.info(`!!!====>${this.TAG} formsystemhost deleteCallBack end ====>`);
  }

  aboutToAppear() {
    commonEvent.createSubscriber(this.subscriberFormDeleteEvent).then(async (data) => {
      console.info(`====>${this.TAG} formsystemhost Subscriber FormDelete data:====>`, JSON.stringify(data));
      this.subscriberDel = data;
      await commonEvent.subscribe(this.subscriberDel, this.deleteCallBack);
    })

    console.error(`${this.TAG} getWant`);
    featureAbility.getWant()
      .then((want: any) => {
        console.info(`${this.TAG} getWant data: ${JSON.stringify(want)}`);
        this.formId = parseInt(want.parameters.formId);
        this.name = want.parameters.name;
        this.bundle = want.parameters.bundle;
        this.ability = want.parameters.ability;
        if (want.parameters.moduleName) {
          this.moduleName = want.parameters.moduleName;
        }
        if (want.parameters.temporary) {
          this.temporary = want.parameters.temporary;
        }
        console.log(`${this.TAG} formsystemhost dimension1:` + this.dimension);
        if (want.parameters.dimension) {
          this.dimension = want.parameters.dimension;
        }
        console.log(`${this.TAG} formsystemhost dimension2:` + this.dimension);
        if (want.parameters.castForm) {
          this.castForm = want.parameters.castForm;
        }
        if (want.parameters.temporaryId) {
          this.temporaryId = want.parameters.temporaryId;
        }
        if (want.parameters.deleteForm) {
          this.deleteForm = want.parameters.deleteForm;
        }
        if (want.parameters.deleteId) {
          this.deleteId = want.parameters.deleteId;
        }
        setTimeout(() => {
          this.canCreateForm = want.parameters.isCreate ? true : false;
          console.error(`${this.TAG} getWant canCreateForm:` + this.canCreateForm);
        }, 10);
        console.error(`${this.TAG} getWant end` + JSON.stringify(want));

        if (!want.parameters.isCreate && this.deleteForm) {
          console.log(`${this.TAG} formsystemhost deleteForm start`);
          formHost.deleteForm(this.deleteId)
            .then((data) => {
              console.info(`${this.TAG} formsystemhost deleteForm result:` + data);
              let commonEventPublishData = {
                data: (data + "") || "0",
                parameters: {
                  "formId": this.deleteId.toString()
                }
              };
              commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
            })
            .catch((error) => {
              console.info(`${this.TAG} deleteForm error:` + error);
              let commonEventPublishData = {
                data: error.code.toString(),
                parameters: {
                  "formId": this.deleteId.toString()
                }
              };
              commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
            });
          console.log(`${this.TAG} formsystemhost deleteForm end`);
        }
        if (!want.parameters.isCreate && this.castForm) {
          console.log(`${this.TAG} castTempForm start`);
          formHost.castTempForm(this.temporaryId)
            .then((data) => {
              console.info(`${this.TAG} castTempForm result:` + data);
              setTimeout(() => {
                let commonEventPublishData = {
                  data: (data + "") || "0",
                  parameters: {
                    "formId": this.temporaryId.toString()
                  }
                };
                commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
              }, 5);
            })
            .catch((error) => {
              console.info(`${this.TAG} castTempForm error:` + error);
              setTimeout(() => {
                let commonEventPublishData = {
                  data: error.code.toString(),
                  parameters: {
                    "formId": this.temporaryId.toString()
                  }
                };
                commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
              }, 5);
            });
          console.log(`${this.TAG} castTempForm end`);
        }
      })
      .catch((error: any) => {
        console.error(`${this.TAG} Operation failed. Cause: ` + JSON.stringify(error));
      })
    console.log(`${this.TAG} aboutToAppear end`);
  }

  build() {
    Column() {
      Text('form component test begin')
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
            .allowUpdate(this.allowUpate)
            .visibility(this.isShowing ? Visibility.Visible : Visibility.Hidden)
            .onAcquired((form) => {
              console.log(`${this.TAG} get form, form id:` + form.id);
              this.formId = form.id;
              if (this.castForm) {
                console.log(`${this.TAG} castTempForm start`);
                formHost.castTempForm(this.temporaryId)
                  .then((data) => {
                    console.info(`${this.TAG} castTempForm result:` + data);
                    setTimeout(() => {
                      let commonEventPublishData = {
                        data: (data + "") || "0",
                        parameters: {
                          "formId": this.formId.toString()
                        }
                      };
                      commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
                    }, 5);
                  })
                  .catch((error) => {
                    console.info(`${this.TAG} castTempForm error:` + error);
                    setTimeout(() => {
                      let commonEventPublishData = {
                        data: error.code.toString(),
                        parameters: {
                          "formId": this.temporaryId.toString()
                        }
                      };
                      commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
                    }, 5);
                  });
                console.log(`${this.TAG} castTempForm end`);
              } else if (this.deleteForm) {
                console.log(`${this.TAG} deleteForm start`);
                if (this.deleteId == "self") {
                  this.deleteId = this.formId.toString();
                }
                setTimeout(() => {
                  formHost.deleteForm(this.deleteId)
                    .then((data) => {
                      console.info(`${this.TAG} deleteForm result:` + data);
                      let commonEventPublishData = {
                        data: (data + "") || "0",
                        parameters: {
                          "formId": this.deleteId.toString()
                        }
                      };
                      commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
                    })
                    .catch((error) => {
                      console.info(`${this.TAG} deleteForm error:` + error);
                      let commonEventPublishData = {
                        data: error.code.toString(),
                        parameters: {
                          "formId": this.deleteId.toString()
                        }
                      };
                      commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
                    });

                  console.log(`${this.TAG} deleteForm end`);
                }, 1000);
              } else {
                let commonEventPublishData = {
                  data: this.formId.toString(),
                  parameters: {
                    "formId": this.deleteId.toString()
                  }
                };
                commonEvent.publish(this.formOnAcquiredEvent, commonEventPublishData, this.publishOnAcquiredCallBack);
              }
            })
            .onUninstall((info) => {
              console.log(`${this.TAG} onUninstall:` + JSON.stringify(info));
              let commonEventPublishData = {
                data: this.formId.toString(),
                parameters: {
                  "formId": info.id.toString()
                }
              };
              commonEvent.publish(this.formOnUninstallEvent, commonEventPublishData, this.publishOnUninstallCallBack);
            })
            .onError((error) => {
              console.log(`${this.TAG} error code:` + error.errcode);
              console.log(`${this.TAG} error msg:` + error.msg);
              if (this.deleteForm && this.deleteId) {
                let commonEventPublishData = {
                  data: error.msg,
                  parameters: {
                    "formId": this.formId.toString()
                  }
                };
                commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
              } else {
                let commonEventPublishData = {
                  data: error.msg
                };
                commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
              }
            })
        }
      }
        .backgroundColor(Color.White)
      Text('form component test end')
    }
      .backgroundColor(Color.White)
  }
}