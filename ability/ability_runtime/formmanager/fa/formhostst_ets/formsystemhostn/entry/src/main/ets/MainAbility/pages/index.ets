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
  @State bundle: string = "com.form.formsystemtestservicea.hmservice";
  @State ability: string = "com.form.formsystemtestservicea.hmservice.MainAbility";
  @State moduleName: string = "entry";
  @State name: string = "Form_Js001";
  @State allowUpate: boolean = true;
  @State isShowing: boolean = true;
  @State optType: number = 0;
  private dimension: FormDimension = FormDimension.Dimension_1_2;

  private normal = 0;
  private temporary = 0;
  private normaldel = 0;
  private temporarydel = 0;
  private normalFormIds = [];
  private tempFormIds = [];

  private deleteIds = [];
  private delCount = 0;

  private normalFormCounts = [];
  private tempFormCounts = [];

  private castFormId = "-1";

  private formOnAcquiredEvent = "FMS_FormOnAcquired_commonEvent";
  private formOnErrorEvent = "FMS_FormOnError_commonEvent";
  private formCastEvent = "FMS_FormCast_commonEvent";

  private subscriberDel;
  private subscriberFormDeleteEvent = {
    events: ["FMS_FormDelete_commonEvent"],
  };

  private subscriberSendCastForm;
  private subscriberSendCastFormEvent = {
    events: ["FMS_SendCastForm_commonEvent"],
  };

  private publishOnErrorCallBack() {
    console.debug("====> [FormComponent] formsystemhostn formOnErrorEvent Publish CallBack ====>");
  }
  private publishOnAcquiredCallBack() {
    console.debug("====> [FormComponent] formsystemhostn formOnAcquiredEvent Publish CallBack ====>");
  }
  private publishDeleteCallBack() {
    console.debug("====> [FormComponent] formsystemhostn publishDeleteCallBack Publish CallBack ====>");
  }
  private publishCastCallBack() {
    console.debug("====>formCastEvent Publish CallBack ====>");
  }
  private startAbility(bundleName, abilityName, sendMsg) {
    featureAbility.startAbility({
      want: {
        bundleName: bundleName,
        abilityName: abilityName,
        parameters: {
          "formId": "0",
          "name": "Form_Js001",
          "bundle": "com.form.formsystemtestservicea.hmservice",
          "ability": "com.form.formsystemtestservicea.hmservice.MainAbility",
          "moduleName": "entry",
          "temporary": false,
          "sendCastForm": true,
          "sendCastFormMsg": sendMsg,
          "isCreate": false
        }
      }
    }).then((res: any) => {
      console.info(`[FormComponent] formsystemhostn featureAbility.startAbility res: ${JSON.stringify(res)}`);
    }).catch((err: any) => {
      console.info(`[FormComponent] formsystemhostn featureAbility.startAbility error: ${JSON.stringify(err)}`);
    });
  }

  private publishOnSendCastForm(err, data) {
    console.info("!!!====>[FormComponent] formsystemhostn OnSendCastForm start:====>" + JSON.stringify(data));
    if (data.bundleName && data.bundleName != "com.ohos.st.formsystemhostn") {
      return;
    }
    let formId = data.parameters.castFormId;
    setTimeout(function () {
      console.info("[FormComponent.host] castTempForm start, formId: " + formId);
      formHost.castTempForm(formId)
        .then((data) => {
          console.info('[FormComponent] castTempForm result:' + data);
          this.startAbility("com.ohos.st.formsystemhostc", "com.ohos.st.formsystemhostc.MainAbility", data);
        })
        .catch((error) => {
          console.info('[FormComponent] castTempForm error:' + JSON.stringify(error));
          this.startAbility("com.ohos.st.formsystemhostc", "com.ohos.st.formsystemhostc.MainAbility", error.code.toString());
        });
      console.info("[FormComponent.host] castTempForm end");
    }, 5000);
    console.info("!!!====>[FormComponent] formsystemhostn OnSendCastForm end");
  }

  private deleteCallBack(err, data) {
    console.info("!!!====>[FormComponent] formsystemhostn deleteCallBack start:====>" + JSON.stringify(data));
    const delFormIds = data.parameters.formIds;
    console.info(`[FormComponent] data size ${delFormIds.length}`);

    console.info(`[FormComponent] data.subscriber ${JSON.stringify(this.subscriberDel)}`);
    commonEvent.unsubscribe(this.subscriberDel, () => {
      console.info("====> [FormComponent] formsystemhostn optType unSubscribeDeleteCallback CallBack====>");
    });
    commonEvent.unsubscribe(this.subscriberSendCastForm, () => {
      console.info("====> [FormComponent] formsystemhostn optType unSubscribeCastFormCallback CallBack====>");
    });
    console.info(`[FormComponent] data.bundleName ${JSON.stringify(data.bundleName)}`);
    console.info(`[FormComponent] tof ${"com.ohos.st.formsystemhostn" != data.bundleName}`);
    if ("com.ohos.st.formsystemhostn" != data.bundleName) {
      return;
    }
    delFormIds.forEach(async (formId, index) => {
      console.info(`[FormComponent] formsystemhostn deleteForm ${index}`);
      try {
        const res = await formHost.deleteForm(formId);
        console.info(`[FormComponent] formsystemhostn deleteForm ${index} ${formId} result: ${JSON.stringify(res)}`);
      } catch (error) {
        console.info(`[FormComponent] formsystemhostn deleteForm ${index} ${formId} error: ${JSON.stringify(error)}`);
      }
    });
    console.info("!!!====> [FormComponent] formsystemhostn optType deleteCallBack end ====>");
  }

  private unSubscribeDeleteCallback() {
    console.debug("====> [FormComponent] formsystemhostn optType unSubscribeDeleteCallback CallBack====>");
  }

  private unSubscribeCastFormCallback() {
    console.debug("====> [FormComponent] formsystemhostn optType unSubscribeCastFormCallback CallBack====>");
  }

  aboutToAppear() {
    commonEvent.createSubscriber(this.subscriberFormDeleteEvent).then(async (data) => {
      console.info("====>[FormComponent] formsystemhostn Subscriber FormDelete data:====>", JSON.stringify(data));
      this.subscriberDel = data;
      commonEvent.subscribe(this.subscriberDel, (err, data) => {
        if ("com.ohos.st.formsystemhostn" != data.bundleName) {
          return;
        } else {
          console.info("!!!====>[FormComponent.hostn] formsystemhostn deleteCallBack start:====>" + JSON.stringify(data));
          const delFormIds = data.parameters.formIds;
          console.info(`[FormComponent] data size ${delFormIds.length}`);
          commonEvent.unsubscribe(this.subscriberDel, () => {
            console.info("====> [FormComponent] formsystemhostn optType unSubscribeDeleteCallback CallBack====>");
          });
          commonEvent.unsubscribe(this.subscriberSendCastForm, () => {
            console.info("====> [FormComponent] formsystemhostn optType unSubscribeCastFormCallback CallBack====>");
          });
          let delCounter = 0;
          delFormIds.forEach((formId) => {
            formHost.deleteForm(formId, (error, data) => {
              console.info(`[FormComponent] formsystemhostn deleteForm ${++delCounter} ${formId} data: ${JSON.stringify(data)} err: ${JSON.stringify(error)}`);
            });
          });
        }
      });
    });

    commonEvent.createSubscriber(this.subscriberSendCastFormEvent).then(async (data) => {
      console.info("====>[FormComponent] formsystemhostn Subscriber SendCastForm data:====>", JSON.stringify(data));
      this.subscriberSendCastForm = data;
      await commonEvent.subscribe(this.subscriberSendCastForm, this.publishOnSendCastForm);
    });

    featureAbility.getWant()
      .then(async (want: any) => {
        console.info(" [FormComponent] formsystemhostn getWant:" + JSON.stringify(want));

        this.name = want.parameters.name;
        this.bundle = want.parameters.bundle;
        this.ability = want.parameters.ability;
        if (want.parameters.moduleName) {
          this.moduleName = want.parameters.moduleName;
        }

        if (want.parameters.dimension) {
          this.dimension = want.parameters.dimension;
        }

        if (want.parameters.normal) {
          this.normal = want.parameters.normal;
        }

        if (want.parameters.temporary) {
          this.temporary = want.parameters.temporary;
        }
        if (want.parameters.normaldel) {
          this.normaldel = want.parameters.normaldel;
        }

        if (want.parameters.temporarydel) {
          this.temporarydel = want.parameters.temporarydel;
        }

        if (want.parameters.deleteIds) {
          this.deleteIds = want.parameters.deleteIds;
        }
        if (want.parameters.castFormId) {
          this.castFormId = want.parameters.castFormId;
        }

        if (want.parameters.releaseFormId) {
          commonEvent.unsubscribe(this.subscriberDel, () => {
            console.info("====> [FormComponent] formsystemhostn optType unSubscribeDeleteCallback CallBack====>");
          });
          commonEvent.unsubscribe(this.subscriberSendCastForm, () => {
            console.info("====> [FormComponent] formsystemhostn optType unSubscribeCastFormCallback CallBack====>");
          });

          const formId = want.parameters.releaseFormId;
          const isReleaseCache = want.parameters.isReleaseCache;
          const res = await formHost.releaseForm(formId, isReleaseCache);
          console.info(`[FormComponent] releaseForm res: ${JSON.stringify(res)}`);
          const commonEventPublishData = {
            data: `releaseForm`,
            bundleName: `com.ohos.st.formsystemhostn`,
            parameters: {
              formIds: [].concat(formId)
            }
          };
          commonEvent.publish(this.formOnAcquiredEvent, commonEventPublishData, this.publishOnAcquiredCallBack);

          this.normal = 1;
        }

        this.makeCount();

        setTimeout(() => {
          this.optType = want.parameters.optType;
          console.info(' [FormComponent] formsystemhostn getWant optType:' + this.optType);
        }, 10);

        if (this.castFormId != "-1" && want.parameters.optType == 3) {
          console.info("[FormComponent.host] castTempForm start");
          commonEvent.unsubscribe(this.subscriberDel, () => {
            console.info("====> [FormComponent] formsystemhostn optType unSubscribeDeleteCallback CallBack====>");
          });
          commonEvent.unsubscribe(this.subscriberSendCastForm, () => {
            console.info("====> [FormComponent] formsystemhostn optType unSubscribeCastFormCallback CallBack====>");
          });

          formHost.castTempForm(this.castFormId)
            .then((data) => {
              console.info('[FormComponent] castTempForm result:' + data);
              let commonEventPublishData = {
                data: (data + "") || `0`,
                bundleName: "com.ohos.st.formsystemhostn",
                parameters: {
                  formId: this.castFormId.toString()
                }
              };
              commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
            })
            .catch((error) => {
              console.info('[FormComponent] castTempForm error:' + error.code);
              let commonEventPublishData = {
                data: error.code.toString(),
                errMsg: error.msg,
                bundleName: "com.ohos.st.formsystemhostn",
                parameters: {
                  formId: this.castFormId.toString()
                }
              };
              commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
            });
          console.info("[FormComponent.host] castTempForm end");
        }

        if (want.parameters.optType == 2 && this.deleteIds.length > 0) {
          for (let iIndex = 0; iIndex < this.deleteIds.length; ++iIndex) {
            console.info("[FormComponent] formsystemhostn deleteForm start");
            formHost.deleteForm(this.deleteIds[iIndex])
              .then((data) => {
                console.info('[FormComponent] formsystemhostn deleteForm result:' + data);
                this.delCount++;

                if (this.delCount == this.deleteIds.length) {
                  let commonEventPublishData = {
                    data: data + "",
                    bundleName: "com.ohos.st.formsystemhostn",
                    parameters: {
                      "formIds": this.deleteIds
                    }
                  };
                  commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishDeleteCallBack);
                }
              })
              .catch((error) => {
                console.info(' [FormComponent] formsystemhostn deleteForm error:' + error);
                let commonEventPublishData = {
                  data: error.code.toString(),
                  bundleName: "com.ohos.st.formsystemhostn",
                  parameters: {
                    "formIds": [this.deleteIds[iIndex]]
                  }
                };
                commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
              });
            console.info("[FormComponent] formsystemhostn deleteForm end");
          }
        }
      })
      .catch((error: any) => {
        console.error(' [FormComponent] formsystemhostn Operation failed. Cause: ' + JSON.stringify(error));
      })
    console.info(`[FormComponent.host] aboutToAppear end`);
  }

  private makeCount() {
    console.info(' [FormComponent] formsystemhostn makeCount start.');
    for (let nNormal = 0; nNormal < this.normal; nNormal++) {
      this.normalFormCounts.push(nNormal);
    }
    console.info(' [FormComponent] formsystemhostn this.normalFormCounts.length:' + this.normalFormCounts.length);

    for (let nTemp = 0; nTemp < this.temporary; nTemp++) {
      this.tempFormCounts.push(nTemp);
    }
    console.info(' [FormComponent] formsystemhostn this.tempFormCounts.length:' + this.tempFormCounts.length);
  }

  build() {
    Scroll(new Scroller()) {
      Column() {
        if (this.optType == 1) {
          Text(' [FormComponent] formsystemhostn normal form component test begin')
          Grid() {
            ForEach(this.normalFormCounts, (item) => {
              GridItem() {
                FormComponent({
                  id: 0,
                  name: this.name,
                  bundle: this.bundle,
                  ability: this.ability,
                  module: this.moduleName,
                  dimension: this.dimension,
                  temporary: false
                })
                  .allowUpdate(this.allowUpate)
                  .visibility(this.isShowing ? Visibility.Visible : Visibility.Hidden)
                  .onAcquired((form) => {
                    console.info(" [FormComponent] formsystemhostn get normal form, form id:" + form.id);

                    this.normalFormIds.push(form.id.toString());
                    if (this.normalFormIds.length == this.normal - this.normaldel) {
                      let commonEventPublishData = {
                        data: "normalForm",
                        bundleName: "com.ohos.st.formsystemhostn",
                        parameters: {
                          "formIds": this.normalFormIds
                        }
                      };
                      commonEvent.publish(this.formOnAcquiredEvent, commonEventPublishData, this.publishOnAcquiredCallBack);
                    }
                  })
                  .onError((error) => {
                    console.info(" [FormComponent] formsystemhostn normal form error code:" + error.errcode);
                    console.info(" [FormComponent] formsystemhostn normal form error msg:" + error.msg);
                    let commonEventPublishData = {
                      data: error.msg,
                      bundleName: "com.ohos.st.formsystemhostn"
                    };
                    commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
                  })
                  .size({ width: 40, height: 40 })
              }
            }, (item) => JSON.stringify(item))
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ')
            .columnsGap(2)
            .rowsGap(2)
            .width('100%')
          Text(' [FormComponent] formsystemhostn normal form component test end')

          Text(' [FormComponent] formsystemhostn temp form component test start')
          Grid() {
            ForEach(this.tempFormCounts, (item) => {
              GridItem() {
                FormComponent({
                  id: 0,
                  name: this.name,
                  bundle: this.bundle,
                  ability: this.ability,
                  module: this.moduleName,
                  dimension: this.dimension,
                  temporary: true
                })
                  .allowUpdate(this.allowUpate)
                  .visibility(this.isShowing ? Visibility.Visible : Visibility.Hidden)
                  .onAcquired((form) => {
                    console.info(" [FormComponent] formsystemhostn get temp form, form id:" + form.id);
                    this.tempFormIds.push(form.id.toString());
                    if (this.tempFormIds.length == this.temporary - this.temporarydel) {
                      let commonEventPublishData = {
                        data: "tempForm",
                        bundleName: "com.ohos.st.formsystemhostn",
                        parameters: {
                          "formIds": this.tempFormIds
                        }
                      };
                      commonEvent.publish(this.formOnAcquiredEvent, commonEventPublishData, this.publishOnAcquiredCallBack);
                    }
                  })
                  .onError((error) => {
                    console.info(" [FormComponent] formsystemhostn temp form error code:" + error.errcode);
                    console.info(" [FormComponent] formsystemhostn temp form error msg:" + error.msg);
                    let commonEventPublishData = {
                      data: error.msg,
                      bundleName: "com.ohos.st.formsystemhostn"
                    };
                    commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
                  })
                  .size({ width: 40, height: 40 })
              }
            }, (item) => JSON.stringify(item))
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ')
            .columnsGap(2)
            .rowsGap(2)
            .width('100%')

          Text(' [FormComponent] formsystemhostn temp form component test end')
        }
      }
      .backgroundColor(Color.White)
    }
    .scrollable(ScrollDirection.Vertical)
      .width('100%')
      .height('100%')
  }
}
