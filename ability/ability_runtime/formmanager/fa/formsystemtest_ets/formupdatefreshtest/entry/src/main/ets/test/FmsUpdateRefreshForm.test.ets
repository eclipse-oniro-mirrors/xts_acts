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
import { beforeAll, beforeEach, afterEach, describe, expect, it } from '@ohos/hypium'

var onAcquiredForm_Event = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};
var onDeletedFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};
var onUpdateRefreshEvent = {
    events: ["FMS_FormUpdateRefresh_commonEvent"],
};
var onRequestFormEvent = {
    events: ["FMS_FormOnRequest_commonEvent"],
};

const unsubscribeCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

var deleteForm_Event = "FMS_FormDelete_commonEvent";


var subscriberOnAcquired;
var subscriberOnDeleted;
var subscriberOnRefresh;
var subscriberOnRequest;

function sleep(time) {
    return new Promise((resolve)=>setTimeout(resolve,time));
  }

export default function test() {
    describe(`FmsUpdateRefreshFormTest`, () => {

        beforeAll(async (done) => {
            done();
        })

        beforeEach(async () => {
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberOnDeleted = await commonEvent.createSubscriber(onDeletedFormEvent);
            subscriberOnRefresh = await commonEvent.createSubscriber(onUpdateRefreshEvent);
            subscriberOnRequest = await commonEvent.createSubscriber(onRequestFormEvent);
        })

        afterEach(async() => {
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeCallback("afterEach unsubscribe subscriberOnDeleted"));
            commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeCallback("afterEach unsubscribe subscriberOnRefresh"));
            commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeCallback("afterEach unsubscribe subscriberOnRequest"));
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formupdaterefreshtest",
                    abilityName: "com.ohos.st.formupdaterefreshtest.MainAbility"
                }
            }).then((data) => {
                console.log("FmsUpdateRefreshFormTest startAbility data: " + JSON.stringify(data));
            }).catch((err) => {
                console.log("FmsUpdateRefreshFormTest startAbility err: " + JSON.stringify(err));
            })
            await sleep(2000);
        })
        /**
         * @tc.number: FMS_updateForm_0100
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0100`, 0, async (done) => {
            console.log(`FMS_updateForm_0100 start`);

            function onRefreshCallBack(_, data) {
                console.info("!!!====>FMS_updateForm_0100 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormUpdateRefresh_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback("FMS_updateForm_0100"));

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData,
                () => delPublishCallBack("FMS_updateForm_0100", done));
            }
            commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
            console.log(`FMS_updateForm_0100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "updateForm" : true,
                        "updateId" : "-1",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_updateForm_0100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_updateForm_0100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_updateForm_0100 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_updateForm_0200
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0200`, 0, async (done) => {
            console.log(`FMS_updateForm_0200 start`);

            function onRefreshCallBack(_, data) {
                console.info("!!!====>FMS_updateForm_0200 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormUpdateRefresh_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback("FMS_updateForm_0200"));

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData,
                () => delPublishCallBack("FMS_updateForm_0200", done));
                done();
            }
            commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
            console.log(`FMS_updateForm_0200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "updateForm" : true,
                        "updateId" : "0",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_updateForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_updateForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_updateForm_0200 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_updateForm_0300
        * @tc.name: formID id is error because formId is not self
        * @tc.desc: 1.The form provider B to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_updateForm_0300`, 0, async (done) => {
            console.log(`FMS_updateForm_0300 start`);
            let formId;

            function onRefreshCallBack(_, data) {
                console.info("!!!====>FMS_updateForm_0300 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormUpdateRefresh_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback("FMS_updateForm_0300"));
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData,
                () => delPublishCallBack("FMS_updateForm_0300", done));
                done();
            }
            function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_updateForm_0300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_updateForm_0300"));
                formId = data.data;
                commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);

                console.log(`FMS_updateForm_0300 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "updateForm" : true,
                            "updateId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_updateForm_0300 featureAbility.startAbility again end`);
            }
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.log(`FMS_updateForm_0300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_updateForm_0300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_updateForm_0400
         * @tc.name: Form ID error (FormID does not exist)
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0400`, 0, async (done) => {
            console.log(`FMS_updateForm_0400 start`);
            let formId;

            function onRefreshCallBack(_, data) {
                console.info("!!!====>FMS_updateForm_0400 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormUpdateRefresh_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback("FMS_updateForm_0400"));
                setTimeout(function () {
                    console.info('FMS_updateForm_0400 onRefreshCallBack end');
                    console.log(`FMS_updateForm_0400 end`);   
                    done();
                }, 1000);  
            }
            function onDeletedCallBack(_, data) {
                console.info("!!!====>FMS_updateForm_0400 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeDeletedCallback("FMS_updateForm_0400"));
                formId = data.parameters.formId;
                commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);

                console.log(`FMS_updateForm_0400 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "updateForm" : true,
                            "updateId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_updateForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_updateForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_updateForm_0400 featureAbility.startAbility again end`);
            }
            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallBack);
            console.log(`FMS_updateForm_0400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "deleteForm" : true,
                        "deleteId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_updateForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_updateForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_updateForm_0400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_updateForm_0500
         * @tc.name: The jsonData of form in the provider is empty.
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0500`, 0, async (done) => {
            console.log(`FMS_updateForm_0500 start`);

            function onRefreshCallBack(_, data) {
                console.info("!!!====>FMS_updateForm_0500 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormUpdateRefresh_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback("FMS_updateForm_0500"));

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData,
                () => delPublishCallBack("FMS_updateForm_0500", done));
                done();
            }
            commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
            console.log(`FMS_updateForm_0500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "updateForm" : true,
                        "updateId" : "self",
                        "jsonEmpty" : true,
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_updateForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_updateForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_updateForm_0500 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_hostRefresh_0100
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_hostRefresh_0100`, 0, async (done) => {
            console.log(`FMS_hostRefresh_0100 start`);

            function onRequestCallBack(_, data) {
                console.info("!!!====>FMS_hostRefresh_0100 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRequestCallback("FMS_hostRefresh_0100"));

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData,
                () => delPublishCallBack("FMS_hostRefresh_0100", done));
            }
            commonEvent.subscribe(subscriberOnRequest, onRequestCallBack);
            console.log(`FMS_hostRefresh_0100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "-1",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefresh_0100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_hostRefresh_0100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0100 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_hostRefresh_0200
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_hostRefresh_0200`, 0, async (done) => {
            console.log(`FMS_hostRefresh_0200 start`);

            function onRequestCallBack(_, data) {
                console.info("!!!====>FMS_hostRefresh_0200 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRequestCallback("FMS_hostRefresh_0200"));

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData,
                () => delPublishCallBack("FMS_hostRefresh_0200", done));
                done();
            }
            commonEvent.subscribe(subscriberOnRequest, onRequestCallBack);
            console.log(`FMS_hostRefresh_0200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "0",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefresh_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_hostRefresh_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0200 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_hostRefresh_0300
        * @tc.name: formID id is error because formId is not self
        * @tc.desc: 1.The form user B to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_hostRefresh_0300`, 0, async (done) => {
            console.log(`FMS_hostRefresh_0300 start`);
            let formId;

            function onRequestCallBack(_, data) {
                console.info("!!!====>FMS_hostRefresh_0300 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRefreshCallback("FMS_hostRefresh_0300"));
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData,
                () => delPublishCallBack("FMS_hostRefresh_0300", done));
                done();
            }

            function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_hostRefresh_0300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_hostRefresh_0300"));
                formId = data.data;
                commonEvent.subscribe(subscriberOnRequest, onRequestCallBack);

                console.log(`FMS_hostRefresh_0300 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "requestForm" : true,
                            "requestId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_hostRefresh_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_hostRefresh_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_hostRefresh_0300 featureAbility.startAbility again end`);
            }
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.log(`FMS_hostRefresh_0300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefresh_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_hostRefresh_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0300 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_hostRefresh_0400
        * @tc.name: Form ID error (FormID does not exist)
        * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_hostRefresh_0400`, 0, async (done) => {
            console.log(`FMS_hostRefresh_0400 start`);
            let formId;

            function onRequestCallBack(_, data) {
                console.info("!!!====>FMS_hostRefresh_0400 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRequestCallback("FMS_hostRefresh_0400"));
                setTimeout(function () {
                    console.info('FMS_hostRefresh_0400 onRequestCallBack end');
                    console.log(`FMS_hostRefresh_0400 end`);   
                    done();
                }, 10);
            }
            function onDeletedCallBack(_, data) {
                console.info("!!!====>FMS_hostRefresh_0400 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeDeletedCallback("FMS_hostRefresh_0400"));
                formId = data.parameters.formId;
                commonEvent.subscribe(subscriberOnRequest, onRequestCallBack);

                console.log(`FMS_hostRefresh_0400 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "requestForm" : true,
                            "requestId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_hostRefresh_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_hostRefresh_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_hostRefresh_0400 featureAbility.startAbility again end`);
            }
            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallBack);
            console.log(`FMS_hostRefresh_0400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "deleteForm" : true,
                        "deleteId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefresh_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_hostRefresh_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0400 featureAbility.startAbility end`);
        });
       /**
        * @tc.number: FMS_hostRefresh_0600
        * @tc.name: The form user has no form permission.
        * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_hostRefresh_0600`, 0, async (done) => {
            console.log(`FMS_hostRefresh_0600 start`);

            function onRequestCallBack(_, data) {
                console.info("!!!====>FMS_hostRefresh_0600 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRequestCallback("FMS_hostRefresh_0600"));

                setTimeout(function () {
                    console.info('FMS_hostRefresh_0600 onRequestCallBack end');
                    console.log(`FMS_hostRefresh_0600 end`);
                    done();
                }, 1000)
            }

            commonEvent.subscribe(subscriberOnRequest, onRequestCallBack);
            console.log(`FMS_hostRefresh_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostnoperm",
                    abilityName: "com.ohos.st.formsystemhostnoperm.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "1",
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefresh_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_hostRefresh_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0600 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_hostRefresh_0700
        * @tc.name: Refresh form successfully by the form user.
        * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
        *           2.Verify that pulling up the form provider.
        */
        it(`FMS_hostRefresh_0700`, 0, async (done) => {
            console.log(`FMS_hostRefresh_0700 start`);
            let formId;
            
            function onRequestCallBack(_, data) {
                console.info("!!!====>FMS_hostRefresh_0700 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRequestCallback("FMS_hostRefresh_0700"));
                formId = data.parameters.formId;
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, () => delPublishCallBack("FMS_hostRefresh_0700", done));
                done();
            }

            commonEvent.subscribe(subscriberOnRequest, onRequestCallBack);
 
            console.log(`FMS_hostRefresh_0700 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefresh_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_hostRefresh_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0700 featureAbility.startAbility end`);
        });
    });
}

const delPublishCallBack = async (tcNumber, done) => {
    console.info(`${tcNumber} delPublishCallBack start`);
    setTimeout(function () {
        console.info(`${tcNumber} delPublishCallBack end`);
        done();
    }, 1000)
}

const unsubscribeOnRequestCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unsubscribeOnRequestCallback CallBack====>`);
}

const unsubscribeOnRefreshCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unsubscribeOnRefreshCallback CallBack====>`);
}

const unsubscribeDeletedCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unsubscribeDeletedCallback====>`);
}

const unsubscribeOnAcquiredCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unsubscribeOnAcquiredCallback CallBack====>`);
}
