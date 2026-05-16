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

import featureAbility from '@ohos.ability.featureAbility';
import commonEvent from '@ohos.commonEvent';
import systemTime from '@ohos.systemTime';
import { beforeAll, afterAll, beforeEach, afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import backgroundTaskManager from '@ohos.backgroundTaskManager';
import { BusinessError } from '@ohos.base';
import CommonEventManager from '@ohos.commonEventManager';

interface onFormEvent {
    events: string[];
}

const onAcquiredForm_Event: onFormEvent = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};
const onDeletedFormEvent: onFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};
const onReleasedFormEvent: onFormEvent = {
    events: ["FMS_FormOnReleased_commonEvent"],
};
const onSupplyEvent: onFormEvent = {
    events: ["FMS_FormSupply_commonEvent"],
};

const unsubscribeCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}


const deleteForm_Event = "FMS_FormDelete_commonEvent";

let subscriberOnAcquired: CommonEventManager.CommonEventSubscriber;
let subscriberOnReleased: CommonEventManager.CommonEventSubscriber;
let subscriberOnDeleted: CommonEventManager.CommonEventSubscriber;
let subscriberSupply: CommonEventManager.CommonEventSubscriber;
let isSupportChangeTime: boolean;

export default function test() {
    describe(`FmsDeleteFormTest`, () => {

        let id: number;
        beforeAll(async (done: () => void) => {
            console.log("FMS_deleteForm beforeAll called");
            let myReason = 'test FaShowOnLockTest';
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
                console.log("FMS_deleteForm Request suspension delay will time out.");
            })
            id = delayInfo.requestId;
            console.log("FMS_deleteForm requestId is : " + id);
            setTimeout(() => {
                console.log("FMS_deleteForm beforeAll end");
                done();
            }, 1000);
        })
        
        afterAll(async (done: () => void) => {
            console.log("FMS_deleteForm afterAll called");
            backgroundTaskManager.cancelSuspendDelay(id);
            setTimeout(() => {
                console.log("FMS_deleteForm afterAll end");
                done();
            }, 1000);
        })

        beforeEach(async () => {
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberOnReleased = await commonEvent.createSubscriber(onReleasedFormEvent);
            subscriberOnDeleted = await commonEvent.createSubscriber(onDeletedFormEvent);
            subscriberSupply = await commonEvent.createSubscriber(onSupplyEvent);
        });

        afterEach(async() => {
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeCallback("afterEach unsubscribe subscriberOnReleased"));
            commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeCallback("afterEach unsubscribe subscriberOnDeleted"));
            commonEvent.unsubscribe(subscriberSupply, () => unsubscribeCallback("afterEach unsubscribe subscriberSupply"));
        })

        /**
         * @tc.name   FMS_deleteForm_0100
         * @tc.number FMS_deleteForm_0100
         * @tc.desc   1.delete the form that formID is 1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_deleteForm_0100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            const tcNumber = `FMS_deleteForm_0100 555555`;
            let formId: string;

            const onAcquiredCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                if(data.data){
                    formId = data.data;
                }

                console.info(`${tcNumber} featureAbility.startAbility again start`);
                await sleepTime(3000);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostnoperm",
                        abilityName: "com.ohos.st.formsystemhostnoperm.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            deleteForm: true,
                            deleteId: formId,
                            isCreate: false
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormOnDeleted_commonEvent', (err) => {
                        console.info(`${tcNumber} publish` + JSON.stringify(err));
                    });
                    expect(res).assertEqual(0);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await sleepTime(3000);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnAcquired_commonEvent', (err) => {
                    console.info(`${tcNumber} publish` + JSON.stringify(err));
                });
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_deleteForm_0200
         * @tc.number FMS_deleteForm_0200
         * @tc.desc   1.delete the form
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_deleteForm_0200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            const tcNumber = `FMS_deleteForm_0200`;

            const onDeletedCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeOnDeletedCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, async (err) => {
                    console.info(`${tcNumber} publish + ${JSON.stringify(err)}`);
                    await sleep(3000)
                    done()
                });
            };
            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await sleepTime(3000);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        deleteForm: true,
                        deleteId: "-1",
                        isCreate: true
                    }
                }
            }).then((res) => {

                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnDeleted_commonEvent', (err) => {
                    console.info(`${tcNumber} publish` + JSON.stringify(err))})

            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_deleteForm_0300
         * @tc.number FMS_deleteForm_0300
         * @tc.desc   1.delete the form
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_deleteForm_0300`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            const tcNumber = `FMS_deleteForm_0300`;

            const onDeletedCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeOnDeletedCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, async (err) => {
                    console.info(`${tcNumber} publish + ${JSON.stringify(err)}`);
                    await sleep(3000)
                    done()
                });
            };
            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await sleepTime(3000);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        deleteForm: true,
                        deleteId: "0",
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnDeleted_commonEvent', (err) => {
                    console.info(`${tcNumber} publish` + JSON.stringify(err))})
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_deleteForm_0400
         * @tc.number FMS_deleteForm_0400
         * @tc.desc   1.host A create a formA
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_deleteForm_0400`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            const tcNumber = `FMS_deleteForm_0400`;
            let formId: number | string | undefined = undefined;

            const onDeletedCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeOnDeletedCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, async (err) => {
                    console.info(`${tcNumber} publish + ${JSON.stringify(err)}`);
                    await sleep(3000)
                    done()
                });
            };

            const onAcquiredCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                formId = data.data;

                console.info(`${tcNumber} featureAbility.startAbility again start`);
                await sleepTime(3000);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostd",
                        abilityName: "com.ohos.st.formsystemhostd.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            deleteForm: true,
                            deleteId: formId,
                            isCreate: false
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormOnDeleted_commonEvent', (err) => {
                        console.info(`${tcNumber} publish` + JSON.stringify(err));
                    });
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };

            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallback);
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await sleepTime(3000);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnAcquired_commonEvent', (err) => {
                    console.info(`${tcNumber} publish` + JSON.stringify(err));
                });
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_deleteForm_0500
         * @tc.number FMS_deleteForm_0500
         * @tc.desc   1.host A create a normal formA
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_deleteForm_0500`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            const tcNumber = `FMS_deleteForm_0500`;
            let formId: number | string | undefined = undefined;
            let supplyFlag = false;

            const deleteFormB = () => {
                console.info(`${tcNumber} deleteFormB start`);
                commonEvent.publish(deleteForm_Event, delPublishCallbackB);
                console.info(`${tcNumber} deleteFormB end`);
            }

            const delPublishCallbackB = async () => {
                console.info(`${tcNumber} delPublishCallbackB`);
                await sleep(2000);
                console.info(`${tcNumber} delPublishCallbackB end`);
                console.info(`${tcNumber} end`);
                done();
            }

            const delPublishCallback = async () => {
                console.info(`${tcNumber} delPublishCallback supplyFlag: ${supplyFlag}`);
                await sleep(1000);
                commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback(tcNumber));
                if (supplyFlag) {
                    deleteFormB();
                } else {
                    deleteFormB();
                    expect().assertFail();
                }
                console.info(`${tcNumber} delPublishCallback end`);
            }

            const onAcquiredCallbackB = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onAcquiredCallbackB data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, delPublishCallback);
            };

            const onAcquiredCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                formId = data.data;
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                await sleep(1000);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallbackB);

                console.info(`${tcNumber} featureAbility.startAbility again start`);
                await sleepTime(3000);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostd",
                        abilityName: "com.ohos.st.formsystemhostd.MainAbility",
                        parameters: {
                            formId: formId,
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            isCreate: true
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormSupply_commonEvent', (err) => {
                        console.info(`${tcNumber} onAcquiredCallbackB publish` + JSON.stringify(err));
                    });
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };

            const onSupplyCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}`);
                if (data.event == "FMS_FormSupply_commonEvent") {
                    console.info(`${tcNumber} onSupplyCallback ${JSON.stringify(data)}`);
                    supplyFlag = true;
                    commonEvent.publish('FMS_FormOnAcquired_commonEvent', data, (err) => {
                        console.info(`${tcNumber} onAcquiredCallbackB publish` + JSON.stringify(err));
                    });
                }
            };

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallback);
            commonEvent.subscribe(subscriberSupply, onSupplyCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await sleepTime(3000);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);

                commonEvent.publish('FMS_FormOnAcquired_commonEvent', (err) => {
                    console.info(`${tcNumber} publish` + JSON.stringify(err));
                });

            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_deleteForm_0600
         * @tc.number FMS_deleteForm_0600
         * @tc.desc   1.host A an host B create one normal card respectively
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_deleteForm_0600`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            const tcNumber = `FMS_deleteForm_0600`;
            let formId: number | string | undefined = undefined;
            let formIdB: number | string | undefined = undefined;
            let supplyFlag = false;

            const delPublishCallback = async () => {
                console.info(`${tcNumber} delPublishCallback supplyFlag:${supplyFlag}`);
                await sleep(1000);
                commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback(tcNumber));
                if (supplyFlag) {
                    deleteFormB();
                } else {
                    deleteFormB();
                }
                console.info(`${tcNumber} delPublishCallback end`);
            }

            const delPublishCallbackB = async () => {
                console.info(`${tcNumber} delPublishCallbackB`);
                await sleep(1000);
                console.info(`${tcNumber} delPublishCallbackB end`);
                console.info(`${tcNumber} end`);
                done();
            }

            const deleteFormB = () => {
                console.info(`${tcNumber} deleteFormB start`);
                commonEvent.publish(deleteForm_Event, delPublishCallbackB);
                console.info(`${tcNumber} deleteFormB end`);
            }

            const onAcquiredCallbackB = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onAcquiredCallbackB data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                formIdB = data.data;
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, delPublishCallback);
            };

            const onAcquiredCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                formId = data.data;
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                await sleep(1000);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallbackB);

                console.info(`${tcNumber} featureAbility.startAbility again start`);
                await sleepTime(3000);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostd",
                        abilityName: "com.ohos.st.formsystemhostd.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            isCreate: true
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormSupply_commonEvent', (err) => {
                        console.info(`${tcNumber} onAcquiredCallbackB publish` + JSON.stringify(err));
                    });
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };

            const onSupplyCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onSupplyCallback ${JSON.stringify(data)}`);
                if (data.event == "FMS_FormSupply_commonEvent") {
                    supplyFlag = true;
                    commonEvent.publish('FMS_FormOnAcquired_commonEvent', data, (err) => {
                        console.info(`${tcNumber} onAcquiredCallbackB publish` + JSON.stringify(err));
                    });
                }
            };
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallback);
            commonEvent.subscribe(subscriberSupply, onSupplyCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await sleepTime(3000);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnAcquired_commonEvent', (err) => {
                    console.info(`${tcNumber} onAcquiredCallback publish` + JSON.stringify(err));
                });
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_deleteForm_0700
         * @tc.number FMS_deleteForm_0700
         * @tc.desc   1.host A an host B create one normal card respectively
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_deleteForm_0700`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            const tcNumber = `FMS_deleteForm_0700`;
            let currentTime = new Date().getTime();
            let formId: string;
            let formIdB: string;
            let supplyFlag = false;
            let supplyFlagUpdate = false;

            // timer speed up
            commonEvent.publish(`fms.time_speed`, { code: 900 }, () => {
                console.info(`${tcNumber} time speed up`);
            });

            isSupportChangeTime = false;
            await changeTime(10, 29, 55);
            console.info(`${tcNumber} setTime  ${JSON.stringify(isSupportChangeTime)}`);

            if (isSupportChangeTime) {
                const delPublishCallback = async () => {
                    console.info(`${tcNumber} delPublishCallback`);
                    await sleep(5000);
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback(tcNumber));
                    if (supplyFlag && supplyFlagUpdate) {
                        deleteFormB();
                    } else {
                        deleteFormB();
                    }
                    console.info(`${tcNumber} delPublishCallback end`);
                }

                const delPublishCallbackB = async () => {
                    console.info(`${tcNumber} delPublishCallbackB`);
                    console.info(`${tcNumber} delPublishCallbackB end`);
                    console.info(`${tcNumber} end`);
                    await systemTime.setTime(currentTime).then((data)=>{
                        console.info(`${tcNumber} setTime  ${JSON.stringify(data)}`);
                        done();
                    }).catch((error: BusinessError)=>{
                        console.info(`${tcNumber} setTime  ${JSON.stringify(error)}`);
                        done();
                    })
                }

                const deleteFormB = async () => {
                    console.info(`${tcNumber} deleteFormB start`);
                    // timer speed reset
                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.info(`${tcNumber} time speed up`);
                    });
                    await sleep(1000);
                    const commonEventPublishData: CommonEventManager.CommonEventPublishData = {
                        bundleName: "com.ohos.st.formsystemhostc",
                        data: formIdB
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallbackB);
                    console.info(`${tcNumber} deleteFormB end`);
                }

                const onAcquiredCallbackB = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                    console.info(`${tcNumber} onAcquiredCallbackB data: ${JSON.stringify(data)}`);
                    expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                    if(data.data){
                        formIdB = data.data;
                    }
                    commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                    const commonEventPublishData: CommonEventManager.CommonEventPublishData = {
                        bundleName: "com.ohos.st.formsystemhostd",
                        data: formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallback);
                };

                const onAcquiredCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                    console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                    expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                    commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                    if(data.data){
                        formId = data.data;
                    }
                    subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                    await sleep(1000);
                    commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallbackB);

                    console.info(`${tcNumber} featureAbility.startAbility again start`);
                    await sleepTime(3000);
                    await featureAbility.startAbility({
                        want: {
                            bundleName: "com.ohos.st.formsystemhostc",
                            abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                            parameters: {
                                formId: "0",
                                name: "Form_Js001",
                                bundle: "com.acts.form.formsystemtestservicea.hmservice",
                                ability: "FormAbility",
                                moduleName: "entry",
                                temporary: false,
                                isCreate: true
                            }
                        }
                    }).then((res) => {
                        console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    }).catch((err: BusinessError) => {
                        console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                    console.info(`${tcNumber} featureAbility.startAbility again end`);
                };
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallback);

                const onSupplyCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                    let kind: string = ''
                    if (data.parameters?.kind) {
                        kind = data.parameters.kind;
                    }
                    if ("onDestroy" == kind) {
                        console.info(`${tcNumber} onSupplyCallback ${JSON.stringify(data)}`);
                        supplyFlag = true;
                    }
                    if ("onUpdate" == kind) {
                        if (data.parameters?.parameters == formId) {
                            expect().assertFail();
                        } else if (data.parameters?.parameters == formIdB) {
                            supplyFlagUpdate = true;
                        }
                    }
                };
                commonEvent.subscribe(subscriberSupply, onSupplyCallback);

                console.info(`${tcNumber} featureAbility.startAbility start`);
                await sleepTime(3000);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostd",
                        abilityName: "com.ohos.st.formsystemhostd.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js002",
                            bundle: "com.acts.form.formsystemtestserviceb.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            isCreate: true
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`${tcNumber} featureAbility.startAbility end`);
            } else {
                console.info(`${tcNumber} not support change time`);
                expect(true).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   FMS_deleteForm_0800
         * @tc.number FMS_deleteForm_0800
         * @tc.desc   1.host create one normal card
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_deleteForm_0800`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            const tcNumber = `FMS_deleteForm_0800`;
            let formId = '';

            const onSupplyCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onSupplyCallback ${JSON.stringify(data)}`);
                if (data.event == "FMS_FormSupply_commonEvent") {
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback(tcNumber));
                    await sleep(1000);
                    console.info(`${tcNumber}onDeletedCallback end`);
                    console.info(`${tcNumber} end`);
                    done();
                }
            };

            const onReleasedCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onReleasedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnReleased_commonEvent`);
                commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback(tcNumber));

                console.info(`${tcNumber} featureAbility.startAbility again start`);
                await sleepTime(3000);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            deleteForm: true,
                            deleteId: formId,
                            isCreate: false
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormSupply_commonEvent', data, (err) => {
                        console.info(`${tcNumber} onSupplyCallback publish` + JSON.stringify(err));
                    });
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            }
            
            commonEvent.subscribe(subscriberOnReleased, onReleasedCallback);
            commonEvent.subscribe(subscriberSupply, onSupplyCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await sleepTime(3000);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        "releaseForm": true,
                        "releaseId": "self",
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnReleased_commonEvent', (err) => {
                    console.info(`${tcNumber} onReleasedCallback publish` + JSON.stringify(err));
                });
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);

            await sleep(3000);
        });

        /**
         * @tc.name   FMS_deleteForm_0900
         * @tc.number FMS_deleteForm_0900
         * @tc.desc   1.host a and b create one temporary card respectively
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_deleteForm_0900`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            const tcNumber = `FMS_deleteForm_0900`;
            let formId: number | string | undefined = undefined;
            let formIdB: number | string | undefined = undefined;
            let supplyFlag = false;

            const delPublishCallback = async () => {
                console.info(`${tcNumber} delPublishCallback supplyFlag:${supplyFlag}`);
                await sleep(1000);
                commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback(tcNumber));
                if (supplyFlag) {
                    deleteFormB();
                } else {
                    deleteFormB();
                }
                console.info(`${tcNumber} delPublishCallback end`);
            }

            const delPublishCallbackB = async () => {
                console.info(`${tcNumber} delPublishCallbackB`);
                await sleep(1000);
                console.info(`${tcNumber} delPublishCallbackB end`);
                console.info(`${tcNumber} end`);
                done();
            }

            const deleteFormB = () => {
                console.info(`${tcNumber} deleteFormB start`);
                commonEvent.publish(deleteForm_Event, delPublishCallbackB);
                console.info(`${tcNumber} deleteFormB end`);
            }

            const onAcquiredCallbackB = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onAcquiredCallbackB data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, delPublishCallback);
            };

            const onAcquiredCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                formId = data.data;
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                await sleep(1000);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallbackB);

                console.info(`${tcNumber} featureAbility.startAbility again start`);
                await sleepTime(3000);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostd",
                        abilityName: "com.ohos.st.formsystemhostd.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: true,
                            isCreate: true
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormSupply_commonEvent', (err) => {
                        console.info(`${tcNumber} onSupplyCallback publish` + JSON.stringify(err));
                    });
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };
            

            const onSupplyCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onSupplyCallback ${JSON.stringify(data)}`);
                if (data.event == "FMS_FormSupply_commonEvent") {
                    supplyFlag = true;
                    commonEvent.publish('FMS_FormOnAcquired_commonEvent', data, (err) => {
                        console.info(`${tcNumber} onAcquiredCallbackB publish` + JSON.stringify(err));
                    });
                }
            };

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallback);
            commonEvent.subscribe(subscriberSupply, onSupplyCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await sleepTime(3000);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: true,
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnAcquired_commonEvent', (err) => {
                    console.info(`${tcNumber} onAcquiredCallback publish` + JSON.stringify(err));
                });
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_deleteForm_1000
         * @tc.number FMS_deleteForm_1000
         * @tc.desc   1.host create one normal card
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_deleteForm_1000`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            const tcNumber = `FMS_deleteForm_1000`;
            let formId: number | string | undefined = undefined;

            const onDeletedCallback2 = (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onDeletedCallback2 data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                expect(data.data != "0").assertEqual(true);
                console.info(`${tcNumber} failed to delete form again.`);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeOnDeletedCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info(`${tcNumber} publish + ${JSON.stringify(err)}`);
                    done()
                });
            }

            const onDeletedCallback = async (_: BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                // expect(data.data).assertEqual(`0`);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeOnDeletedCallback(tcNumber));
                formId = data.parameters?.formId;
                subscriberOnDeleted = await commonEvent.createSubscriber(onDeletedFormEvent);
                await sleep(1000);
                commonEvent.subscribe(subscriberOnDeleted, onDeletedCallback2);

                console.info(`${tcNumber} featureAbility.startAbility again start`);
                await sleepTime(3000);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            deleteForm: true,
                            deleteId: formId,
                            isCreate: false
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormOnDeleted_commonEvent', data, (err) => {
                        console.info(`${tcNumber} onDeletedCallback2 publish` + JSON.stringify(err));
                    });
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };

            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await sleepTime(3000);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        deleteForm: true,
                        deleteId: "self",
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnDeleted_commonEvent', (err) => {
                    console.info(`${tcNumber} onDeletedCallback publish` + JSON.stringify(err));
                });
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });
    });
}

/**
 * Set time
 *
 * @param hour hour of 24H clock
 * @param min minute
 * @param second second
 */
const changeTime = async (hour: number, min: number, second: number) => {
    console.info(`FMS_deleteForm changeTime start`);
    const datetime = new Date();
    const year = datetime.getFullYear();
    const month = datetime.getMonth() + 1;
    const day = datetime.getDate();
    const formatTime = year + '-' + fill(month) + '-' + fill(day)
        + 'T' + fill(hour) + ':' + fill(min) + ':' + fill(second);
    const s = (new Date(formatTime)).getTime();
    console.info(`FMS_deleteForm changeTime formatTime: ${formatTime}`);
    console.info(`FMS_deleteForm changeTime s: ${s}`);

    try {
        await systemTime.setTime(s);
        console.info(`FMS_deleteForm set time success: ${formatTime}`);
        isSupportChangeTime = true;
    } catch (error) {
        console.info(`FMS_deleteForm set time failure: ${error}`);
        isSupportChangeTime = false;
    }
    console.info(`FMS_deleteForm changeTime end`);
};

const fill = (value: number) => {
    return (value > 9 ? "" : "0") + value;
};

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

const unsubscribeOnAcquiredCallback = (tcNumber: string) => {
    console.info(`${tcNumber} Unsubscribe OnAcquired Callback`);
};

const unsubscribeOnDeletedCallback = (tcNumber: string) => {
    console.info(`${tcNumber} Unsubscribe OnDeleted Callback`);
};

const unsubscribeSupplyCallback = (tcNumber: string) => {
    console.info(`${tcNumber} Unsubscribe Supply Callback`);
};

const unsubscribeOnReleasedCallback = (tcNumber: string) => {
    console.info(`${tcNumber} Unsubscribe OnReleased Callback`);
};

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