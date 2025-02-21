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
  @State ability: string = "com.acts.form.formsystemtestservicea.hmservice.MainAbility";
  @State moduleName: string = "entry";
  @State name: string = "Form_Js001";
  @State allowUpate: boolean = true;
  @State isShowing: boolean = true;
  @State canCreateForm: boolean = false;

  private dimension: FormDimension = FormDimension.Dimension_1_2;

  private stateForm = "visible";
  private stateIds = [];
  private requestForm = false;
  private requestId = "-1";
  private releaseForm = false;
  private releaseId = "-1";
  private deleteForm = false;
  private deleteId = "-1";
  private temporary = false;
  private castForm = false;

  private formOnErrorEvent = "FMS_FormOnError_commonEvent";
  private formOnDeletedEvent = "FMS_FormOnDeleted_commonEvent";
  private formOnReleasedEvent = "FMS_FormOnReleased_commonEvent";
  private formOnRequestEvent = "FMS_FormOnRequest_commonEvent";
  private formOnStateEvent = "FMS_FormOnState_commonEvent";
  
  private publishCallBack = () => {
    console.debug("====>formOnErrorEvent Publish CallBack ====>");
  }

  aboutToAppear() {
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
      if(want.parameters.castForm) {
        this.castForm = want.parameters.castForm;
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
      if(want.parameters.requestForm) {
        this.requestForm = want.parameters.requestForm;
      }
      if(want.parameters.requestId) {
        this.requestId = want.parameters.requestId;
      }
      if(want.parameters.stateForm) {
        this.stateForm = want.parameters.stateForm;
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
        console.log("formsystemhostnoperm deleteForm start");
        formHost.deleteForm(this.deleteId)
            .then((data) => {
            console.info('formsystemhostnoperm deleteForm result:' + data);
            let commonEventPublishData = {
              data: data + "",
              parameters: {
                "formId" : this.deleteId.toString()
              }
            };
            commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishCallBack);
          })
          .catch((error) => {
            console.info('formsystemhostnoperm deleteForm error:' + error);
            let commonEventPublishData = {
              data: error.code.toString(),
              parameters: {
                "formId" : this.deleteId.toString()
              }
            };
            commonEvent.publish(this.formOnDeletedEvent, commonEventPublishData, this.publishCallBack);
        });
        
        console.log("formsystemhostnoperm deleteForm end");
      }

      if(!want.parameters.isCreate && this.releaseForm) {
        console.log("formsystemhost releaseForm start");
        formHost.releaseForm(this.releaseId)
          .then((data) => {
          console.info('formsystemhost releaseForm result:' + data);
          let commonEventPublishData = {
            data: data + "",
              parameters: {
                "formId" : this.requestId.toString()
              }
          };
          commonEvent.publish(this.formOnReleasedEvent, commonEventPublishData, () => this.publishCallBack());
        })
        .catch((error)  => {
          console.info('formsystemhost releaseForm error:' + error);
          let commonEventPublishData = {
            data: error.code.toString(),
            parameters: {
              "formId" : this.releaseId.toString()
            }
          };
          commonEvent.publish(this.formOnReleasedEvent, commonEventPublishData, this.publishCallBack);
        });
      
        console.log("formsystemhost releaseForm end");
      }

      if(!want.parameters.isCreate && this.requestForm) {
        console.log("[FormComponent.host] requestForm start");
        formHost.requestForm(this.requestId)
            .then((data) => {
            console.info('[FormComponent] requestForm result:' + data);
            let commonEventPublishData = {
              data: data + "",
              parameters: {
                "formId" : this.requestId
              }
            };
            commonEvent.publish(this.formOnRequestEvent, commonEventPublishData, () => this.publishCallBack());
          })
          .catch((error) => {
            console.info('[FormComponent] requestForm error:' + error);
            let commonEventPublishData = {
              data: error.code.toString(),
              parameters: {
                "formId" : this.requestId
              }
            };
            commonEvent.publish(this.formOnRequestEvent, commonEventPublishData, this.publishCallBack);
          });
        
          console.log("[FormComponent.host] requestForm end");              
      }
      if(!want.parameters.isCreate && this.stateForm) {        
        if(this.stateForm == "visible") {
          console.log("formsystemhost notifyVisibleForm start");
          formHost.notifyVisibleForms(this.stateIds)
            .then((data) => {
            console.info('formsystemhost notifyVisibleForm result:' + data);
            let retData = "0";
            if((data + "") != "0") {
              retData = data + "";
            }
            let commonEventPublishData = {
              data: retData,
              parameters: {
                "formId" : this.stateIds.toString()
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishCallBack);
          })
          .catch((error) => {
            console.info('formsystemhost notifyVisibleForm error:' + error);
            let commonEventPublishData = {
              data: error.code.toString(),
              parameters: {
                "formId" : this.stateIds.toString()
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishCallBack);
          });        
          console.log("formsystemhost notifyVisibleForm end");
        } else if(this.stateForm == "invisible") {
          console.log("formsystemhost notifyInvisibleForm start");
          formHost.notifyInvisibleForms(this.stateIds)
            .then((data) => {
            console.info('formsystemhost notifyInvisibleForm result:' + data);
            let commonEventPublishData = {
              data: data + "",
              parameters: {
                "formId" : this.stateIds.toString()
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, () => this.publishCallBack());
          })
          .catch((error) => {
            console.info('formsystemhost notifyInvisibleForm error:' + error);
            let commonEventPublishData = {
              data: error.code.toString(),
              parameters: {
                "formId" : this.stateIds.toString()
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishCallBack);
          });
          console.log("formsystemhost notifyInvisibleForm end");
        } else if(this.stateForm == "enable") {
          console.log("formsystemhost enableFormsUpdate start");
          formHost.enableFormsUpdate(this.stateIds)
            .then((data) => {
            console.info('formsystemhost enableFormsUpdate result:' + data);
            let commonEventPublishData = {
              data: data + "",
              parameters: {
                "formId" : this.stateIds.toString()
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, () => this.publishCallBack());
          })
          .catch((error) => {
            console.info('formsystemhost enableFormsUpdate error:' + error);
            let commonEventPublishData = {
              data: error.code.toString(),
              parameters: {
                "formId" : this.stateIds.toString()
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishCallBack);
          });        
          console.log("formsystemhost enableFormsUpdate end");
        } else {
          console.log("formsystemhost disableFormsUpdate start");
          formHost.disableFormsUpdate(this.stateIds)
            .then((data) => {
            console.info('formsystemhost disableFormsUpdate result:' + data);
            let commonEventPublishData = {
              data: data + "",
              parameters: {
                "formId" : this.stateIds.toString()
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, () => this.publishCallBack());
          })
          .catch((error) => {
            console.info('formsystemhost disableFormsUpdate error:' + error);
            let commonEventPublishData = {
              data: error.code.toString(),
              parameters: {
                "formId" : this.stateIds.toString()
              }
            };
            commonEvent.publish(this.formOnStateEvent, commonEventPublishData, this.publishCallBack);
          });        
          console.log("formsystemhost disableFormsUpdate end");
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
              this.formId = form.id;
              console.log("[FormComponent.host] get form, form id:" + form.id);              
            })
            .onError((error) => {
              console.log("[FormComponent.host] error code:" + error.errcode);
              console.log("[FormComponent.host] error msg:" + error.msg);
              let commonEventPublishData = {
                data: error.msg                 
              };
              commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishCallBack);
            })
          }
        }
        .backgroundColor(Color.White)
        Text('form component test end')
      }
      .backgroundColor(Color.White)
  }
}
