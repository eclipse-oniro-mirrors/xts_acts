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

import featureAbility from '@ohos.ability.featureAbility';
import commonEvent from '@ohos.commonEvent';
import { beforeEach, afterEach, describe, expect, it } from '@ohos/hypium'

const onAcquiredForm_Event = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};

const onDeletedFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};

const onRefreshFormEvent = {
    events: ["FMS_FormDynamicRefresh_commonEvent"],
};

const onSupplyEvent = {
    events: ["FMS_FormSupply_commonEvent"],
};

const unsubscribeCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

const deleteForm_Event = "FMS_FormDelete_commonEvent";

let subscriberOnAcquired;
let subscriberOnDeleted;
let subscriberOnRefresh;
let subscriberSupply;

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

            let wantInfo = {
                want: {
                    bundleName: "com.ohos.st.formdynamicrefreshtest",
                    abilityName: "com.ohos.st.formdynamicrefreshtest.TestAbility"
                }
            }
            await featureAbility.startAbility(wantInfo).then((data) => {
              console.log("FMS_timedRefresh startAbility data : " + JSON.stringify(data));
            }).catch((err) => {
              console.log("FMS_timedRefresh startAbility err : " + JSON.stringify(err));
            })
            await sleep(1000);
        })

        /**
         * @tc.number: FMS_timedRefresh_0100
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
         *           2.Verify the result of the dynamic timed refresh interface.
         */
        it(`FMS_timedRefresh_0100`, 0, async (done) => {
            const tcNumber = `FMS_timedRefresh_0100`;

            const onRefreshCallback = async (_, data) => {
                console.info(`${tcNumber} onRefreshCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormDynamicRefresh_commonEvent`);
                expect(data.data).assertEqual(`7`);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback(tcNumber));
                const commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                console.info('FMS_timedRefresh_0100 publish' + JSON.stringify(err));
                done()
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
                        bundle: "com.form.formsystemtestservicea.hmservice",
                        ability: "com.form.formsystemtestservicea.hmservice.FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        refreshForm: true,
                        refreshId: "-1",
                        refreshTime: 5,
                        isCreate: true
                    }
                }
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
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
        it(`FMS_timedRefresh_0200`, 0, async (done) => {
            const tcNumber = `FMS_timedRefresh_0200`;

            const onRefreshCallback = async (_, data) => {
                console.info(`${tcNumber} onRefreshCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormDynamicRefresh_commonEvent`);
                expect(data.data).assertEqual(`7`);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback(tcNumber));
                const commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                console.info('FMS_timedRefresh_0200 publish' + JSON.stringify(err));
                done()
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
                        bundle: "com.form.formsystemtestservicea.hmservice",
                        ability: "com.form.formsystemtestservicea.hmservice.FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        refreshForm: true,
                        refreshId: "0",
                        refreshTime: 5,
                        isCreate: true
                    }
                }
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
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
        it(`FMS_timedRefresh_0300`, 0, async (done) => {
            const tcNumber = `FMS_timedRefresh_0300`;
            let formId;

            const onRefreshCallback = async (_, data) => {
                console.info(`${tcNumber} onRefreshCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormDynamicRefresh_commonEvent`);
                expect(data.data).assertEqual(`13`);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback(tcNumber));
                const commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                console.info('FMS_timedRefresh_0300 publish' + JSON.stringify(err));
                done()
                });
            };
            commonEvent.subscribe(subscriberOnRefresh, onRefreshCallback);

            const onAcquiredCallback = async (_, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnAcquired_commonEvent`);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback(tcNumber));
                formId = data.data;

                console.info(`${tcNumber} featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.form.formsystemtestservicea.hmservice",
                            ability: "com.form.formsystemtestservicea.hmservice.FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            refreshForm: true,
                            refreshId: formId,
                            refreshTime: 5,
                            isCreate: false
                        }
                    }
                }).then((res: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    done()
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
                        bundle: "com.form.formsystemtestservicea.hmservice",
                        ability: "com.form.formsystemtestservicea.hmservice.FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        isCreate: true
                    }
                }
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                done()
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0400
        * @tc.name: Form ID error (FormID does not exist)
        * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0400`, 0, async (done) => {
            const tcNumber = `FMS_timedRefresh_0400`;
            let formId;

            const onRefreshCallback = async (_, data) => {
                console.info(`${tcNumber} onRefreshCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormDynamicRefresh_commonEvent`);
                expect(data.data).assertEqual(`9`);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback(tcNumber));
                const commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostc",
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                console.info('FMS_timedRefresh_0400 publish' + JSON.stringify(err));
                done()
                });
            };
            commonEvent.subscribe(subscriberOnRefresh, onRefreshCallback);

            const onDeletedCallback = async (_, data) => {
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormOnDeleted_commonEvent`);
                expect(data.data).assertEqual(`0`);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeDeletedCallback(tcNumber));
                formId = data.parameters.formId;

                console.info(`${tcNumber} featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.form.formsystemtestservicea.hmservice",
                            ability: "com.form.formsystemtestservicea.hmservice.FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            refreshForm: true,
                            refreshId: formId,
                            refreshTime: 5,
                            isCreate: false
                        }
                    }
                }).then((res: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    done()
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
                        bundle: "com.form.formsystemtestservicea.hmservice",
                        ability: "com.form.formsystemtestservicea.hmservice.FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        deleteForm: true,
                        "deleteId": "self",
                        isCreate: true
                    }
                }
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                done()
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0500
        * @tc.name: Incorrect interval for the next refresh (time < 5)
        * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0500`, 0, async (done) => {
            const tcNumber = `FMS_timedRefresh_0500`;

            const onRefreshCallback = async (_, data) => {
                console.info(`${tcNumber} onRefreshCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormDynamicRefresh_commonEvent`);
                expect(data.data).assertEqual(`7`);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback(tcNumber));
                const commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                console.info('FMS_timedRefresh_0500 publish' + JSON.stringify(err));
                done()
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
                        bundle: "com.form.formsystemtestservicea.hmservice",
                        ability: "com.form.formsystemtestservicea.hmservice.FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        refreshForm: true,
                        refreshId: "self",
                        refreshTime: 1,
                        isCreate: true
                    }
                }
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
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
        it(`FMS_timedRefresh_0600`, 0, async (done) => {
            const tcNumber = `FMS_timedRefresh_0600`;

            const onSupplyCallback = async (_, data) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}`);
                expect(data.event).assertEqual(`FMS_FormSupply_commonEvent`);
                if (data.parameters.kind == "onVisibilityChange") {
                    console.info(`${tcNumber} onSupplyCallback kind: data.parameters.kind`);
                    console.info(`${tcNumber} onSupplyCallback error: data.parameters.errorData`);
                    expect(data.parameters.errorData).assertEqual(`0`);
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback(tcNumber));
                    const commonEventPublishData = {
                        data: data.parameters.formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_timedRefresh_0600 publish' + JSON.stringify(err));
                    done()
                    });
                }
                done()
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
                        bundle: "com.form.formsystemtestservicec.hmservice",
                        ability: "com.form.formsystemtestservicec.hmservice.FormAbility",
                        moduleName: "entry",
                        temporary: false,
                        "notifyVisibleForms": true,
                        "notifyVisibleId": "self",
                        isCreate: true
                    }
                }
            }).then((res: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`${tcNumber} featureAbility.startAbility end`);
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
    await sleep(1000);
    console.info(`${tcNumber} delPublishCallback end`);
    console.info(`${tcNumber} end`);
    done();
};

const unsubscribeOnAcquiredCallback = (tcNumber) => {
    console.info(`${tcNumber} Unsubscribe OnAcquired Callback`);
};

const unsubscribeDeletedCallback = (tcNumber) => {
    console.info(`${tcNumber} Unsubscribe Deleted Callback`);
};

const unsubscribeSupplyCallback = (tcNumber) => {
    console.info(`${tcNumber} Unsubscribe Supply Callback`);
};

const unsubscribeOnRefreshCallback = (tcNumber) => {
    console.info(`${tcNumber} Unsubscribe OnRefresh Callback`);
};
