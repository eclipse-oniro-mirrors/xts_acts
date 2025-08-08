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
import { beforeEach, afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

const onAcquiredForm_Event: CommonEventManager.CommonEventSubscribeInfo = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};

const onDeletedFormEvent: CommonEventManager.CommonEventSubscribeInfo = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};

const onRefreshFormEvent: CommonEventManager.CommonEventSubscribeInfo = {
    events: ["FMS_FormDynamicRefresh_commonEvent"],
};

const onSupplyEvent: CommonEventManager.CommonEventSubscribeInfo = {
    events: ["FMS_FormSupply_commonEvent"],
};

const unsubscribeCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

const deleteForm_Event: string = "FMS_FormDelete_commonEvent";

let subscriberOnAcquired: CommonEventManager.CommonEventSubscriber;
let subscriberOnDeleted: CommonEventManager.CommonEventSubscriber;
let subscriberOnRefresh: CommonEventManager.CommonEventSubscriber;
let subscriberSupply: CommonEventManager.CommonEventSubscriber;

export default function test() {
    describe(`FmsTimeRefreshFormTest`, () => {

        beforeEach(async () => {
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberOnDeleted = await commonEvent.createSubscriber(onDeletedFormEvent);
            subscriberOnRefresh = await commonEvent.createSubscriber(onRefreshFormEvent);
            subscriberSupply = await commonEvent.createSubscriber(onSupplyEvent);
            await sleep(1000);
        });

        afterEach(async() => {
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeCallback("afterEach unsubscribe subscriberOnDeleted"));
            commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeCallback("afterEach unsubscribe subscriberOnRefresh"));
            commonEvent.unsubscribe(subscriberSupply, () => unsubscribeCallback("afterEach unsubscribe subscriberSupply"));
            await sleep(1000);
        })

        /**
         * @tc.number: FMS_timedRefresh_0100
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
         *           2.Verify the result of the dynamic timed refresh interface.
         */
        it(`FMS_timedRefresh_0100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            const tcNumber = `FMS_timedRefresh_0100`;

            const onRefreshCallback = async (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onRefreshCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormDynamicRefresh_commonEvent`);
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info(`${tcNumber} publish deleteForm_Event: ${JSON.stringify(err)}`);
                    done();
                });
            };
            commonEvent.subscribe(subscriberOnRefresh, onRefreshCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        refreshForm: true,
                        refreshId: "-1",
                        refreshTime: 5,
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish("FMS_FormDynamicRefresh_commonEvent", () => {
                    console.info(`${tcNumber} onRefreshCallback publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_timedRefresh_0200
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
         *           2.Verify the result of the dynamic timed refresh interface.
         */
        it(`FMS_timedRefresh_0200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            const tcNumber = `FMS_timedRefresh_0200`;

            const onRefreshCallback = async (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onRefreshCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormDynamicRefresh_commonEvent`);
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info(`${tcNumber} publish deleteForm_Event: ${JSON.stringify(err)}`);
                    done();
                });
            };
            commonEvent.subscribe(subscriberOnRefresh, onRefreshCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        refreshForm: true,
                        refreshId: "0",
                        refreshTime: 5,
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish("FMS_FormDynamicRefresh_commonEvent", () => {
                    console.info(`${tcNumber} onRefreshCallback publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0300
        * @tc.name: formID id is error because formId is not self
        * @tc.desc: 1.The form provider B to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0300`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            const tcNumber = `FMS_timedRefresh_0300`;

            const onRefreshCallback = async (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onRefreshCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormDynamicRefresh_commonEvent`);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info(`${tcNumber} publish deleteForm_Event: ${JSON.stringify(err)}`);
                    done();
                });
            };
            commonEvent.subscribe(subscriberOnRefresh, onRefreshCallback);

            const onAcquiredCallback = async (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));

                console.info(`${tcNumber} featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            refreshForm: true,
                            refreshId: data.data,
                            refreshTime: 5,
                            isCreate: false
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost again res: ${JSON.stringify(res)}`);
                    commonEvent.publish("FMS_FormDynamicRefresh_commonEvent", () => {
                        console.info(`${tcNumber} onRefreshCallback publish start`)});
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost again error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
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
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", () => {
                    console.info(`${tcNumber} onAcquiredCallback publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0400
        * @tc.name: Form ID error (FormID does not exist)
        * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0400`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            const tcNumber = `FMS_timedRefresh_0400`;
            let formId: string | undefined = '';

            const onRefreshCallback = async (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onRefreshCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormDynamicRefresh_commonEvent`);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info(`${tcNumber} publish deleteForm_Event: ${JSON.stringify(err)}`);
                    done();
                });
            };
            commonEvent.subscribe(subscriberOnRefresh, onRefreshCallback);

            const onDeletedCallback = async (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeDeletedCallback(tcNumber));
                formId = data.parameters?.formId;

                console.info(`${tcNumber} featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            refreshForm: true,
                            refreshId: formId,
                            refreshTime: 5,
                            isCreate: false
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost again res: ${JSON.stringify(res)}`);
                    commonEvent.publish("FMS_FormDynamicRefresh_commonEvent", () => {
                        console.info(`${tcNumber} onRefreshCallback publish again start`)})
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost again error: ${JSON.stringify(err)}`);
                });
                console.info(`${tcNumber} featureAbility.startAbility again end`);
            };
            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        deleteForm: true,
                        "deleteId": "self",
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish("FMS_FormOnDeleted_commonEvent", () => {
                    console.info(`${tcNumber} onDeletedCallback publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0500
        * @tc.name: Incorrect interval for the next refresh (time < 5)
        * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0500`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            const tcNumber = `FMS_timedRefresh_0500`;

            const onRefreshCallback = async (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onRefreshCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormDynamicRefresh_commonEvent`);
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback(tcNumber));
                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info(`${tcNumber} publish deleteForm_Event: ${JSON.stringify(err)}`);
                    done();
                });
            };
            commonEvent.subscribe(subscriberOnRefresh, onRefreshCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicea.hmservice",
                        ability: "FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        refreshForm: true,
                        refreshId: "self",
                        refreshTime: 1,
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish("FMS_FormDynamicRefresh_commonEvent", () => {
                    console.info(`${tcNumber} onRefreshCallback publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0600
        * @tc.name: correct interval for the next refresh (time == 5)
        * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0600`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            const tcNumber = `FMS_timedRefresh_0600`;

            const onSupplyCallback = async (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormSupply_commonEvent`);
                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info(`${tcNumber} publish deleteForm_Event: ${JSON.stringify(err)}`);
                    done();
                });
                
            };
            commonEvent.subscribe(subscriberSupply, onSupplyCallback);

            console.info(`${tcNumber} featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        formId: "0",
                        name: "Form_Js001",
                        bundle: "com.acts.form.formsystemtestservicec.hmservice",
                        ability: "com.acts.form.formsystemtestservicec.hmservice.FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        "notifyVisibleForms": true,
                        "notifyVisibleId": "self",
                        isCreate: true
                    }
                }
            }).then((res) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish("FMS_FormSupply_commonEvent", () => {
                    console.info(`${tcNumber} onSupplyCallback publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);

            await sleep(3000);
        });
    });
}

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

const unsubscribeOnAcquiredCallback = (tcNumber: string) => {
    console.info(`${tcNumber} Unsubscribe OnAcquired Callback`);
};

const unsubscribeDeletedCallback = (tcNumber: string) => {
    console.info(`${tcNumber} Unsubscribe Deleted Callback`);
};

const unsubscribeSupplyCallback = (tcNumber: string) => {
    console.info(`${tcNumber} Unsubscribe Supply Callback`);
};

const unsubscribeOnRefreshCallback = (tcNumber: string) => {
    console.info(`${tcNumber} Unsubscribe OnRefresh Callback`);
};