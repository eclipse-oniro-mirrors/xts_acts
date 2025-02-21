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
var onReleasedFormEvent = {
    events: ["FMS_FormOnReleased_commonEvent"],
};
var deleteForm_Event = "FMS_FormDelete_commonEvent";

const unsubscribeCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

var subscriberOnAcquired;
var subscriberOnDeleted;
var subscriberOnReleased;
function sleep(time) {
  return new Promise((resolve)=>setTimeout(resolve,time));
}
export default function test() {
    describe(`FmsReleaseFormTest`, () => {

        beforeAll(async (done) => {
            done();
        })

        beforeEach(async () => {
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberOnDeleted = await commonEvent.createSubscriber(onDeletedFormEvent);
            subscriberOnReleased = await commonEvent.createSubscriber(onReleasedFormEvent);
            await sleep(1000);
        })

        afterEach(async() => {
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeCallback("afterEach unsubscribe subscriberOnDeleted"));
            commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeCallback("afterEach unsubscribe subscriberOnReleased"));

            let wantInfo = {
                want: {
                    bundleName: "com.ohos.st.formreleasetest",
                    abilityName: "com.ohos.st.formreleasetest.TestAbility"
                }
            }
            await featureAbility.startAbility(wantInfo).then((data) => {
              console.log("FMS_releaseForm startAbility data : " + JSON.stringify(data));
            }).catch((err) => {
              console.log("FMS_releaseForm startAbility err : " + JSON.stringify(err));
            })
            await sleep(1000);
        })

        /**
         * @tc.number: FMS_releaseForm_0200
         * @tc.name: host does not have permission
         * @tc.desc: 1.release the form that formID is 1
         *           2.Verify the result is false
         */
        it(`FMS_releaseForm_0200`, 0, async (done) => {
            console.log(`FMS_releaseForm_0200 start`);
            let formId;

            function onReleasedCallBack(_, data) {
                console.info("!!!====>FMS_releaseForm_0200 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback("FMS_releaseForm_0200"));
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                	console.info('FMS_releaseForm_0200 publish' + JSON.stringify(err));
			        done()
                });
            }

            function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_releaseForm_0200 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_releaseForm_0200"))
                formId = data.data;
                commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);

                console.log(`FMS_releaseForm_0200 featureAbility.startAbility again start`);
                featureAbility.startAbility({
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
                            "releaseForm" : true,
                            "releaseId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_releaseForm_0200 featureAbility.startAbility again end`);
            }
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);

            console.log(`FMS_releaseForm_0200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
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
                console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_releaseForm_0200 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_releaseForm_0300
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.release the form
         *           2.Verify the result is false
         */
        it(`FMS_releaseForm_0300`, 0, async (done) => {
            console.log(`FMS_releaseForm_0300 start`);

            function onReleasedCallBack(_, data) {
                console.info("!!!====>FMS_releaseForm_0300 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback("FMS_releaseForm_0300"));
                setTimeout(function () {
                    console.info('FMS_releaseForm_0300 onReleasedCallBack end');
                    console.log(`FMS_releaseForm_0300 end`);
                    done();
                }, 100);
            }
            commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);

            console.log(`FMS_releaseForm_0300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "releaseForm" : true,
                        "releaseId" : "-1",
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_releaseForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_releaseForm_0300 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_releaseForm_0400
        * @tc.name: formID id is error(formID = 0)
        * @tc.desc: 1.release the form
        *           2.Verify the result is false
        */
        it(`FMS_releaseForm_0400`, 0, async (done) => {
            console.log(`FMS_releaseForm_0400 start`);

            function onReleaseCallBack(_, data) {
                console.info("!!!====>FMS_releaseForm_0400 onReleaseCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback("FMS_releaseForm_0400"));
                setTimeout(function () {                    
                    console.info('FMS_releaseForm_0400 onReleaseCallBack end');
                    console.log(`FMS_releaseForm_0400 end`);
                    done();
                }, 100);
            }
            commonEvent.subscribe(subscriberOnReleased, onReleaseCallBack);
            console.log(`FMS_releaseForm_0400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "releaseForm" : true,
                        "releaseId" : "0",
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_releaseForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_releaseForm_0400 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_releaseForm_0500
        * @tc.name: formID id is error because formId is not self
        * @tc.desc: 1.host A create a formA
        *           2.host B release the formA
        *           2.Verify the result is false
        */
        it(`FMS_releaseForm_0500`, 0, async (done) => {
            console.log(`FMS_releaseForm_0500 start`);
            let formId;

            function onReleasedCallBack(_, data) {
                console.info("!!!====>FMS_releaseForm_0500 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback("FMS_releaseForm_0500"));
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_releaseForm_0500 publish' + JSON.stringify(err));
		            done()
                });
            }
            function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_releaseForm_0500 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_releaseForm_0500"));
                formId = data.data;
                commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);
                console.log(`FMS_releaseForm_0500 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostd",
                        abilityName: "com.ohos.st.formsystemhostd.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "releaseForm" : true,
                            "releaseId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_releaseForm_0500 featureAbility.startAbility again end`);
            }
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.log(`FMS_releaseForm_0500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
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
                console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_releaseForm_0500 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_releaseForm_0600
        * @tc.name: Form ID error (FormID does not exist)
        * @tc.desc: 1.host create one normal card
        *           2.host delete the form
        *           3.host release the form and verify the result is false
        */
        it(`FMS_releaseForm_0600`, 0, async (done) => {
            console.log(`FMS_releaseForm_0600 start`);
            let formId;

            function onReleasedCallBack(_, data) {
                console.info("!!!====>FMS_releaseForm_0600 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback("FMS_releaseForm_0600"));
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostc",
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_releaseForm_0600 publish' + JSON.stringify(err));
		            done()
                });
            }
            function onDeletedCallBack(_, data) {
                console.info("!!!====>FMS_releaseForm_0600 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnDeleted, unsubscribeDeletedCallback)
                formId = data.parameters.formId;
                commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);

                console.log(`FMS_releaseForm_0600 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "releaseForm" : true,
                            "releaseId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_releaseForm_0600 featureAbility.startAbility again end`);
            }
            function unsubscribeDeletedCallback() {
                console.debug("====>FMS_releaseForm_0600 unsubscribeDeletedCallback====>");
            }
            commonEvent.subscribe(subscriberOnDeleted, onDeletedCallBack);
            console.log(`FMS_releaseForm_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
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
                console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_releaseForm_0600 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_releaseForm_1300
        * @tc.name: single host continuously release forms
        * @tc.desc: 1.There are 2 forms created by the single host
        *           2.single host release 2 forms successfully
        */
        it(`FMS_releaseForm_1300`, 0, async (done) => {
            console.log(`FMS_releaseForm_1300 start`);
            let formIdList = [];
            let releasedIdList = [];
            let formCount = 2;
            let delCount = 0;

            function delPublishCallBack() {
                console.info("!!!====>FMS_releaseForm_1300 delPublishCallBack====>");
                delCount++;
                if(delCount == formCount) {
                    setTimeout(function () {
                        console.info('FMS_releaseForm_1300 delPublishCallBack end');
                        console.log(`FMS_releaseForm_1300 end`);
                        done();
                    }, 1000);
                }
            }

            function onReleasedCallBack(_, data) {
                console.info("!!!====>FMS_releaseForm_1300 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data).assertEqual("0");
                let formId = data.parameters.formId;
                formIdList.forEach(function(item, index, arr) {
                    if(item === formId) {
                        releasedIdList.push(formId);
                    }
                });
                if(releasedIdList.length == formCount) {
                    commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback("FMS_releaseForm_1300"));
                    for(var iIndex = 0; iIndex < releasedIdList.length; iIndex++) {
                        let commonEventPublishData = {
                            bundleName: "com.ohos.st.formsystemhostc",
                            data: releasedIdList[iIndex]
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    }
                }
            }
            async function releaseForms() {
                console.debug("====>FMS_releaseForm_1300 releaseForms====>");
                commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);
                for(var iIndex = 0; iIndex < formIdList.length; iIndex++) {
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbility start`);
                    await featureAbility.startAbility({
                        want: {
                            bundleName: "com.ohos.st.formsystemhostc",
                            abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                            parameters: {
                                "formId" : "0",
                                "name" : "Form_Js001",
                                "bundle" : "com.form.formsystemtestservicea.hmservice",
                                "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                                "moduleName" : "entry",
                                "temporary" : false,
                                "releaseForm" : true,
                                "releaseId" : formIdList[iIndex],
                                "isCreate" : false
                            }
                        }
                    }).then((res: any) => {
                        console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    }).catch((err: any) => {
                        console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                    await sleep(1000)
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbility end`);
                }
            }
            function onAcquiredCallBack1(_, data) {
                console.info("!!!====>FMS_releaseForm_1300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_releaseForm_1300"));
                formIdList.push(data.data);

                releaseForms();
            }

            async function onAcquiredCallBack(_, data) {
                console.info("!!!====>FMS_releaseForm_1300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_releaseForm_1300"));
                formIdList.push(data.data);
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack1);

                console.log(`FMS_releaseForm_1300 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
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
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_releaseForm_1300 featureAbility.startAbility end`);
            }
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);

            console.log(`FMS_releaseForm_1300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
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
                console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_releaseForm_1300 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_releaseForm_1400
        * @tc.name: release temp form
        * @tc.desc: 1.host create one temp form
        *           2.release the form and judge the result is true
        */
        it(`FMS_releaseForm_1400`, 0, async (done) => {
            console.log(`FMS_releaseForm_1400 start`);

            function onReleasedCallBack(_, data) {
                console.info("!!!====>FMS_releaseForm_1400 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data).assertEqual("0");
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostc",
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, (err) => {
                    console.info('FMS_releaseForm_1400 publish' + JSON.stringify(err));
		            done()
                });
            }
            commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);

            console.log(`FMS_releaseForm_1400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : true,
                        "releaseForm" : true,
                        "releaseId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_releaseForm_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_releaseForm_1400 featureAbility.startAbility end`);
        });
    });
}

const delPublishCallBack = async (tcNumber, done) => {
    console.info(`${tcNumber} delPublishCallBack start`);
    setTimeout(function () {
        console.info(`${tcNumber} delPublishCallBack end`);
        done();
    }, 1000);
}

const unsubscribeOnReleasedCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unsubscribeOnReleasedCallback====>`);
}

const unsubscribeOnAcquiredCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unsubscribeOnAcquiredCallback====>`);
}
