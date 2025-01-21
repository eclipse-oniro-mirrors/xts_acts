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

  private stateForm = "visible";
  private doStateForm = false;
  private stateIds = [];
  private deleteForm = false;
  private deleteId = "-1";
  private temporaryId="-1";
  private temporary = false;

  private formOnAcquiredEvent = "FMS_FormOnAcquired_commonEvent";
  private formOnErrorEvent = "FMS_FormOnError_commonEvent";
  private formOnDeletedEvent = "FMS_FormOnDeleted_commonEvent";
  private formOnStateEvent = "FMS_FormOnState_commonEvent";

  private subscriberDel;
  private subscriberFormDeleteEvent = {
    events: ["FMS_FormDelete_commonEvent"],
  };

  private publishOnErrorCallBack = () => {
    this.canCreateForm = false;
    console.debug("====>[FormComponent.host] formOnErrorEventCallBack ====>");
  }
  private publishOnDeletedCallBack = () => {
    this.canCreateForm = false;
    console.debug("====>[FormComponent.host] publishOnDeletedCallBack ====>");
  }
  private publishOnStateCallBack = () => {
    this.canCreateForm = false;
    console.debug("====>[FormComponent.host] publishOnStateCallBack ====>");
  }
  private publishOnAcquiredCallBack = () => {
    console.debug("====>[FormComponent.host] formOnAcquiredEventCallBack ====>");
  }
  private deleteCallBack = (err, data) => {
    console.info("!!!====>[FormComponent.host] deleteCallBack start:====>" + JSON.stringify(data));
    if(data.bundleName && data.bundleName != "com.ohos.st.formsystemhostg") {
      return;
    }
    formHost.deleteForm(data.data)
      .then((data2) => {
        console.info('[FormComponent] deleteForm result:' + data2);
      });

    this.canCreateForm = false;
    console.info("!!!====>[FormComponent.host] deleteCallBack end ====>");
  }

  aboutToAppear() {
    commonEvent.createSubscriber(this.subscriberFormDeleteEvent).then(async (data) => {
        console.info("====>[FormComponent.host] Subscriber FormDelete data:====>", JSON.stringify(data)); 
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
      if(want.parameters.stateForm) {
        this.stateForm = want.parameters.stateForm;
        this.doStateForm = true;
      }
      if(want.parameters.stateIds) {
        this.stateIds = want.parameters.stateIds;
      }
      setTimeout(() => {
        this.canCreateForm = want.parameters.isCreate ? true : false;
        console.error('[FormComponent] getWant canCreateForm:'+ this.canCreateForm); 
      }, 10); 
      console.error('[FormComponent] getWant end'+ JSON.stringify(want));

      if(!want.parameters.isCreate && this.deleteForm) {
        console.log("[FormComponent.host] deleteForm start");
        formHost.deleteForm(this.deleteId)
          .then((data) => {
          console.info('[FormComponent.host] deleteForm result:' + data);
          let commonEventPublishData = {
            data: "0",
            parameters: {
              "formId" : this.deleteId,
            }
          };
          commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
        })
        .catch((error) => {
          console.info('[FormComponent.host] deleteForm error:' + error);
          let commonEventPublishData = {
            data: error.code.toString(),
            parameters: {
              "formId" : this.deleteId,
            }
          };
          commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
        });
      
        console.log("[FormComponent.host] deleteForm end");
      }

      if(!want.parameters.isCreate && this.stateForm) {        
        if(this.stateForm == "visible") {
          console.log("[FormComponent.host] notifyVisibleForm start");
          formHost.notifyVisibleForms(this.stateIds)
            .then((data) => {
            console.info('[FormComponent.host] notifyVisibleForm result:' + data);
            console.info('[FormComponent.host] notifyVisibleForm formId:' + this.stateIds[0]);
            let commonEventPublishData = {
              data: "0",
              parameters: {
                "kind": "visible",
                "formId" : this.stateIds[0]
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
          })
          .catch((error) => {
            console.info('[FormComponent.host] notifyVisibleForm error:' + error);
            let commonEventPublishData = {
              data: error.code.toString(),
              parameters: {
                "kind": "visible",
                "formId" : this.stateIds[0]
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
          });        
          console.log("[FormComponent.host] notifyVisibleForm end");
        } else if(this.stateForm == "invisible") {
          console.log("[FormComponent.host] notifyInvisibleForm start");
          formHost.notifyInvisibleForms(this.stateIds)
            .then((data) => {
            console.info('[FormComponent.host] notifyInvisibleForm result:' + data);
            console.info('[FormComponent.host] notifyInvisibleForm formId:' + this.stateIds[0]);
            let commonEventPublishData = {
              data: "0",
              parameters: {
                "kind": "invisible",
                "formId" : this.stateIds[0]
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
          })
          .catch((error) => {
            console.info('[FormComponent.host] notifyInvisibleForm error:' + error);
            let commonEventPublishData = {
              data: error.code.toString(),
              parameters: {
                "kind": "invisible",
                "formId" : this.stateIds[0]
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
          });
          console.log("[FormComponent.host] notifyInvisibleForm end");
        } else if(this.stateForm == "enable") {
          console.log("[FormComponent.host] enableFormsUpdate start");
          formHost.enableFormsUpdate(this.stateIds)
            .then((data) => {
            console.info('[FormComponent.host] enableFormsUpdate result:' + data);
            let commonEventPublishData = {
              data: "0",
              parameters: {
                "kind": "enable",
                "formId" : this.stateIds[0]
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
          })
          .catch((error) => {
            console.info('[FormComponent.host] enableFormsUpdate error:' + error);
            let commonEventPublishData = {
              data: error.code.toString(),
              parameters: {
                "kind": "enable",
                "formId" : this.stateIds[0]
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
          });        
          console.log("[FormComponent.host] enableFormsUpdate end");
        } else {
          console.log("[FormComponent.host] disableFormsUpdate start");
          formHost.disableFormsUpdate(this.stateIds)
            .then((data) => {
            console.info('[FormComponent.host] disableFormsUpdate result:' + data);
            let commonEventPublishData = {
              data: "0",
              parameters: {
                "kind": "disable",
                "formId" : this.stateIds[0]
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
          })
          .catch((error) => {
            console.info('[FormComponent.host] disableFormsUpdate error:' + error);
            let commonEventPublishData = {
              data: error.code.toString(),
              parameters: {
                "kind": "disable",
                "formId" : this.stateIds[0]
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
          });        
          console.log("[FormComponent.host] disableFormsUpdate end");
        }
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
                  formHost.deleteForm(this.deleteId)
                    .then((data) => {
                    console.info('[FormComponent] deleteForm result:' + data);
                    let commonEventPublishData = {
                      data: "0",
                      parameters: {
                        "formId" : this.deleteId,
                      }
                    };
                    commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
                  })
                  .catch((error) => {
                    console.info('[FormComponent.host] deleteForm error:' + error);
                    let commonEventPublishData = {
                      data: error.code.toString(),
                      parameters: {
                        "formId" : this.deleteId
                      }
                    };
                    commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
                  });
               
                  console.log("[FormComponent.host] deleteForm end");
                }, 500);
              } else if(this.doStateForm) {
                console.log("[FormComponent.host] state start");
                if((this.stateIds.length != 0) && (this.stateIds[0] == "self")) {
                  this.stateIds = [this.formId.toString()];
                }
                console.info('[FormComponent.host] notifyVisibleForm stateIds:' + this.stateIds);
                setTimeout(() => {
                  if(this.stateForm == "visible") {
                    console.log("[FormComponent.host] notifyVisibleForm start");
                    formHost.notifyVisibleForms(this.stateIds)
                      .then((data) => {
                      console.info('[FormComponent.host] notifyVisibleForm result:' + data);
                      console.info('[FormComponent.host] notifyVisibleForm formId:' + this.stateIds[0]);
                      if(this.stateIds.length == 0) {
                        this.stateIds = ["-1"];
                      }
                      let commonEventPublishData = {
                        data: "0",
                        parameters: {
                          "kind": "visible",
                          "formId" : this.stateIds[0]
                        }
                      };
                      commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
                    })
                    .catch((error) => {
                      console.info('[FormComponent.host] notifyVisibleForm error:' + error);
                      if(this.stateIds.length == 0) {
                        this.stateIds = ["-1"];
                      }
                      let commonEventPublishData = {
                        data: error.code.toString(),
                        parameters: {
                          "kind": "visible",
                          "formId" : this.stateIds[0]
                        }
                      };
                      commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
                    });
                    console.log("[FormComponent.host] notifyVisibleForm end");
                  } else if(this.stateForm == "invisible") {
                    console.log("[FormComponent.host] notifyInvisibleForm start");
                    formHost.notifyInvisibleForms(this.stateIds)
                    .then((data) => {
                      console.info('[FormComponent.host] notifyInvisibleForm result:' + data);
                      if(this.stateIds.length == 0) {
                        this.stateIds = ["-1"];
                      }
                      console.info('[FormComponent.host] notifyInvisibleForm formId:' + this.stateIds[0]);
                      let commonEventPublishData = {
                        data: "0",
                        parameters: {
                          "kind": "invisible",
                          "formId" : this.stateIds[0]
                        }
                      };
                      commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
                    })
                    .catch((error) => {
                      console.info('[FormComponent.host] notifyInvisibleForm error:' + error.code);
                      if(this.stateIds.length == 0) {
                        this.stateIds = ["-1"];
                      }
                      let commonEventPublishData = {
                        data: error.code.toString(),
                        parameters: {
                          "kind": "invisible",
                          "formId" : this.stateIds[0]
                        }
                      };
                      commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
                    });
                    console.log("[FormComponent.host] notifyInvisibleForm end");
                  } else if(this.stateForm == "enable") {
                    console.log("[FormComponent.host] enableFormsUpdate start");
                    formHost.enableFormsUpdate(this.stateIds)
                      .then((data) => {
                      console.info('[FormComponent.host] enableFormsUpdate result:' + data);
                      if(this.stateIds.length == 0) {
                        this.stateIds = ["-1"];
                      }
                      let commonEventPublishData = {
                        data: "0",
                        parameters: {
                          "kind": "enable",
                          "formId" : this.stateIds[0]
                        }
                      };
                      commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
                    })
                    .catch((error) => {
                      console.info('[FormComponent.host] enableFormsUpdate error:' + error);
                      if(this.stateIds.length == 0) {
                        this.stateIds = ["-1"];
                      }
                      let commonEventPublishData = {
                        data: error.code.toString(),
                        parameters: {
                          "kind": "enable",
                          "formId" : this.stateIds[0]
                        }
                      };
                      commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
                    });        
                    console.log("[FormComponent.host] enableFormsUpdate end");
                  } else {
                    console.log("[FormComponent.host] disableFormsUpdate start");
                    formHost.disableFormsUpdate(this.stateIds)
                      .then((data) => {
                      console.info('[FormComponent.host] disableFormsUpdate result:' + data);
                      if(this.stateIds.length == 0) {
                        this.stateIds = ["-1"];
                      }
                      let commonEventPublishData = {
                        data: "0",
                        parameters: {
                          "kind": "disable",
                          "formId" : this.stateIds[0]
                        }
                      };
                      commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
                    })
                    .catch((error) => {
                      console.info('[FormComponent.host] disableFormsUpdate error:' + error);
                      if(this.stateIds.length == 0) {
                        this.stateIds = ["-1"];
                      }
                      let commonEventPublishData = {
                        data: error.code.toString(),
                        parameters: {
                          "kind": "disable",
                          "formId" : this.stateIds[0]
                        }
                      };
                      commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishOnStateCallBack);
                    });
                    console.log("[FormComponent.host] disableFormsUpdate end");
                  }
                }, 1000);                
              } else {
                let commonEventPublishData = {
                    data: this.formId.toString(),
                    parameters: {
                      "formId" : this.formId.toString()
                    }
                };
                commonEvent.publish(this.formOnAcquiredEvent, commonEventPublishData, this.publishOnAcquiredCallBack);
              }
            })
            .onUninstall((info) => {
              console.log("[FormComponent] onUninstall:" + JSON.stringify(info));
            })
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
                    data: error.msg,
                    parameters: {
                      "formId" : "-1"
                    }
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
