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
import formManager from '@ohos.application.formHost';
import systemTime from '@ohos.systemTime';

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

  private releaseForm = false;
  private releaseId = "-1";
  private deleteForm = false;
  private deleteId = "-1";
  private temporaryId="-1";
  private temporary = false;
  private castForm = false;
  private sendCastForm = false;
  private sendCastFormMsg;

  private formOnAcquiredEvent = "FMS_FormOnAcquired_commonEvent";
  private formCastEvent = "FMS_FormCast_commonEvent";
  private formOnErrorEvent = "FMS_FormOnError_commonEvent";
  private formOnDeletedEvent = "FMS_FormOnDeleted_commonEvent";
  private formOnReleasedEvent = "FMS_FormOnReleased_commonEvent";

  private subscriberDel;
  private subscriberFormDeleteEvent = {
    events: ["FMS_FormDelete_commonEvent"],
  };
  private subscriberTimeChange;
  private subscriberTimeChangeEvent = {
    events: ["FMS_TimeChange_commonEvent"],
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
  private publishCastCallBack = () => {
    console.debug("====>formsystemhostc formCastEventCallBack ====>");
  }

  private deleteCallBack = (err, data) => {
    console.info("!!!====>[FormComponent] deleteCallBack start:====>" + JSON.stringify(data));
    if(data.bundleName && data.bundleName != "com.ohos.st.formsystemhostc") {
      return;
    }
    formManager.deleteForm(data.data)
      .then((data2) => {
        console.info('[FormComponent] deleteForm result:' + data2);
      });

    this.canCreateForm = false;
    console.info("!!!====>[FormComponent] deleteCallBack end ====>");
  }
  
  private timeChangeCallBack = (err, data) => {
    console.info("!!!====>[FormComponent] timeChangeCallBack start:====>" + JSON.stringify(data));
    if(data.bundleName && data.bundleName != "com.ohos.st.formsystemhostc") {
      return;
    }
    this.changeTime(data.parameters.hour, data.parameters.min, data.parameters.second);
    console.info("!!!====>[FormComponent] timeChangeCallBack end ====>");
  }

  /**
  *
  * @param hour hour of 24H clock
  * @param min minute
  * @param second second
  */
  private changeTime(hour: number, min: number, second: number): void {
    let datetime = new Date();
    let year = datetime.getFullYear();
    let month = datetime.getMonth() + 1;
    let day = datetime.getDate();
    let formatTime = year + '-' + this.fill(month) + '-' + this.fill(day)
      + 'T' + this.fill(hour) + ':' + this.fill(min) + ':' + this.fill(second);
    let s = (new Date(formatTime)).getTime();

    systemTime.setTime(s).then(data => {
      console.log(`set time success: ${formatTime}, result:${data}`);
    }).catch(error => {
      console.log(`set time failure: ${error}`);
    })
  }

  private fill(value: number): string {
    return (value > 9 ? "" : "0") + value;
  }
  aboutToAppear() {
    commonEvent.createSubscriber(this.subscriberFormDeleteEvent).then(async (data) => {
        console.info("====>[FormComponent] Subscriber FormDelete data:====>", JSON.stringify(data)); 
        this.subscriberDel = data;     
        await commonEvent.subscribe(this.subscriberDel, this.deleteCallBack);
    })

    commonEvent.createSubscriber(this.subscriberTimeChangeEvent).then(async (data) => {
        console.info("====>[FormComponent] Subscriber TimeChange data:====>", JSON.stringify(data)); 
        this.subscriberTimeChange = data;     
        await commonEvent.subscribe(this.subscriberTimeChange, this.timeChangeCallBack);
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
      if(want.parameters.castForm) {
        this.castForm = want.parameters.castForm;
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

      if(want.parameters.sendCastForm) {
        this.sendCastForm = want.parameters.sendCastForm;
      }
      if(want.parameters.sendCastFormMsg) {
        this.sendCastFormMsg = want.parameters.sendCastFormMsg;
      }

      setTimeout(() => {
        this.canCreateForm = want.parameters.isCreate ? true : false;
        console.error('[FormComponent] getWant canCreateForm:'+ this.canCreateForm); 
      }, 10); 
      console.error('[FormComponent] getWant end'+ JSON.stringify(want));
      if(!want.parameters.isCreate && this.sendCastForm) {
        console.log("[FormComponent.host] sendCastForm start");
        setTimeout(() => {
          let commonEventPublishData = {
            data: this.sendCastFormMsg,
            parameters: {
              "formId" : ""
            }
          };
          commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
        }, 5);              
        console.log("[FormComponent.host] sendCastForm end");
      }
      if(!want.parameters.isCreate && this.deleteForm) {
        console.log("[FormComponent] deleteForm start");
        formManager.deleteForm(this.deleteId)
          .then((data) => {
          console.info('[FormComponent] deleteForm result:' + data);
          let commonEventPublishData = {
            data: "0",
            parameters: {
              "formId" : this.deleteId
            }
          };
          commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
        })
        .catch((error) => {
          console.info('[FormComponent] deleteForm error:' + error);
          let commonEventPublishData = {
            data: error.code.toString(),
            parameters: {
              "formId" : this.deleteId.toString()
            }
          };
          commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
        });
      
        console.log("[FormComponent] deleteForm end");
      }
      if(!want.parameters.isCreate && this.releaseForm) {
        console.log("[FormComponent] releaseForm start");
        formManager.releaseForm(this.releaseId, true)
        .then((data) => {
          console.info('[FormComponent] releaseForm result:' + data);
          let commonEventPublishData = {
            data: "0",
            parameters: {
              "formId" : this.releaseId
            }
          };
          commonEvent.publish(this.formOnReleasedEvent, commonEventPublishData, this.publishOnReleasedCallBack);
        })
        .catch((error) => {
          console.info('[FormComponent] releaseForm error:' + error);
          let commonEventPublishData = {
            data: error.code.toString(),
            parameters: {
              "formId" : this.releaseId
            }
          };
          commonEvent.publish(this.formOnReleasedEvent, commonEventPublishData, this.publishOnReleasedCallBack);
        });
      
        console.log("[FormComponent] releaseForm end");
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
              if(this.castForm) {
                console.log("[FormComponent.host] castTempForm start");
                formManager.castTempForm(this.temporaryId)
                    .then((data) => {
                    console.info('[FormComponent] castTempForm result:' + data);
                     setTimeout(() => {
                      let commonEventPublishData = {
                        data: "0",
                        parameters: {
                          "formId" : this.formId.toString()
                        }
                      };
                      commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
                    }, 5);
                  })
                  .catch((error) => {
                    console.info('[FormComponent] castTempForm error:' + error);
                     setTimeout(() => {
                      let commonEventPublishData = {
                        data: error.code.toString(),
                        parameters: {
                          "formId" : this.formId.toString()
                        }
                      };
                      commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
                    }, 5);
                  });               
                console.log("[FormComponent.host] castTempForm end");
              } else if(this.deleteForm) {
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
                        "formId" : this.deleteId
                      }
                    };
                    commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
                  })
                  .catch((error) => {
                    console.info('[FormComponent] deleteForm error:' + error);
                    var commonEventPublishData = {
                      data: error.code.toString(),
                      parameters: {
                        "formId" : this.deleteId
                      }
                    };
                    commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishOnDeletedCallBack);
                  });
               
                  console.log("[FormComponent.host] deleteForm end");
                }, 1000);                
              } else if(this.releaseForm) {
                console.log("[FormComponent.host] releaseForm start");
                if(this.releaseId == "self") {
                  this.releaseId = this.formId.toString();
                }
                setTimeout(() => {
                  formManager.releaseForm(this.releaseId, true)
                    .then((data) => {
                    console.info('[FormComponent] releaseForm result:' + data);
                    var commonEventPublishData = {
                      data: "0",
                      parameters: {
                        "formId" : this.releaseId
                      }
                    };
                    commonEvent.publish(this.formOnReleasedEvent, commonEventPublishData, this.publishOnReleasedCallBack);
                  })
                  .catch((error) => {
                    console.info('[FormComponent] releaseForm error:' + error);
                    let commonEventPublishData = {
                      data: error.code.toString(),
                      parameters: {
                        "formId" : this.releaseId
                      }
                    };
                    commonEvent.publish(this.formOnReleasedEvent, commonEventPublishData, this.publishOnReleasedCallBack);
                  });
               
                  console.log("[FormComponent.host] releaseForm end");
                }, 1000);                
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