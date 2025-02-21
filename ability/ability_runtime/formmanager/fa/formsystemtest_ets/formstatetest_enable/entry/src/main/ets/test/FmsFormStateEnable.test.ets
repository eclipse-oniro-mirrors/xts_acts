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
            console.log("FMS_enableFormsUpdate beforeAll called");
            let myReason = 'test FaShowOnLockTest';
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
                console.log("FMS_enableFormsUpdate Request suspension delay will time out.");
            })
            id = delayInfo.requestId;
            console.log("FMS_enableFormsUpdate requestId is : " + id);
            setTimeout(function () {
                console.log("FMS_enableFormsUpdate beforeAll end");
                done();
            }, 1000);
        })
        
        afterAll(async (done) => {
            console.log("FMS_enableFormsUpdate afterAll called");
            backgroundTaskManager.cancelSuspendDelay(id);
            setTimeout(function () {
                console.log("FMS_enableFormsUpdate afterAll end");
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
         * @tc.number: FMS_enableFormsUpdate_0200
         * @tc.name: The form user does not have permission.
         * @tc.desc: 1.The form user calls the enable update interface.
         *           2.Verify the result of the enable update interface.
         */
        it(`FMS_enableFormsUpdate_0200`, 0, async (done) => {
            console.log(`FMS_enableFormsUpdate_0200 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_enableFormsUpdate_0200 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("2");
                console.info('FMS_enableFormsUpdate_0200 onStateCallBack end');
                console.log(`FMS_enableFormsUpdate_0200 end`);
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info('FMS_enableFormsUpdate_0200 unsubscribe callback');
                    done();
                })
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_enableFormsUpdate_0200 featureAbility.startAbility again start`);
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
                        "stateForm" : "enable",
                        "stateIds" : ["1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_enableFormsUpdate_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_enableFormsUpdate_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_enableFormsUpdate_0200 featureAbility.startAbility again end`);
        });
        /**
         * @tc.number: FMS_enableFormsUpdate_0300
         * @tc.name: The length of the formId list is 0 (no formId)
         * @tc.desc: 1.The form user calls the enable update interface.
         *           2.Verify the result of the enable update interface.
         */
        it(`FMS_enableFormsUpdate_0300`, 0, async (done) => {
            console.log(`FMS_enableFormsUpdate_0300 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_enableFormsUpdate_0300 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("7");
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info('FMS_enableFormsUpdate_0300 unsubscribe callback');
                    done();
                })
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_enableFormsUpdate_0300 featureAbility.startAbility start`);
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
                        "stateForm" : "enable",
                        "stateIds" : [],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_enableFormsUpdate_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_enableFormsUpdate_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_enableFormsUpdate_0300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_enableFormsUpdate_0400
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form user calls the enable update interface.
         *           2.Verify the result of the enable update interface.
         */
        it(`FMS_enableFormsUpdate_0400`, 0, async (done) => {
            console.log(`FMS_enableFormsUpdate_0400 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_enableFormsUpdate_0400 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info('FMS_enableFormsUpdate_0400 unsubscribe callback');
                    done();
                })
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_enableFormsUpdate_0400 featureAbility.startAbility start`);
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
                        "stateForm" : "enable",
                        "stateIds" : ["-1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_enableFormsUpdate_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_enableFormsUpdate_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_enableFormsUpdate_0400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_enableFormsUpdate_0500
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form user calls the enable update interface.
         *           2.Verify the result of the enable update interface.
         */
        it(`FMS_enableFormsUpdate_0500`, 0, async (done) => {
            console.log(`FMS_enableFormsUpdate_0500 start`);

            function onStateCallBack(_, data) {
                console.info("!!!====>FMS_enableFormsUpdate_0500 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info('FMS_enableFormsUpdate_0500 unsubscribe callback');
                    done();
                })
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_enableFormsUpdate_0500 featureAbility.startAbility start`);
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
                        "stateForm" : "enable",
                        "stateIds" : ["0"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_enableFormsUpdate_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_enableFormsUpdate_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_enableFormsUpdate_0500 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_enableFormsUpdate_0600
         * @tc.name: formID id is error because formId is not self
         * @tc.desc: 1.The form user calls the enable update interface.
         *           2.Verify the result of the enable update interface.
         */
        it(`FMS_enableFormsUpdate_0600`, 0, async (done) => {
            console.info(`FMS_enableFormsUpdate_0600 start`);
            let hostFormId;

            const onEnableCallback = (_, data) => {
                if (data.parameters.kind != "enable") {
                    return;
                }
                console.debug("====>FMS_enableFormsUpdate_0600 onEnableCallback data:====>" + JSON.stringify(data));

                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_enableFormsUpdate_0600"));
                const commonEventPublishData = {
                    data: hostFormId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_enableFormsUpdate_0600 publish' + JSON.stringify(err));
                    done()
                });
            }

            const onAcquiredCallBack = async (_, data) => {
                console.debug("====>FMS_enableFormsUpdate_0600 onAcquiredCallback data:====>" + JSON.stringify(data));
                hostFormId = data.data;

                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId": hostFormId,
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicef.hmservice",
                            "ability": "com.form.formsystemtestservicef.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "stateForm": "enable",
                            "stateIds": [hostFormId],
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.debug(`FMS_enableFormsUpdate_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.debug(`FMS_enableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_enableFormsUpdate_0600"));
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            commonEvent.subscribe(subscriberOnState, onEnableCallback);
            console.info(`FMS_enableFormsUpdate_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicef.hmservice",
                        "ability": "com.form.formsystemtestservicef.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.debug(`FMS_enableFormsUpdate_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_enableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
        });
        /**
         * @tc.number: FMS_enableFormsUpdate_0700
         * @tc.name: formID id is error because formId is not exist
         * @tc.desc: 1.The form user calls the enable update interface.
         *           2.Verify the result of the enable update interface.
         */
        it(`FMS_enableFormsUpdate_0700`, 0, async (done) => {
            console.info(`FMS_enableFormsUpdate_0700 start`);
            let hostFormId;

            const onEnableCallback = (_, data) => {
                if (data.parameters.kind != "enable") {
                    return;
                }
                console.debug("====>FMS_enableFormsUpdate_0700 onEnableCallback data:====>" + JSON.stringify(data));

                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info("====>FMS_enableFormsUpdate_0700 unSubscribeOnEnableCallback====>");
                    done();
                });
            }

            const onDeleteCallback = async (_, data) => {
                console.debug("====>FMS_enableFormsUpdate_0700 onDeleteCallback data:====>" + JSON.stringify(data));
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
                            "stateForm": "enable",
                            "stateIds": [hostFormId],
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.debug(`FMS_enableFormsUpdate_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.debug(`FMS_enableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });

                commonEvent.unsubscribe(subscriberDel, () => {
                    console.info("====>FMS_enableFormsUpdate_0700 unSubscribeDelCallback====>");
                });
            }

            commonEvent.subscribe(subscriberDel, onDeleteCallback);
            commonEvent.subscribe(subscriberOnState, onEnableCallback);
            console.info(`FMS_enableFormsUpdate_0700 featureAbility.startAbility start`);
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
                console.debug(`FMS_enableFormsUpdate_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_enableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
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

const unsubscribeOnStateCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unsubscribeOnStateCallback====>`);
}

const unsubscribeOnAcquiredCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeOnAcquiredCallback====>`);
}