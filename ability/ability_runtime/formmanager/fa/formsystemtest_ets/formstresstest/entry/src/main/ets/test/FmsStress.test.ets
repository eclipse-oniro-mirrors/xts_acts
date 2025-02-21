/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the `License`);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an `AS IS` BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import featureAbility from '@ohos.ability.featureAbility';
import formHost from '@ohos.application.formHost';
import commonEvent from '@ohos.commonEvent';
import { beforeEach, afterEach, describe, expect, it } from '@ohos/hypium'

const onDeletedEvent = {
    events: [`FMS_FormOnDeleted_commonEvent`]
}
const onAcquiredEvent = {
    events: [`FMS_FormOnAcquired_commonEvent`]
};
const onSupplyEvent = {
    events: [`FMS_FormSupply_commonEvent`]
};
const formOnDeleteEvent = `FMS_FormDelete_commonEvent`;

const unsubscribeCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

const unsubscribeOnDeletedCallback = (tcNumber, done) => {
    console.info(`${tcNumber} unsubscribeOnDeleted Callback`);
}
const unsubscribeOnAcquiredCallback = (tcNumber) => {
    console.info(`${tcNumber} unsubscribeOnAcquired Callback`);
}
const unsubscribeOnSupplyCallback = (tcNumber) => {
    console.info(`${tcNumber} unsubscribeOnSupply Callback`);
}
const publishOnDeleteCallback = (tcNumber) => {
    console.info(`${tcNumber} publishOnDelete Callback`);
}

let onDeletedEventSubscriber;
let onAcquiredEventSubscriber;
let onSupplyEventSubscriber;

function sleep(time) {
    return new Promise((resolve)=>setTimeout(resolve,time));
  }

export default function test() {
    describe(`FmsStressTest`, () => {

        beforeEach(async () => {
            onDeletedEventSubscriber = await commonEvent.createSubscriber(onDeletedEvent);
            onAcquiredEventSubscriber = await commonEvent.createSubscriber(onAcquiredEvent);
            onSupplyEventSubscriber = await commonEvent.createSubscriber(onSupplyEvent);
        });

        afterEach(async() => {
            commonEvent.unsubscribe(onDeletedEventSubscriber, () => unsubscribeCallback("afterEach unsubscribe onDeletedEventSubscriber"));
            commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeCallback("afterEach unsubscribe onAcquiredEventSubscriber"));
            commonEvent.unsubscribe(onSupplyEventSubscriber, () => unsubscribeCallback("afterEach unsubscribe onSupplyEventSubscriber"));
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formstresstest",
                    abilityName: "com.ohos.st.formstresstest.MainAbility"
                }
            }).then((data) => {
                console.log("FmsStressTest startAbility data: " + JSON.stringify(data));
            }).catch((err) => {
                console.log("FmsStressTest startAbility err: " + JSON.stringify(err));
            })
            await sleep(2000);
        })

        const subscribeDeletedEvent = (tcNumber, expectedDeletedFormAmount, done) => {
            commonEvent.subscribe(onDeletedEventSubscriber, async (err, data) => {
                const formIds = data.parameters.formIds;
                const deletedFormAmount = data.parameters.deletedFormAmount;
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onDeletedCallback formIds: ${formIds}`);

                expect(expectedDeletedFormAmount).assertEqual(deletedFormAmount);
                expect(err.code).assertEqual(0);
                console.info(`${tcNumber} onDeletedCallback end`);
                commonEvent.unsubscribe(onDeletedEventSubscriber, () => unsubscribeOnDeletedCallback(tcNumber, done));
            });
        }

        /**
         * @tc.number: FMS_stressTest_0100
         * @tc.name: Create form test.
         * @tc.desc: OnCreate form interface working well.
         */
        it(`FMS_stressTest_0100`, 0, async (done) => {
            const tcNumber = `FMS_stressTest_0100`;

            subscribeDeletedEvent(tcNumber, 1, done);

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                const formId = data.data;
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${formId}`);

                expect(err.code).assertEqual(0);
                commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));

                setTimeout(() => {
                    commonEvent.publish(formOnDeleteEvent, {
                        parameters: {
                            formIds: [].concat(formId)
                        }
                    }, () => publishOnDeleteCallback(tcNumber));
                }, 500);
                console.info(`${tcNumber} onAcquiredCallback end`);
                done()
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestservicef.hmservice`,
                            ability: `com.form.formsystemtestservicef.hmservice.FormAbility`,
                            moduleName: `entry`,
                            isCreate: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
                done()
            }
        });

        /**
         * @tc.number: FMS_stressTest_0200
         * @tc.name: Host release form test.
         * @tc.desc: releaseForm method working well.
         */
        it(`FMS_stressTest_0200`, 0, async (done) => {
            const tcNumber = `FMS_stressTest_0200`;

            subscribeDeletedEvent(tcNumber, 1, done);

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                const kind = data.parameters.kind;
                const formId = data.parameters.formId;
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${formId}`);

                expect(err.code).assertEqual(0);
                if (`release` == kind) {
                    try {
                        const res = await featureAbility.startAbility({
                            want: {
                                bundleName: `com.ohos.st.formsystemhostk`,
                                abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                                parameters: {
                                    formId: `0`,
                                    name: `Form_Js001`,
                                    bundle: `com.form.formsystemtestservicef.hmservice`,
                                    ability: `com.form.formsystemtestservicef.hmservice.FormAbility`,
                                    moduleName: `entry`,
                                    isCreate: true
                                }
                            }
                        });
                        console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
                    } catch (error) {
                        console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                        console.info(`${tcNumber} should not reach here`);
                        expect().assertFail();
                        done()
                    }
                } else {
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                    setTimeout(() => {
                        commonEvent.publish(formOnDeleteEvent, {
                            parameters: {
                                formIds: [].concat(formId)
                            }
                        }, () => publishOnDeleteCallback(tcNumber));
                    }, 500);
                    console.info(`${tcNumber} onAcquiredCallback end`);
                    done()
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestservicef.hmservice`,
                            ability: `com.form.formsystemtestservicef.hmservice.FormAbility`,
                            moduleName: `entry`,
                            releaseForm: true,
                            isCreate: true,
                            temporary: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
                done()
            }
        });

        /**
         * @tc.number: FMS_stressTest_0300
         * @tc.name: Host cast temp form test.
         * @tc.desc: castTempForm method working well.
         */
        it(`FMS_stressTest_0300`, 0, async (done) => {
            const tcNumber = `FMS_stressTest_0300`;

            subscribeDeletedEvent(tcNumber, 1, done);

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                const kind = data.parameters.kind;
                const formId = data.parameters.formId;
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${formId}`);

                expect(err.code).assertEqual(0);
                if (`castTempForm` == kind) {
                    try {
                        const res = await featureAbility.startAbility({
                            want: {
                                bundleName: `com.ohos.st.formsystemhostk`,
                                abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                                parameters: {
                                    formId: formId,
                                    name: `Form_Js001`,
                                    bundle: `com.form.formsystemtestservicef.hmservice`,
                                    ability: `com.form.formsystemtestservicef.hmservice.FormAbility`,
                                    moduleName: `entry`
                                }
                            }
                        });
                        console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
                    } catch (error) {
                        console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                        console.info(`${tcNumber} should not reach here`);
                        expect().assertFail();
                        done()
                    }
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                    setTimeout(() => {
                        commonEvent.publish(formOnDeleteEvent, {
                            parameters: {
                                formIds: [].concat(formId)
                            }
                        }, () => publishOnDeleteCallback(tcNumber));
                    }, 500);
                    console.info(`${tcNumber} onAcquiredCallback end`);
                    done()
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestservicef.hmservice`,
                            ability: `com.form.formsystemtestservicef.hmservice.FormAbility`,
                            moduleName: `entry`,
                            castTempForm: true,
                            isCreate: true,
                            temporary: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
                done()
            }
        });

        /**
         * @tc.number: FMS_stressTest_0700
         * @tc.name: Host request form test.
         * @tc.desc: requestForm method working well.
         */
        it(`FMS_stressTest_0700`, 0, async (done) => {
            const tcNumber = `FMS_stressTest_0700`;

            subscribeDeletedEvent(tcNumber, 1, done);

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                const kind = data.parameters.kind;
                const formId = data.parameters.formId;
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${formId}`);

                if (`request` == kind) {
                    expect(err.code).assertEqual(0);
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                    setTimeout(() => {
                        commonEvent.publish(formOnDeleteEvent, {
                            parameters: {
                                formIds: [].concat(formId)
                            }
                        }, () => publishOnDeleteCallback(tcNumber));
                    }, 500);
                    console.info(`${tcNumber} onAcquiredCallback end`);
                    done()
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestservicef.hmservice`,
                            ability: `com.form.formsystemtestservicef.hmservice.FormAbility`,
                            moduleName: `entry`,
                            requestForm: true,
                            isCreate: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
                done()
            }
        });

        /**
         * @tc.number: FMS_stressTest_0900
         * @tc.name: Provider update form test.
         * @tc.desc: updateForm method working well.
         */
        it(`FMS_stressTest_0900`, 0, async (done) => {
            const tcNumber = `FMS_stressTest_0900`;

            subscribeDeletedEvent(tcNumber, 1, done);

            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                const kind = data.parameters.kind;
                const supplyFormId = `onCreate` == kind
                    ? JSON.parse(data.parameters.parameters).parameters[`ohos.extra.param.key.form_identity`]
                    : `onVisibilityChange` == kind
                        ? Object.keys(JSON.parse(data.parameters.parameters))[0]
                        : data.parameters.parameters;
                console.info(`${tcNumber} onSupplyCallback formId: ${supplyFormId} kind: ${kind}`);

                if (`onUpdateForm` == kind) {
                    commonEvent.unsubscribe(onSupplyEventSubscriber, () => unsubscribeOnSupplyCallback(tcNumber));
                    setTimeout(() => {
                        commonEvent.publish(formOnDeleteEvent, {
                            parameters: {
                                formIds: [].concat(supplyFormId)
                            }
                        }, () => publishOnDeleteCallback(tcNumber));
                    }, 500);
                    console.info(`${tcNumber} onSupplyCallback end`);
                    done()
                }
            });

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                const kind = data.parameters.kind;
                const formId = data.parameters.formId;
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${formId}`);

                if (`notifyVisibleForms` == kind) {
                    expect(err.code).assertEqual(0);
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                    console.info(`${tcNumber} onAcquiredCallback end`);
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestserviceg.hmservice`,
                            ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                            moduleName: `entry`,
                            notifyVisibleForms: true,
                            isCreate: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
                done()
            }
        });

        /**
         * @tc.number: FMS_stressTest_1100
         * @tc.name: Host notify form's visibility test.
         * @tc.desc: notifyVisibleForms and notifyInvisibleForms method working well.
         */
        it(`FMS_stressTest_1100`, 0, async (done) => {
            const tcNumber = `FMS_stressTest_1100`;
            let hostCounter = 0;
            let providerCounter = 0;

            subscribeDeletedEvent(tcNumber, 1, done);

            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                const kind = data.parameters.kind;
                const supplyFormId = `onCreate` == kind
                    ? JSON.parse(data.parameters.parameters).parameters[`ohos.extra.param.key.form_identity`]
                    : `onVisibilityChange` == kind
                        ? Object.keys(JSON.parse(data.parameters.parameters))[0]
                        : data.parameters.parameters;
                console.info(`${tcNumber} onSupplyCallback formId: ${supplyFormId} kind: ${kind}`);

                if (`onVisibilityChange` == kind) {
                    if (++providerCounter == 2) {
                        commonEvent.unsubscribe(onSupplyEventSubscriber, () => unsubscribeOnSupplyCallback(tcNumber));
                        setTimeout(() => {
                            commonEvent.publish(formOnDeleteEvent, {
                                parameters: {
                                    formIds: [].concat(supplyFormId)
                                }
                            }, () => publishOnDeleteCallback(tcNumber));
                        }, 500);
                        console.info(`${tcNumber} onSupplyCallback end`);
                        done()
                    }
                }
            });

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                const kind = data.parameters.kind;
                const formId = data.parameters.formId;
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${formId}`);

                if (`notifyVisibleForms` == kind) {
                    expect(err.code).assertEqual(0);
                    if (++hostCounter == 2) {
                        commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                        console.info(`${tcNumber} onAcquiredCallback end`);
                    }
                } else if (`notifyInvisibleForms` == kind) {
                    expect(err.code).assertEqual(0);
                    if (++hostCounter == 2) {
                        commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                        console.info(`${tcNumber} onAcquiredCallback end`);
                    }
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestserviceg.hmservice`,
                            ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                            moduleName: `entry`,
                            notifyVisibility: true,
                            isCreate: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
                done()
            }
        });

        /**
         * @tc.number: FMS_stressTest_1700
         * @tc.name: Get forms info test.
         * @tc.desc: getAllFormsInfo and getFormsInfo method working well.
         */
        it(`FMS_stressTest_1700`, 0, async (done) => {
            const tcNumber = `FMS_stressTest_1700`;

            let allFormsInfo = await formHost.getAllFormsInfo();
            const providerBundleNameList = [
                `com.form.formsystemtestservicef.hmservice`,
                `com.form.formsystemtestserviceg.hmservice`
            ];

            console.info(`${tcNumber} getAllFormsInfo: ${JSON.stringify(allFormsInfo)}`);
            console.info(`${tcNumber} before filter size: ${JSON.stringify(allFormsInfo.length)}`);
            allFormsInfo = allFormsInfo.filter((formsInfo) => providerBundleNameList.includes(formsInfo.bundleName));
            console.info(`${tcNumber} after filter size: ${JSON.stringify(allFormsInfo.length)}`);
            expect(allFormsInfo.length).assertEqual(3);

            allFormsInfo.forEach(async (formsInfo, index) => {
                const providerFormsInfo1 = await formHost.getFormsInfo(formsInfo.bundleName);
                const providerFormsInfo2 = await formHost.getFormsInfo(formsInfo.bundleName, formsInfo.moduleName);

                console.info(`${tcNumber} getFormsInfo: ${JSON.stringify(providerFormsInfo1)}`);
                console.info(`${tcNumber} getFormsInfo: ${JSON.stringify(providerFormsInfo2)}`);
                expect(providerFormsInfo1[0].bundleName).assertEqual(providerFormsInfo2[0].bundleName);

                if (index == allFormsInfo.length - 1) {
                    done();
                }
            });
        });


        /**
         * @tc.number: FMS_stressTest_1800
         * @tc.name: Form system ready test.
         * @tc.desc: isSystemReady method working well.
         */
        it(`FMS_stressTest_1800`, 0, async (done) => {
            const tcNumber = `FMS_stressTest_1800`;

            const systemstatus = await formHost.isSystemReady();
            console.info(`${tcNumber} systemstatus: ${JSON.stringify(systemstatus)}`);
            expect(systemstatus).assertEqual(undefined);
            done();
        });
    });
}
