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

const onAcquiredForm_Event = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};
const onDeletedFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};
const onReleasedFormEvent = {
    events: ["FMS_FormOnReleased_commonEvent"],
};
const onSupplyEvent = {
    events: ["FMS_FormSupply_commonEvent"],
};

const unsubscribeCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

const deleteForm_Event = "FMS_FormDelete_commonEvent";

let subscriberOnAcquired;
let subscriberOnReleased;
let subscriberOnDeleted;
let subscriberSupply;
let isSupportChangeTime;

export default function test() {
    describe(`FmsDeleteFormTest`, () => {

        let id = undefined;
        beforeAll(async (done) => {
            console.log("FMS_deleteForm beforeAll called");
            let myReason = 'test FaShowOnLockTest';
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
                console.log("FMS_deleteForm Request suspension delay will time out.");
            })
            id = delayInfo.requestId;
            console.log("FMS_deleteForm requestId is : " + id);
            setTimeout(function () {
                console.log("FMS_deleteForm beforeAll end");
                done();
            }, 1000);
        })
        
        afterAll(async (done) => {
            console.log("FMS_deleteForm afterAll called");
            backgroundTaskManager.cancelSuspendDelay(id);
            setTimeout(function () {
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
         * @tc.number: FMS_deleteForm_0200
         * @tc.name: host does not have permission
         * @tc.desc: 1.delete the form that formID is 1
         *           2.Verify the result is false
         */
        it(`FMS_deleteForm_0200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            const tcNumber = `FMS_deleteForm_0200`;
            let formId;

            const onDeletedCallback = async (_, data) => {
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeOnDeletedCallback(tcNumber));
                const commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, async (err) => {
                    console.info('FMS_deleteForm_0200 publish' + JSON.stringify(err));
                    await sleep(3000)
                    done()
                });
            };

            const onAcquiredCallback = async (_, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                formId = data.data;

                console.info(`${tcNumber} featureAbility.startAbility again start`);
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
                }).then((res: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormOnDeleted_commonEvent', (err) => {
                        console.info(`${tcNumber} publish` + JSON.stringify(err));
                    });
                }).catch((err: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };

            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallback);
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
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
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnAcquired_commonEvent', (err) => {
                    console.info(`${tcNumber} publish` + JSON.stringify(err));
                });
            }).catch((err: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_deleteForm_0300
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.delete the form
         *           2.Verify the result is false
         */
        it(`FMS_deleteForm_0300`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            const tcNumber = `FMS_deleteForm_0300`;

            const onDeletedCallback = async (_, data) => {
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeOnDeletedCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, async (err) => {
                    console.info('FMS_deleteForm_0300 publish' + JSON.stringify(err));
                    await sleep(3000)
                    done()
                });
            };
            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
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
            }).then((res: any) => {

                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnDeleted_commonEvent', (err) => {
                    console.info(`${tcNumber} publish` + JSON.stringify(err))})

            }).catch((err: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_deleteForm_0400
         * @tc.name: formID id is error(formID = 0)
         * @tc.desc: 1.delete the form
         *           2.Verify the result is false
         */
        it(`FMS_deleteForm_0400`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            const tcNumber = `FMS_deleteForm_0400`;

            const onDeletedCallback = async (_, data) => {
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeOnDeletedCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, async (err) => {
                    console.info('FMS_deleteForm_0400 publish' + JSON.stringify(err));
                    await sleep(3000)
                    done()
                });
            };
            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
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
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnDeleted_commonEvent', (err) => {
                    console.info(`${tcNumber} publish` + JSON.stringify(err))})
            }).catch((err: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_deleteForm_0500
         * @tc.name: formID id is error because formId is not self
         * @tc.desc: 1.host A create a formA
         *           2.host B delete the formA
         *           2.Verify the result is false
         */
        it(`FMS_deleteForm_0500`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            const tcNumber = `FMS_deleteForm_0500`;
            let formId;

            const onDeletedCallback = async (_, data) => {
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeOnDeletedCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, async (err) => {
                    console.info('FMS_deleteForm_0500 publish' + JSON.stringify(err));
                    await sleep(3000)
                    done()
                });
            };

            const onAcquiredCallback = async (_, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                formId = data.data;

                console.info(`${tcNumber} featureAbility.startAbility again start`);
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
                }).then((res: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormOnDeleted_commonEvent', (err) => {
                        console.info(`${tcNumber} publish` + JSON.stringify(err));
                    });
                }).catch((err: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };

            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallback);
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
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
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnAcquired_commonEvent', (err) => {
                    console.info(`${tcNumber} publish` + JSON.stringify(err));
                });
            }).catch((err: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_deleteForm_0600
         * @tc.name: Delete a normal form and the form reference is not 0 after deletion
         * @tc.desc: 1.host A create a normal formA
         *           2.host B create a form with formA's ID
         *           3.delete formA, and verify the result is true
         */
        it(`FMS_deleteForm_0600`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            const tcNumber = `FMS_deleteForm_0600`;
            let formId;
            let supplyFlag = false;

            function deleteFormB() {
                console.info(`${tcNumber} deleteFormB start`);
                commonEvent.publish(deleteForm_Event, delPublishCallbackB);
                console.info(`${tcNumber} deleteFormB end`);
            }

            async function delPublishCallbackB() {
                console.info(`${tcNumber} delPublishCallbackB`);
                await sleep(2000);
                console.info(`${tcNumber} delPublishCallbackB end`);
                console.info(`${tcNumber} end`);
                done();
            }

            async function delPublishCallback() {
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

            const onAcquiredCallbackB = async (_, data) => {
                console.info(`${tcNumber} onAcquiredCallbackB data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, delPublishCallback);
            };

            const onAcquiredCallback = async (_, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                formId = data.data;
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                await sleep(1000);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallbackB);

                console.info(`${tcNumber} featureAbility.startAbility again start`);
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
                }).then((res: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormSupply_commonEvent', (err) => {
                        console.info(`${tcNumber} onAcquiredCallbackB publish` + JSON.stringify(err));
                    });
                }).catch((err: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };

            const onSupplyCallback = async (_, data) => {
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
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);

                commonEvent.publish('FMS_FormOnAcquired_commonEvent', (err) => {
                    console.info(`${tcNumber} publish` + JSON.stringify(err));
                });

            }).catch((err: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_deleteForm_0700
         * @tc.name: After deleting a normal form, the form reference is 0.
         *     After deleting a form, there are still created normal forms in FMS.
         * @tc.desc: 1.host A an host B create one normal card respectively
         *           2.host A delete the form and verify the result is true
         */
        it(`FMS_deleteForm_0700`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            const tcNumber = `FMS_deleteForm_0700`;
            let formId;
            let formIdB;
            let supplyFlag = false;

            async function delPublishCallback() {
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

            async function delPublishCallbackB() {
                console.info(`${tcNumber} delPublishCallbackB`);
                await sleep(1000);
                console.info(`${tcNumber} delPublishCallbackB end`);
                console.info(`${tcNumber} end`);
                done();
            }

            function deleteFormB() {
                console.info(`${tcNumber} deleteFormB start`);
                commonEvent.publish(deleteForm_Event, delPublishCallbackB);
                console.info(`${tcNumber} deleteFormB end`);
            }

            const onAcquiredCallbackB = async (_, data) => {
                console.info(`${tcNumber} onAcquiredCallbackB data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                formIdB = data.data;
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, delPublishCallback);
            };

            const onAcquiredCallback = async (_, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                formId = data.data;
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                await sleep(1000);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallbackB);

                console.info(`${tcNumber} featureAbility.startAbility again start`);
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
                }).then((res: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormSupply_commonEvent', (err) => {
                        console.info(`${tcNumber} onAcquiredCallbackB publish` + JSON.stringify(err));
                    });
                }).catch((err: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };

            const onSupplyCallback = async (_, data) => {
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
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnAcquired_commonEvent', (err) => {
                    console.info(`${tcNumber} onAcquiredCallback publish` + JSON.stringify(err));
                });
            }).catch((err: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_deleteForm_0700_1
         * @tc.name: After deleting a normal form, the form reference is 0.
         *     After deleting a form, there are still created normal forms in FMS.
         * @tc.desc: 1.host A an host B create one normal card respectively
         *           2.host A delete the form and verify the result is true
         */
        it(`FMS_deleteForm_0700_1`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            const tcNumber = `FMS_deleteForm_0700_1`;
            let currentTime = new Date().getTime();
            let formId;
            let formIdB;
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
                async function delPublishCallback() {
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

                async function delPublishCallbackB() {
                    console.info(`${tcNumber} delPublishCallbackB`);
                    console.info(`${tcNumber} delPublishCallbackB end`);
                    console.info(`${tcNumber} end`);
                    await systemTime.setTime(currentTime).then((data)=>{
                        console.info(`${tcNumber} setTime  ${JSON.stringify(data)}`);
                        done();
                    }).catch((error)=>{
                        console.info(`${tcNumber} setTime  ${JSON.stringify(error)}`);
                        done();
                    })
                }

                async function deleteFormB() {
                    console.info(`${tcNumber} deleteFormB start`);
                    // timer speed reset
                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.info(`${tcNumber} time speed up`);
                    });
                    await sleep(1000);
                    const commonEventPublishData = {
                        bundleName: "com.ohos.st.formsystemhostc",
                        data: formIdB
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallbackB);
                    console.info(`${tcNumber} deleteFormB end`);
                }

                const onAcquiredCallbackB = async (_, data) => {
                    console.info(`${tcNumber} onAcquiredCallbackB data: ${JSON.stringify(data)}`);
                    expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                    formIdB = data.data;
                    commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                    const commonEventPublishData = {
                        bundleName: "com.ohos.st.formsystemhostd",
                        data: formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallback);
                };

                const onAcquiredCallback = async (_, data) => {
                    console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                    expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                    commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                    formId = data.data;
                    subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                    await sleep(1000);
                    commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallbackB);

                    console.info(`${tcNumber} featureAbility.startAbility again start`);
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
                    }).then((res: any) => {
                        console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    }).catch((err: any) => {
                        console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                    console.info(`${tcNumber} featureAbility.startAbility again end`);
                };
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallback);

                const onSupplyCallback = async (_, data) => {
                    if (data.parameters.kind == "onDestroy") {
                        console.info(`${tcNumber} onSupplyCallback ${JSON.stringify(data)}`);
                        supplyFlag = true;
                    }
                    if (data.parameters.kind == "onUpdate") {
                        if (data.parameters.parameters == formId) {
                            expect().assertFail();
                        } else if (data.parameters.parameters == formIdB) {
                            supplyFlagUpdate = true;
                        }
                    }
                };
                commonEvent.subscribe(subscriberSupply, onSupplyCallback);

                console.info(`${tcNumber} featureAbility.startAbility start`);
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
                }).then((res: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
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
         * @tc.number: FMS_deleteForm_1000
         * @tc.name: You can delete a card after releasing it
         * @tc.desc: 1.host create one normal card
         *           2.host release the form
         *           3.host delete the form and verify the result is true
         */
        it(`FMS_deleteForm_1000`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            const tcNumber = `FMS_deleteForm_1000`;
            let formId = '';

            const onSupplyCallback = async (_, data) => {
                console.info(`${tcNumber} onSupplyCallback ${JSON.stringify(data)}`);
                if (data.event == "FMS_FormSupply_commonEvent") {
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback(tcNumber));
                    await sleep(1000);
                    console.info(`${tcNumber}onDeletedCallback end`);
                    console.info(`${tcNumber} end`);
                    done();
                }
            };

            async function onReleasedCallback(_, data) {
                console.info(`${tcNumber} onReleasedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnReleased_commonEvent`);
                // expect(data.data).assertEqual(`0`);
                commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback(tcNumber));
                //formId = data.parameters.formId;

                console.info(`${tcNumber} featureAbility.startAbility again start`);
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
                }).then((res: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormSupply_commonEvent', data, (err) => {
                        console.info(`${tcNumber} onSupplyCallback publish` + JSON.stringify(err));
                    });
                }).catch((err: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            }
            
            commonEvent.subscribe(subscriberOnReleased, onReleasedCallback);
            commonEvent.subscribe(subscriberSupply, onSupplyCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
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
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnReleased_commonEvent', (err) => {
                    console.info(`${tcNumber} onReleasedCallback publish` + JSON.stringify(err));
                });
            }).catch((err: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);

            await sleep(3000);
        });

        /**
         * @tc.number: FMS_deleteForm_1100
         * @tc.name: When deleting a temporary form, cache data is deleted.
         * @tc.desc: 1.host a and b create one temporary card respectively
         *           2.host a delete the form and verify the result is true
         */
        it(`FMS_deleteForm_1100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            const tcNumber = `FMS_deleteForm_1100`;
            let formId;
            let formIdB;
            let supplyFlag = false;

            async function delPublishCallback() {
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

            async function delPublishCallbackB() {
                console.info(`${tcNumber} delPublishCallbackB`);
                await sleep(1000);
                console.info(`${tcNumber} delPublishCallbackB end`);
                console.info(`${tcNumber} end`);
                done();
            }

            function deleteFormB() {
                console.info(`${tcNumber} deleteFormB start`);
                commonEvent.publish(deleteForm_Event, delPublishCallbackB);
                console.info(`${tcNumber} deleteFormB end`);
            }

            const onAcquiredCallbackB = async (_, data) => {
                console.info(`${tcNumber} onAcquiredCallbackB data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, delPublishCallback);
            };

            const onAcquiredCallback = async (_, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                formId = data.data;
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                await sleep(1000);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallbackB);

                console.info(`${tcNumber} featureAbility.startAbility again start`);
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
                }).then((res: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormSupply_commonEvent', (err) => {
                        console.info(`${tcNumber} onSupplyCallback publish` + JSON.stringify(err));
                    });
                }).catch((err: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };
            

            const onSupplyCallback = async (_, data) => {
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
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnAcquired_commonEvent', (err) => {
                    console.info(`${tcNumber} onAcquiredCallback publish` + JSON.stringify(err));
                });
            }).catch((err: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_deleteForm_0900
         * @tc.name: Form ID error (FormID does not exist)
         * @tc.desc: 1.host create one normal card
         *           2.host delete the form
         *           3.host delete the form again and verify the result is false
         */
        it(`FMS_deleteForm_0900`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            const tcNumber = `FMS_deleteForm_0900`;
            let formId;

            function onDeletedCallback2(_, data) {
                console.info(`${tcNumber} onDeletedCallback2 data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                expect(data.data != "0").assertEqual(true);
                console.info(`${tcNumber} failed to delete form again.`);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeOnDeletedCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info('FMS_deleteForm_0900 publish' + JSON.stringify(err));
                    done()
                });
            }

            const onDeletedCallback = async (_, data) => {
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                // expect(data.data).assertEqual(`0`);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeOnDeletedCallback(tcNumber));
                formId = data.parameters.formId;
                subscriberOnDeleted = await commonEvent.createSubscriber(onDeletedFormEvent);
                await sleep(1000);
                commonEvent.subscribe(subscriberOnDeleted, onDeletedCallback2);

                console.info(`${tcNumber} featureAbility.startAbility again start`);
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
                }).then((res: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    commonEvent.publish('FMS_FormOnDeleted_commonEvent', data, (err) => {
                        console.info(`${tcNumber} onDeletedCallback2 publish` + JSON.stringify(err));
                    });
                }).catch((err: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };

            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
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
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish('FMS_FormOnDeleted_commonEvent', (err) => {
                    console.info(`${tcNumber} onDeletedCallback publish` + JSON.stringify(err));
                });
            }).catch((err: any) => {
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
const changeTime = async (hour, min, second) => {
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

const fill = value => {
    return (value > 9 ? "" : "0") + value;
};

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

const delPublishCallback = async (tcNumber, done) => {
    await sleep(1000);
    console.info(`${tcNumber} delPublishCallback end`);
    console.info(`${tcNumber} end`);
    done();
};

const unsubscribeOnAcquiredCallback = (tcNumber) => {
    console.info(`${tcNumber} Unsubscribe OnAcquired Callback`);
};

const unsubscribeOnDeletedCallback = (tcNumber) => {
    console.info(`${tcNumber} Unsubscribe OnDeleted Callback`);
};

const unsubscribeSupplyCallback = (tcNumber) => {
    console.info(`${tcNumber} Unsubscribe Supply Callback`);
};

const unsubscribeOnReleasedCallback = (tcNumber) => {
    console.info(`${tcNumber} Unsubscribe OnReleased Callback`);
};