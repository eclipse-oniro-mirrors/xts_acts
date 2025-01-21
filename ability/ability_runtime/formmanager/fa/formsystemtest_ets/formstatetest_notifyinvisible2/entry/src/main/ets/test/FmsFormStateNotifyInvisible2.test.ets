/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

var onAcquiredForm_Event = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};

var onStateFormEvent = {
    events: ["FMS_FormOnState_commonEvent"],
};

var onSupplyEvent = {
    events: ["FMS_FormSupply_commonEvent"],
};

const unsubscribeCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

var deleteForm_Event = "FMS_FormDelete_commonEvent";

var subscriberOnAcquired;
var subscriberOnState;
var subscriberSupply;

export default function test() {

    describe(`FmsStateFormTest`, () => {

        beforeEach(async () => {
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
            subscriberSupply = await commonEvent.createSubscriber(onSupplyEvent);
            await sleep(1000);
        })

        afterEach(async() => {
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberOnState, () => unsubscribeCallback("afterEach unsubscribe subscriberOnState"));
            commonEvent.unsubscribe(subscriberSupply, () => unsubscribeCallback("afterEach unsubscribe subscriberSupply"));

            let wantInfo = {
                want: {
                    bundleName: "com.ohos.st.formstatenotifyinvisibletest2",
                    abilityName: "com.ohos.st.formstatenotifyinvisibletest2.TestAbility"
                }
            }
            await featureAbility.startAbility(wantInfo).then((data) => {
              console.log("FMS_notifyInvisibleForms2 startAbility data : " + JSON.stringify(data));
            }).catch((err) => {
              console.log("FMS_notifyInvisibleForms2 startAbility err : " + JSON.stringify(err));
            })
            await sleep(1000);
        })
        /**
         * @tc.number: FMS_notifyInvisibleForms_0900
         * @tc.name: There are correct and wrong formId in the form ID parameter list
         * that informs that the form is invisible.
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
         it(`FMS_notifyInvisibleForms_0900`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0900 start`);
            let formIdInvisible;
            let formIdVisible;
            let onSupplyCount = 0;

            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyInvisibleForms_0900 onSupplyCallBack====>" + JSON.stringify(data));
                    onSupplyCount++;
                    if (onSupplyCount == 2) {
                        commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyInvisibleForms_0900"));
                    }
                    if (formIdInvisible && formIdVisible) {
                        let commonEventPublishData = {
                            data: formIdInvisible
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                            console.info('FMS_notifyInvisibleForms_0900 publish' + JSON.stringify(err));
                            done()
                        });
                    }
                }
            }

            function OnInvisibleCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0900 OnInvisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                formIdInvisible = data.parameters.formId;
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_0900"));
                if (formIdInvisible && formIdVisible && onSupplyCount == 2) {
                    let commonEventPublishData = {
                        data: formIdInvisible
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                        console.info('FMS_notifyInvisibleForms_0900 publish' + JSON.stringify(err));
                        done()
                    });
                }
            }
            async function onVisibleCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0900 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_0900"));
                formIdVisible = data.parameters.formId;

                subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
                commonEvent.subscribe(subscriberOnState, OnInvisibleCallBack);
                console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "stateForm" : "invisible",
                            "stateIds" : [formIdVisible, "0"],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnState, onVisibleCallBack);
            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "visible",
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_1000
         * @tc.name: When the form provider is not a system application, notify the form to be invisible
         *           and do not pull up the form provider.
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
         it(`FMS_notifyInvisibleForms_1000`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_1000 start`);

            function onVisibleCallBack(_, data) {
                if (data.parameters.kind != "invisible") {
                    return;
                }
                console.info("!!!====>FMS_notifyInvisibleForms_1000 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");

                setTimeout(function () {
                    commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_1000"));
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyInvisibleForms_1000"));

                    let commonEventPublishData = {
                        data: data.parameters.formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, () => delPublishCallback("FMS_notifyInvisibleForms_1000",done));
                }, 2000);
            }
            function onSupplyEventCallBack(_, data) {
                if (data.parameters.kind != "onVisibilityChange") {
                    return;
                }
                expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyInvisibleForms_1000"));
                console.debug("====>FMS_notifyInvisibleForms_1000 onSupplyEventCallBack====>" + JSON.stringify(data));
                console.log(`FMS_notifyInvisibleForms_1000 error`);
                expect().assertFail();
            }
            commonEvent.subscribe(subscriberOnState, onVisibleCallBack);
            commonEvent.subscribe(subscriberSupply, onSupplyEventCallBack);
            console.log(`FMS_notifyInvisibleForms_1000 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicenotsysapp.hmservice",
                        "ability" : "com.form.formsystemtestservicenotsysapp.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "invisible",
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_notifyInvisibleForms_1000 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_1100
         * @tc.name: When formVisibleNotify is false in config.json,
         * the form provider will not be pulled when the card is invisible.
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_1100`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_1100 start`);
            let supplyFlag = false;
            let formIdInvisible;
            let formIdVisible;
            
            function delPublishCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1100 delPublishCallBack====>");
                setTimeout(function () {
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyInvisibleForms_1100"));
                    if (supplyFlag) {
                        expect().assertFail();
                    }
                    console.info('FMS_notifyInvisibleForms_1100 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_1100 end`);
                    done();
                }, 1000);
            }

            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyInvisibleForms_1100 onSupplyCallBack====>" + JSON.stringify(data));
                    supplyFlag = true;
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyInvisibleForms_1100"));

                    if (formIdInvisible && formIdVisible) {
                        let commonEventPublishData = {
                            data: formIdInvisible
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    }
                }
            }

            function OnInvisibleCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1100 OnInvisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                formIdInvisible = data.parameters.formId;
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_1100"));
                if (formIdInvisible && formIdVisible) {
                    let commonEventPublishData = {
                        data: formIdInvisible
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }
            }
            async function onVisibleCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1100 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_1100"));
                formIdVisible = data.parameters.formId;

                subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
                commonEvent.subscribe(subscriberOnState, OnInvisibleCallBack);

                console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestserviced.hmservice",
                            "ability" : "com.form.formsystemtestserviced.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "stateForm" : "invisible",
                            "stateIds" : [formIdVisible],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnState, onVisibleCallBack);
            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestserviced.hmservice",
                        "ability" : "com.form.formsystemtestserviced.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "visible",
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_1200
         * @tc.name: When formVisibleNotify in config.json is true,
         *           the provider can be notified of the visibility of the form.
         * @tc.desc: 1. The form is created successfully.
         *           2. The invisible interface is invoked successfully,
         *              and the visibility notification of form providers A and B is triggered.
         *              The formId is the same as the created formId, and the visibility status is invisible.
         */
        it(`FMS_notifyInvisibleForms_1200`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_1200 start`);
            let formId1;
            let formId2;
            let delCount = 0;
            let onSupplyCount = 0;

            function delPublishCallBack() {
                console.info("!!!====>FMS_notifyInvisibleForms_1200 delPublishCallBack====>");
                delCount++;
                if (delCount == 2) {
                    setTimeout(function () {
                        console.info('FMS_notifyInvisibleForms_1200 delPublishCallBack end');
                        console.info('FMS_notifyInvisibleForms_1200 end');
                        done();
                    }, 500);
                }
            }
            function onAcquiredCallBack_Normal1(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1200 onAcquiredCallBack_Normal1 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal1)
                formId1 = data.data;

                FMS_notifyInvisibleForms_1200_normal2();
            }
            function unSubscribeOnAcquiredCallBack_Normal1() {
                console.debug("====>FMS_notifyInvisibleForms_1200 unSubscribeOnAcquiredCallBack_Normal1 CallBack====>");
            }

            async function FMS_notifyInvisibleForms_1200_normal1() {
                console.log(`FMS_notifyInvisibleForms_1200_normal1 start`);

                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal1);
                console.log(`FMS_notifyInvisibleForms_1200_normal1 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_1200_normal1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_1200_normal1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });

                console.log(`FMS_notifyInvisibleForms_1200_normal1 featureAbility.startAbility end`);
                console.log(`FMS_notifyInvisibleForms_1200_normal1 end`);
            }

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1200 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_1200"))
                console.info("!!!====>FMS_notifyInvisibleForms_1200 onStateCallBack formId1:====>" + formId1);
                console.info("!!!====>FMS_notifyInvisibleForms_1200 onStateCallBack formId2:====>" + formId2);
                console.info("!!!====>FMS_notifyInvisibleForms_1200 onStateCallBack onSupplyCount:====>" + onSupplyCount);
                if (formId1 && formId2 && onSupplyCount == 2) {
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    let commonEventPublishData2 = {
                        data: formId2
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData2, delPublishCallBack);
                }
            }

            async function onAcquiredCallBack_Normal2(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1200 onAcquiredCallBack_Normal2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");                
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal2);
                formId2 = data.data;

                commonEvent.subscribe(subscriberOnState, onStateCallBack);
                console.log(`FMS_notifyInvisibleForms_1200 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "stateForm" : "invisible",
                            "stateIds" : [formId1, formId2],
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_1200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_1200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyInvisibleForms_1200 featureAbility.startAbility end`);
            }
            function unSubscribeOnAcquiredCallBack_Normal2() {
                console.debug("====>FMS_notifyInvisibleForms_1200 unSubscribeOnAcquiredCallBack_Normal2====>");
            }
            async function FMS_notifyInvisibleForms_1200_normal2() {
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal2);
                console.log(`FMS_notifyInvisibleForms_1200_normal2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestserviceb.hmservice",
                            "ability" : "com.form.formsystemtestserviceb.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_1200_normal2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_1200_normal2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });

                console.log(`FMS_notifyInvisibleForms_1200_normal2 featureAbility.startAbility end`);
            }
            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyInvisibleForms_1200 onSupplyCallBack====>" + JSON.stringify(data));
                    let parameters = JSON.parse(data.parameters.parameters);
                    if(parameters[formId1]) {
                        expect(parameters[formId1]).assertEqual(2);
                    }
                    if(parameters[formId2]) {
                        expect(parameters[formId2]).assertEqual(2);
                    }

                    onSupplyCount++;
                    if (onSupplyCount == 2) {
                        commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyInvisibleForms_1200"));
                    }
                    if (formId1 && formId2) {
                        let commonEventPublishData = {
                            data: formId1
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                        let commonEventPublishData2 = {
                            data: formId2
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData2, delPublishCallBack);
                    }
                }
            }

            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            FMS_notifyInvisibleForms_1200_normal1();
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_1300
         * @tc.name: When formVisibleNotify is true in config.json,
         * the form provider will be pulled when the card is invisible.
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_1300`, 0, async (done) => {
            console.info(`FMS_notifyInvisibleForms_1300 start`);
            let hostFormId;
            let providerFormId;
            let counter = 0;

            const delPublishCallback = (_, data) => {
                console.info("!!!====>FMS_notifyInvisibleForms_1300 delPublishCallback====>");
                setTimeout(() => {
                    expect(hostFormId).assertEqual(providerFormId);
                    console.info('FMS_notifyInvisibleForms_1300 delPublishCallback end');
                    console.info(`FMS_notifyInvisibleForms_1300 end`);
                    done();
                }, 1000);
            }

            const onSupplyCallback = (_, data) => {
                if (data.parameters.kind != "onVisibilityChange") {
                    return;
                }
                console.debug("====>FMS_notifyInvisibleForms_1300 onSupplyCallback data:====>" + JSON.stringify(data));
                providerFormId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                const visibilityStatus = JSON.parse(data.parameters.parameters)[providerFormId];

                expect(visibilityStatus).assertEqual(2);
                commonEvent.unsubscribe(subscriberSupply, () => {
                    console.info("====>FMS_notifyInvisibleForms_1300 unSubscribeSupplyCallback====>");
                });
                if (++counter == 2) {
                    const commonEventPublishData = {
                        data: providerFormId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallback);
                }
            }

            const onInvisibleCallback = (_, data) => {
                if (data.parameters.kind != "invisible") {
                    return;
                }
                console.debug("====>FMS_notifyInvisibleForms_1300 onInvisibleCallback data:====>" + JSON.stringify(data));
                hostFormId = data.parameters.formId;

                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info("====>FMS_notifyInvisibleForms_1300 unSubscribeOnInvisibleCallback====>");
                });
                if (++counter == 2) {
                    const commonEventPublishData = {
                        data: hostFormId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallback);
                }
            }

            commonEvent.subscribe(subscriberOnState, onInvisibleCallback);
            commonEvent.subscribe(subscriberSupply, onSupplyCallback);
            console.info(`FMS_notifyInvisibleForms_1300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicef.hmservice",
                        "ability": "com.form.formsystemtestservicef.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "stateForm": "invisible",
                        "stateIds": ["self"],
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.debug(`FMS_notifyInvisibleForms_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_notifyInvisibleForms_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.number: FMS_notifyInvisibleForms_1400
         * @tc.name: Use -1 form Id and created 2 form card Id notify the form to be invisible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyInvisibleForms_1400`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_1400 start`);
            let formIds = new Array();
            let count = 0;

            function delPublishCallBack1(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1400 delPublishCallBack1====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyInvisibleForms_1400 delPublishCallBack1 end');
                    console.log(`FMS_notifyInvisibleForms_1400 end`);
                }, 1000);
            }
            function delPublishCallBack2(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1400 delPublishCallBack2====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyInvisibleForms_1400 delPublishCallBack2 end');
                    console.log(`FMS_notifyInvisibleForms_1400 end`);
                    done();
                }, 1000);
            }

            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyInvisibleForms_1400 onSupplyCallBack====>" + JSON.stringify(data));

                    let retFormId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                    const visibilityStatus = JSON.parse(data.parameters.parameters)[retFormId];
                    expect(formIds.includes(retFormId)).assertTrue();
                    expect(visibilityStatus).assertEqual(2);

                    ++count;
                    if (count == 2) {
                        console.debug("====>FMS_notifyInvisibleForms_1400 OK====>");
                        commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyInvisibleForms_1400"));

                        let commonEventPublishData1 = {
                            data: formIds[0]
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData1, delPublishCallBack1);
                        let commonEventPublishData2 = {
                            data: formIds[1]
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData2, delPublishCallBack2);
                    }
                }
            }

            async function onSecondAcquiredCallBack(_, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeSupplyCallback("FMS_notifyInvisibleForms_1400"));
                console.debug("====>FMS_notifyInvisibleForms_1400 onSecondAcquiredCallBack====>" + JSON.stringify(data));
                formIds.push(data.data);
                formIds.push("-1");
                console.debug("====>FMS_notifyInvisibleForms_1400 formIds====>" + formIds);

                commonEvent.subscribe(subscriberSupply, onSupplyCallBack);

                console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbility notifyInVisible start`);
                await featureAbility.startAbility({
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
                            "stateForm" : "invisible",
                            "stateIds" : formIds,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbility notifyInVisible end`);
            }

            async function onFirstAcquiredCallBack(_, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeSupplyCallback("FMS_notifyInvisibleForms_1400"));
                console.debug("====>FMS_notifyInvisibleForms_1400 onFirstAcquiredCallBack====>" + JSON.stringify(data));
                formIds.push(data.data);

                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onSecondAcquiredCallBack);
                console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbility serviceb start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestserviceb.hmservice",
                            "ability" : "com.form.formsystemtestserviceb.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbility serviceb end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onFirstAcquiredCallBack);
            console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbility servicea start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbility servicea end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_1500
         * @tc.name: The size of invisible form ids in the notification form array exceeds 32.
         * @tc.desc: 1. Failed to invoke the invisibility interface (parameter error).
         */
        it(`FMS_notifyInvisibleForms_1500`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_1500 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1500 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("7");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_1500"))

                setTimeout(function () {
                    console.info('FMS_notifyInvisibleForms_1500 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_1500 end`);
                    done();
                }, 100)
            }
            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_notifyInvisibleForms_1500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "invisible",
                        "stateIds" : [
                            "1","2","3","4","5","6","7","8","9","10","11","12","13","14",
                            "15","16","17","18","19","20","21","22","23","24","25","26",
                            "27","28","29","30","31","32","33"
                        ],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_notifyInvisibleForms_1500 featureAbility.startAbility end`);
        });
    });
}

const sleep = async delay => {
    return new Promise((resolve, _) => {
        setTimeout(async () => {
            resolve(0);
        }, delay);
    });
};

const delPublishCallback = async (tcNumber, done) => {
    console.info(`${tcNumber} delPublishCallBack start`);
    setTimeout(function () {
        console.info(`${tcNumber} delPublishCallBack end`);
        done();
    }, 1000);
}

const unsubscribeOnStateCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unsubscribeOnStateCallback====>`);
}

const unsubscribeSupplyCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unSubscribeSupplyCallback====>`);
}
