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
import { beforeAll, beforeEach, afterEach, describe, expect, it } from '@ohos/hypium'

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

        beforeAll(async (done) => {
            done();
        })

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
                    bundleName: "com.ohos.st.formstatenotifyvisibletest",
                    abilityName: "com.ohos.st.formstatenotifyvisibletest.TestAbility"
                }
            }
            await featureAbility.startAbility(wantInfo).then((data) => {
              console.log("FMS_notifyVisibleForms startAbility data : " + JSON.stringify(data));
            }).catch((err) => {
              console.log("FMS_notifyVisibleForms startAbility err : " + JSON.stringify(err));
            })
            await sleep(1000);
        })
        /**
         * @tc.number: FMS_notifyVisibleForms_0200
         * @tc.name: The form user does not have permission.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_0200`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_0200 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0200 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("2");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_0200"));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_0200 onStateCallBack end');
                    console.log(`FMS_notifyVisibleForms_0200 end`);
                    done();
                }, 1000)
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_notifyVisibleForms_0200 featureAbility.startAbility again start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostnoperm",
                    abilityName: "com.ohos.st.formsystemhostnoperm.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "visible",
                        "stateIds" : ["1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_0200 featureAbility.startAbility again end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_0300
         * @tc.name: The length of the formId list is 0 (no formId)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_0300`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_0300 start`);
            
            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0300 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("7");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_0300"));

                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_0300 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_0300 end`);
                    done();
                }, 100)
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_notifyVisibleForms_0300 featureAbility.startAbility start`);
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
                        "stateIds" : [],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_0300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_0400
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_0400`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_0400 start`);
            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0400 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_0400"))

                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_0400 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_0400 end`);
                    done();
                }, 100)
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_notifyVisibleForms_0400 featureAbility.startAbility start`);
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
                        "stateIds" : ["-1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_0400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_0500
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_0500`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_0500 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0500 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_0500"))

                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_0500 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_0500 end`);
                    done();
                }, 100);
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_notifyVisibleForms_0500 featureAbility.startAbility start`);
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
                        "stateIds" : ["0"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_0500 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_0600
         * @tc.name: formID id is error because formId is not self
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_0600`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_0600 start`);
            let formId;

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0600 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_0600"));
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData,
                () => delPublishCallback("FMS_notifyVisibleForms_0600", done));
            }
            async function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0600 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_notifyVisibleForms_0600"))
                formId = data.data;
                commonEvent.subscribe(subscriberOnState, onStateCallBack);
                console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbility again start`);
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
                            "stateIds" : [formId],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
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
                console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_0700
         * @tc.name: Form ID error (FormID does not exist)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_0700`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_0700 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0700 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_0700"));
                
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_0700 onStateCallBack end');
                    console.log(`FMS_notifyVisibleForms_0700 end`);
                    done();
                }, 100);
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_notifyVisibleForms_0700 featureAbility.startAbility again start`);
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
                        "stateIds" : ["123456789"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_0700 featureAbility.startAbility again end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_1000
         * @tc.name: The form provider is the system application and config When form visiblenotify is true,
         * the form provider can be notified that the form is visible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_1000`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1000 start`);
            let formIdInvisible;
            let formIdVisible;
            let onSupplyCount = 0;

            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyVisibleForms_1000 onSupplyCallBack====>" + JSON.stringify(data));
                    onSupplyCount++;
                    if (onSupplyCount == 2) {
                        commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1000"));
                    }
                    if (formIdInvisible && formIdVisible) {
                        let commonEventPublishData = {
                            data: formIdInvisible
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData,
                        () => delPublishCallback("FMS_notifyVisibleForms_1000", done));
                    }
                }
            }

            function onVisibleCallBack(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1000 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                formIdVisible = data.parameters.formId;
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_1000"));
                 if (formIdInvisible && formIdVisible && onSupplyCount == 2) {
                    let commonEventPublishData = {
                        data: formIdInvisible
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData,
                    () => delPublishCallback("FMS_notifyVisibleForms_1000", done));
                }
            }
            async function OnInvisibleCallBack(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1000 OnInvisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_1000"))
                formIdInvisible = data.parameters.formId;

                subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
                commonEvent.subscribe(subscriberOnState, onVisibleCallBack);
                console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbility again start`);
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
                            "stateIds" : [formIdInvisible],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnState, OnInvisibleCallBack);
            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbility start`);
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
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_1100
         * @tc.name: Use 0 and created form card Id notify the form to be visible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_1100`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1100 start`);
            let assertFormId;

            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1100"));
                    console.debug("====>FMS_notifyVisibleForms_1100 onSupplyCallBack====>" + JSON.stringify(data));
                    let formId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                    const visibilityStatus = JSON.parse(data.parameters.parameters)[formId];
                    expect(formId).assertEqual(assertFormId);
                    expect(visibilityStatus).assertEqual(1);

                    let commonEventPublishData = {
                        data: formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData,
                    () => delPublishCallback("FMS_notifyVisibleForms_1000", done));
                }
            }

            function onVisibleCallBack(_, data) {
                if (data.parameters.kind != "visible") {
                    return;
                }
                console.info("!!!====>FMS_notifyVisibleForms_1100 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                assertFormId = data.parameters.formId;

                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_1100"));
            }

            commonEvent.subscribe(subscriberOnState, onVisibleCallBack);
            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            console.log(`FMS_notifyVisibleForms_1100 featureAbility.startAbility start`);
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
                        "stateIds" : ["self", "0"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1100 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_notifyVisibleForms_1200
         * @tc.name: When the form provider is not a system application, notify the form to be visible
         *           and do not pull up the form provider.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_1200`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1200 start`);

            function onVisibleCallBack(_, data) {
                if (data.parameters.kind != "visible") {
                    return;
                }
                console.info("!!!====>FMS_notifyVisibleForms_1200 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");

                setTimeout(function () {
                    commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_1200"));
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1200"));

                    let commonEventPublishData = {
                        data: data.parameters.formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData,
                    () => delPublishCallback("FMS_notifyVisibleForms_1200", done));
                }, 2000);
            }
            function onSupplyEventCallBack(_, data) {
                if (data.parameters.kind != "onVisibilityChange") {
                    return;
                }
                expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1200"));
                console.debug("====>FMS_notifyVisibleForms_1200 onSupplyEventCallBack====>" + JSON.stringify(data));
                console.log(`FMS_notifyVisibleForms_1200 error`);
                expect().assertFail();
            }

            commonEvent.subscribe(subscriberOnState, onVisibleCallBack);
            commonEvent.subscribe(subscriberSupply, onSupplyEventCallBack);
            console.log(`FMS_notifyVisibleForms_1200 featureAbility.startAbility start`);
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
                        "stateForm" : "visible",
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1200 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_notifyVisibleForms_1300
         * @tc.name: Provider onVisibleChange can not be called when formVisibleNotify is false.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the onVisibleChange interface.
         */
        it(`FMS_notifyVisibleForms_1300`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1300 start`);

            function OnVisibleCallBack(_, data) {
                if (data.parameters.kind != "visible") {
                    return;
                }
                console.info("!!!====>FMS_notifyVisibleForms_1300 OnVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");

                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_1300"));

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData,
                () => delPublishCallback("FMS_notifyVisibleForms_1300", done));
            }

            commonEvent.subscribe(subscriberOnState, OnVisibleCallBack);
            console.log(`FMS_notifyVisibleForms_1300 featureAbility.startAbility start`);
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
                console.log(`FMS_notifyVisibleForms_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_1400
         * @tc.name: formVisibleNotify in config.json is true,
         *           it can notify the form provider that the form is not visible.
         * @tc.desc: 1. The card is created successfully.
         *           2. The visibility interface is successfully invoked. 
         *              The visibility notification of form provider A is triggered, 
         *              and the formId is the same as that of the created formId.
         */
         it(`FMS_notifyVisibleForms_1400`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1400 start`);
            let supplyFlag = false;
            let formId1;
            let formId2;
            let delCount = 0;
            let onSupplyCount = 0;

            function delPublishCallBack() {
                console.info("!!!====>FMS_notifyVisibleForms_1400 delPublishCallBack====>");
                delCount++;
                if (delCount == 2) {
                    setTimeout(function () {
                        commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1400"));
                        if (supplyFlag) {
                            expect().assertFail();
                        }
                        console.info('FMS_notifyVisibleForms_1400 delPublishCallBack end');
                        console.info('FMS_notifyVisibleForms_1400 end');
                        done();
                    }, 1000);
                }
            }
            function onAcquiredCallBack_Normal1(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1400 onAcquiredCallBack_Normal1 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal1)
                formId1 = data.data;

                FMS_notifyVisibleForms_1400_normal2();
            }
            function unSubscribeOnAcquiredCallBack_Normal1() {
                console.debug("====>FMS_notifyVisibleForms_1400 unSubscribeOnAcquiredCallBack_Normal2====>");
            }
            async function FMS_notifyVisibleForms_1400_normal1() {
                console.log(`FMS_notifyVisibleForms_1400_normal1 start`);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal1);
                console.log(`FMS_notifyVisibleForms_1400_normal1 featureAbility.startAbility start`);
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
                    console.log(`FMS_notifyVisibleForms_1400_normal1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1400_normal1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.log(`FMS_notifyVisibleForms_1400_normal1 featureAbility.startAbility end`);
                console.log(`FMS_notifyVisibleForms_1400_normal1 end`);
            }

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1400 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_1400"))
                console.info("!!!====>FMS_notifyVisibleForms_1400 onStateCallBack formId1:====>" + formId1);
                console.info("!!!====>FMS_notifyVisibleForms_1400 onStateCallBack formId2:====>" + formId2);
                console.info("!!!====>FMS_notifyVisibleForms_1400 onStateCallBack onSupplyCount:====>" + onSupplyCount);
                if (formId1 && formId2 && onSupplyCount == 1) {
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
                console.info("!!!====>FMS_notifyVisibleForms_1400 onAcquiredCallBack_Normal2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal2);
                formId2 = data.data;

                
                commonEvent.subscribe(subscriberOnState, onStateCallBack);
                
                console.log(`FMS_notifyVisibleForms_1400 featureAbility.startAbility start`);
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
                            "stateIds" : [formId1,formId2],
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyVisibleForms_1400 featureAbility.startAbility end`);
            }
            function unSubscribeOnAcquiredCallBack_Normal2() {
                console.debug("====>FMS_notifyVisibleForms_1400 unSubscribeOnAcquiredCallBack_Normal2====>");
            }
            async function FMS_notifyVisibleForms_1400_normal2() {
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal2);
                console.log(`FMS_notifyVisibleForms_1400_normal2 featureAbility.startAbility start`);
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
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_1400_normal2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1400_normal2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.log(`FMS_notifyVisibleForms_1400_normal2 featureAbility.startAbility end`);
            }
            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyVisibleForms_1400 onSupplyCallBack====>" + JSON.stringify(data));
                    let parameters = JSON.parse(data.parameters.parameters);
                    if(parameters[formId1]) {
                        expect(parameters[formId1]).assertEqual(1);
                    }
                    if(parameters[formId2]) {
                        expect(parameters[formId2]).assertEqual(1);
                    }

                    onSupplyCount++;
                    if (onSupplyCount == 2) {
                        supplyFlag = true;
                        commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1400"));
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
            FMS_notifyVisibleForms_1400_normal1();
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_1500
         * @tc.name: Created provider A and B form card, notify the form to be visible 3times.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
         it(`FMS_notifyVisibleForms_1500`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1500 start`);
            let formIds = new Array();
            let count = 0;

            function delPublishCallBack1(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1500 delPublishCallBack1====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1500 delPublishCallBack1 end');
                    console.log(`FMS_notifyVisibleForms_1500 end`);
                }, 1000);
            }
            function delPublishCallBack2(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1500 delPublishCallBack2====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1500 delPublishCallBack2 end');
                    console.log(`FMS_notifyVisibleForms_1500 end`);
                    done();
                }, 1000);
            }

            function onInVisibleSupplyCallBack(_, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyVisibleForms_1500 onInVisibleSupplyCallBack====>" + JSON.stringify(data));

                    let retFormId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                    const visibilityStatus = JSON.parse(data.parameters.parameters)[retFormId];
                    expect(formIds.includes(retFormId)).assertTrue();
                    expect(visibilityStatus).assertEqual(2);

                    ++count;
                    if (count == 12) {
                        commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1500"));
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

            async function onVisibleSupplyCallBack(_, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyVisibleForms_1500 onVisibleSupplyCallBack====>" + JSON.stringify(data));

                    let retFormId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                    const visibilityStatus = JSON.parse(data.parameters.parameters)[retFormId];
                    expect(formIds.includes(retFormId)).assertTrue();
                    expect(visibilityStatus).assertEqual(1);

                    ++count;
                    if (count == 6) {
                        commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1500"));
                        subscriberSupply = await commonEvent.createSubscriber(onSupplyEvent);
                        commonEvent.subscribe(subscriberSupply, onInVisibleSupplyCallBack);
                        console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility notifyInvisible start`);
                        for (var i = 0; i < 3; i++) {
                            await featureAbility.startAbility({
                                want: {
                                    bundleName: "com.ohos.st.formsystemhostg",
                                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                                    parameters: {
                                        "stateForm": "invisible",
                                        "stateIds": formIds,
                                        "isCreate": false
                                    }
                                }
                            }).then((res: any) => {
                                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                            }).catch((err: any) => {
                                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                            });
                        }
                        console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility notifyInvisible end`);
                    }
                }
            }

            async function onAcquiredCallBack2(_, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1500"));
                console.debug("====>FMS_notifyVisibleForms_1500 onAcquiredCallBack2====>" + JSON.stringify(data));
                formIds.push(data.data);
                console.debug("====>FMS_notifyVisibleForms_1500 formIds====>" + formIds);

                commonEvent.subscribe(subscriberSupply, onVisibleSupplyCallBack);
                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility notifyVisible start`);
                for (var i = 0; i < 3; i++) {
                    await featureAbility.startAbility({
                        want: {
                            bundleName: "com.ohos.st.formsystemhostg",
                            abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                            parameters: {
                                "stateForm": "visible",
                                "stateIds": formIds,
                                "isCreate": false
                            }
                        }
                    }).then((res: any) => {
                        console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    }).catch((err: any) => {
                        console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    });
                }
                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility notifyVisible end`);
            }

            async function onAcquiredCallBack1(_, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1500"));
                console.debug("====>FMS_notifyVisibleForms_1500 onAcquiredCallBack1====>" + JSON.stringify(data));
                formIds.push(data.data);
                console.debug("====>FMS_notifyVisibleForms_1500 formIds====>" + JSON.stringify(formIds));

                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack2);
                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility serviceb start`);
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
                    console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility serviceb end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack1);
            console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility servicea start`);
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
                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility servicea end`);
        });

        /**
         * @tc.number: FMS_notifyVisibleForms_1600
         * @tc.name: Use -1 and created form card Id notify the form to be visible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_1600`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1600 start`);
            let formIds = new Array();
            let count = 0;

            function delPublishCallBack1(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1600 delPublishCallBack1====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1600 delPublishCallBack1 end');
                    console.log(`FMS_notifyVisibleForms_1600 end`);
                }, 1000);
            }
            function delPublishCallBack2(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1600 delPublishCallBack2====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1600 delPublishCallBack2 end');
                    console.log(`FMS_notifyVisibleForms_1600 end`);
                    done();
                }, 1000);
            }

            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyVisibleForms_1600 onSupplyCallBack====>" + JSON.stringify(data));

                    let retFormId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                    const visibilityStatus = JSON.parse(data.parameters.parameters)[retFormId];
                    expect(formIds.includes(retFormId)).assertTrue();
                    expect(visibilityStatus).assertEqual(1);

                    ++count;
                    if (count == 2) {
                        console.debug("====>FMS_notifyVisibleForms_1600 OK====>");
                        commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1500"));

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
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_notifyVisibleForms_1500"));
                console.debug("====>FMS_notifyVisibleForms_1600 onSecondAcquiredCallBack====>" + JSON.stringify(data));
                formIds.push(data.data);
                formIds.push("-1");
                console.debug("====>FMS_notifyVisibleForms_1600 formIds====>" + formIds);

                commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
                console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbility notifyVisible start`);
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
                            "stateForm" : "visible",
                            "stateIds" : formIds,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbility notifyVisible end`);
            }

            async function onFirstAcquiredCallBack(_, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_notifyVisibleForms_1500"));
                console.debug("====>FMS_notifyVisibleForms_1600 onFirstAcquiredCallBack====>" + JSON.stringify(data));
                formIds.push(data.data);

                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onSecondAcquiredCallBack);
                console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbility serviceb start`);
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
                    console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbility serviceb end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onFirstAcquiredCallBack);
            console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbility servicea start`);
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
                console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbility servicea end`);
        });

        /**
         * @tc.number: FMS_notifyVisibleForms_1700
         * @tc.name: Use -1 and created form card Id notify the form to be visible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_1700`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1700 start`);

            function onFormVisibleCallBack(_, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1700"));
                console.debug("====>FMS_notifyVisibleForms_1700 onFirstAcquiredCallBack====>" + JSON.stringify(data));
                expect(data.parameters.kind).assertEqual("visible");
                expect(data.data).assertEqual("0");

                setTimeout(function () {
                    let commonEventPublishData = {
                        data: data.parameters.formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData,
                    () => delPublishCallback("FMS_notifyVisibleForms_1700", done));
                }, 2000);
            }

            function onFormSupplyCallBack(_, data) {
                expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyVisibleForms_1700"));
                console.debug("====>FMS_notifyVisibleForms_1700 onFormSupplyCallBack====>" + JSON.stringify(data));
                if (data.parameters.kind == "onVisibilityChange") {
                    console.debug("====>FMS_notifyVisibleForms_1700 error");
                    expect().assertFail();
                }
            }

            commonEvent.subscribe(subscriberOnState, onFormVisibleCallBack);
            commonEvent.subscribe(subscriberSupply, onFormSupplyCallBack);
            console.log(`FMS_notifyVisibleForms_1700 featureAbility.startAbility servicea start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true,
                        "isStartOtherApp" : true,
                        "otherAppState" : "visible"
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1700 featureAbility.startAbility servicea end`);
        });

        /**
         * @tc.number: FMS_notifyVisibleForms_1800
         * @tc.name: When formVisibleNotify is true in config.json,
         * the form provider will be pulled when the card is visible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_1800`, 0, async (done) => {
            console.info(`FMS_notifyVisibleForms_1800 start`);
            let hostFormId;
            let providerFormId;
            let counter = 0;

            const delPublishCallback = (_, data) => {
                console.info("!!!====>FMS_notifyVisibleForms_1800 delPublishCallback====>");
                setTimeout(() => {
                    expect(hostFormId).assertEqual(providerFormId);
                    console.info('FMS_notifyVisibleForms_1800 delPublishCallback end');
                    console.info(`FMS_notifyVisibleForms_1800 end`);
                    done();
                }, 1000);
            }

            const onSupplyCallback = (_, data) => {
                if (data.parameters.kind != "onVisibilityChange") {
                    return;
                }
                console.debug("====>FMS_notifyVisibleForms_1800 onSupplyCallback data:====>" + JSON.stringify(data));
                providerFormId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                const visibilityStatus = JSON.parse(data.parameters.parameters)[providerFormId];

                expect(visibilityStatus).assertEqual(1);
                commonEvent.unsubscribe(subscriberSupply, () => {
                    console.info("====>FMS_notifyVisibleForms_1800 unSubscribeSupplyCallback====>");
                });
                if (++counter == 2) {
                    const commonEventPublishData = {
                        data: providerFormId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallback);
                }
            }

            const onVisibleCallback = (_, data) => {
                if (data.parameters.kind != "visible") {
                    return;
                }
                console.debug("====>FMS_notifyVisibleForms_1800 onVisibleCallback data:====>" + JSON.stringify(data));
                hostFormId = data.parameters.formId;

                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info("====>FMS_notifyVisibleForms_1800 unSubscribeOnVisibleCallback====>");
                });
                if (++counter == 2) {
                    const commonEventPublishData = {
                        data: hostFormId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallback);
                }
            }

            commonEvent.subscribe(subscriberOnState, onVisibleCallback);
            commonEvent.subscribe(subscriberSupply, onSupplyCallback);
            console.info(`FMS_notifyVisibleForms_1800 featureAbility.startAbility start`);
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
                        "stateForm": "visible",
                        "stateIds": ["self"],
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.debug(`FMS_notifyVisibleForms_1800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_notifyVisibleForms_1800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_1900
         * @tc.name: The size of visible form ids in the notification form array exceeds 32.
         * @tc.desc: 1. Failed to invoke the visibility interface (parameter error).
         */
        it(`FMS_notifyVisibleForms_1900`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1900 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1900 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyVisibleForms_1900"))

                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1900 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_1900 end`);
                    done();
                }, 100);
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_notifyVisibleForms_1900 featureAbility.startAbility start`);
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
                        "stateIds" : [
                            "1","2","3","4","5","6","7","8","9","10","11","12","13","14",
                            "15","16","17","18","19","20","21","22","23","24","25","26",
                            "27","28","29","30","31","32","33"
                        ],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1900 featureAbility.startAbility end`);
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

const unsubscribeOnAcquiredCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unsubscribeOnAcquiredCallback====>`);
}
