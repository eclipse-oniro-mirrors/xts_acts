/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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
import formHostNew from '@ohos.app.form.formHost';
import formInfo from '@ohos.app.form.formInfo';
import Want from '@ohos.app.ability.Want';
import commonEvent from '@ohos.commonEvent';
import { beforeEach, afterEach, describe, expect, it } from '@ohos/hypium';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

interface onFormEvent {
    events: string[];
}

interface allFormsInfoType {
    moduleName: string;
    bundleName: string;
}


const onDeletedEvent: onFormEvent = {
  events: [`FMS_FormOnDeleted_commonEvent`]
}
const onAcquiredEvent: onFormEvent = {
  events: [`FMS_FormOnAcquired_commonEvent`]
};
const onSupplyEvent: onFormEvent = {
  events: [`FMS_FormSupply_commonEvent`]
};


const formOnDeleteEvent: string = `FMS_FormDelete_commonEvent`;

const unsubscribeCallback = (tcNumber: string) => {
  console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

const unsubscribeOnDeletedCallback = (tcNumber: string, done: () => void) => {
  console.info(`${tcNumber} unsubscribeOnDeleted Callback`);
}
const unsubscribeOnAcquiredCallback = (tcNumber: string) => {
  console.info(`${tcNumber} unsubscribeOnAcquired Callback`);
}
const unsubscribeOnSupplyCallback = (tcNumber: string) => {
  console.info(`${tcNumber} unsubscribeOnSupply Callback`);
}
const publishOnDeleteCallback = (tcNumber: string) => {
  console.info(`${tcNumber} publishOnDelete Callback`);
}

let onDeletedEventSubscriber: CommonEventManager.CommonEventSubscriber;
let onAcquiredEventSubscriber: CommonEventManager.CommonEventSubscriber;
let onSupplyEventSubscriber: CommonEventManager.CommonEventSubscriber;

let options:CommonEventManager.CommonEventPublishData = {
    code: 1,
    data: "initial data",
    isOrdered: true
}

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

function acquiredToPublishDelete(tcNumber: string, formId: string, done: () => void) {
    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
    setTimeout(() => {
        let formIds: string[] = [];
        formIds.push(formId);
        commonEvent.publish(formOnDeleteEvent, {
            parameters: {
                formIds: formIds
            }
        }, () => publishOnDeleteCallback(tcNumber));
    }, 500);
    console.info(`${tcNumber} onAcquiredCallback end`);
    done()
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
            }).catch((err: BusinessError) => {
                console.log("FmsStressTest startAbility err: " + JSON.stringify(err));
            })
            await sleep(2000);
        })

        const subscribeDeletedEvent = (tcNumber: string, expectedDeletedFormAmount: number, done: ()=>void) => {
            console.info(`${tcNumber} subscribeDeletedEvent 开始执行`);
            commonEvent.subscribe(onDeletedEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onDeletedCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);

                if (data?.code) {
                    const code: number = data.code
                    expect(code).assertEqual(0);
                    expect(data.data != "0").assertEqual(true);
                    console.info(`${tcNumber} onDeletedCallback code: ${code}`);
                }

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
        it(`FMS_stressTest_0100`, 0, async (done: ()=> void) => {
            const tcNumber = `FMS_stressTest_0100`;
            subscribeDeletedEvent(tcNumber, 1, done);

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                let formId: string = '';
                if (data?.data) {
                    formId = data.data;
                }
                console.info(`${tcNumber} onAcquiredCallback formId: ${formId}`);

                expect(err.code).assertEqual(0);
                commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));

                setTimeout(() => {
                    let formIds: string[] = [];
                    formIds.push(formId);
                    commonEvent.publish(formOnDeleteEvent, {
                        parameters: {
                            formIds: formIds
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
                            bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                            ability: `FormAbility`,
                            moduleName: `entry`,
                            isCreate: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);

                options.code = res;
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options,
                () => publishOnDeleteCallback("FMS_stressTest_0100"));

            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number: FMS_stressTest_0200
         * @tc.name: Host release form test.
         * @tc.desc: releaseForm method working well.
         */
        it(`FMS_stressTest_0200`, 0, async (done: ()=> void) => {
            const tcNumber = `FMS_stressTest_0200`;

            subscribeDeletedEvent(tcNumber, 1, done);

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                const kind: string | undefined = data.parameters?.kind;
                let formId: string = '';
                if (data?.data) {
                    formId = data.data;
                }
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
                                    bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                                    ability: `FormAbility`,
                                    moduleName: `entry`,
                                    isCreate: true
                                }
                            }
                        });
                        console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
                    } catch (error) {
                        console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                        console.info(`${tcNumber} should not reach here`);
                    }
                } else {
                    acquiredToPublishDelete(tcNumber, formId, done)
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
                            bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                            ability: `FormAbility`,
                            moduleName: `entry`,
                            releaseForm: true,
                            isCreate: true,
                            temporary: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);

                options.code = res;
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options,
                () => publishOnDeleteCallback(tcNumber));
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
        it(`FMS_stressTest_0300`, 0, async (done: ()=> void) => {
            const tcNumber = `FMS_stressTest_0300`;

            subscribeDeletedEvent(tcNumber, 1, done);

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                const kind: string | undefined = data.parameters?.kind;
                let formId: string = '';
                if (data?.data) {
                    formId = data.data;
                }
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
                                    bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                                    ability: `FormAbility`,
                                    moduleName: `entry`
                                }
                            }
                        });
                        console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
                        acquiredToPublishDelete(tcNumber, formId, done)
                    } catch (error) {
                        console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                        console.info(`${tcNumber} should not reach here`);
                    }
                    return;
                }
                acquiredToPublishDelete(tcNumber, formId, done);
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                            ability: `FormAbility`,
                            moduleName: `entry`,
                            castTempForm: true,
                            isCreate: true,
                            temporary: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options,
                () => publishOnDeleteCallback(tcNumber));
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
        it(`FMS_stressTest_0700`, 0, async (done: ()=> void) => {
            const tcNumber = `FMS_stressTest_0700`;

            subscribeDeletedEvent(tcNumber, 1, done);

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                const kind: string | undefined = data.parameters?.kind;
                let formId: string = '';
                if (data?.data) {
                    formId = data.data;
                }
                console.info(`${tcNumber} onAcquiredCallback formId: ${formId}`);

                if (`request` == kind) {
                    expect(err.code).assertEqual(0);
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                    setTimeout(() => {
                        let formIds: string[] = [];
                        formIds.push(formId);
                        commonEvent.publish(formOnDeleteEvent, {
                            parameters: {
                                formIds: formIds
                            }
                        }, () => publishOnDeleteCallback(tcNumber));
                    }, 500);
                    console.info(`${tcNumber} onAcquiredCallback end`);
                    done()
                }
                acquiredToPublishDelete(tcNumber, formId, done)
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                            ability: `FormAbility`,
                            moduleName: `entry`,
                            requestForm: true,
                            isCreate: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options,
                () => publishOnDeleteCallback(tcNumber));
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
        it(`FMS_stressTest_1700`, 0, async (done: ()=> void) => {
            const tcNumber: string = `FMS_stressTest_1700`;
            let allFormsInfo: allFormsInfoType[] | null = null;
            try {
                 allFormsInfo = await formHost.getAllFormsInfo();
            } catch(error) {
                console.error(`${tcNumber} getAllFormsInfo error: ${JSON.stringify(error)}`);
            }

            if (!allFormsInfo) {
                console.error(`${tcNumber} allFormsInfo is null`);
                done();
                return;
            }

            const providerBundleNameList = [
                `com.acts.form.formsystemtestservicef.hmservice`,
                `com.acts.form.formsystemtestserviceg.hmservice`
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

                if (allFormsInfo && index == allFormsInfo.length - 1) {
                    done();
                }
            });
        });

        /**
         * @tc.number: FMS_stressTest_1800
         * @tc.name: Form system ready test.
         * @tc.desc: isSystemReady method working well.
         */
        it(`FMS_stressTest_1800`, 0, async (done: ()=> void) => {
            const tcNumber = `FMS_stressTest_1800`;

            const systemstatus = await formHost.isSystemReady();
            console.info(`${tcNumber} systemstatus: ${JSON.stringify(systemstatus)}`);
            expect(systemstatus).assertEqual(undefined);
            done();
        });
    });
}