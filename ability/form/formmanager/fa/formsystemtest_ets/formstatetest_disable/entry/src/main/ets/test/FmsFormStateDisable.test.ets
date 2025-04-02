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
import { beforeAll, afterAll, beforeEach, afterEach, describe, expect, it } from '@ohos/hypium'
import backgroundTaskManager from '@ohos.backgroundTaskManager';

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

        let id = undefined;
        beforeAll(async (done) => {
            console.log("FMS_disableFormsUpdate beforeAll called");
            let myReason = 'test FaShowOnLockTest';
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
                console.log("FMS_disableFormsUpdate Request suspension delay will time out.");
            })
            id = delayInfo.requestId;
            console.log("FMS_disableFormsUpdate requestId is : " + id);
            setTimeout(function () {
                console.log("FMS_disableFormsUpdate beforeAll end");
                done();
            }, 1000);
        })
        
        afterAll(async (done) => {
            console.log("FMS_disableFormsUpdate afterAll called");
            backgroundTaskManager.cancelSuspendDelay(id);
            setTimeout(function () {
                console.log("FMS_disableFormsUpdate afterAll end");
                done();
            }, 1000);
        })

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
            await sleep(1000);
        })

        /**
         * @tc.number: FMS_disableFormsUpdate_0200
         * @tc.name: The form user does not have permission.
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0200`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_0200 start`);
            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0200 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("2");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_disableFormsUpdate_0200"));
                setTimeout(function () {
                    console.info('FMS_disableFormsUpdate_0200 onStateCallBack end');
                    console.log(`FMS_disableFormsUpdate_0200 end`);
                    done();
                }, 1000)
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbility again start`);
            featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostnoperm",
                    abilityName: "com.ohos.st.formsystemhostnoperm.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "disable",
                        "stateIds" : ["1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail()
                done()
            });
            console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbility again end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0300
         * @tc.name: The length of the formId list is 0 (no formId)
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0300`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_0300 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0300 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("7");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_disableFormsUpdate_0300"))

                setTimeout(function () {
                    console.info('FMS_disableFormsUpdate_0300 delPublishCallBack end');
                    console.log(`FMS_disableFormsUpdate_0300 end`);
                    done();
                }, 100)
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_disableFormsUpdate_0300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "disable",
                        "stateIds" : [],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail()
                done()
            });
            console.log(`FMS_disableFormsUpdate _0300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0400
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0400`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_0400 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0400 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_disableFormsUpdate_0400"))
                console.log(`FMS_disableFormsUpdate_0400 end`);
                done();
            }
            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_disableFormsUpdate_0400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "disable",
                        "stateIds" : ["-1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail()
                done()
            });
            console.log(`FMS_disableFormsUpdate _0400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0500
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0500`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_0500 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0500 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_disableFormsUpdate_0500"))
                console.log(`FMS_disableFormsUpdate_0500 end`);
                done();
                
            }
            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "disable",
                        "stateIds" : ["0"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail()
                done()
            });
            console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0600
         * @tc.name: formID id is error because formId is not self
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0600`, 0, async (done) => {
            console.info(`FMS_disableFormsUpdate_0600 start`);
            let hostFormId;

            const onDisableCallback = (_, data) => {
                if (data.parameters.kind != "disable") {
                    return;
                }
                console.debug("====>FMS_disableFormsUpdate_0600 onDisableCallback data:====>" + JSON.stringify(data));

                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnDisableCallback("FMS_disableFormsUpdate_0600"));
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_disableFormsUpdate_0600"));
                const commonEventPublishData = {
                    data: hostFormId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_disableFormsUpdate_0600 publish' + JSON.stringify(err));
                    done()
                });
            }

            const onAcquiredCallBack = async (_, data) => {
                console.debug("====>FMS_disableFormsUpdate_0600 onAcquiredCallback data:====>" + JSON.stringify(data));
                hostFormId = data.data;

                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId": hostFormId,
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicef.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "stateForm": "disable",
                            "stateIds": [hostFormId],
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.debug(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.debug(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_disableFormsUpdate_0600"));
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            commonEvent.subscribe(subscriberOnState, onDisableCallback);
            console.info(`FMS_disableFormsUpdate_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicef.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.debug(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail()
                done()
            });
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0700
         * @tc.name: formID id is error because formId is not exist
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0700`, 0, async (done) => {
            console.info(`FMS_disableFormsUpdate_0700 start`);
            let hostFormId;

            const onDisableCallback = (_, data) => {
                if (data.parameters.kind != "disable") {
                    return;
                }
                console.debug("====>FMS_disableFormsUpdate_0700 onDisableCallback data:====>" + JSON.stringify(data));

                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info("====>FMS_disableFormsUpdate_0700 unSubscribeOnDisableCallback====>");
                    done()
                });
            }

            const onDeleteCallback = async (_, data) => {
                console.debug("====>FMS_disableFormsUpdate_0700 onDeleteCallback data:====>" + JSON.stringify(data));
                hostFormId = data.parameters.formId;

                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicef.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "stateForm": "disable",
                            "stateIds": [hostFormId],
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.debug(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.debug(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail()
                    done()
                });

                commonEvent.unsubscribe(subscriberDel, () => {
                    console.info("====>FMS_disableFormsUpdate_0700 unSubscribeDelCallback====>");
                });
            }

            commonEvent.subscribe(subscriberDel, onDeleteCallback);
            commonEvent.subscribe(subscriberOnState, onDisableCallback);
            console.info(`FMS_disableFormsUpdate_0700 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicef.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "deleteForm": true,
                        "deleteId": "self",
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.debug(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail()
                done()
            });
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0800
         * @tc.name: The form user has form permission.
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0800`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_0800 start`);
            let formId;

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0800 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                formId = data.parameters.formId;
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_disableFormsUpdate_0800"));
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_disableFormsUpdate_0800 publish' + JSON.stringify(err));
                    done()
                });
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "disable",
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail()
                done()
            });
            console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbility end`);
        });
        
        /**
         * @tc.number: FMS_disableFormsUpdate_0900
         * @tc.name: There are correct and wrong formId in the form ID parameter list.
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0900`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_0900 start`);
            let formId;

            function OnDisableCallBack(_, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0900 OnDisableCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnDisableCallback("FMS_disableFormsUpdate_0900"));

                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_disableFormsUpdate_0900 publish' + JSON.stringify(err));
                    done()
                });
            }
            async function OnEnableCallBack(_, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0900 OnEnableCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnEnableCallback("FMS_disableFormsUpdate_0900"));
                formId = data.parameters.formId;
                subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
                commonEvent.subscribe(subscriberOnState, OnDisableCallBack);
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "disable",
                        "stateIds" : [formId, "0"],
                        "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility end`);
            }

            commonEvent.subscribe(subscriberOnState, OnEnableCallBack);
            console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "enable",
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_1000
         * @tc.name: Set next refresh time is invalid when disable form. (cache data < 1k)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Call the disableFormsUpdate interface.
         *           3.Call the setFormNextRefreshTime interface and verify the form can not refresh.
         */
        it(`FMS_disableFormsUpdate_1000`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_1000 start`);
            let formId;

            // timer speed up
            commonEvent.publish(`fms.time_speed`, { code: 100 }, () => {
                console.log(`FMS_disableFormsUpdate_1000 time speed up`);
            });

            function onSupplyEventCallBack(_, data) {
                console.debug("====>FMS_disableFormsUpdate_1000 onSupplyEventCallBack====>" + JSON.stringify(data));
                if ("onUpdate" == data.parameters.kind) {
                    console.debug("FMS_disableFormsUpdate_1000 error, onUpdate called.");
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1000"));
                    expect().assertFail();
                }
            }

            function onFormDisableCallBack(_, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                console.debug("====>FMS_disableFormsUpdate_1000 onFormDisableCallBack====>" + JSON.stringify(data));
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1000"));
                expect(data.parameters.kind).assertEqual("disable");
                expect(data.data).assertEqual("0");

                commonEvent.subscribe(subscriberSupply, onSupplyEventCallBack);

                setTimeout(() => {
                    // timer reset
                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.log(`FMS_disableFormsUpdate_1000 time reset`);
                    });
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1000"));
                }, 9000);

                setTimeout(() => {
                    console.log(`FMS_disableFormsUpdate_1000 onFormDisableCallBack end`);
                    let commonEventPublishData = {
                        data: formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                        console.info('FMS_disableFormsUpdate_1000 publish' + JSON.stringify(err));
                        done()
                    });
                }, 10000);
            }

            async function onAcquiredCallBack(_, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1000"));
                console.debug("====>FMS_disableFormsUpdate_1000 onAcquiredCallBack====>" + JSON.stringify(data));
                expect(data.parameters.kind).assertEqual("visible");
                expect(data.data).assertEqual("0");
                formId = data.parameters.formId;

                subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
                commonEvent.subscribe(subscriberOnState, onFormDisableCallBack);
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility notify disable start`);
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
                            "stateForm" : "disable",
                            "stateIds" : [formId],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail()
                    done()
                });
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility notify disable end`);
            }

            commonEvent.subscribe(subscriberOnState, onAcquiredCallBack);
            console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility servicea start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestservicef.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true,
                        "stateIds" : ["self"],
                        "stateForm" : "visible"
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail()
                done()
            });
            console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility servicea end`);
        });

        /**
         * @tc.number: FMS_disableFormsUpdate_1100
         * @tc.name: Set next refresh time is invalid when disable form. (cache data > 1k)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Call the disableFormsUpdate interface.
         *           3.Call the setFormNextRefreshTime interface and verify the form can not refresh.
         */
        it(`FMS_disableFormsUpdate_1100`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_1100 start`);
            let formId;

            // timer speed up
            commonEvent.publish(`fms.time_speed`, { code: 100 }, () => {
                console.log(`FMS_disableFormsUpdate_1100 time speed up`);
            });

            function onSupplyEventCallBack(_, data) {
                console.debug("====>FMS_disableFormsUpdate_1100 onSupplyEventCallBack====>" + JSON.stringify(data));
                if ("onUpdate" == data.parameters.kind) {
                    console.debug("FMS_disableFormsUpdate_1100 error, onUpdate called.");
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1100"));
                    expect().assertFail();
                }
            }

            function onFormDisableCallBack(_, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                console.debug("====>FMS_disableFormsUpdate_1100 onFormDisableCallBack====>" + JSON.stringify(data));
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1100"));
                expect(data.parameters.kind).assertEqual("disable");
                expect(data.data).assertEqual("0");

                commonEvent.subscribe(subscriberSupply, onSupplyEventCallBack);

                setTimeout(() => {
                    // timer reset
                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.log(`FMS_disableFormsUpdate_1100 time reset`);
                    });
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1100"));
                }, 9000);

                setTimeout(() => {
                    console.log(`FMS_disableFormsUpdate_1100 onFormDisableCallBack end`);
                    let commonEventPublishData = {
                        data: formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                        console.info('FMS_disableFormsUpdate_1100 publish' + JSON.stringify(err));
                        done()
                    });
                }, 10000);
            }

            async function onAcquiredCallBack(_, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1100"));
                console.debug("====>FMS_disableFormsUpdate_1100 onAcquiredCallBack====>" + JSON.stringify(data));
                expect(data.parameters.kind).assertEqual("visible");
                expect(data.data).assertEqual("0");
                formId = data.parameters.formId;

                subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
                commonEvent.subscribe(subscriberOnState, onFormDisableCallBack);
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility notify disable start`);
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
                            "stateForm" : "disable",
                            "stateIds" : [formId],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail()
                    done()
                });
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility notify disable end`);
            }

            commonEvent.subscribe(subscriberOnState, onAcquiredCallBack);
            console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility servicea start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestserviceg.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true,
                        "stateIds" : ["self"],
                        "stateForm" : "visible"
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail()
                done()
            });
            console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility servicea end`);
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

const unsubscribeOnDisableCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeOnDisableCallback====>`);
}

const unsubscribeOnEnableCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeOnEnableCallback====>`);
}

const unsubscribeSupplyCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unSubscribeSupplyCallback====>`);
}
