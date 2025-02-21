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
import { describe, afterEach, beforeEach, expect, it } from '@ohos/hypium'

var onAcquiredForm_Event = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};

var onDeletedFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
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
var subscriberDel;
var subscriberOnState;
var subscriberSupply;

export default function test() {
    describe(`FmsStateFormTest`, () => {

        beforeEach(async () => {
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberDel = await commonEvent.createSubscriber(onDeletedFormEvent);
            subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
            subscriberSupply = await commonEvent.createSubscriber(onSupplyEvent);
            await sleep(1000);
        })

        afterEach(async() => {
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberDel, () => unsubscribeCallback("afterEach unsubscribe subscriberDel"));
            commonEvent.unsubscribe(subscriberOnState, () => unsubscribeCallback("afterEach unsubscribe subscriberOnState"));
            commonEvent.unsubscribe(subscriberSupply, () => unsubscribeCallback("afterEach unsubscribe subscriberSupply"));

            let wantInfo = {
                want: {
                    bundleName: "com.ohos.st.formstatenotifyinvisibletest",
                    abilityName: "com.ohos.st.formstatenotifyinvisibletest.TestAbility"
                }
            }
            await featureAbility.startAbility(wantInfo).then((data) => {
              console.log("FMS_notifyInvisibleForms startAbility data : " + JSON.stringify(data));
            }).catch((err) => {
              console.log("FMS_notifyInvisibleForms startAbility err : " + JSON.stringify(err));
            })
            await sleep(1000);
        })
        /**
         * @tc.number: FMS_notifyInvisibleForms_0200
         * @tc.name: The form user does not have permission.
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0200`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0200 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0200 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("2");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_0200"));
                setTimeout(function () {
                    console.info('FMS_notifyInvisibleForms_0200 onStateCallBack end');
                    console.log(`FMS_notifyInvisibleForms_0200 end`);
                    done();
                }, 1000)
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_notifyInvisibleForms_0200 featureAbility.startAbility again start`);
            featureAbility.startAbility({
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
                        "stateForm" : "invisible",
                        "stateIds" : ["1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_0200 featureAbility.startAbility again end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_0300
         * @tc.name: The length of the formId list is 0 (no formId)
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0300`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0300 start`);
            
            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0300 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("7");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_0300"))

                setTimeout(function () {
                    console.info('FMS_notifyInvisibleForms_0300 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_0300 end`);
                    done();
                }, 100)
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_notifyInvisibleForms_0300 featureAbility.startAbility start`);
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
                        "stateIds" : [],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_0300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_0400
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0400`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0400 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0400 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_0400"))

                setTimeout(function () {
                    console.info('FMS_notifyInvisibleForms_0400 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_0400 end`);
                    done();
                }, 100)
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_notifyInvisibleForms_0400 featureAbility.startAbility start`);
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
                        "stateIds" : ["-1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_0400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_0500
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0500`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0500 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0500 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_0500"))

                setTimeout(function () {
                    console.info('FMS_notifyInvisibleForms_0500 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_0500 end`);
                    done();
                }, 100)
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_notifyInvisibleForms_0500 featureAbility.startAbility start`);
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
                        "stateIds" : ["0"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_0500 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_0600
         * @tc.name: formID id is error because formId is not self
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0600`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0600 start`);
            let formId;

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0600 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_0600"));
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_notifyInvisibleForms_0600 publish' + JSON.stringify(err));
                    done()
                });
            }

            async function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0600 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_notifyInvisibleForms_0600"))
                formId = data.data;
                commonEvent.subscribe(subscriberOnState, onStateCallBack);
                console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbility again start`);
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
                            "stateIds" : [formId],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    
                });
                console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbility start`);
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
                console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_0700
         * @tc.name: form has been deleted
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0700`, 0, async (done) => {
            console.info(`FMS_notifyInvisibleForms_0700 start`);
            let hostFormId;

            const onSupplyCallback = (_, data) => {
                if (data.parameters.kind != "onVisibilityChange") {
                    return;
                }
                console.debug("====>FMS_notifyInvisibleForms_0700 onSupplyCallback data:====>" + JSON.stringify(data));
                expect().assertFail();
            }

            const onInvisibleCallback = (_, data) => {
                if (data.parameters.kind != "invisible") {
                    return;
                }
                console.debug("====>FMS_notifyInvisibleForms_0700 onInvisibleCallback data:====>" + JSON.stringify(data));

                expect(data.data).assertEqual("0");
                expect(data.parameters.formId).assertEqual(hostFormId);
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_0700"));
                setTimeout(() => {
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyInvisibleForms_0700"));
                    done();
                }, 2000);
            }

            const onDeleteCallback = async (_, data) => {
                console.debug("====>FMS_notifyInvisibleForms_0700 onDeleteCallback data:====>" + JSON.stringify(data));
                hostFormId = data.parameters.formId;

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
                            "stateIds": [hostFormId],
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.debug(`FMS_notifyInvisibleForms_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.debug(`FMS_notifyInvisibleForms_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                commonEvent.unsubscribe(subscriberDel, () => {
                    console.info("====>FMS_notifyInvisibleForms_0700 unSubscribeDelCallback====>");
                });
            }

            commonEvent.subscribe(subscriberDel, onDeleteCallback);
            commonEvent.subscribe(subscriberOnState, onInvisibleCallback);
            commonEvent.subscribe(subscriberSupply, onSupplyCallback);
            console.info(`FMS_notifyInvisibleForms_0700 featureAbility.startAbility start`);
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
                        "deleteForm": true,
                        "deleteId": "self",
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.debug(`FMS_notifyInvisibleForms_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_notifyInvisibleForms_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_0800
         * @tc.name: The form provider is the system application and config When form visiblenotify is true,
         * the form provider can be notified that the form is invisible.
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0800`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0800 start`);
            let formIdInvisible;
            let formIdVisible;
            let onSupplyCount = 0;

            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyInvisibleForms_0800 onSupplyCallBack====>" + JSON.stringify(data));
                    onSupplyCount++;
                    if (onSupplyCount == 2) {
                        commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_notifyInvisibleForms_0800"));
                    }
                    if (formIdInvisible && formIdVisible) {
                        let commonEventPublishData = {
                            data: formIdInvisible
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                            console.info('FMS_notifyInvisibleForms_0800 publish' + JSON.stringify(err));
                            done()
                        });
                    }
                }
            }

            function OnInvisibleCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0800 OnInvisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                formIdInvisible = data.parameters.formId;
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_0800"));
                if (formIdInvisible && formIdVisible && onSupplyCount == 2) {
                    let commonEventPublishData = {
                        data: formIdInvisible
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                        console.info('FMS_notifyInvisibleForms_0800 publish' + JSON.stringify(err));
                        done()
                    });
                }
            }
            async function onVisibleCallBack(_, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0800 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_notifyInvisibleForms_0800"));
                formIdVisible = data.parameters.formId;
                
                subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
                commonEvent.subscribe(subscriberOnState, OnInvisibleCallBack);
                console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbility again start`);
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
                            "stateIds" : [formIdVisible],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnState, onVisibleCallBack);
            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbility start`);
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
                console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbility end`);
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

const unsubscribeOnAcquiredCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeOnAcquiredCallback====>`);
}

const unsubscribeSupplyCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unSubscribeSupplyCallback====>`);
}
