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
import { beforeEach, afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
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
    describe(`FmsAcquiredFormTest`, () => {

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
         * @tc.number: FMS_acquireForm_0200
         * @tc.name: The form host does not have permission to use the form
         * @tc.desc: Failed to create a form when verifying that the form host does not have form permission.
         */
        it(`FMS_acquireForm_0200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_acquireForm_0200 start`);

            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_0200 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("Permissions denied.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_0200"));
                console.info(`FMS_acquireForm_0200 end`);
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_0200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostnoperm",
                    abilityName: "com.ohos.st.formsystemhostnoperm.MainAbility",
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
                console.info(`FMS_acquireForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                expect(res).assertEqual(0);
                done();
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                commonEvent.publish("FMS_FormOnError_commonEvent", () => {
                    console.info(`FMS_acquireForm_0200  onErrorCallBack publish start`)})
            });
            console.info(`FMS_acquireForm_0200 featureAbility.startAbility end`);
            await sleepTime(3000)
        });

        /**
         * @tc.number: FMS_acquireForm_0300
         * @tc.name: Failed to add form when parameter formId is wrong.
         * @tc.desc: Failed to create form when verifying that the parameter (formId) of creating form is wrong.
         */
        it(`FMS_acquireForm_0300`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_acquireForm_0300 start`);
            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_0300 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("Parameter error. Possible causes: " +
                    "1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; 3.Parameter verification failed.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_0300"));
                console.info(`FMS_acquireForm_0300 end`);
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_0300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                expect(res).assertEqual(0);
                done();
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                commonEvent.publish("FMS_FormOnError_commonEvent", () => {
                    console.info(`FMS_acquireForm_0300  onErrorCallBack publish start`)})
            });
            console.info(`FMS_acquireForm_0300 featureAbility.startAbility end`);
            await sleepTime(3000)
        });

        /**
        * @tc.number: FMS_acquireForm_0400
        * @tc.name: Failed to add form when parameter bundlename is wrong.
        * @tc.desc: Form creation failed when verifying the wrong parameter (bundlename) of form creation.
        */
        it(`FMS_acquireForm_0400`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_acquireForm_0400 start`);
            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_0400 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("Parameter error. Possible causes: " +
                    "1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; 3.Parameter verification failed.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_0400"));
                console.info(`FMS_acquireForm_0400 end`);
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_0400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice123",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                expect(res).assertEqual(0);
                done();
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                commonEvent.publish("FMS_FormOnError_commonEvent", () => {
                    console.info(`FMS_acquireForm_0400  onErrorCallBack publish start`)})
            });
            console.info(`FMS_acquireForm_0400 featureAbility.startAbility end`);
            await sleepTime(3000)
        });

        /**
         * @tc.number: FMS_acquireForm_0500
         * @tc.name: Failed to add form when parameter moduleName is wrong.
         * @tc.desc: Form creation failed when verifying the wrong parameter (moduleName) of form creation.
         */
        it(`FMS_acquireForm_0500`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_acquireForm_0500 start`);
            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_0500 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("Parameter error. Possible causes: " +
                    "1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; 3.Parameter verification failed.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_0500"));
                console.info(`FMS_acquireForm_0500 end`);
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_0500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry123",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                expect(res).assertEqual(0);
                done();
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                commonEvent.publish("FMS_FormOnError_commonEvent", () => {
                    console.info(`FMS_acquireForm_0500  onErrorCallBack publish start`)})
            });
            console.info(`FMS_acquireForm_0500 featureAbility.startAbility end`);
            await sleepTime(3000)
        });

        /**
        * @tc.number: FMS_acquireForm_0600
        * @tc.name: Failed to add form when parameter formName is wrong.
        * @tc.desc: Form creation failed when verifying the wrong parameter (formName) of form creation.
        */
        it(`FMS_acquireForm_0600`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_acquireForm_0600 start`);
            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_0600 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("Parameter error. Possible causes: " +
                    "1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; 3.Parameter verification failed.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_0600"));
                console.info(`FMS_acquireForm_0600 end`);
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001987",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                expect(res).assertEqual(0);
                done();
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                commonEvent.publish("FMS_FormOnError_commonEvent", () => {
                    console.info(`FMS_acquireForm_0600  onErrorCallBack publish start`)})
            });
            console.info(`FMS_acquireForm_0600 featureAbility.startAbility end`);
            await sleepTime(3000)
        });

        /**
        * @tc.number: FMS_acquireForm_0700
        * @tc.name: Failed to add form when parameter abilityName is wrong.
        * @tc.desc: Form creation failed when verifying the wrong parameter (abilityName) of form creation.
        */
        it(`FMS_acquireForm_0700`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_acquireForm_0700 start`);
            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_0700 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("Parameter error. Possible causes: " +
                    "1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; 3.Parameter verification failed.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_0700"));
                console.info(`FMS_acquireForm_0700 end`);
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_0700 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility123",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                expect(res).assertEqual(0);
                done();
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                commonEvent.publish("FMS_FormOnError_commonEvent", () => {
                    console.info(`FMS_acquireForm_0700  onErrorCallBack publish start`)})
            });
            console.info(`FMS_acquireForm_0700 featureAbility.startAbility end`);
            await sleepTime(3000)
        });

        /**
        * @tc.number: FMS_acquireForm_1000
        * @tc.name: Failed to add form when parameter form dimension is wrong.
        * @tc.desc: Form creation failed when verifying the wrong parameter (form dimension) of form creation.
        */
        it(`FMS_acquireForm_1000`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_acquireForm_1000 start`);
            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1000 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("Parameter error. Possible causes: " +
                    "1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; 3.Parameter verification failed.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_1000"));
                console.info(`FMS_acquireForm_1000 end`);
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_1000 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                        "ability": "FormAbility",
                        "moduleName": "entry",
                        "dimension": 4,
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                expect(res).assertEqual(0);
                done();
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                commonEvent.publish("FMS_FormOnError_commonEvent", () => {
                    console.info(`FMS_acquireForm_1000  onErrorCallBack publish start`)})
            });
            console.info(`FMS_acquireForm_1000 featureAbility.startAbility end`);
            await sleepTime(3000)
        });

        /**
        * @tc.number: FMS_acquireForm_1100
        * @tc.name: When the formId is set to 0, a non cached form is added.
        * @tc.desc: Verify that the non cache form can be successfully created.
        */
        it(`FMS_acquireForm_1100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_acquireForm_1100 start`);

            let onSupplyCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("====>FMS_acquireForm_1100 onSupplyCallBack====>" + JSON.stringify(data));
                if (data.data == "FMS_FormSupply_commonEvent") {
                    expect(data.code).assertEqual(0);
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_acquireForm_1100"));
                    commonEvent.publish(deleteForm_Event, data, async (err) => {
                        console.info('FMS_acquireForm_1100 publish' + JSON.stringify(err));
                        await sleepTime(3000)
                        done()
                    });
                }
            }

            let onAcquiredCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1100 onAcquiredCallBack data:====>" + JSON.stringify(data));
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_1100"));
                if (data.data == "FMS_FormOnAcquired_commonEvent") {
                    expect(data.code).assertEqual(0);
                    commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info('FMS_acquireForm_1100 publish' + JSON.stringify(err));
                    data.data = 'FMS_FormSupply_commonEvent';
                    commonEvent.publish("FMS_FormSupply_commonEvent", data, () => {
                        console.info(`FMS_acquireForm_1100 onSupplyCallBack publish start`)})
                    });
                }
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            await sleepTime(2000);

            console.info(`FMS_acquireForm_1100 featureAbility.startAbility start`);
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
                console.info(`FMS_acquireForm_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_acquireForm_1100  onAcquiredCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_1100 featureAbility.startAbility end`);
            await sleepTime(3000);
        });

        /**
        * @tc.number: FMS_acquireForm_1200
        * @tc.name: When the formId is set to 0, a non cached form is added.
        * @tc.desc: Verify that the non cache form can be successfully created.
        */
        it(`FMS_acquireForm_1200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_acquireForm_1200 start`);

            let onSupplyCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("====>FMS_acquireForm_1200 onSupplyCallBack====>" + JSON.stringify(data));
                if (data.data == "FMS_FormSupply_commonEvent") {
                    expect(data.code).assertEqual(0);
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_acquireForm_1200"));
                    commonEvent.publish(deleteForm_Event, data, async (err) => {
                        console.info('FMS_acquireForm_1200 publish' + JSON.stringify(err));
                        await sleepTime(3000)
                        done()
                    });
                }
            }

            let onAcquiredCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1200 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_1200"))
                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info('FMS_acquireForm_1200 publish' + JSON.stringify(err));
                });
                data.data = 'FMS_FormSupply_commonEvent';
                commonEvent.publish("FMS_FormSupply_commonEvent", data,() => {
                    console.info(`FMS_acquireForm_1200 onSupplyCallBack publish start`)})
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_1200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostb",
                    abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicee.hmservice",
                        "ability": "com.form.formsystemtestservicee.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res) => {
                console.info(`FMS_acquireForm_1200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_acquireForm_1200 onStateCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_1200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_1200 featureAbility.startAbility end`);
            await sleepTime(3000)
        });

        /**
        * @tc.number: FMS_acquireForm_1400
        * @tc.name: FormId does not match other parameters when adding a cached form.
        * @tc.desc: Failed to create a cached form when verifying that FormId does not match other parameters.
        */
        it(`FMS_acquireForm_1400`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_acquireForm_1400 start`);
            let formId: string = '';

            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1400 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("The ID of the form to be operated does not exist");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallBackCache("FMS_acquireForm_1400"));
                let commonEventPublishData: commonEventPublishDataType = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_acquireForm_1400 publish' + JSON.stringify(err));
                });
            }

            let onAcquiredCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1400 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_1400"))
                if(data.data) {
                    formId = data.data;
                }

                commonEvent.subscribe(subscriberOnError, onErrorCallBack);
                await sleepTime(2000);
                console.info(`FMS_acquireForm_1400 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "1",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect(res).assertEqual(0);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    commonEvent.publish("FMS_FormOnError_commonEvent", () => {
                        console.info(`FMS_acquireForm_1400  onErrorCallBack publish start`)})
                });
                console.info(`FMS_acquireForm_1400 featureAbility.startAbility again end`);
                await sleepTime(3000);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            await sleepTime(2000);
            console.info(`FMS_acquireForm_1400 featureAbility.startAbility start`);
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
                console.info(`FMS_acquireForm_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_acquireForm_1400 onStateCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_1400 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_acquireForm_1500
        * @tc.name: Add a cached form.
        * @tc.desc: Verify that the cached form can be successfully created.
        */
        it(`FMS_acquireForm_1500`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.info(`FMS_acquireForm_1500 start`);
            let formId1: string = '';
            let onCreateCount = 0;

            let onSupplyCallBack = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("====>FMS_acquireForm_1500 onSupplyCallBack====>" + JSON.stringify(data));
                if (data.data == "FMS_FormSupply_commonEvent") {
                    onCreateCount++;
                    console.info("====>FMS_acquireForm_1500 onSupplyCallBack====>" + `${onCreateCount}`);
                    if (onCreateCount == 2) {
                        commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_acquireForm_1500"))
                    }
                    data.data = 'onAcquiredCallBackCache';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", data, () => {
                        console.info(`FMS_acquireForm_1500 onAcquiredCallBackCache publish start`)});
                }
            }

            let onAcquiredCallBackCache = (_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1500 onAcquiredCallBackCache data:====>" + JSON.stringify(data));
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallBackCache("FMS_acquireForm_1500"));
                expect(data.data).assertEqual("onAcquiredCallBackCache");
                commonEvent.publish(deleteForm_Event, data, async (err) => {
                    console.info('FMS_acquireForm_1500 publish' + JSON.stringify(err));
                    await sleepTime(3000)
                    done()
                });
            }

            let onAcquiredCallBack = async(_:BusinessError, data: CommonEventManager.CommonEventData) => {
                console.info("!!!====>FMS_acquireForm_1500 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);

                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_1500"))
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBackCache);
                await sleepTime(2000);
                console.info(`FMS_acquireForm_1500 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                        parameters: {
                            "formId": data.data,
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormSupply_commonEvent';
                    commonEvent.publish("FMS_FormSupply_commonEvent", data, () => {
                        console.info(`FMS_acquireForm_1500 onSupplyCallBack publish start`)});

                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1500 featureAbility.startAbilityhost again error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_1500 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            await sleepTime(2000);

            console.info(`FMS_acquireForm_1500 featureAbility.startAbility start`);
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
                console.info(`FMS_acquireForm_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_acquireForm_1500 onAcquiredCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.info(`FMS_acquireForm_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);

            });
            console.info(`FMS_acquireForm_1500 featureAbility.startAbility end`);
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