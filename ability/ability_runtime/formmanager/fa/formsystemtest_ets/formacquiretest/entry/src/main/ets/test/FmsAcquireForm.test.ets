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

import featureAbility from "@ohos.ability.featureAbility";
import commonEvent from '@ohos.commonEvent';
import { beforeEach, afterEach, describe, expect, it } from '@ohos/hypium'

var onErrorForm_Event = {
    events: ["FMS_FormOnError_commonEvent"],
};
var onAcquiredForm_Event = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};
var subscriberFormCastEvent = {
    events: ["FMS_FormCast_commonEvent"],
};
var onSupplyEvent = {
    events: ["FMS_FormSupply_commonEvent"],
};

const unsubscribeCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

var deleteForm_Event = "FMS_FormDelete_commonEvent";

var subscriberOnError;
var subscriberOnAcquired;
var subscriberCast;
var subscriberSupply;

export default function test() {
    describe(`FmsAcquiredFormTest`, () => {

        beforeEach(async () => {
            subscriberOnError = await commonEvent.createSubscriber(onErrorForm_Event);
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberCast = await commonEvent.createSubscriber(subscriberFormCastEvent);
            subscriberSupply = await commonEvent.createSubscriber(onSupplyEvent);
            await sleep(1000);
        })

        afterEach(async() => {
            commonEvent.unsubscribe(subscriberOnError, () => unsubscribeCallback("afterEach unsubscribe subscriberOnError"));
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberCast, () => unsubscribeCallback("afterEach unsubscribe subscriberCast"));
            commonEvent.unsubscribe(subscriberSupply, () => unsubscribeCallback("afterEach unsubscribe subscriberSupply"));

            let wantInfo = {
                want: {
                    bundleName: "com.ohos.st.formacquiretest",
                    abilityName: "com.ohos.st.formacquiretest.TestAbility"
                }
            }
            await featureAbility.startAbility(wantInfo).then((data) => {
              console.log("FMS_acquireForm startAbility data : " + JSON.stringify(data));
            }).catch((err) => {
              console.log("FMS_acquireForm startAbility err : " + JSON.stringify(err));
            })
            await sleep(1000);
        })

        /**
         * @tc.number: FMS_acquireForm_0200
         * @tc.name: The form host does not have permission to use the form
         * @tc.desc: Failed to create a form when verifying that the form host does not have form permission.
         */
        it(`FMS_acquireForm_0200`, 0, async (done) => {
            console.info(`FMS_acquireForm_0200 start`);
            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_0200 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("check permission deny, need to request ohos.permission.REQUIRE_FORM.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_0200"));
                console.info(`FMS_acquireForm_0200 end`);
                done();
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_0200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostnoperm",
                    abilityName: "com.ohos.st.formsystemhostnoperm.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_0200 featureAbility.startAbility end`);
            await sleepTime(3000)
        });
        /**
         * @tc.number: FMS_acquireForm_0300
         * @tc.name: Failed to add form when parameter formId is wrong.
         * @tc.desc: Failed to create form when verifying that the parameter (formId) of creating form is wrong.
         */
        it(`FMS_acquireForm_0300`, 0, async (done) => {
            console.info(`FMS_acquireForm_0300 start`);
            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_0300 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_0300"));
                console.info(`FMS_acquireForm_0300 end`);
                done();
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_0300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_0300 featureAbility.startAbility end`);
            await sleepTime(3000)
        });
        /**
        * @tc.number: FMS_acquireForm_0400
        * @tc.name: Failed to add form when parameter bundlename is wrong.
        * @tc.desc: Form creation failed when verifying the wrong parameter (bundlename) of form creation.
        */
        it(`FMS_acquireForm_0400`, 0, async (done) => {
            console.info(`FMS_acquireForm_0400 start`);
            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_0400 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_0400"));
                console.info(`FMS_acquireForm_0400 end`);
                done();
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_0400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice123",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_0400 featureAbility.startAbility end`);
            await sleepTime(3000)
        });
        /**
         * @tc.number: FMS_acquireForm_0500
         * @tc.name: Failed to add form when parameter moduleName is wrong.
         * @tc.desc: Form creation failed when verifying the wrong parameter (moduleName) of form creation.
         */
        it(`FMS_acquireForm_0500`, 0, async (done) => {
            console.info(`FMS_acquireForm_0500 start`);
            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_0500 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_0500"));
                console.info(`FMS_acquireForm_0500 end`);
                done();
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_0500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry123",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_0500 featureAbility.startAbility end`);
            await sleepTime(3000)
        });
        /**
        * @tc.number: FMS_acquireForm_0600
        * @tc.name: Failed to add form when parameter formName is wrong.
        * @tc.desc: Form creation failed when verifying the wrong parameter (formName) of form creation.
        */
        it(`FMS_acquireForm_0600`, 0, async (done) => {
            console.info(`FMS_acquireForm_0600 start`);
            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_0600 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_0600"));
                console.info(`FMS_acquireForm_0600 end`);
                done();
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001987",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_0600 featureAbility.startAbility end`);
            await sleepTime(3000)
        });
        /**
        * @tc.number: FMS_acquireForm_0700
        * @tc.name: Failed to add form when parameter abilityName is wrong.
        * @tc.desc: Form creation failed when verifying the wrong parameter (abilityName) of form creation.
        */
        it(`FMS_acquireForm_0700`, 0, async (done) => {
            console.info(`FMS_acquireForm_0700 start`);
            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_0700 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_0700"));
                console.info(`FMS_acquireForm_0700 end`);
                done();
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_0700 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility123",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_0700 featureAbility.startAbility end`);
            await sleepTime(3000)
        });
        /**
        * @tc.number: FMS_acquireForm_1000
        * @tc.name: Failed to add form when parameter form dimension is wrong.
        * @tc.desc: Form creation failed when verifying the wrong parameter (form dimension) of form creation.
        */
        it(`FMS_acquireForm_1000`, 0, async (done) => {
            console.info(`FMS_acquireForm_1000 start`);
            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_1000 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_1000"));
                console.info(`FMS_acquireForm_1000 end`);
                done();
            }
            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_1000 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "dimension": 4,
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_1000 featureAbility.startAbility end`);
            await sleepTime(3000)
        });

        /**
        * @tc.number: FMS_acquireForm_1100
        * @tc.name: When the formId is set to 0, a non cached form is added.
        * @tc.desc: Verify that the non cache form can be successfully created.
        */
        it(`FMS_acquireForm_1100`, 0, async (done) => {
            console.info(`FMS_acquireForm_1100 start`);
            let formId1;
            let formId2;

            function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_1100 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_1100"));
                formId1 = data.data;

                if (formId1 && formId2) {
                    expect(formId1).assertEqual(formId2);
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_acquireForm_1100 publish' + JSON.stringify(err));
                    });
                }
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onCreate") {
                    console.info("====>FMS_acquireForm_1100 onSupplyCallBack====>" + JSON.stringify(data));
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_acquireForm_1100"));
                    let retData = JSON.parse(data.parameters.parameters);

                    let bundleName = retData.bundleName;
                    expect(bundleName).assertEqual("com.form.formsystemtestservicea.hmservice");
                    let abilityName = retData.abilityName;
                    expect(abilityName).assertEqual("com.form.formsystemtestservicea.hmservice.FormAbility");
                    let moduleName = retData.parameters['ohos.extra.param.key.module_name'];
                    expect(moduleName).assertEqual("entry");
                    let formName = retData.parameters['ohos.extra.param.key.form_name'];
                    expect(formName).assertEqual("Form_Js001");
                    let formDimension = retData.parameters['ohos.extra.param.key.form_dimension'];
                    expect(formDimension).assertEqual(1);
                    let tempFormFlag = retData.parameters['ohos.extra.param.key.form_temporary'];
                    expect(tempFormFlag).assertEqual(false);

                    formId2 = retData.parameters['ohos.extra.param.key.form_identity'];

                    if (formId1 && formId2) {
                        expect(formId1).assertEqual(formId2);
                        let commonEventPublishData = {
                            data: formId1
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                            console.info('FMS_acquireForm_1100 publish' + JSON.stringify(err));
                            done()
                        });
                    }
                }
            }
            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            console.info(`FMS_acquireForm_1100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_1100 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_acquireForm_1200
        * @tc.name: When the formId is set to 0, a non cached form is added.
        * @tc.desc: Verify that the non cache form can be successfully created.
        */
        it(`FMS_acquireForm_1200`, 0, async (done) => {
            console.info(`FMS_acquireForm_1200 start`);
            let formId1;
            let formId2;

            function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_1200 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_1200"))
                formId1 = data.data;
                console.info("!!!====>FMS_acquireForm_1200 onAcquiredCallBack formId1:====>" + formId1);
                if (formId1 && formId2) {
                    expect(formId1).assertEqual(formId2);
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                        console.info('FMS_acquireForm_1200 publish' + JSON.stringify(err));
                    });
                }
            }
            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onCreate") {
                    console.info("====>FMS_acquireForm_1200 onSupplyCallBack====>" + JSON.stringify(data));
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_acquireForm_1200"));
                    let retData = JSON.parse(data.parameters.parameters);

                    let bundleName = retData.bundleName;
                    expect(bundleName).assertEqual("com.form.formsystemtestservicee.hmservice");
                    let abilityName = retData.abilityName;
                    expect(abilityName).assertEqual("com.form.formsystemtestservicee.hmservice.FormAbility");
                    let moduleName = retData.parameters['ohos.extra.param.key.module_name'];
                    expect(moduleName).assertEqual("entry");
                    let formName = retData.parameters['ohos.extra.param.key.form_name'];
                    expect(formName).assertEqual("Form_Js001");
                    let formDimension = retData.parameters['ohos.extra.param.key.form_dimension'];
                    expect(formDimension).assertEqual(1);
                    let tempFormFlag = retData.parameters['ohos.extra.param.key.form_temporary'];
                    expect(tempFormFlag).assertEqual(false);

                    formId2 = retData.parameters['ohos.extra.param.key.form_identity'];
                    console.info("!!!====>FMS_acquireForm_1200 onSupplyCallBack formId2:====>" + formId2);
                    if (formId1 && formId2) {
                        expect(formId1).assertEqual(formId2);
                        let commonEventPublishData = {
                            data: formId1
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                            console.info('FMS_acquireForm_1200 publish' + JSON.stringify(err));
                            done()
                        });
                    }
                }
            }
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
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
            }).then((res: any) => {
                console.info(`FMS_acquireForm_1200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_1200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_1200 featureAbility.startAbility end`);
            await sleepTime(3000)
            done()
        });
        /**
        * @tc.number: FMS_acquireForm_1400
        * @tc.name: FormId does not match other parameters when adding a cached form.
        * @tc.desc: Failed to create a cached form when verifying that FormId does not match other parameters.
        */
        it(`FMS_acquireForm_1400`, 0, async (done) => {
            console.info(`FMS_acquireForm_1400 start`);
            var formId;

            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_1400 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("the requested form id is not existed on fms.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallBackCache("FMS_acquireForm_1400"));
                var commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_acquireForm_1400 publish' + JSON.stringify(err));
                    done()
                });
            }
            async function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_1400 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_1400"))
                formId = data.data;
                // add cache form
                commonEvent.subscribe(subscriberOnError, onErrorCallBack);
                console.info(`FMS_acquireForm_1400 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "1",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`FMS_acquireForm_1400 featureAbility.startAbility again end`);
                await sleepTime(3000)
                
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.info(`FMS_acquireForm_1400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_1400 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_acquireForm_1500
        * @tc.name: Add a cached form.
        * @tc.desc: Verify that the cached form can be successfully created.
        */
        it(`FMS_acquireForm_1500`, 0, async (done) => {
            console.info(`FMS_acquireForm_1500 start`);
            let formId1;
            let formId2;
            let onCreateCount = 0;

            function onAcquiredCallBackCache(_, data) {
                console.info("!!!====>FMS_acquireForm_1500 onAcquiredCallBackCache data:====>" + JSON.stringify(data));
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallBackCache("FMS_acquireForm_1500"));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                formId2 = data.data;
                if (formId1 && formId2) {
                    expect(formId1).assertEqual(formId2);
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                        console.info('FMS_acquireForm_1500 publish' + JSON.stringify(err));
                        done()
                    });
                }
            }
            async function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_1500 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_1500"))
                formId1 = data.data;
                // add cache form
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBackCache);
                console.info(`FMS_acquireForm_1500 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                        parameters: {
                            "formId": formId1,
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`FMS_acquireForm_1500 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onCreate") {
                    console.info("====>FMS_acquireForm_1500 onSupplyCallBack====>" + JSON.stringify(data));
                    onCreateCount++;
                    if (onCreateCount == 2) {
                        commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_acquireForm_1500"))
                    }
                    if (formId1 && formId2) {
                        expect(formId1).assertEqual(formId2);
                        let commonEventPublishData = {
                            data: formId1
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                        console.info('FMS_acquireForm_1500 publish' + JSON.stringify(err));
                        });
                    }
                }
            }

            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            console.info(`FMS_acquireForm_1500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_1500 featureAbility.startAbility end`);
            await sleepTime(3000)
        });

        /**
         * @tc.number: FMS_acquireForm_1600
         * @tc.name: A single form host (using a single thread) continuously creates 2 normal and 2 temporary forms.
         * @tc.desc: Verify that a single host (using a single thread) can successfully create multiple normal
         *           and temporary forms continuously.
         */
        it(`FMS_acquireForm_1600`, 0, async (done) => {
            console.info(`FMS_acquireForm_1600 start`);

            function delPublishCallBack_Normal1() {
                console.info("!!!====>FMS_acquireForm_1600 delPublishCallBack_Normal1====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1600 delPublishCallBack_Normal1 end');
                    FMS_acquireForm_1600_normal2();
                }, 50);
            }
            function onAcquiredCallBack_Normal1(_, data) {
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Normal1 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal1)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhost",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Normal1);
            }
            function unSubscribeOnAcquiredCallBack_Normal1() {
                console.info("====>FMS_acquireForm_1600 unSubscribeOnAcquiredCallBack_Normal1 CallBack====>");
            }

            async function FMS_acquireForm_1600_normal1() {
                console.info(`FMS_acquireForm_1600_normal1 start`);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal1);
                console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });

                console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1600_normal1 end`);
            }

            function delPublishCallBack_Normal2() {
                console.info("!!!====>FMS_acquireForm_1600 delPublishCallBack_Normal2====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1600 delPublishCallBack_Normal2 end');
                    FMS_acquireForm_1600_Temp1();
                }, 50);
            }
            function onAcquiredCallBack_Normal2(_, data) {
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Normal2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal2)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhost",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Normal2);
            }
            function unSubscribeOnAcquiredCallBack_Normal2() {
                console.info("====>FMS_acquireForm_1600 unSubscribeOnAcquiredCallBack_Normal2====>");
            }
            async function FMS_acquireForm_1600_normal2() {
                console.info(`FMS_acquireForm_1600_normal2 start`);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal2);
                console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });

                console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1600_normal2 end`);
            }

            function delPublishCallBack_Temp1() {
                console.info("!!!====>FMS_acquireForm_1600 delPublishCallBack_Temp1====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1600 delPublishCallBack_Temp1 end');
                    FMS_acquireForm_1600_Temp2();
                }, 50);
            }
            function onAcquiredCallBack_Temp1(_, data) {
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Temp1 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Temp1)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhost",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Temp1);
            }
            function unSubscribeOnAcquiredCallBack_Temp1() {
                console.info("====>FMS_acquireForm_1600 unSubscribeOnAcquiredCallBack_Temp1====>");
            }

            async function FMS_acquireForm_1600_Temp1() {
                console.info(`FMS_acquireForm_1600_Temp1 start`);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Temp1);
                console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",

                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });

                console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1600_Temp1 end`);
            }

            function delPublishCallBack_Temp2() {
                console.info("!!!====>FMS_acquireForm_1600 delPublishCallBack_Temp2====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1600 delPublishCallBack_Temp2 end');
                    console.info(`FMS_acquireForm_1600 end`);
                    done();
                }, 500);
            }
            function onAcquiredCallBack_Temp2(_, data) {
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Temp2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Temp2)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhost",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Temp2);
            }
            function unSubscribeOnAcquiredCallBack_Temp2() {
                console.info("====>FMS_acquireForm_1600 unSubscribeOnAcquiredCallBack_Temp2====>");
            }

            async function FMS_acquireForm_1600_Temp2() {
                console.info(`FMS_acquireForm_1600_Temp2 start`);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Temp2);
                console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",

                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });

                console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1600_Temp2 end`);
            }

            FMS_acquireForm_1600_normal1();
        });
        /**
         * @tc.number: FMS_acquireForm_1800
         * @tc.name: Multiple form hosts create one normal form and one temporary form respectively.
         * @tc.desc: Verify that multiple hosts can successfully create multiple normal and temporary forms respectively.
         */
        it(`FMS_acquireForm_1800`, 0, async (done) => {
            console.info(`FMS_acquireForm_1800 start`);

            function delPublishCallBack_Normal1() {
                console.info("!!!====>FMS_acquireForm_1800 delPublishCallBack_Normal1====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1800 delPublishCallBack_Normal1 end');
                    FMS_acquireForm_1800_normal2();
                }, 50);
            }
            function onAcquiredCallBack_Normal1(_, data) {
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Normal1 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal1)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhost",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Normal1);
            }
            function unSubscribeOnAcquiredCallBack_Normal1() {
                console.info("====>FMS_acquireForm_1800 unSubscribeOnAcquiredCallBack_Normal1 CallBack====>");
            }

            async function FMS_acquireForm_1800_normal1() {
                console.info(`FMS_acquireForm_1800_normal1 start`);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal1);

                console.info(`FMS_acquireForm_1800_normal1 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1800_normal1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1800_normal1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });

                console.info(`FMS_acquireForm_1800_normal1 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1800_normal1 end`);
            }

            function delPublishCallBack_Normal2() {
                console.info("!!!====>FMS_acquireForm_1800 delPublishCallBack_Normal2====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1800 delPublishCallBack_Normal2 end');
                    FMS_acquireForm_1800_Temp1();
                }, 50);
            }
            function onAcquiredCallBack_Normal2(_, data) {
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Normal2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal2)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostb",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Normal2);
            }
            function unSubscribeOnAcquiredCallBack_Normal2() {
                console.info("====>FMS_acquireForm_1800 unSubscribeOnAcquiredCallBack_Normal2====>");
            }
            async function FMS_acquireForm_1800_normal2() {
                console.info(`FMS_acquireForm_1800_normal2 start`);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal2);

                console.info(`FMS_acquireForm_1800_normal2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1800_normal2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1800_normal2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1800_normal2 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1800_normal2 end`);
            }

            function delPublishCallBack_Temp1() {
                console.info("!!!====>FMS_acquireForm_1800 delPublishCallBack_Temp1====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1800 delPublishCallBack_Temp1 end');
                    FMS_acquireForm_1800_Temp2();
                }, 50);
            }
            function onAcquiredCallBack_Temp1(_, data) {
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Temp1 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Temp1)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhost",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Temp1);
            }
            function unSubscribeOnAcquiredCallBack_Temp1() {
                console.info("====>FMS_acquireForm_1800 unSubscribeOnAcquiredCallBack_Temp1====>");
            }

            async function FMS_acquireForm_1800_Temp1() {
                console.info(`FMS_acquireForm_1800_Temp1 start`);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Temp1);
                console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1800_Temp1 end`);
            }

            function delPublishCallBack_Temp2() {
                console.info("!!!====>FMS_acquireForm_1800 delPublishCallBack_Temp2====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1800 delPublishCallBack_Temp2 end');
                    console.info(`FMS_acquireForm_1800 end`);
                    done();
                }, 500);
            }
            function onAcquiredCallBack_Temp2(_, data) {
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Temp2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Temp2)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostb",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Temp2);
            }
            function unSubscribeOnAcquiredCallBack_Temp2() {
                console.info("====>FMS_acquireForm_1800 unSubscribeOnAcquiredCallBack_Temp2====>");
            }

            async function FMS_acquireForm_1800_Temp2() {
                console.info(`FMS_acquireForm_1800_Temp2 start`);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Temp2);

                console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",

                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1800_Temp2 end`);
            }
            await FMS_acquireForm_1800_normal1();
            await sleepTime(5000)
        });
        /**
         * @tc.number: FMS_acquireForm_1900
         * @tc.name: Add a temporary form when the formId is set to 0.
         * @tc.desc: When the verification formId is set to 0, the temporary form is created successfully.
         */
        it(`FMS_acquireForm_1900`, 0, async (done) => {
            console.info(`FMS_acquireForm_1900 start`);
            let formId1;
            let formId2;

            function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_1900 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_1900"))
                formId1 = data.data;

                if (formId1 && formId2) {
                    expect(formId1).assertEqual(formId2);
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                        console.info('FMS_acquireForm_1900 publish' + JSON.stringify(err));
                        done()
                    });
                }
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);

            function onSupplyCallBack(_, data) {
                if (data.parameters.kind == "onCreate") {
                    console.info("====>FMS_acquireForm_1900 onSupplyCallBack====>" + JSON.stringify(data));
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_acquireForm_1900"));
                    let retData = JSON.parse(data.parameters.parameters);

                    let bundleName = retData.bundleName;
                    expect(bundleName).assertEqual("com.form.formsystemtestservicea.hmservice");
                    let abilityName = retData.abilityName;
                    expect(abilityName).assertEqual("com.form.formsystemtestservicea.hmservice.FormAbility");
                    let moduleName = retData.parameters['ohos.extra.param.key.module_name'];
                    expect(moduleName).assertEqual("entry");
                    let formName = retData.parameters['ohos.extra.param.key.form_name'];
                    expect(formName).assertEqual("Form_Js001");
                    let formDimension = retData.parameters['ohos.extra.param.key.form_dimension'];
                    expect(formDimension).assertEqual(1);
                    let tempFormFlag = retData.parameters['ohos.extra.param.key.form_temporary'];
                    expect(tempFormFlag).assertEqual(true);
                    formId2 = retData.parameters['ohos.extra.param.key.form_identity'];
                    console.info("!!!====>FMS_acquireForm_1900 onAcquiredCallBack formId2:====>" + formId2);
                    if (formId1 && formId2) {
                        expect(formId1).assertEqual(formId2);
                        let commonEventPublishData = {
                            data: formId1
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                            console.info('FMS_acquireForm_1900 publish' + JSON.stringify(err));
                            done()
                        });
                    }
                }
            }

            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);

            console.info(`FMS_acquireForm_1900 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_1900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_1900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });

            console.info(`FMS_acquireForm_1900 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_2100
         * @tc.name: When creating a temporary form, the formId is specified as the created normal formId.
         * @tc.desc: Failed to create a temporary form when verifying that the formId is set to create a normal formId.
         */
        it(`FMS_acquireForm_2100`, 0, async (done) => {
            console.info(`FMS_acquireForm_2100 start`);
            var formId;

            function onErrorCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_2100 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallBackCache("FMS_acquireForm_2100"));
                var commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_acquireForm_2100 publish' + JSON.stringify(err));
                    done()
                });
            }
            async function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_2100 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_2100"))
                formId = data.data;
                // add cache form
                commonEvent.subscribe(subscriberOnError, onErrorCallBack);
                console.info(`FMS_acquireForm_2100 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": data.data,
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_2100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_2100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`FMS_acquireForm_2100 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.info(`FMS_acquireForm_2100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_2100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_2100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_2100 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_2200
         * @tc.name: Cast to normal form when the temporary formId is set to negative.
         * @tc.desc: Failed to Cast to normal form when the temporary formId is set to negative
         */
        it(`FMS_acquireForm_2200`, 0, async (done) => {
            console.info(`FMS_acquireForm_2200 start`);

            function onCastCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_2200 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormCast_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberCast, () => unsubscribeOnCastCallback("FMS_acquireForm_2200"))
                var commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_acquireForm_2200 publish' + JSON.stringify(err));
                    done()
                });
            }

            commonEvent.subscribe(subscriberCast, onCastCallBack);
            console.info(`FMS_acquireForm_2200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "temporaryId": "-1",
                        "castForm": true,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_2200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_2200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_2200 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_2300
         * @tc.name: Cast to normal form when the temporary formId is set to 0.
         * @tc.desc: Failed to convert to normal form when verifying that the temporary formIdis set to 0
         */
        it(`FMS_acquireForm_2300`, 0, async (done) => {
            console.info(`FMS_acquireForm_2300 start`);

            function onCastCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_2300 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormCast_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberCast, () => unsubscribeOnCastCallback("FMS_acquireForm_2300"))
                var commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_acquireForm_2300 publish' + JSON.stringify(err));
                    done()
                });
            }
            commonEvent.subscribe(subscriberCast, onCastCallBack);
            console.info(`FMS_acquireForm_2300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "temporaryId": "0",
                        "castForm": true,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_2300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_2300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_2300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_2400
         * @tc.name: Non affiliated temporary form ID to normal form.
         * @tc.desc: Failed to convert non affiliated temporary form ID to normal form.
         */
        it(`FMS_acquireForm_2400`, 0, async (done) => {
            console.info(`FMS_acquireForm_2400 start`);

            function onCastCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_2400 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormCast_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberCast, () => unsubscribeOnCastCallback("FMS_acquireForm_2400"))
                var commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_acquireForm_2400 publish' + JSON.stringify(err));
                    done()
                });
            }
            async function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_2400 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_2400"))
                commonEvent.subscribe(subscriberCast, onCastCallBack);
                console.info(`FMS_acquireForm_2400 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "temporaryId": data.data,
                            "castForm": true,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_2400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_2400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`FMS_acquireForm_2400 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.info(`FMS_acquireForm_2400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_2400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_2400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_2400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_2500
         * @tc.name: cast non-existent temporary formId to normal form.
         * @tc.desc: Failed to verify that the temporary formId that does not exist is casted to normal form.
         */
        it(`FMS_acquireForm_2500`, 0, async (done) => {
            console.info(`FMS_acquireForm_2500 start`);

            function onCastCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_2500 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormCast_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberCast, () => unsubscribeOnCastCallback("FMS_acquireForm_2500"))
                var commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_acquireForm_2500 publish' + JSON.stringify(err));
                    done()
                });
            }
            commonEvent.subscribe(subscriberCast, onCastCallBack);
            console.info(`FMS_acquireForm_2500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "temporaryId": "123456789",
                        "castForm": true,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_2500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_2500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.info(`FMS_acquireForm_2500 featureAbility.startAbility end`);
            await sleep(3000)
        });
       /**
         * @tc.number: FMS_acquireForm_2600
         * @tc.name: When the normal form does not reach the maximum value created by the form, the temporary form changes to the normal form.
         * @tc.desc: Verify that when the normal form does not reach the maximum value created by the form.
         *           the temporary form can be successfully casted to the normal form.
         */
        it(`FMS_acquireForm_2600`, 0, async (done) => {
            console.info(`FMS_acquireForm_2600 start`);
            let formId1;
            let formId2;

            function onCastCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_2600 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormCast_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberCast, () => unsubscribeOnCastCallback("FMS_acquireForm_2600"))
                formId1 = data.parameters.formId;
                console.info("!!!====>FMS_acquireForm_2600 formId1 " + formId1 + " formId2 " + formId2);
                if (formId1 && formId2) {
                    console.info("!!!====>FMS_acquireForm_2600 2 formId1 " + formId1 + " formId2 " + formId2);
                    expect(formId1).assertEqual(formId2);
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, () => delPublishCallBack("FMS_acquireForm_2600", done));
                }else{
                    console.info("!!!====>FMS_acquireForm_2600 formId1 not equal formId2");
                    expect().assertFail();
                    done()
                }
            }

            async function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_acquireForm_2600 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_2600"))

                formId2 = data.data;
                console.info(`FMS_acquireForm_2600 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "temporaryId": data.data,
                            "castForm": true,
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_2600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_2600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`FMS_acquireForm_2600 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            commonEvent.subscribe(subscriberCast, onCastCallBack);

            console.info(`FMS_acquireForm_2600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_2600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_2600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_2600 featureAbility.startAbility end`);
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

const delPublishCallBack = async (tcNumber, done) => {
    console.info(`${tcNumber} delPublishCallBack start`);
    setTimeout(function () {
        console.info(`${tcNumber} delPublishCallBack end`);
        done();
    }, 1000);
}

function sleepTime(time) {
  return new Promise((resolve)=>setTimeout(resolve,time));
}

const unsubscribeOnErrorCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unsubscribeOnErrorCallback====>`);
}

const unsubscribeOnAcquiredCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unSubscribeOnAcquiredCallback====>`);
}

const unsubscribeSupplyCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unSubscribeSupplyCallback====>`);
}

const unsubscribeOnErrorCallBackCache = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeOnErrorCallBackCache CallBack====>`);
}

const unsubscribeOnAcquiredCallBackCache = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeOnAcquiredCallBackCache CallBack====>`);
}

const unsubscribeOnCastCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeOnCastCallback====>`);
}
