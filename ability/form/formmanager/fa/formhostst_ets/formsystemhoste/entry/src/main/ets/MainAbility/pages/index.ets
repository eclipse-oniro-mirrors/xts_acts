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
import formProvider from '@ohos.application.formProvider';

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

  private TAG = `[FormComponent.host.e]`;

  private requestForm = false;
  private requestId = "-1";
  private refreshForm = false;
  private refreshId = "-1";
  private refreshTime = 5;
  private notifyVisibleForms = false;
  private notifyVisibleId = "-1";
  private deleteForm = false;
  private deleteId = "-1";
  private temporaryId = "-1";
  private temporary = false;

  private formOnAcquiredEvent = "FMS_FormOnAcquired_commonEvent";
  private formOnErrorEvent = "FMS_FormOnError_commonEvent";
  private formOnDeletedEvent = "FMS_FormOnDeleted_commonEvent";
  private formOnDynamicRefreshEvent = "FMS_FormDynamicRefresh_commonEvent";
  private formOnRequestEvent = "FMS_FormOnRequest_commonEvent";

  private subscriberDel;
  private subscriberFormDeleteEvent = {
    events: ["FMS_FormDelete_commonEvent"],
  };

  private publishOnErrorCallBack = () => {
    this.canCreateForm = false;
    console.debug(`====>${this.TAG} formsystemhostc formOnErrorEventCallBack ====>`);
  }
  private publishOnDeletedCallBack = () => {
    this.canCreateForm = false;
    console.debug(`====>${this.TAG} formsystemhostc publishOnDeletedCallBack ====>`);
  }
  private formOnDynamicRefreshCallBack = () => {
    this.canCreateForm = false;
    console.debug(`====>${this.TAG} formsystemhostc formOnDynamicRefreshEventk ====>`);
  }
  private formOnRequestCallBack = () => {
    this.canCreateForm = false;
    console.debug(`====>${this.TAG} formsystemhostc formOnRequestCallBack ====>`);
  }
  private publishOnAcquiredCallBack = () => {
    console.debug(`====>${this.TAG} formsystemhostc formOnAcquiredEventCallBack ====>`);
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
        if (want.parameters.dimension) {
          this.dimension = want.parameters.dimension;
        }
        if (!this.dimension) {
          this.dimension = FormDimension.Dimension_1_2;
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
        if (want.parameters.refreshForm) {
          this.refreshForm = want.parameters.refreshForm;
        }
        if (want.parameters.refreshId) {
          this.refreshId = want.parameters.refreshId;
        }
        if (want.parameters.refreshTime) {
          this.refreshTime = want.parameters.refreshTime;
        }
        if (want.parameters.requestForm) {
          this.requestForm = want.parameters.requestForm;
        }
        if (want.parameters.requestId) {
          this.requestId = want.parameters.requestId;
        }
        if (want.parameters.notifyVisibleForms) {
          this.notifyVisibleForms = want.parameters.notifyVisibleForms;
        }
        if (want.parameters.notifyVisibleId) {
          this.notifyVisibleId = want.parameters.notifyVisibleId;
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
                data: "0",
                parameters: {
                  "formId": this.deleteId.toString()
                }
              };
              commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
            })
            .catch((error) => {
              console.info(`${this.TAG} formsystemhost deleteForm error:` + error);
              let commonEventPublishData = {
                data: error.code.toString(),
                parameters: {
                  "formId": this.deleteId.toString()
                }
              };
              commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
            });

          console.log(`${this.TAG} formsystemhost deleteForm end`);
        }
        if (!want.parameters.isCreate && this.refreshForm) {
          console.log(`${this.TAG} formsystemhost refreshForm start`);
          formProvider.setFormNextRefreshTime(this.refreshId, this.refreshTime)
            .then((data) => {
              console.info(`${this.TAG} formsystemhost refreshForm result:` + data);
              let commonEventPublishData = {
                data: "0",
                parameters: {
                  "formId": this.refreshId.toString()
                }
              };
              commonEvent.publish(this.formOnDynamicRefreshEvent, commonEventPublishData, this.formOnDynamicRefreshCallBack);
            })
            .catch((error) => {
              console.info(`${this.TAG} formsystemhost refreshForm error:` + JSON.stringify(error));
              let commonEventPublishData = {
                data: error.code.toString(),
                parameters: {
                  "formId": this.refreshId.toString()
                }
              };
              commonEvent.publish(this.formOnDynamicRefreshEvent, commonEventPublishData, this.formOnDynamicRefreshCallBack);
            });

          console.log(`${this.TAG} formsystemhost deleteForm end`);
        }
        if (!want.parameters.isCreate && this.requestForm) {
          console.log(`${this.TAG} requestForm start`);
          formHost.requestForm(this.requestId)
            .then((data) => {
              console.info(`${this.TAG} requestForm result:` + data);
              var commonEventPublishData = {
                data: "0",
                parameters: {
                  "formId": this.requestId
                }
              };
              commonEvent.publish(this.formOnRequestEvent, commonEventPublishData, this.formOnRequestCallBack);
            })
            .catch((error) => {
              console.info(`${this.TAG} requestForm error:` + error.toString());
              var commonEventPublishData = {
                data: error.code.toString(),
                parameters: {
                  "formId": this.requestId
                }
              };
              commonEvent.publish(this.formOnRequestEvent, commonEventPublishData, this.formOnRequestCallBack);
            });

          console.log(`${this.TAG} requestForm end`);
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
              if (this.deleteForm) {
                console.log(`${this.TAG} deleteForm start`);
                if (this.deleteId == "self") {
                  this.deleteId = this.formId.toString();
                }
                setTimeout(() => {
                  formHost.deleteForm(this.deleteId)
                    .then((data) => {
                      console.info(`${this.TAG} deleteForm result:` + data);
                      var commonEventPublishData = {
                        data: "0",
                        parameters: {
                          "formId": this.deleteId.toString()
                        }
                      };
                      commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
                    })
                    .catch((error) => {
                      console.info(`${this.TAG} formsystemhost deleteForm error:` + error);
                      let commonEventPublishData = {
                        data: error.code.toString(),
                        parameters: {
                          "formId": this.deleteId.toString()
                        }
                      };
                      commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
                    });

                  console.log(`${this.TAG} deleteForm end`);
                }, 1000);
              } else if (this.requestForm) {
                console.log(`${this.TAG} requestForm start`);
                if (this.requestId == "self") {
                  this.requestId = this.formId.toString();
                }
                setTimeout(() => {
                  formHost.requestForm(this.requestId)
                    .then((data) => {
                      console.info(`${this.TAG} requestForm result:` + data);
                      var delFormId = this.requestId;
                      if (this.requestId == "0" || this.requestId == "-1") {
                        delFormId = this.formId.toString();
                      }
                      var commonEventPublishData = {
                        data: "0",
                        parameters: {
                          "formId": delFormId
                        }
                      };
                      commonEvent.publish(this.formOnRequestEvent, commonEventPublishData, this.formOnRequestCallBack);
                    })
                    .catch((error) => {
                      console.info(`${this.TAG} requestForm error:` + error);
                      var delFormId = this.requestId;
                      if (this.requestId == "0" || this.requestId == "-1") {
                        delFormId = this.formId.toString();
                      }
                      var commonEventPublishData = {
                        data: error.code.toString(),
                        parameters: {
                          "formId": delFormId
                        }
                      };
                      commonEvent.publish(this.formOnRequestEvent, commonEventPublishData, this.formOnRequestCallBack);
                    });

                  console.log(`${this.TAG} requestForm end`);
                }, 1000);
              } else if (this.refreshForm) {
                console.log(`${this.TAG} formsystemhost refreshForm start`);
                if (this.refreshId == "self") {
                  this.refreshId = this.formId.toString();
                }
                setTimeout(() => {
                  formProvider.setFormNextRefreshTime(this.refreshId, this.refreshTime)
                    .then((data) => {
                      console.info(`${this.TAG} formsystemhost refreshForm result:` + data);
                      let commonEventPublishData = {
                        data: "0",
                        parameters: {
                          "formId": this.refreshId.toString()
                        }
                      };
                      commonEvent.publish(this.formOnDynamicRefreshEvent, commonEventPublishData, this.formOnDynamicRefreshCallBack);
                    })
                    .catch((error) => {
                      console.info(`${this.TAG} formsystemhost refreshForm error:` + error);
                      let commonEventPublishData = {
                        data: error.code.toString(),
                        parameters: {
                          "formId": this.refreshId.toString()
                        }
                      };
                      commonEvent.publish(this.formOnDynamicRefreshEvent, commonEventPublishData, this.formOnDynamicRefreshCallBack);
                    });
                }, 1000);
              } else if (this.notifyVisibleForms) {
                console.log(`${this.TAG} formsystemhost notifyVisibleForms start`);
                if (this.notifyVisibleId == "self") {
                  this.notifyVisibleId = this.formId.toString();
                }
                setTimeout(() => {
                  formHost.notifyVisibleForms([this.notifyVisibleId])
                    .then((data) => {
                      console.info(`${this.TAG} formsystemhost notifyVisibleForms result:` + data);
                      let commonEventPublishData = {
                        data: "0",
                        parameters: {
                          "formId": this.notifyVisibleId.toString()
                        }
                      };
                    })
                    .catch((error) => {
                      console.info(`${this.TAG} formsystemhost notifyVisibleForms error:` + error);
                      let commonEventPublishData = {
                        data: error.code.toString(),
                        parameters: {
                          "formId": this.notifyVisibleId.toString()
                        }
                      };
                    });
                }, 1000);
              } else {
                var commonEventPublishData = {
                  data: this.formId.toString()
                };
                commonEvent.publish(this.formOnAcquiredEvent, commonEventPublishData, this.publishOnAcquiredCallBack);
              }
            })
            .onUninstall((info) => {
              console.log(`${this.TAG} onUninstall:` + JSON.stringify(info));
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
                commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
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
