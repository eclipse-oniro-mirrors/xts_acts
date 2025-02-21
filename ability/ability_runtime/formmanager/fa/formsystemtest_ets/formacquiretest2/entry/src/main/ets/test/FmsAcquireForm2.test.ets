/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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

import featureAbility from "@ohos.ability.featureAbility";
import commonEvent from '@ohos.commonEvent';
import { beforeEach, afterEach, describe, expect, it } from '@ohos/hypium'

var onErrorForm_Event = {
    events: ["FMS_FormOnError_commonEvent"],
};
var onAcquiredForm_Event = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};
var subscriberFormCastEvent = {
    events: ["FMS_FormCast_commonEvent"],
};
var onSupplyEvent = {
    events: ["FMS_FormSupply_commonEvent"],
};

const unsubscribeCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

var deleteForm_Event = "FMS_FormDelete_commonEvent";

var subscriberOnError;
var subscriberOnAcquired;
var subscriberCast;
var subscriberSupply;

function sleep(time) {
    return new Promise((resolve)=>setTimeout(resolve,time));
  }

export default function test() {
    describe(`FmsAcquiredFormTest2`, () => {

        beforeEach(async () => {
            subscriberOnError = await commonEvent.createSubscriber(onErrorForm_Event);
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberCast = await commonEvent.createSubscriber(subscriberFormCastEvent);
            subscriberSupply = await commonEvent.createSubscriber(onSupplyEvent);
        })

        afterEach(async() => {
            commonEvent.unsubscribe(subscriberOnError, () => unsubscribeCallback("afterEach unsubscribe subscriberOnError"));
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberCast, () => unsubscribeCallback("afterEach unsubscribe subscriberCast"));
            commonEvent.unsubscribe(subscriberSupply, () => unsubscribeCallback("afterEach unsubscribe subscriberSupply"));

            let wantInfo = {
                want: {
                    bundleName: "com.ohos.st.formacquiretest2",
                    abilityName: "com.ohos.st.formacquiretest2.TestAbility"
                }
            }
            await featureAbility.startAbility(wantInfo).then((data) => {
              console.log("FMS_acquireForm2 startAbility data : " + JSON.stringify(data));
            }).catch((err) => {
              console.log("FMS_acquireForm2 startAbility err : " + JSON.stringify(err));
            })
            await sleep(1000);
        })

        /**
         * @tc.number: FMS_acquireForm_3800
         * @tc.name: Failed to add form when parameter ability is wrong.
         * @tc.desc: Failed to create form when verifying that the parameter (formId) of creating form is wrong.
         */
        it(`FMS_acquireForm_3800`, 0, async (done) => {
            console.info(`FMS_acquireForm_3800 start`);
            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_3800 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("Parameter error.");
                commonEvent.unsubscribe(subscriberOnError, () => {
                    console.info(`FMS_acquireForm_3800 unsubscribe callback`);
                    done();
                });
                
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_3800 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_3800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_3800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_3800 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_3900
         * @tc.name: Failed to add form when parameter bundleName is wrong.
         * @tc.desc: Failed to create form when verifying that the parameter (bundleName) of creating form is wrong.
         */
        it(`FMS_acquireForm_3900`, 0, async (done) => {
            console.info(`FMS_acquireForm_3900 start`);
            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_3900 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("Parameter error.");
                commonEvent.unsubscribe(subscriberOnError, () => {
                    console.info(`FMS_acquireForm_3900 unsubscribe callback`);
                    done();
                });
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_3900 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_3900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_3900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_3900 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4000
         * @tc.name: When the form specifications are inconsistent, creating the cached form fails.
         * @tc.desc: Return failed.
         */
        it(`FMS_acquireForm_4000`, 0, async (done) => {
            console.info(`FMS_acquireForm_4000 start`);
            var formId;

            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_4000 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_4000"));
                expect(data.data).assertEqual("The ID of the form to be operated does not exist");

                console.info(`FMS_acquireForm_4000 end`);
                var commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_acquireForm_4000 publish' + JSON.stringify(err));
                    done()
                });
            }
            function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_4000 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_4000"))
                formId = data.data;
                commonEvent.subscribe(subscriberOnError, onErrorCallBack);

                console.info(`FMS_acquireForm_4000 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": data.data,
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "dimension": "2",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_4000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_4000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`FMS_acquireForm_4000 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.info("====>FMS_acquireForm_4000 OnAcquired UnSubscribe CallBack====>");
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.info(`FMS_acquireForm_4000 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "dimension": "1",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_4000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_4000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_4000 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4200
         * @tc.name: Success to add form when parameter formName is blank.
         * @tc.desc: Success to create form when verifying that the parameter (formName) of creating form is success.
         */
        it(`FMS_acquireForm_4200`, 0, async (done) => {
            console.info(`FMS_acquireForm_4200 start`);
            let formId1;
            let formId2;

            function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_4200 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_4200"))
                formId1 = data.data;

                if (formId1 && formId2) {
                    expect(formId1).assertEqual(formId2);
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData,
                    () => delPublishCallBack('FMS_acquireForm_4200', done));
                }
            }
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);

            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onCreate") {
                    console.info("====>FMS_acquireForm_4200 onSupplyCallBack====>" + JSON.stringify(data));
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_acquireForm_4200"));
                    let retData = JSON.parse(data.parameters.parameters);

                    let formName = retData.parameters['ohos.extra.param.key.form_name'];
                    expect(formName).assertEqual("Form_Js001");
                    formId2 = retData.parameters['ohos.extra.param.key.form_identity'];
                    console.info("!!!====>FMS_acquireForm_4200 onAcquiredCallBack formId2:====>" + formId2);
                    if (formId1 && formId2) {
                        expect(formId1).assertEqual(formId2);
                        let commonEventPublishData = {
                            data: formId1
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData,
                        () => delPublishCallBack('FMS_acquireForm_4200', done));
                    }
                }
            }
            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            console.info(`FMS_acquireForm_4200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_4200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_4200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });

            console.info(`FMS_acquireForm_4200 featureAbility.startAbility end`);
            await sleep(3000);
            done();
        });

        /**
         * @tc.number: FMS_acquireForm_4300
         * @tc.name: Success to add form when parameter dimension is passed.
         * @tc.desc: Success to create form when verifying that the parameter (dimension) of creating form.
         */
        it(`FMS_acquireForm_4300`, 0, async (done) => {
            console.info(`FMS_acquireForm_4300 start`);
            function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_4300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_4300"));
                console.info(`FMS_acquireForm_4300 end`);
                done();
            }
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.info(`FMS_acquireForm_4300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhosti",
                    abilityName: "com.ohos.st.formsystemhosti.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_4300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_4300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_4300 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4400
         * @tc.name: Failed to add form when parameter dimension is not exist.
         * @tc.desc: Failed to create form when verifying that the parameter (dimension) of creating form is wrong.
         */
        it(`FMS_acquireForm_4400`, 0, async (done) => {
            console.info(`FMS_acquireForm_4400 start`);
            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_4400 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("Parameter error.");
                commonEvent.unsubscribe(subscriberOnError, () => {
                    console.info(`FMS_acquireForm_4400 unsubscribe callback`);
                    done();
                });
                
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_4400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhosti",
                    abilityName: "com.ohos.st.formsystemhosti.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "dimension": "6",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_4400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_4400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_4400 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4900
         * @tc.name: Cast temp form when the formId is created formId.
         * @tc.desc: When the verification formId is set to 0, the form is created failed.
         */
        it(`FMS_acquireForm_4900`, 0, async (done) => {
            console.info(`FMS_acquireForm_4900 start`);

            function onCastCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_4900 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormCast_commonEvent");
                expect(data.data).assertEqual("9");
                commonEvent.unsubscribe(subscriberCast, () => unsubscribeOnCastCallback("FMS_acquireForm_4900"))
                var commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData,(err) => {
                    console.info('FMS_acquireForm_4900 publish' + JSON.stringify(err));
		            done()
                });
            }
            function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_4900 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_4900"))
                commonEvent.subscribe(subscriberCast, onCastCallBack);

                console.info(`FMS_acquireForm_4900 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "temporaryId": data.data,
                            "castForm": true,
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_4900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_4900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`FMS_acquireForm_4900 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.info(`FMS_acquireForm_4900 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_4900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_4900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_4900 featureAbility.startAbility end`);
        });

    });
}


const delPublishCallBack = async (tcNumber, done) => {
    console.info(`${tcNumber} delPublishCallBack start`);
    setTimeout(function () {
        console.info(`${tcNumber} delPublishCallBack end`);
        done();
    }, 1000);
}

const unsubscribeOnErrorCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unsubscribeOnErrorCallback====>`);
}

const unsubscribeOnAcquiredCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unSubscribeOnAcquiredCallback====>`);
}

const unsubscribeSupplyCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unSubscribeSupplyCallback====>`);
}

const unsubscribeOnCastCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeOnCastCallback====>`);
}
