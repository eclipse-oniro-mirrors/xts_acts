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

interface onFormEvent {
    events: string[];
}

interface commonEventPublishDataType {
    data: string | number;
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

let deleteForm_Event: onFormEvent = {
    events: ["FMS_FormDelete_commonEvent"],
};

const unsubscribeCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

let options:CommonEventManager.CommonEventPublishData = {
    code: 1,
    data: "initial data",
    isOrdered: true
}

let subscriberOnAcquired: CommonEventManager.CommonEventSubscriber;
let subscriberDel: CommonEventManager.CommonEventSubscriber;
let subscriberOnState: CommonEventManager.CommonEventSubscriber;
let subscriberSupply: CommonEventManager.CommonEventSubscriber;

let subscriberDeleteFormEvent: CommonEventManager.CommonEventSubscriber;

let deleteFormEventCallback = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
    console.info("!!!====>FMS_enableFormsUpdate_0600 onStateCallBack data:====>" + JSON.stringify(data));
    commonEvent.unsubscribe(subscriberDeleteFormEvent, () => {
        console.info('FMS_enableFormsUpdate_0600 unsubscribe callback');
    })
}

export default function test() {
    describe(`FmsStateFormTest`, () => {
        let id: number | string | undefined = undefined;

        beforeAll(async (done: () => void) => {
            console.log("FMS_enableFormsUpdate beforeAll called");
            let myReason: string = 'test FaShowOnLockTest';
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
                console.log("FMS_enableFormsUpdate Request suspension delay will time out.");
            })
            id = delayInfo.requestId;
            console.log("FMS_enableFormsUpdate requestId is : " + id);
            setTimeout(() => {
                console.log("FMS_enableFormsUpdate beforeAll end");
                done();
            }, 1000);
        })

        afterAll(async (done: () => void) => {
            console.log(`FMS_enableFormsUpdate afterAll called id: ${id}`);
            setTimeout(() => {
                console.log("FMS_enableFormsUpdate afterAll end");
                done();
            }, 1000);
        })

        beforeEach(async () => {
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberDel = await commonEvent.createSubscriber(onDeletedFormEvent);
            subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
            subscriberSupply = await commonEvent.createSubscriber(onSupplyEvent);
            subscriberDeleteFormEvent = await commonEvent.createSubscriber(deleteForm_Event);
            commonEvent.subscribe(subscriberDeleteFormEvent, deleteFormEventCallback);
            await sleep(1000);
        })

        afterEach(async() => {
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberDel, () => unsubscribeCallback("afterEach unsubscribe subscriberDel"));
            commonEvent.unsubscribe(subscriberOnState, () => unsubscribeCallback("afterEach unsubscribe subscriberOnState"));
            commonEvent.unsubscribe(subscriberSupply, () => unsubscribeCallback("afterEach unsubscribe subscriberSupply"));
            commonEvent.unsubscribe(subscriberDeleteFormEvent, () => unsubscribeCallback("afterEach unsubscribe subscriberDeleteFormEvent"));
            await sleep(1000);
        })

        /**
         * @tc.name   FMS_enableFormsUpdate_0200
         * @tc.number FMS_enableFormsUpdate_0200
         * @tc.desc   1.The form user calls the enable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_enableFormsUpdate_0200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_enableFormsUpdate_0200 start`);

            let onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_enableFormsUpdate_0200 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "enable",
                        "stateIds" : ["1"],
                        "isCreate" : false
                    }
                }
            }).then((res) => {
                console.log(`FMS_enableFormsUpdate_0200 featureAbility.startAbilityhost again res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                    console.log(`onStateCallBack publish start`)
                });
            }).catch((err: BusinessError) => {
                console.log(`FMS_enableFormsUpdate_0200 featureAbility.startAbilityhost again error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_0200 featureAbility.startAbility again end`);
        });

        /**
         * @tc.name   FMS_enableFormsUpdate_0300
         * @tc.number FMS_enableFormsUpdate_0300
         * @tc.desc   1.The form user calls the enable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_enableFormsUpdate_0300`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_enableFormsUpdate_0300 start`);

            let onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_enableFormsUpdate_0300 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info('FMS_enableFormsUpdate_0300 unsubscribe callback');
                    done();
                })
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_enableFormsUpdate_0300 featureAbility.startAbility start`);
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
                        "stateIds" : [],
                        "isCreate" : false
                    }
                }
            }).then((res) => {
                console.log(`FMS_enableFormsUpdate_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                    console.log(`onStateCallBack publish start`)
                });
            }).catch((err: BusinessError) => {
                console.log(`FMS_enableFormsUpdate_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_0300 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_enableFormsUpdate_0400
         * @tc.number FMS_enableFormsUpdate_0400
         * @tc.desc   1.The form user calls the enable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_enableFormsUpdate_0400`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_enableFormsUpdate_0400 start`);

            let onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_enableFormsUpdate_0400 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info('FMS_enableFormsUpdate_0400 unsubscribe callback');
                    done();
                })
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_enableFormsUpdate_0400 featureAbility.startAbility start`);
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
                        "stateIds" : ["-1"],
                        "isCreate" : false
                    }
                }
            }).then((res) => {
                console.log(`FMS_enableFormsUpdate_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                    console.log(`onStateCallBack publish start`)
                });
            }).catch((err: BusinessError) => {
                console.log(`FMS_enableFormsUpdate_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_0400 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_enableFormsUpdate_0500
         * @tc.number FMS_enableFormsUpdate_0500
         * @tc.desc   1.The form user calls the enable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_enableFormsUpdate_0500`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_enableFormsUpdate_0500 start`);

            let onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_enableFormsUpdate_0500 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info('FMS_enableFormsUpdate_0500 unsubscribe callback');
                    done();
                })
            }

            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.log(`FMS_enableFormsUpdate_0500 featureAbility.startAbility start`);
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
                        "stateIds" : ["0"],
                        "isCreate" : false
                    }
                }
            }).then((res) => {
                console.log(`FMS_enableFormsUpdate_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                    console.log(`onStateCallBack publish start`)
                });
            }).catch((err: BusinessError) => {
                console.log(`FMS_enableFormsUpdate_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_0500 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_enableFormsUpdate_0600
         * @tc.number FMS_enableFormsUpdate_0600
         * @tc.desc   1.The form user calls the enable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_enableFormsUpdate_0600`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_enableFormsUpdate_0600 start`);

            let hostFormId: string | number = '';
            const onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_enableFormsUpdate_0600 onEnableCallback data:====>" + JSON.stringify(data));

                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeOnStateCallback("FMS_enableFormsUpdate_0600"));
                const commonEventPublishData: commonEventPublishDataType = {
                    data: hostFormId
                };
                commonEvent.publish('FMS_FormDelete_commonEvent', data, () => {
                    console.info('FMS_enableFormsUpdate_0600  FMS_FormDelete_commonEvent publish');
                    done()
                });
            }

            const onAcquiredCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_enableFormsUpdate_0600 onAcquiredCallback data:====>" + JSON.stringify(data));
                if(data.data) {
                    hostFormId = data.data;
                    console.info(`FMS_enableFormsUpdate_0600 hostFormId: ${hostFormId}`);
                }

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
                            "stateForm": "enable",
                            "stateIds": [hostFormId],
                            "isCreate": false
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_enableFormsUpdate_0600 onAcquiredCallBack featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                        console.log(`FMS_enableFormsUpdate_0600 onAcquiredCallBack onStateCallBack publish start`)
                    });
                }).catch((err: BusinessError) => {
                    console.error(`FMS_enableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_enableFormsUpdate_0600"));
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            commonEvent.subscribe(subscriberOnState, onStateCallBack);
            console.info(`FMS_enableFormsUpdate_0600 featureAbility.startAbility start`);
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
                console.info(`FMS_enableFormsUpdate_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_enableFormsUpdate_0600 onAcquiredCallBack publish start`)
                });
            }).catch((err: BusinessError) => {
                console.error(`FMS_enableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
        });

        /**
         * @tc.name   FMS_enableFormsUpdate_0700
         * @tc.number FMS_enableFormsUpdate_0700
         * @tc.desc   1.The form user calls the enable update interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_enableFormsUpdate_0700`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_enableFormsUpdate_0700 start`);

            let hostFormId: string | undefined;
            const onStateCallback = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_enableFormsUpdate_0700 onStateCallback data:====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => {
                    console.info("====>FMS_enableFormsUpdate_0700 unSubscribeOnEnableCallback====>");
                    done();
                });
            }

            const onDeleteCallback = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_enableFormsUpdate_0700 onDeleteCallback data:====>" + JSON.stringify(data));
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
                            "stateForm": "enable",
                            "stateIds": [hostFormId],
                            "isCreate": false
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_enableFormsUpdate_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    data.code = res;
                    console.info(`FMS_enableFormsUpdate_0700 featureAbility.startAbilityhost options是: ${JSON.stringify(options)}`);
                    commonEvent.publish("FMS_FormOnState_commonEvent", options, () => {
                        console.info(`FMS_enableFormsUpdate_0700 onStateCallback publish start`)})
                }).catch((err: BusinessError) => {
                    console.error(`FMS_enableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                commonEvent.unsubscribe(subscriberDel, () => {
                    console.info("====>FMS_enableFormsUpdate_0700 unSubscribeDelCallback====>");
                });
            }

            commonEvent.subscribe(subscriberDel, onDeleteCallback);
            commonEvent.subscribe(subscriberOnState, onStateCallback);
            console.info(`FMS_enableFormsUpdate_0700 featureAbility.startAbility start`);
            try {
                await sleepTime(3000);
                let res =  await featureAbility.startAbility({
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
                })

                options.code = res;
                commonEvent.publish("FMS_FormOnDeleted_commonEvent", options, () => {
                    console.info(`FMS_enableFormsUpdate_0700 onDeleteCallback publish start`)})
            } catch (error) {
                console.error(`FMS_enableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(error)}`);
            }
        });

        /**
         * @tc.name   FMS_enableFormsUpdate_0900
         * @tc.number FMS_enableFormsUpdate_0900
         * @tc.desc   1.The form user calls the visible notification interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_enableFormsUpdate_0900`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_enableFormsUpdate_0900 start`);

            let formIds: string[] = [];
            commonEvent.publish(`fms.time_speed`, { code: 300 }, () => {
                console.log(`FMS_enableFormsUpdate_0900 time speed up`);
            });

            let onSupplyCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_enableFormsUpdate_0900 onUpdateCallBack ====>" + JSON.stringify(data));
                if (data.data == 'FMS_FormSupply_commonEvent') {
                    expect(data.code).assertEqual(0);
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_enableFormsUpdate_0900"));
                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.log(`FMS_enableFormsUpdate_0900 time reset`);
                    });

                    setTimeout(() => {
                        commonEvent.publish('FMS_FormDelete_commonEvent', data, (err) => {
                            console.info('FMS_enableFormsUpdate_0900 publish' + JSON.stringify(err));
                            done()
                        });
                    }, 2000);
                }
            }

            let onFormDisableCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_enableFormsUpdate_0900 onFormDisableCallBack  ====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                expect(data.data).assertEqual('FMS_FormOnDeleted_commonEvent');
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_enableFormsUpdate_0900"));
                data.data = 'FMS_FormSupply_commonEvent';
                commonEvent.publish("FMS_FormSupply_commonEvent", data, () => {
                    console.info(`FMS_enableFormsUpdate_0900 onUpdateCallBack publish start`)})
            }

            let onFormOnStateCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_enableFormsUpdate_0900 onFormOnStateCallBack====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);

                subscriberDel = await commonEvent.createSubscriber(onDeletedFormEvent);
                commonEvent.subscribe(subscriberDel, onFormDisableCallBack);
                commonEvent.subscribe(subscriberSupply, onSupplyCallBack);

                setTimeout(async () => {
                    console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbility notifyVisible start`);
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
                                "stateForm" : "enable",
                                "stateIds" : formIds,
                                "isCreate" : false
                            }
                        }
                    }).then((res) => {
                        console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbilityhost notifyVisible res: ${JSON.stringify(res)}`);
                        data.code = res;
                        data.data = 'FMS_FormOnDeleted_commonEvent';
                        commonEvent.publish("FMS_FormOnDeleted_commonEvent", data, () => {
                            console.info(`FMS_enableFormsUpdate_0900 onFormDisableCallBack publish start`)})
                    }).catch((err: BusinessError) => {
                        console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbilityhost notifyVisible error: ${JSON.stringify(err)}`);
                    });
                    console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbility notifyVisible end`);
                }, 1000);
            }

            let onAcquiredCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeSupplyCallback("FMS_enableFormsUpdate_0900"));
                console.info("====>FMS_enableFormsUpdate_0900 onAcquiredCallBack====>" + JSON.stringify(data));
                if(data.data) {
                    formIds.push(data.data);
                }
                commonEvent.subscribe(subscriberOnState, onFormOnStateCallBack);
                console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbility notify disable start`);
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
                            "stateIds" : formIds,
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbilityhost disable res: ${JSON.stringify(res)}`);
                    data.code = res;
                    commonEvent.publish("FMS_FormOnState_commonEvent", data, () => {
                        console.info(`FMS_enableFormsUpdate_0900 onFormOnStateCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbilityhost disable error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbility notify disable end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbility servicea start`);
            await sleepTime(3000);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestservicee.hmservice",
                        "ability" : "com.acts.form.formsystemtestservicee.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbilityhost servicea res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_enableFormsUpdate_0900 onAcquiredCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbilityhost servicea error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbility servicea end`);
            await sleep(1000);
        });

        /**
         * @tc.name   FMS_enableFormsUpdate_1000
         * @tc.number FMS_enableFormsUpdate_1000
         * @tc.desc   1.The form user calls the visible notification interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_enableFormsUpdate_1000`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_enableFormsUpdate_1000 start`);

            let formIds: string[] = [];
            commonEvent.publish(`fms.time_speed`, { code: 300 }, () => {
                console.log(`FMS_enableFormsUpdate_1000 time speed up`);
            });

            let onSupplyCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                if (data.data == "FMS_FormSupply_commonEvent") {
                    console.info("====>FMS_enableFormsUpdate_1000 onSupplyCallBack====>" + JSON.stringify(data));
                    expect(data.code).assertEqual(0);

                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_enableFormsUpdate_1000"));

                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.log(`FMS_enableFormsUpdate_1000 time reset`);
                    });

                    setTimeout(() => {
                        commonEvent.publish('FMS_FormDelete_commonEvent', data, (err) => {
                            console.info('FMS_enableFormsUpdate_1000 publish' + JSON.stringify(err));
                            done()
                        });
                    }, 2000);
                }
            }

            let onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_enableFormsUpdate_1000 onFormEnableCallBack====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                expect(data.data).assertEqual("FMS_FormOnState_commonEvent");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_enableFormsUpdate_1000"));
                data.data = 'FMS_FormSupply_commonEvent'
                commonEvent.publish("FMS_FormSupply_commonEvent", data, () => {
                    console.info(`FMS_enableFormsUpdate_1000 onSupplyCallBack publish start`)})
            }

            let onFormDisableCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_enableFormsUpdate_1000 onFormDisableCallBack====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                expect(data.data).assertEqual("FMS_FormOnDeleted_commonEvent");
                commonEvent.unsubscribe(subscriberDel, () => unsubscribeSupplyCallback("FMS_enableFormsUpdate_1000"));

                subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
                commonEvent.subscribe(subscriberOnState, onStateCallBack);
                commonEvent.subscribe(subscriberSupply, onSupplyCallBack);

                console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbility notifyVisible start`);
                formIds.push("0");
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
                            "stateForm" : "enable",
                            "stateIds" : formIds,
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbilityhost visible res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormOnState_commonEvent';
                    commonEvent.publish("FMS_FormOnState_commonEvent", data, () => {
                        console.info(`FMS_enableFormsUpdate_1000 onStateCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbilityhost visible error: ${JSON.stringify(err)}`);

                });
                console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbility notifyVisible end`);
            }

            let onAcquiredCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeSupplyCallback("FMS_enableFormsUpdate_1000"));
                console.info("====>FMS_enableFormsUpdate_1000 onAcquiredCallBack====>" + JSON.stringify(data));
                commonEvent.subscribe(subscriberDel, onFormDisableCallBack);
                console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbility notify disable start`);
                featureAbility.startAbility({
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
                            "stateIds" : formIds,
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbilityhost disable res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormOnDeleted_commonEvent';
                    commonEvent.publish("FMS_FormOnDeleted_commonEvent", data, () => {
                        console.info(`FMS_enableFormsUpdate_1000 onFormDisableCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbilityhost disable error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbility notify disable end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbility servicea start`);
            await sleepTime(3000);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestservicee.hmservice",
                        "ability" : "com.acts.form.formsystemtestservicee.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbilityhost servicea res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_enableFormsUpdate_1000 onAcquiredCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbilityhost servicea error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbility servicea end`);
            await sleep(1000);
        });

        /**
         * @tc.name   FMS_enableFormsUpdate_1200
         * @tc.number FMS_enableFormsUpdate_1200
         * @tc.desc   1.The form user calls the visible notification interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_enableFormsUpdate_1200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log(`FMS_enableFormsUpdate_1200 start`);

            let formIds: string[] = new Array();
            commonEvent.publish(`fms.time_speed`, { code: 300 }, () => {
                console.log(`FMS_enableFormsUpdate_1200 time speed up`);
            });

            let delPublishCallBack1 = () => {
                console.info("!!!====>FMS_enableFormsUpdate_1200 delPublishCallBack1====>" );
                setTimeout(() => {
                    console.info('FMS_enableFormsUpdate_1200 delPublishCallBack1 end');
                    console.log(`FMS_enableFormsUpdate_1200 end`);
                }, 1000);
            }

            let delPublishCallBack2 = () => {
                console.info("!!!====>FMS_enableFormsUpdate_1200 delPublishCallBack2====>");
                setTimeout(() => {
                    console.info('FMS_enableFormsUpdate_1200 delPublishCallBack2 end');
                    console.log(`FMS_enableFormsUpdate_1200 end`);
                    done()
                }, 1000);
            }

            let onStateCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_enableFormsUpdate_1200 onFormEnableCallBack====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_enableFormsUpdate_1200"));
            }

            let onSupplyCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_enableFormsUpdate_1200 onSupplyCallBack last ====>" + JSON.stringify(data));
                if (data.data == 'FMS_FormSupply_commonEvent') {
                    expect(data.code).assertEqual(0);
                    console.log("====>FMS_enableFormsUpdate_1200 OK====>");
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_enableFormsUpdate_1200"));

                    commonEvent.publish("FMS_FormOnState_commonEvent", data, () => {
                        console.log(`FMS_enableFormsUpdate_1200 onStateCallBack publish start`)
                    });
                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.log(`FMS_enableFormsUpdate_1200 time reset`);
                    });
                    setTimeout(() => {
                        commonEvent.publish('FMS_FormDelete_commonEvent', data, delPublishCallBack1);
                        commonEvent.publish('FMS_FormDelete_commonEvent', data, delPublishCallBack2);
                    }, 2000);
                }
            }

            let onFormDisableCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_enableFormsUpdate_1200 onFormDisableCallBack====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnDeleted_commonEvent");
                commonEvent.unsubscribe(subscriberOnState, () => unsubscribeSupplyCallback("FMS_enableFormsUpdate_1200"));

                subscriberOnState = await commonEvent.createSubscriber(onStateFormEvent);
                commonEvent.subscribe(subscriberOnState, onStateCallBack);
                commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
                setTimeout(async () => {
                    console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility notifyVisible start`);
                    formIds.push("0");
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
                                "stateForm" : "enable",
                                "stateIds" : formIds,
                                "isCreate" : false
                            }
                        }
                    }).then((res) => {
                        console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost notifyVisible res: ${JSON.stringify(res)}`);
                        data.code = res;
                        data.data = 'FMS_FormSupply_commonEvent';
                        commonEvent.publish("FMS_FormSupply_commonEvent", data, () => {
                            console.info(`FMS_enableFormsUpdate_1200 onSupplyCallBack publish start`)})
                    }).catch((err: BusinessError) => {
                        console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost notifyVisible error: ${JSON.stringify(err)}`);
                    });
                    console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility notifyVisible end`);
                }, 1000);
            }

            let onSecondAcquiredCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                expect(data.data).assertEqual("Second_FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeSupplyCallback("FMS_enableFormsUpdate_1200"));
                console.info("====>FMS_enableFormsUpdate_1200 onSecondAcquiredCallBack====>" + JSON.stringify(data));
                console.info("====>FMS_enableFormsUpdate_1200 formIds====>" + formIds);
                commonEvent.subscribe(subscriberDel, onFormDisableCallBack);

                console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility notify disable start`);
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
                            "stateIds" : formIds,
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost disable res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormOnDeleted_commonEvent';
                    commonEvent.publish("FMS_FormOnDeleted_commonEvent", data, () => {
                        console.info(`FMS_enableFormsUpdate_1200 onFormDisableCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost disable error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility notify disable end`);
            }

            let onFirstAcquiredCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeSupplyCallback("FMS_enableFormsUpdate_1200"));
                console.info("====>FMS_enableFormsUpdate_1200 onFirstAcquiredCallBack====>" + JSON.stringify(data));
                if(data.data){
                   formIds.push(data.data);
                }

                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onSecondAcquiredCallBack);

                console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility serviceb start`);
                await sleepTime(3000);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestserviceh.hmservice",
                            "ability" : "com.acts.form.formsystemtestserviceh.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost serviceb res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'Second_FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", data, () => {
                        console.info(`FMS_enableFormsUpdate_1200 onSecondAcquiredCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost serviceb error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility serviceb end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onFirstAcquiredCallBack);
            console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility servicea start`);
            await sleepTime(3000);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestservicee.hmservice",
                        "ability" : "com.acts.form.formsystemtestservicee.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost servicea res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_enableFormsUpdate_1200 onFirstAcquiredCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost servicea error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility servicea end`);
            await sleep(1000);
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