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
import { beforeEach, afterEach, describe, expect, it } from '@ohos/hypium';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

interface onFormEvent {
    events: string[];
}

interface commonEventPublishDataType {
    data: string | undefined;
    bundleName?: string
}

interface wantType {
    bundleName: string
    abilityName: string
}

let options:CommonEventManager.CommonEventPublishData = {
    code: 1,
    data: "initial data",
    isOrdered: true
}

let onErrorForm_Event: onFormEvent = {
    events: ["FMS_FormOnError_commonEvent"],
};
let onAcquiredForm_Event: onFormEvent = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};
let subscriberFormCastEvent: onFormEvent = {
    events: ["FMS_FormCast_commonEvent"],
};
let onSupplyEvent: onFormEvent = {
    events: ["FMS_FormSupply_commonEvent"],
};

const unsubscribeCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

let deleteForm_Event: string = "FMS_FormDelete_commonEvent";

let subscriberOnError: CommonEventManager.CommonEventSubscriber;
let subscriberOnAcquired: CommonEventManager.CommonEventSubscriber;
let subscriberCast: CommonEventManager.CommonEventSubscriber;
let subscriberSupply: CommonEventManager.CommonEventSubscriber;

export default function test() {
    describe(`FmsAcquiredFormTest3`, () => {

        beforeEach(async () => {
            subscriberOnError = await commonEvent.createSubscriber(onErrorForm_Event);
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberCast = await commonEvent.createSubscriber(subscriberFormCastEvent);
            subscriberSupply = await commonEvent.createSubscriber(onSupplyEvent);
            await sleepTime(1000);
        })

        afterEach(async() => {
            commonEvent.unsubscribe(subscriberOnError, () => unsubscribeCallback("afterEach unsubscribe subscriberOnError"));
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberCast, () => unsubscribeCallback("afterEach unsubscribe subscriberCast"));
            commonEvent.unsubscribe(subscriberSupply, () => unsubscribeCallback("afterEach unsubscribe subscriberSupply"));
        })

        /**
         * @tc.number: FMS_acquireForm_1600
         * @tc.name: A single form host (using a single thread) continuously creates 2 normal and 2 temporary forms.
         * @tc.desc: Verify that a single host (using a single thread) can successfully create multiple normal
         *           and temporary forms continuously.
         */
        it(`FMS_acquireForm_1600`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_1600 start`);

            let unSubscribeOnAcquiredCallBack_Normal2 = () => {
                console.info("====>FMS_acquireForm_1600 unSubscribeOnAcquiredCallBack_Normal2====>");
            }

            let unSubscribeOnAcquiredCallBack_Temp1 = () => {
                console.info("====>FMS_acquireForm_1600 unSubscribeOnAcquiredCallBack_Temp1====>");
            }

            let unSubscribeOnAcquiredCallBack_Temp2 = () => {
                console.info("====>FMS_acquireForm_1600 unSubscribeOnAcquiredCallBack_Temp2====>");
            }
            let unSubscribeOnAcquiredCallBack_Normal1 = () => {
                console.info("====>FMS_acquireForm_1600 unSubscribeOnAcquiredCallBack_Normal1 CallBack====>");
            }

            let delPublishCallBack_Temp2 = () => {
                console.info("!!!====>FMS_acquireForm_1600 delPublishCallBack_Temp2====>");
                setTimeout(async () => {
                    console.info('FMS_acquireForm_1600 delPublishCallBack_Temp2 end');
                    await sleepTime(3000);
                    console.info(`FMS_acquireForm_1600 end`);
                    done();
                }, 500);
            }

            let onAcquiredCallBack_Temp2 = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Temp2 data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Temp2)
                commonEvent.publish(deleteForm_Event, delPublishCallBack_Temp2);
            }

            let FMS_acquireForm_1600_Temp2 = async () => {
                console.info(`FMS_acquireForm_1600_Temp2 start`);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                console.info(`FMS_acquireForm_1600_Temp2 createSubscriber`);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Temp2);
                console.info(`FMS_acquireForm_1600_Temp2 subscribe`);
                await sleepTime(2000);
                console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",

                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    options.data = 'FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_1600_Temp2 onAcquiredCallBack_Temp2 publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1600_Temp2 end`);
            }

            let delPublishCallBack_Temp1 = () => {
                console.info("!!!====>FMS_acquireForm_1600 delPublishCallBack_Temp1====>");
                setTimeout( () => {
                    console.info('FMS_acquireForm_1600 delPublishCallBack_Temp1 end');
                    FMS_acquireForm_1600_Temp2();
                }, 50);
            }

            let onAcquiredCallBack_Temp1 = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Temp1 data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Temp1)
                commonEvent.publish(deleteForm_Event, delPublishCallBack_Temp1);
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Temp1 end====>");
            }

            let FMS_acquireForm_1600_Temp1 = async () => {
                console.info(`FMS_acquireForm_1600_Temp1 start`);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                console.info(`FMS_acquireForm_1600_Temp1 createSubscriber`);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Temp1);
                console.info(`FMS_acquireForm_1600_Temp1 subscribe`);
                await sleepTime(2000);
                console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",

                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    options.data = 'FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_1600_Temp1 onAcquiredCallBack_Temp1 publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1600_Temp1 end`);
            }

            let delPublishCallBack_Normal2 = () => {
                console.info("!!!====>FMS_acquireForm_1600 delPublishCallBack_Normal2====>");
                setTimeout(  () => {
                    console.info('FMS_acquireForm_1600 delPublishCallBack_Normal2 end');
                    FMS_acquireForm_1600_Temp1();
                }, 50);
            }

            let onAcquiredCallBack_Normal2 = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Normal2 data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal2)
                commonEvent.publish(deleteForm_Event, delPublishCallBack_Normal2);
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Normal2 end====>");
            }

            let FMS_acquireForm_1600_normal2 = async () => {
                console.info(`FMS_acquireForm_1600_normal2 start`);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                console.info(`FMS_acquireForm_1600_normal2 createSubscriber`);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal2);
                console.info(`FMS_acquireForm_1600_normal2 subscribe`);
                await sleepTime(2000);
                console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    options.data = 'FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_1600_normal2 onAcquiredCallBack_Normal2 publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1600_normal2 end`);
            }

            let delPublishCallBack_Normal1 = () => {
                console.info("!!!====>FMS_acquireForm_1600 delPublishCallBack_Normal1====>");
                setTimeout( () => {
                    console.info('FMS_acquireForm_1600 delPublishCallBack_Normal1 end');
                    FMS_acquireForm_1600_normal2();
                }, 50);
            }

            let onAcquiredCallBack_Normal1 = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Normal1 data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal1)
                commonEvent.publish(deleteForm_Event, delPublishCallBack_Normal1);
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Normal1 end====>");
            }

            let FMS_acquireForm_1600_normal1 = async () => {
                console.info(`FMS_acquireForm_1600_normal1 start`);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal1);
                await sleepTime(2000);
                console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    options.data = 'FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_1600_normal1 onAcquiredCallBack_Normal1 publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1600_normal1 end`);
            }
            FMS_acquireForm_1600_normal1();
        });

        /**
         * @tc.number: FMS_acquireForm_1800
         * @tc.name: Multiple form hosts create one normal form and one temporary form respectively.
         * @tc.desc: Verify that multiple hosts can successfully create multiple normal and temporary forms respectively.
         */
        it(`FMS_acquireForm_1800`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_1800 start`);

            let unSubscribeOnAcquiredCallBack_Temp2 = () => {
                console.info("====>FMS_acquireForm_1800 unSubscribeOnAcquiredCallBack_Temp2====>");
            }
            let unSubscribeOnAcquiredCallBack_Normal1 = () => {
                console.info("====>FMS_acquireForm_1800 unSubscribeOnAcquiredCallBack_Normal1 CallBack====>");
            }
            let unSubscribeOnAcquiredCallBack_Normal2 = () => {
                console.info("====>FMS_acquireForm_1800 unSubscribeOnAcquiredCallBack_Normal2====>");
            }
            let unSubscribeOnAcquiredCallBack_Temp1 = () => {
                console.info("====>FMS_acquireForm_1800 unSubscribeOnAcquiredCallBack_Temp1====>");
            }

            let delPublishCallBack_Temp2 = () => {
                console.info("!!!====>FMS_acquireForm_1800 delPublishCallBack_Temp2====>");
                setTimeout(async () => {
                    console.info('FMS_acquireForm_1800 delPublishCallBack_Temp2 end');
                    await sleepTime(3000);
                    console.info(`FMS_acquireForm_1800 end`);
                    done();
                }, 500);
            }

            let onAcquiredCallBack_Temp2 = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Temp2 data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Temp2)
                commonEvent.publish(deleteForm_Event, delPublishCallBack_Temp2);
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Temp2 end====>");
            }

            let FMS_acquireForm_1800_Temp2 = async () => {
                console.info(`FMS_acquireForm_1800_Temp2 start`);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                console.info(`FMS_acquireForm_1800_Temp2 createSubscriber`);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Temp2);
                console.info(`FMS_acquireForm_1800_Temp2 subscribe`);
                await sleepTime(2000);
                console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",

                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    options.data = 'FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_1800_Temp2 onAcquiredCallBack_Temp2 publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1800_Temp2 end`);
            }

            let delPublishCallBack_Temp1 = () => {
                console.info("!!!====>FMS_acquireForm_1800 delPublishCallBack_Temp1====>");
                setTimeout( () => {
                    console.info('FMS_acquireForm_1800 delPublishCallBack_Temp1 end');
                    FMS_acquireForm_1800_Temp2();
                }, 50);
            }

            let onAcquiredCallBack_Temp1 = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Temp1 data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Temp1)
                commonEvent.publish(deleteForm_Event, data, delPublishCallBack_Temp1);
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Temp1 end====>");
            }

            let FMS_acquireForm_1800_Temp1 = async () => {
                console.info(`FMS_acquireForm_1800_Temp1 start`);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                console.info(`FMS_acquireForm_1800_Temp1 createSubscriber`);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Temp1);
                console.info(`FMS_acquireForm_1800_Temp1 subscribe`);
                await sleepTime(2000);
                console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    options.data = 'FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_1800_Temp1 onAcquiredCallBack_Temp1 publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1800_Temp1 end`);
            }

            let delPublishCallBack_Normal2 = () => {
                console.info("!!!====>FMS_acquireForm_1800 delPublishCallBack_Normal2====>");
                setTimeout( () => {
                    console.info('FMS_acquireForm_1800 delPublishCallBack_Normal2 end');
                    FMS_acquireForm_1800_Temp1();
                }, 50);
            }

            let onAcquiredCallBack_Normal2 = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Normal2 data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal2)
                commonEvent.publish(deleteForm_Event, delPublishCallBack_Normal2);
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Normal2 end====>");
            }

            let FMS_acquireForm_1800_normal2 = async () => {
                console.info(`FMS_acquireForm_1800_normal2 start`);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                console.info(`FMS_acquireForm_1800_normal2 createSubscriber`);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal2);
                console.info(`FMS_acquireForm_1800_normal2 subscribe`);
                await sleepTime(2000);
                console.info(`FMS_acquireForm_1800_normal2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1800_normal2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    options.data = 'FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_1800_normal2 onAcquiredCallBack_Normal2 publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1800_normal2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1800_normal2 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1800_normal2 end`);
            }

            let delPublishCallBack_Normal1 = () => {
                console.info("!!!====>FMS_acquireForm_1800 delPublishCallBack_Normal1====>");
                setTimeout(async () => {
                    console.info('FMS_acquireForm_1800 delPublishCallBack_Normal1 end');
                    await sleepTime(3000);
                    FMS_acquireForm_1800_normal2();
                }, 50);
            }

            let onAcquiredCallBack_Normal1 = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Normal1 data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal1)
                commonEvent.publish(deleteForm_Event, delPublishCallBack_Normal1);
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Normal1 end====>");
            }

            let FMS_acquireForm_1800_normal1 = async() => {
                console.info(`FMS_acquireForm_1800_normal1 start`);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal1);
                console.info(`FMS_acquireForm_1800_normal1 subscribe`);
                await sleepTime(2000);
                console.info(`FMS_acquireForm_1800_normal1 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1800_normal1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    options.data = 'FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_1800_normal1 onAcquiredCallBack_Normal1 publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1800_normal1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1800_normal1 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1800_normal1 end`);
            }

            await FMS_acquireForm_1800_normal1();
            await sleepTime(2000)
        });

        /**
         * @tc.number: FMS_acquireForm_1900
         * @tc.name: Add a temporary form when the formId is set to 0.
         * @tc.desc: When the verification formId is set to 0, the temporary form is created successfully.
         */
        it(`FMS_acquireForm_1900`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_1900 start`);
            let onAcquiredCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1900 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_1900"))
                commonEvent.publish(deleteForm_Event, data, async (err) => {
                    console.info('FMS_acquireForm_1900 publish' + JSON.stringify(err));
                    await sleepTime(3000)
                    done()
                });
            }

            let onSupplyCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("====>FMS_acquireForm_1900 onSupplyCallBack====>" + JSON.stringify(data));
                if (data.data == "FMS_FormSupply_commonEvent") {
                    expect(data.code).assertEqual(0);
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_acquireForm_1900"));
                    commonEvent.publish(deleteForm_Event, data, (err) => {
                        console.info('FMS_acquireForm_1900 publish' + JSON.stringify(err));
                        data.data = 'FMS_FormOnAcquired_commonEvent';
                        commonEvent.publish("FMS_FormOnAcquired_commonEvent", data, () => {
                            console.info(`FMS_acquireForm_1900 onAcquiredCallBack publish start`)})
                    });
                }
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_1900 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_1900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormSupply_commonEvent';
                commonEvent.publish("FMS_FormSupply_commonEvent", options, () => {
                    console.info(`FMS_acquireForm_1900 onSupplyCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_1900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                commonEvent.publish("FMS_FormOnError_commonEvent", () => {
                    console.info(`FMS_acquireForm_0200  onErrorCallBack publish start`)})
            });

            console.info(`FMS_acquireForm_1900 featureAbility.startAbility end`);
            await sleepTime(3000);
        });

        /**
         * @tc.number: FMS_acquireForm_2100
         * @tc.name: When creating a temporary form, the formId is specified as the created normal formId.
         * @tc.desc: Failed to create a temporary form when verifying that the formId is set to create a normal formId.
         */
        it(`FMS_acquireForm_2100`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_2100 start`);
            let formId: string = '';

            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_2100 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("Parameter error. Possible causes: " +
                    "1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; 3.Parameter verification failed.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallBackCache("FMS_acquireForm_2100"));
                commonEvent.publish(deleteForm_Event, (err) => {
                    console.info('FMS_acquireForm_2100 publish' + JSON.stringify(err));
                });
            }

            let onAcquiredCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_2100 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_2100"))
                if(data.data) {
                    formId = data.data;
                }
                commonEvent.subscribe(subscriberOnError, onErrorCallBack);
                await sleepTime(2000);
                console.info(`FMS_acquireForm_2100 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": data.data,
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_2100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect(res).assertEqual(0);
                    done()
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_2100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    commonEvent.publish("FMS_FormOnError_commonEvent", () => {
                        console.info(`FMS_acquireForm_2100  onErrorCallBack publish start`)})
                });
                console.info(`FMS_acquireForm_2100 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_2100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_2100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_acquireForm_2100  onAcquiredCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_2100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_2100 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_2200
         * @tc.name: Cast to normal form when the temporary formId is set to negative.
         * @tc.desc: Failed to Cast to normal form when the temporary formId is set to negative
         */
        it(`FMS_acquireForm_2200`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_2200 start`);

            let onCastCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_2200 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormCast_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberCast, () => unsubscribeOnCastCallback("FMS_acquireForm_2200"))
                commonEvent.publish(deleteForm_Event,  async (err) => {
                    console.info('FMS_acquireForm_2200 publish' + JSON.stringify(err));
                    await sleepTime(3000)
                    done()
                });
            }

            commonEvent.subscribe(subscriberCast, onCastCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_2200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "temporaryId": "-1",
                        "castForm": true,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_2200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormCast_commonEvent';
                commonEvent.publish("FMS_FormCast_commonEvent", options, () => {
                    console.info(`FMS_acquireForm_2200 onCastCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_2200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);

            });
            console.info(`FMS_acquireForm_2200 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_2300
         * @tc.name: Cast to normal form when the temporary formId is set to 0.
         * @tc.desc: Failed to convert to normal form when verifying that the temporary formIdis set to 0
         */
        it(`FMS_acquireForm_2300`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_2300 start`);

            let onCastCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_2300 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormCast_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberCast, () => unsubscribeOnCastCallback("FMS_acquireForm_2300"))
                commonEvent.publish(deleteForm_Event, async (err) => {
                    console.info('FMS_acquireForm_2300 publish' + JSON.stringify(err));
                    await sleepTime(3000)
                    done()
                });
            }
            commonEvent.subscribe(subscriberCast, onCastCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_2300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "temporaryId": "0",
                        "castForm": true,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_2300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormCast_commonEvent';
                commonEvent.publish("FMS_FormCast_commonEvent", options, () => {
                    console.info(`FMS_acquireForm_2300 onCastCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_2300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_2300 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_2400
         * @tc.name: Non affiliated temporary form ID to normal form.
         * @tc.desc: Failed to convert non affiliated temporary form ID to normal form.
         */
        it(`FMS_acquireForm_2400`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_2400 start`);

            let onCastCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_2400 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormCast_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberCast, () => unsubscribeOnCastCallback("FMS_acquireForm_2400"))
                commonEvent.publish(deleteForm_Event, async (err) => {
                    console.info('FMS_acquireForm_2400 publish' + JSON.stringify(err));
                    await sleepTime(3000);
                    done()
                });
            }

            let onAcquiredCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_2400 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_2400"))
                commonEvent.subscribe(subscriberCast, onCastCallBack);
                await sleepTime(2000);
                console.info(`FMS_acquireForm_2400 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "temporaryId": data.data,
                            "castForm": true,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_2400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormCast_commonEvent';
                    commonEvent.publish("FMS_FormCast_commonEvent", data, () => {
                        console.info(`FMS_acquireForm_2400 onCastCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_2400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_2400 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_2400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_2400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_acquireForm_2400 onAcquiredCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_2400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);

            });
            console.info(`FMS_acquireForm_2400 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_2500
         * @tc.name: cast non-existent temporary formId to normal form.
         * @tc.desc: Failed to verify that the temporary formId that does not exist is casted to normal form.
         */
        it(`FMS_acquireForm_2500`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_2500 start`);

            let onCastCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_2500 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormCast_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberCast, () => unsubscribeOnCastCallback("FMS_acquireForm_2500"))
                commonEvent.publish(deleteForm_Event, async () => {
                    console.info('FMS_acquireForm_2500 publish  deleteForm_Event');
                    await sleepTime(1000)
                    done()
                });
            }
            commonEvent.subscribe(subscriberCast, onCastCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_2500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "temporaryId": "123456789",
                        "castForm": true,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_2500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormCast_commonEvent';
                commonEvent.publish("FMS_FormCast_commonEvent", options, () => {
                    console.info(`FMS_acquireForm_2500 onCastCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_2500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);

            });
            console.info(`FMS_acquireForm_2500 featureAbility.startAbility end`);
            await sleepTime(3000)
        });

       /**
         * @tc.number: FMS_acquireForm_2600
         * @tc.name: When the normal form does not reach the maximum value created by the form, the temporary form changes to the normal form.
         * @tc.desc: Verify that when the normal form does not reach the maximum value created by the form.
         *           the temporary form can be successfully casted to the normal form.
         */
        it(`FMS_acquireForm_2600`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_2600 start`);

            let onCastCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_2600 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormCast_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberCast, () => unsubscribeOnCastCallback("FMS_acquireForm_2600"))
                commonEvent.publish(deleteForm_Event, async () => {
                    console.info("FMS_acquireForm_2600  test end" );
                    done()
                    await sleepTime(1000)
                });
            }

            let onAcquiredCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_2600 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_2600"))

                console.info(`FMS_acquireForm_2600 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "temporaryId": data.data,
                            "castForm": true,
                            "isCreate": false
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_2600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormCast_commonEvent';
                    commonEvent.publish("FMS_FormCast_commonEvent", data, () => {
                        console.info(`FMS_acquireForm_2600 onCastCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_2600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_2600 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            commonEvent.subscribe(subscriberCast, onCastCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_2600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_2600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_acquireForm_2600 onAcquiredCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_2600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_2600 featureAbility.startAbility end`);
        });
    });
}



const delPublishCallBack = async (tcNumber: string, done: () => void) => {
    console.info(`${tcNumber} delPublishCallBack start`);
    setTimeout(() => {
        console.info(`${tcNumber} delPublishCallBack end`);
        done();
    }, 1000);
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

const unsubscribeOnErrorCallback = (tcNumber: string) => {
    console.debug(`====>${tcNumber} unsubscribeOnErrorCallback====>`);
}

const unsubscribeOnAcquiredCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unSubscribeOnAcquiredCallback====>`);
}

const unsubscribeSupplyCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unSubscribeSupplyCallback====>`);
}

const unsubscribeOnErrorCallBackCache = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeOnErrorCallBackCache CallBack====>`);
}

const unsubscribeOnAcquiredCallBackCache = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeOnAcquiredCallBackCache CallBack====>`);
}

const unsubscribeOnCastCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeOnCastCallback====>`);
}