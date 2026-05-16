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
import { beforeAll, afterAll, beforeEach, afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import backgroundTaskManager from '@ohos.backgroundTaskManager';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';

interface onFormEvent {
    events: string[];
}

let onAcquiredForm_Event: onFormEvent = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};

let onDeletedFormEvent: onFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};

let onStateFormEvent: onFormEvent = {
    events: ["FMS_FormOnState_commonEvent"],
};

let onSupplyEvent: onFormEvent = {
    events: ["FMS_FormSupply_commonEvent"],
};

const unsubscribeCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

const EVENT_ID_FORM_ON_STATE = 1100;

let options:CommonEventManager.CommonEventPublishData = {
    code: 1,
    data: "initial data",
    isOrdered: true
}

let deleteForm_Event: string = "FMS_FormDelete_commonEvent";

let subscriberOnAcquired: CommonEventManager.CommonEventSubscriber;
let subscriberDel: CommonEventManager.CommonEventSubscriber;
let subscriberOnState: CommonEventManager.CommonEventSubscriber;
let subscriberSupply: CommonEventManager.CommonEventSubscriber;

export default function test() {
    describe(`FmsStateFormTest`, () => {
        let id: number | string | undefined = undefined;
        beforeAll(async (done: () => void) => {
            console.log("FMS_disableFormsUpdate beforeAll called");
            let myReason = 'test FaShowOnLockTest';
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
                console.log("FMS_disableFormsUpdate Request suspension delay will time out.");
            })
            id = delayInfo.requestId;
            console.log("FMS_disableFormsUpdate requestId is : " + id);
            setTimeout(() => {
                console.log("FMS_disableFormsUpdate beforeAll end");
                done();
            }, 1000);
        })

        afterAll(async (done: () => void) => {
            console.log("FMS_disableFormsUpdate afterAll called");
            setTimeout(() => {
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
            emitter.off(EVENT_ID_FORM_ON_STATE);
            await sleep(1000);
        })

        /**
         * @tc.name   FMS_disableFormsUpdate_0200
         * @tc.number FMS_disableFormsUpdate_0200
         * @tc.desc   1.The form user calls the disable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_disableFormsUpdate_0200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_0200 start`);
            let onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_disableFormsUpdate_0200 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_disableFormsUpdate_0200"));
                setTimeout(() => {
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
            }).then((res) => {
                console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                    console.info(`FMS_disableFormsUpdate_0200 onFormEnableCallBack publish start`)})
            }).catch((err: BusinessError)  => {
                console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbility again end`);
        });

        /**
         * @tc.name   FMS_disableFormsUpdate_0300
         * @tc.number FMS_disableFormsUpdate_0300
         * @tc.desc   1.The form user calls the disable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_disableFormsUpdate_0300`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_0300 start`);

            let onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_disableFormsUpdate_0300 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                expect(data.data).assertEqual('FMS_FormOnState_commonEvent');
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_disableFormsUpdate_0300"))

                setTimeout(() => {
                    console.info('FMS_disableFormsUpdate_0300 delPublishCallBack end');
                    console.log(`FMS_disableFormsUpdate_0300 end`);
                    done();
                }, 100)
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_disableFormsUpdate_0300 featureAbility.startAbility start`);
            await sleepTime(3000);
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
            }).then((res) => {
                console.log(`FMS_disableFormsUpdate_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnState_commonEvent';
                commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                    console.info(`FMS_disableFormsUpdate_0300 onFormEnableCallBack publish start`)})
            }).catch((err: BusinessError)  => {
                console.log(`FMS_disableFormsUpdate_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate _0300 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_disableFormsUpdate_0400
         * @tc.number FMS_disableFormsUpdate_0400
         * @tc.desc   1.The form user calls the disable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_disableFormsUpdate_0400`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_0400 start`);

            let onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_disableFormsUpdate_0400 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_disableFormsUpdate_0400"))
                console.log(`FMS_disableFormsUpdate_0400 end`);
                done();
            }
            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_disableFormsUpdate_0400 featureAbility.startAbility start`);
            await sleepTime(3000);
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
            }).then((res) => {
                console.log(`FMS_disableFormsUpdate_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnState_commonEvent';
                commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                    console.info(`FMS_disableFormsUpdate_0400 onFormEnableCallBack publish start`)})
            }).catch((err: BusinessError)  => {
                console.log(`FMS_disableFormsUpdate_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate _0400 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_disableFormsUpdate_0500
         * @tc.number FMS_disableFormsUpdate_0500
         * @tc.desc   1.The form user calls the disable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_disableFormsUpdate_0500`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_0500 start`);

            let onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_disableFormsUpdate_0500 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_disableFormsUpdate_0500"))
                console.log(`FMS_disableFormsUpdate_0500 end`);
                done();
            }
            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbility start`);
            await sleepTime(3000);
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
            }).then((res) => {
                console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnState_commonEvent';
                commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                    console.info(`FMS_disableFormsUpdate_0500 onFormEnableCallBack publish start`)})
            }).catch((err: BusinessError)  => {
                console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_disableFormsUpdate_0600
         * @tc.number FMS_disableFormsUpdate_0600
         * @tc.desc   1.The form user calls the disable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_disableFormsUpdate_0600`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_disableFormsUpdate_0600 start`);

            let hostFormId: string | undefined;
            const onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_disableFormsUpdate_0600 onDisableCallback data:====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                expect(data.data).assertEqual('FMS_FormOnState_commonEvent');
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnDisableCallback("FMS_disableFormsUpdate_0600"));
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_disableFormsUpdate_0600"));
                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info('FMS_disableFormsUpdate_0600 publish' + JSON.stringify(err));
                    done()
                });
            }

            const onAcquiredCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_disableFormsUpdate_0600 onAcquiredCallback data:====>" + JSON.stringify(data));
                hostFormId = data.data;

                await sleepTime(3000);
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
                }).then((res) => {
                    console.info(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormOnState_commonEvent';
                    commonEvent.publish("FMS_FormOnState_commonEvent", data, () => {
                        console.info(`FMS_disableFormsUpdate_0400 onFormEnableCallBack publish start`)})
                }).catch((err: BusinessError)  => {
                    console.info(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_disableFormsUpdate_0600"));
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.info(`FMS_disableFormsUpdate_0600 featureAbility.startAbility start`);
            await sleepTime(3000);
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
            }).then((res) => {
                console.info(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_disableFormsUpdate_0600 onFormEnableCallBack publish start`)})
            }).catch((err: BusinessError)  => {
                console.info(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
        });

        /**
         * @tc.name   FMS_disableFormsUpdate_0700
         * @tc.number FMS_disableFormsUpdate_0700
         * @tc.desc   1.The form user calls the disable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_disableFormsUpdate_0700`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_disableFormsUpdate_0700 start`);
            let hostFormId: string;

            const onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_disableFormsUpdate_0700 onDisableCallback data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info("====>FMS_disableFormsUpdate_0700 unSubscribeOnDisableCallback====>");
                    done()
                });
            }

            const onDeleteCallback = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_disableFormsUpdate_0700 onDeleteCallback data:====>" + JSON.stringify(data));
                hostFormId = data.parameters?.formId;

                await sleepTime(3000);
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
                }).then((res) => {
                    console.info(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormOnState_commonEvent';
                    commonEvent.publish("FMS_FormOnState_commonEvent", data, () => {
                        console.info(`FMS_disableFormsUpdate_0700 onStateCallBack publish start`)})
                }).catch((err: BusinessError)  => {
                    console.info(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                commonEvent.unsubscribe(subscriberDel, () => {
                    console.info("====>FMS_disableFormsUpdate_0700 unSubscribeDelCallback====>");
                });
            }

            commonEvent.subscribe(subscriberDel, onDeleteCallback);
            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.info(`FMS_disableFormsUpdate_0700 featureAbility.startAbility start`);
            await sleepTime(3000);
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
            }).then((res) => {
                console.info(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnDeleted_commonEvent';
                commonEvent.publish("FMS_FormOnDeleted_commonEvent", options, () => {
                    console.info(`FMS_disableFormsUpdate_0700 onFormEnableCallBack publish start`)})
            }).catch((err: BusinessError)  => {
                console.info(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
        });

        /**
         * @tc.name   FMS_disableFormsUpdate_0800
         * @tc.number FMS_disableFormsUpdate_0800
         * @tc.desc   1.The form user calls the disable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_disableFormsUpdate_0800`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_0800 start`);

            let onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_disableFormsUpdate_0800 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_disableFormsUpdate_0800"));
                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info('FMS_disableFormsUpdate_0800 publish' + JSON.stringify(err));
                    done()
                });
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbility start`);
            await sleepTime(3000);
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
            }).then((res) => {
                console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnState_commonEvent';
                commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                    console.info(`FMS_disableFormsUpdate_0800 onStateCallBack publish start`)})
            }).catch((err: BusinessError)  => {
                console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_disableFormsUpdate_0900
         * @tc.number FMS_disableFormsUpdate_0900
         * @tc.desc   1.The form user calls the disable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_disableFormsUpdate_0900`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_0900 start`);
            let formId: string = '';
            let OnDisableCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_disableFormsUpdate_0900 OnDisableCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberDel, () => unsubscribeOnDisableCallback("FMS_disableFormsUpdate_0900"));

                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info('FMS_disableFormsUpdate_0900 publish' + JSON.stringify(err));
                    done()
                });
            }

            let onStateCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_disableFormsUpdate_0900 OnEnableCallBack data:====>" + JSON.stringify(data));
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnEnableCallback("FMS_disableFormsUpdate_0900"));
                if(data.parameters){
                    formId = data.parameters.formId;
                }
                subscriberDel = await commonEvent.createSubscriber(onDeletedFormEvent);
                commonEvent.subscribe(subscriberDel, OnDisableCallBack);
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility start`);
                await sleepTime(3000);
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
                }).then((res) => {
                    console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormOnDeleted_commonEvent';
                    commonEvent.publish("FMS_FormOnDeleted_commonEvent", data, () => {
                        console.info(`FMS_disableFormsUpdate_0900 OnDisableCallBack publish start`)})
                }).catch((err: BusinessError)  => {
                    console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility end`);
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility start`);
            await sleepTime(3000);
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
            }).then((res) => {
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnState_commonEvent';
                commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                    console.info(`FMS_disableFormsUpdate_0900 onFormEnableCallBack publish start`)})
            }).catch((err: BusinessError)  => {
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_disableFormsUpdate_1000
         * @tc.number FMS_disableFormsUpdate_1000
         * @tc.desc   1.The form user calls the visible notification interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_disableFormsUpdate_1000`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_1000 start`);

            let formId: string = '';
            commonEvent.publish(`fms.time_speed`, { code: 100 }, () => {
                console.log(`FMS_disableFormsUpdate_1000 time speed up`);
            });

            let onSupplyEventCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_disableFormsUpdate_1000 onSupplyEventCallBack====>" + JSON.stringify(data));
                if ("onUpdate" == data.parameters?.kind) {
                    console.info("FMS_disableFormsUpdate_1000 error, onUpdate called.");
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1000"));
                    expect().assertFail();
                }
            }

            let onFormDisableCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_disableFormsUpdate_1000 onFormDisableCallBack 此处有done ====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberDel, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1000"));
                commonEvent.subscribe(subscriberSupply, onSupplyEventCallBack);

                setTimeout(() => {
                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.log(`FMS_disableFormsUpdate_1000 time reset`);
                    });
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1000"));
                }, 1000);

                setTimeout(() => {
                    console.log(`FMS_disableFormsUpdate_1000 onFormDisableCallBack end`);
                    commonEvent.publish(deleteForm_Event, data, () => {
                        console.info('FMS_disableFormsUpdate_1000 publish 这个要打印 ');
                        done()
                    });
                }, 2000);
            }

            let onStateCallBack = async(_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                expect(data.data).assertEqual("FMS_FormOnState_commonEvent");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1000"));
                console.info("====>FMS_disableFormsUpdate_1000 onStateCallBack====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                if (data.parameters) {
                    formId = data.parameters.formId;
                }

                subscriberDel = await commonEvent.createSubscriber(onDeletedFormEvent);
                commonEvent.subscribe(subscriberDel, onFormDisableCallBack);
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility notify disable start`);
                await sleepTime(3000);
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
                }).then((res) => {
                    console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormOnDeleted_commonEvent';
                    commonEvent.publish("FMS_FormOnDeleted_commonEvent", data, () => {
                        console.info(`FMS_disableFormsUpdate_1000 onFormDisableCallBack publish start`)})
                }).catch((err: BusinessError)  => {
                    console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility notify disable end`);
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility servicea start`);
            await sleepTime(3000);
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
            }).then((res) => {
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnState_commonEvent';
                commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                    console.info(`FMS_disableFormsUpdate_1000 onStateCallBack publish start`)})
            }).catch((err: BusinessError)  => {
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility servicea end`);
        });

        /**
         * @tc.name   FMS_disableFormsUpdate_1100
         * @tc.number FMS_disableFormsUpdate_1100
         * @tc.desc   1.The form user calls the visible notification interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_disableFormsUpdate_1100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_1100 start`);

            let formId: string = '';
            commonEvent.publish(`fms.time_speed`, { code: 100 }, () => {
                console.log(`FMS_disableFormsUpdate_1100 time speed up`);
            });

            let onSupplyEventCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_disableFormsUpdate_1100 onSupplyEventCallBack====>" + JSON.stringify(data));
                if ("onUpdate" == data.parameters?.kind) {
                    console.info("FMS_disableFormsUpdate_1100 error, onUpdate called.");
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1100"));
                    expect().assertFail();
                }
            }

            let secondOnStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_disableFormsUpdate_1100 secondOnStateCallBack====>" + JSON.stringify(data));
                expect(data.data).assertEqual("Second_FMS_FormOnState_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1100"));
                commonEvent.subscribe(subscriberSupply, onSupplyEventCallBack);

                setTimeout(() => {
                    console.log(`FMS_disableFormsUpdate_1100 onFormDisableCallBack end`);
                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.log(`FMS_disableFormsUpdate_1100 time reset`);
                    });
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1100"));

                    commonEvent.publish(deleteForm_Event, data, () => {
                        console.info('FMS_disableFormsUpdate_1100 publish deleteForm_Event');
                        done()
                    });

                }, 1000);
            }

            emitter.on({
                eventId: EVENT_ID_FORM_ON_STATE
            }, (data:emitter.EventData) => {
                console.info("====>FMS_disableFormsUpdate_1100 emitter CallBack====>" + JSON.stringify(data));
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1100"));
                commonEvent.subscribe(subscriberSupply, onSupplyEventCallBack);

                setTimeout(() => {
                    console.log(`FMS_disableFormsUpdate_1100 emitter onFormDisableCallBack end`);
                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.log(`FMS_disableFormsUpdate_1100 emitter time reset`);
                    });
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1100"));
                    options.code = 0;
                    options.data = 'Second_FMS_FormOnState_commonEvent';
                    commonEvent.publish(deleteForm_Event, options, () => {
                        console.info('FMS_disableFormsUpdate_1100 emitter publish deleteForm_Event');
                        done();
                    });

                }, 1000);
            });

            let onStateCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_disableFormsUpdate_1100 onAcquiredCallBack====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_disableFormsUpdate_1100"));
                if (data.parameters) {
                    formId = data.parameters.formId;
                }

                subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
                commonEvent.subscribe(subscriberOnState, secondOnStateCallBack);
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility notify disable start`);
                await sleepTime(3000);
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
                }).then((res) => {
                    console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost disable res: ${JSON.stringify(res)}`);
                    emitter.emit({eventId: EVENT_ID_FORM_ON_STATE},
                        {data:{code: res, data: 'Second_FMS_FormOnState_commonEvent'}});
                    data.code = res;
                    data.data = 'Second_FMS_FormOnState_commonEvent';
                    commonEvent.publish("FMS_FormOnState_commonEvent", data, () => {
                        console.info(`FMS_disableFormsUpdate_1000 onStateCallBack disable publish start`)});
                }).catch((err: BusinessError)  => {
                    console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost disable error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility notify disable end`);
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility servicea start`);
            await sleepTime(3000);
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
            }).then((res) => {
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost servicea res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnState_commonEvent';
                commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                    console.info(`FMS_disableFormsUpdate_1000 onStateCallBack publish servicea start`)})
            }).catch((err: BusinessError)  => {
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost servicea error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility servicea end`);
        });
    });
}

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

const delPublishCallback = async (tcNumber: string, done: () => void) => {
    console.info(`${tcNumber} delPublishCallBack start`);
    setTimeout(() => {
        console.info(`${tcNumber} delPublishCallBack end`);
        done();
    }, 1000);
}

const unsubscribeOnStateCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeOnStateCallback====>`);
}

const unsubscribeOnAcquiredCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeOnAcquiredCallback====>`);
}

const unsubscribeOnDisableCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeOnDisableCallback====>`);
}

const unsubscribeOnEnableCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeOnEnableCallback====>`);
}

const unsubscribeSupplyCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unSubscribeSupplyCallback====>`);
}

function sleepTime(time: number): Promise<void> {
    return new Promise((resolve, reject) => {
        try{
            setTimeout(resolve,time);
        } catch(e) {
            console.error(`sleepTime error: ${JSON.stringify(e)}`);
			reject();
        }
    });
}