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
import formBindingData from '@ohos.application.formBindingData';
import formManager from '@ohos.application.formHost';
import formProvider from '@ohos.application.formProvider';

@Entry
@Component
struct Index {
  @State formId: number = 0;
  @State bundle: string = "com.form.formsystemtestservicea.hmservice";
  @State ability: string = "com.form.formsystemtestservicea.hmservice.MainAbility";
  @State moduleName: string = "entry";
  @State name: string = "Form_Js001";
  @State allowUpate: boolean = true;
  @State isShowing: boolean = true;
  @State canCreateForm: boolean = false;

  private dimension: FormDimension = FormDimension.Dimension_1_2;

  private updateForm = false;
  private updateId = "-1";
  private jsonEmpty = false;
  private releaseForm = false;
  private releaseId = "-1";
  private deleteForm = false;
  private deleteId = "-1";
  private temporaryId="-1";
  private temporary = false;

  private isStartOtherApp = false;
  private otherAppState = "visible";

  private formOnAcquiredEvent = "FMS_FormOnAcquired_commonEvent";
  private formOnErrorEvent = "FMS_FormOnError_commonEvent";
  private formOnDeletedEvent = "FMS_FormOnDeleted_commonEvent";
  private formOnReleasedEvent = "FMS_FormOnReleased_commonEvent";
  private formOnUpdatedEvent = "FMS_FormUpdateRefresh_commonEvent";

  private subscriberDel;
  private subscriberFormDeleteEvent = {
    events: ["FMS_FormDelete_commonEvent"],
  };

  private publishOnErrorCallBack = () => {
    this.canCreateForm = false;
    console.debug("====>formsystemhostc formOnErrorEventCallBack ====>");
  }
  private publishOnDeletedCallBack = () => {
    this.canCreateForm = false;
    console.debug("====>formsystemhostc publishOnDeletedCallBack ====>");
  }
  private publishOnReleasedCallBack = () => {
    this.canCreateForm = false;
    console.debug("====>formsystemhostc publishOnReleasedCallBackk ====>");
  }
  private publishOnAcquiredCallBack = () => {
    console.debug("====>formsystemhostc formOnAcquiredEventCallBack ====>");
  }
  private publishOnUpdatedCallBack = () => {
    this.canCreateForm = false;
    console.debug("====>formsystemhostc publishOnUpdatedCallBack ====>");
  }
  private deleteCallBack = (err, data) => {
    console.info("!!!====>formsystemhost deleteCallBack start:====>" + JSON.stringify(data));
    if(data.bundleName && data.bundleName != "com.ohos.st.formsystemhostf") {
      return;
    }
    formManager.deleteForm(data.data)
      .then((data2) => {
        console.info('[FormComponent] deleteForm result:' + data2);
      });

    this.canCreateForm = false;
    console.info("!!!====>formsystemhost deleteCallBack end ====>");
  }

  aboutToAppear() {
    commonEvent.createSubscriber(this.subscriberFormDeleteEvent).then(async (data) => {
        console.info("====>formsystemhost Subscriber FormDelete data:====>", JSON.stringify(data)); 
        this.subscriberDel = data;     
        await commonEvent.subscribe(this.subscriberDel, this.deleteCallBack);
    })

    console.error('[FormComponent] getWant');
    featureAbility.getWant()
    .then((want: any) => {
      this.formId = parseInt(want.parameters.formId);
      this.name = want.parameters.name;
      this.bundle =  want.parameters.bundle;
      this.ability = want.parameters.ability;
      if(want.parameters.moduleName) {
        this.moduleName = want.parameters.moduleName;
      }
      if(want.parameters.temporary) {
        this.temporary = want.parameters.temporary;
      }
      if(want.parameters.dimension) {
        this.dimension = want.parameters.dimension;
      }
      if(!this.dimension) {
        this.dimension = FormDimension.Dimension_1_2;
      }
      if(want.parameters.temporaryId) {
        this.temporaryId = want.parameters.temporaryId;
      }
      if(want.parameters.deleteForm) {
        this.deleteForm = want.parameters.deleteForm;
      }
      if(want.parameters.deleteId) {
        this.deleteId = want.parameters.deleteId;
      }
      if(want.parameters.releaseForm) {
        this.releaseForm = want.parameters.releaseForm;
      }
      if(want.parameters.releaseId) {
        this.releaseId = want.parameters.releaseId;
      }
      if(want.parameters.updateForm) {
        this.updateForm = want.parameters.updateForm;
      }
      if(want.parameters.updateId) {
        this.updateId = want.parameters.updateId;
      }
      if(want.parameters.jsonEmpty) {
        this.jsonEmpty = want.parameters.jsonEmpty;
      }
      if(want.parameters.isStartOtherApp) {
        this.isStartOtherApp = true;
        if(want.parameters.otherAppState) {
          this.otherAppState = want.parameters.otherAppState;
        }
      }

      setTimeout(() => {
        this.canCreateForm = want.parameters.isCreate ? true : false;
        console.error('[FormComponent] getWant canCreateForm:'+ this.canCreateForm); 
      }, 10); 
      console.error('[FormComponent] getWant end'+ JSON.stringify(want));

      if(!want.parameters.isCreate && this.deleteForm) {
        console.log("formsystemhost deleteForm start");
        formManager.deleteForm(this.deleteId)
          .then((data) => {
          console.info('formsystemhost deleteForm result:' + data);
          let commonEventPublishData = {
            data: "0",
            parameters: {
              "formId" : this.deleteId.toString()
            }
          };
          commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
        })
        .catch((error) => {
          console.info('formsystemhost deleteForm error:' + error);
          let commonEventPublishData = {
            data: error.code.toString(),
            parameters: {
              "formId" : this.deleteId.toString()
            }
          };
          commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
        });
      
        console.log("formsystemhost deleteForm end");
      }

      if(!want.parameters.isCreate && this.releaseForm) {
        console.log("formsystemhost releaseForm start");
        formManager.releaseForm(this.releaseId)
          .then((data) => {
          console.info('formsystemhost releaseForm result:' + data);
          let commonEventPublishData = {
            data: "0",
            parameters: {
              "formId" : this.releaseId.toString()
            }
          };
          commonEvent.publish(this.formOnReleasedEvent, commonEventPublishData, this.publishOnReleasedCallBack);
        })
        .catch((error) => {
          console.info('formsystemhost releaseForm error:' + error);
          let commonEventPublishData = {
            data: error.code.toString(),
            parameters: {
              "formId" : this.releaseId.toString()
            }
          };
          commonEvent.publish(this.formOnReleasedEvent, commonEventPublishData, this.publishOnReleasedCallBack);
        });
      
        console.log("formsystemhost releaseForm end");
      }

      if(!want.parameters.isCreate && this.updateForm) {
        console.log("formsystemhost updateForm start");
        let formData = {
            temperature: "11°",
            time: "11:00",
            area: "Shenyang",
            epidemic: true,
            count: 10
        };
        if(this.jsonEmpty) {
          formData = {
          temperature: "",
          time: "",
          area: "",
          epidemic: true,
          count: 1
          };
        }
        let bindingData = formBindingData.createFormBindingData(formData);
        formProvider.updateForm(this.updateId, bindingData)
          .then((data) => {
          console.info('formsystemhost updateForm result:' + data);
          let commonEventPublishData = {
            data: "0",
            parameters: {
              "formId" : this.updateId
            }
          };
          commonEvent.publish(this.formOnUpdatedEvent, commonEventPublishData, this.publishOnUpdatedCallBack);
        })
        .catch((error) => {
          console.info('formsystemhost updateForm error:' + error);
          let commonEventPublishData = {
            data: error.code.toString(),
            parameters: {
              "formId" : this.updateId
            }
          };
          commonEvent.publish(this.formOnUpdatedEvent, commonEventPublishData, this.publishOnUpdatedCallBack);
        });
      
        console.log("formsystemhost releaseForm end");
      }

    })
    .catch((error: any) => {
      console.error('[FormComponent] Operation failed. Cause: ' + JSON.stringify(error));
    })
    console.log(`[FormComponent.host] aboutToAppear end`);
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
              console.log("[FormComponent.host] get form, form id:" + form.id);
              this.formId = form.id;
              if(this.deleteForm) {
                console.log("[FormComponent.host] deleteForm start");
                if(this.deleteId == "self") {
                  this.deleteId = this.formId.toString();
                }
                setTimeout(() => {
                  formManager.deleteForm(this.deleteId)
                    .then((data) => {
                    console.info('[FormComponent] deleteForm result:' + data);
                    var commonEventPublishData = {
                      data: "0",
                      parameters: {
                        "formId" : this.deleteId.toString()
                      }
                    };
                    commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
                  })
                  .catch((error) => {
                    console.info('formsystemhost deleteForm error:' + error);
                    let commonEventPublishData = {
                      data: error.code.toString(),
                      parameters: {
                        "formId" : this.deleteId.toString()
                      }
                    };
                    commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
                  });               
                  console.log("[FormComponent.host] deleteForm end");
                }, 500);                
              } else if(this.releaseForm) {
                console.log("[FormComponent.host] releaseForm start");
                if(this.releaseId == "self") {
                  this.releaseId = this.formId.toString();
                }
                setTimeout(() => {
                  formManager.releaseForm(this.releaseId)
                    .then((data) => {
                    console.info('[FormComponent] releaseForm result:' + data);
                    var commonEventPublishData = {
                      data: "0",
                      parameters: {
                        "formId" : this.releaseId.toString()
                      }
                    };
                    commonEvent.publish(this.formOnReleasedEvent, commonEventPublishData, this.publishOnReleasedCallBack);
                  })
                  .catch((error) => {
                    console.info('formsystemhost releaseForm error:' + error);
                    let commonEventPublishData = {
                      data: error.code.toString(),
                      parameters: {
                        "formId" : this.releaseId.toString()
                      }
                    };
                    commonEvent.publish(this.formOnReleasedEvent, commonEventPublishData, this.publishOnReleasedCallBack);
                  });
               
                  console.log("[FormComponent.host] releaseForm end");
                }, 500);                
              } else if (this.updateForm) {
                console.log("formsystemhost updateForm start");
                let formData = {
                    temperature: "11°",
                    time: "11:00",
                    area: "Shenyang",
                    epidemic: true,
                    count: 10
                };
                if(this.jsonEmpty) {
                  formData = {
                  temperature: "",
                  time: "",
                  area: "",
                  epidemic: true,
                  count: 1
                  };
                }
                let bindingData = formBindingData.createFormBindingData(formData);
                formProvider.updateForm(this.updateId, bindingData)
                  .then((data) => {
                  console.info('formsystemhost updateForm result:' + data);
                  let commonEventPublishData = {
                    data: "0",
                    parameters: {
                      "formId" : this.updateId
                    }
                  };
                  commonEvent.publish(this.formOnUpdatedEvent, commonEventPublishData, this.publishOnUpdatedCallBack);
                })
                .catch((error) => {
                  console.info('formsystemhost updateForm error:' + error);
                  let commonEventPublishData = {
                    data: error.code.toString(),
                    parameters: {
                      "formId" : this.updateId
                    }
                  };
                  commonEvent.publish(this.formOnUpdatedEvent, commonEventPublishData, this.publishOnUpdatedCallBack);
                });
              
                console.log("formsystemhost releaseForm end");
              } else if (this.isStartOtherApp) {
                console.log("formsystemhost app G start");
                featureAbility.startAbility({
                  want: {
                      bundleName: "com.ohos.st.formsystemhostg",
                      abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                      parameters: {
                          "formId" : "0",
                          "name" : "name",
                          "bundle" : "bundle",
                          "ability" : "ability",
                          "moduleName" : "entry",
                          "temporary" : false,
                          "stateForm" : this.otherAppState,
                          "stateIds" : [this.formId.toString()],
                          "isCreate" : false
                      }
                  }
                }).then((res: any) => {
                    console.log(`formsystemhost featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`formsystemhost featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
              } else {                
                var commonEventPublishData = {
                    data: this.formId.toString()
                };
                commonEvent.publish(this.formOnAcquiredEvent, commonEventPublishData, this.publishOnAcquiredCallBack);
              }
            })
            // .onUninstall((info) => {
            //   console.log("[FormComponent] onUninstall:" + JSON.stringify(info));
            // })
            .onError((error) => {
              console.log("[FormComponent.host] error code:" + error.errcode);
              console.log("[FormComponent.host] error msg:" + error.msg);
              if(this.deleteForm && this.deleteId) {
                let commonEventPublishData = {
                    data: error.msg,
                    parameters: {
                      "formId" : this.formId.toString()
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
