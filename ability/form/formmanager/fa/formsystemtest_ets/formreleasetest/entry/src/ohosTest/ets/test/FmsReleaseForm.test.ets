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
import { beforeAll, beforeEach, afterEach, describe, expect, it } from '@ohos/hypium';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

interface onFormEvent {
    events: string[];
}


interface wantType {
    bundleName: string
    abilityName: string
}
interface wantInfoType {
    want: wantType
}

let onAcquiredForm_Event: onFormEvent = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};
let onDeletedFormEvent: onFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};
let onReleasedFormEvent: onFormEvent = {
    events: ["FMS_FormOnReleased_commonEvent"],
};
let deleteForm_Event: string = "FMS_FormDelete_commonEvent";

const unsubscribeCallback = (tcNumber: string)  => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

let options:CommonEventManager.CommonEventPublishData = {
    code: 1,
    data: "initial data",
    isOrdered: true
}

let subscriberOnAcquired: CommonEventManager.CommonEventSubscriber;
let subscriberOnDeleted: CommonEventManager.CommonEventSubscriber;
let subscriberOnReleased: CommonEventManager.CommonEventSubscriber;

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

export default function test() {
    describe(`FmsReleaseFormTest`, () => {

        beforeAll(async (done: () => void) => {
            done();
        })

        beforeEach(async () => {
            try{
                subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
                console.info("!!!FMS_releaseForm_0200 ====>");
            } catch(err) {
                console.log("FMS_releaseForm_0200" + JSON.stringify(err))
            }
            subscriberOnDeleted = await commonEvent.createSubscriber(onDeletedFormEvent);
            subscriberOnReleased = await commonEvent.createSubscriber(onReleasedFormEvent);
            await sleep(1000);
        })

        afterEach(async () => {
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeCallback("afterEach unsubscribe subscriberOnDeleted"));
            commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeCallback("afterEach unsubscribe subscriberOnReleased"));
        })

        /**
         * @tc.number: FMS_releaseForm_0200
         * @tc.name: host does not have permission
         * @tc.desc: 1.release the form that formID is 1
         *           2.Verify the result is false
         */
        it(`FMS_releaseForm_0200`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_0200 start`);
            let formId: string = '';

            let onReleasedCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_releaseForm_0200 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual('FMS_FormOnReleased_commonEvent');
                expect(data.code).assertEqual(0);
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback("FMS_releaseForm_0200"));
                commonEvent.publish(deleteForm_Event, data, async (err) => {
                    console.info('FMS_releaseForm_0200 publish' + JSON.stringify(err));
                    await sleep(2000);
                    done();
                });
            }

            let onAcquiredCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_releaseForm_0200 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_releaseForm_0200"))
                if(data.data){
                    formId = data.data;
                }

                commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);

                console.log(`FMS_releaseForm_0200 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostnoperm",
                        abilityName: "com.ohos.st.formsystemhostnoperm.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "releaseForm" : true,
                            "releaseId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormOnReleased_commonEvent';
                    commonEvent.publish("FMS_FormOnReleased_commonEvent", data, () => {
                        console.info(`FMS_releaseForm_0200 onReleasedCallBack publish start`)})
                }).catch((err: BusinessError) => {
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_releaseForm_0200 onAcquiredCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_releaseForm_0200 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_releaseForm_0300
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.release the form
         *           2.Verify the result is false
         */
        it(`FMS_releaseForm_0300`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_0300 start`);

            let onReleasedCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_releaseForm_0300 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback("FMS_releaseForm_0300"));
                setTimeout( async () => {
                    console.info('FMS_releaseForm_0300 onReleasedCallBack end');
                    console.log(`FMS_releaseForm_0300 end`);
                    await sleep(2000);
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "releaseForm" : true,
                        "releaseId" : "-1",
                        "isCreate" : false
                    }
                }
            }).then((res) => {
                console.log(`FMS_releaseForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnReleased_commonEvent';
                commonEvent.publish("FMS_FormOnReleased_commonEvent", options, () => {
                    console.info(`FMS_releaseForm_0300 onReleasedCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.log(`FMS_releaseForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_releaseForm_0300 featureAbility.startAbility end`);
        });


        /**
        * @tc.number: FMS_releaseForm_0400
        * @tc.name: formID id is error(formID = 0)
        * @tc.desc: 1.release the form
        *           2.Verify the result is false
        */
        it(`FMS_releaseForm_0400`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_0400 start`);

            let onReleaseCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_releaseForm_0400 onReleaseCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback("FMS_releaseForm_0400"));
                setTimeout( async () => {
                    console.info('FMS_releaseForm_0400 onReleaseCallBack end');
                    console.log(`FMS_releaseForm_0400 end`);
                    await sleep(2000);
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "releaseForm" : true,
                        "releaseId" : "0",
                        "isCreate" : false
                    }
                }
            }).then((res) => {
                console.log(`FMS_releaseForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnReleased_commonEvent';
                commonEvent.publish("FMS_FormOnReleased_commonEvent", options, () => {
                    console.info(`FMS_releaseForm_0400 onReleaseCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.log(`FMS_releaseForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
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
        it(`FMS_releaseForm_0500`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_0500 start`);
            let formId: string = '';

            let onReleasedCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_releaseForm_0500 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback("FMS_releaseForm_0500"));
                commonEvent.publish(deleteForm_Event, data, async (err) => {
                    console.info('FMS_releaseForm_0500 publish' + JSON.stringify(err));
                    await sleep(2000);
                    done();
                });
            }

            let onAcquiredCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_releaseForm_0500 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_releaseForm_0500"));
                if(data.data){
                    formId = data.data;
                }

                commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);
                console.log(`FMS_releaseForm_0500 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostd",
                        abilityName: "com.ohos.st.formsystemhostd.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "releaseForm" : true,
                            "releaseId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormOnReleased_commonEvent';
                    commonEvent.publish("FMS_FormOnReleased_commonEvent", data, () => {
                        console.info(`FMS_releaseForm_0500 onReleasedCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_releaseForm_0500 onAcquiredCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
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
        it(`FMS_releaseForm_0600`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_0600 start`);
            let formId: string = '';

            let onReleasedCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_releaseForm_0600 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback("FMS_releaseForm_0600"));
                commonEvent.publish(deleteForm_Event, data, async (err) => {
                    console.info('FMS_releaseForm_0600 publish' + JSON.stringify(err));
                    await sleep(2000);
		            done();
                });
            }

            let onDeletedCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_releaseForm_0600 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnDeleted, unsubscribeDeletedCallback)
                if(data.parameters) {
                    formId = data.parameters.formId;
                }

                commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);
                console.log(`FMS_releaseForm_0600 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "releaseForm" : true,
                            "releaseId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost again res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'FMS_FormOnReleased_commonEvent';
                    commonEvent.publish("FMS_FormOnReleased_commonEvent", data, () => {
                        console.info(`FMS_releaseForm_0600 again onReleasedCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost again error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_releaseForm_0600 featureAbility.startAbility again end`);
            }

            let unsubscribeDeletedCallback = () => {
                console.log("====>FMS_releaseForm_0600 unsubscribeDeletedCallback====>");
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "deleteForm" : true,
                        "deleteId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnDeleted_commonEvent';
                commonEvent.publish("FMS_FormOnDeleted_commonEvent", options, () => {
                    console.info(`FMS_releaseForm_0600 onDeletedCallBack publish start`)});
            }).catch((err: BusinessError) => {
                console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_releaseForm_0600 featureAbility.startAbility end`);
        });


        /**
        * @tc.number: FMS_releaseForm_1300
        * @tc.name: single host continuously release forms
        * @tc.desc: 1.There are 2 forms created by the single host
        *           2.single host release 2 forms successfully
        */
        it(`FMS_releaseForm_1300`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_1300 start`);

            let formIdList: string[] = [];
            let releasedIdList: string[] = [];
            let formCount = 2;
            let delCount = 0;

            let delPublishCallBack = () => {
                console.info("!!!====>FMS_releaseForm_1300 delPublishCallBack====>" + `formCount:${formCount} delCount:${delCount}`);
                delCount++;
                if(delCount == formCount) {
                    setTimeout( async () => {
                        console.info('FMS_releaseForm_1300 delPublishCallBack end');
                        console.log(`FMS_releaseForm_1300 end`);
                         await sleep(2000);
                        done();
                    }, 1000);
                }
            }

            let onReleasedCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_releaseForm_1300 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.code).assertEqual(0);

                console.info(`====>FMS_releaseForm_1300 onReleasedCallBack 打印 length:${formIdList.length} formCount:${formCount}`);
                if(formIdList.length == formCount) {
                    commonEvent.unsubscribe(subscriberOnReleased, () => unsubscribeOnReleasedCallback("FMS_releaseForm_1300"));
                    for(let iIndex = 0; iIndex < formIdList.length; iIndex++) {
                        commonEvent.publish(deleteForm_Event, data, delPublishCallBack);
                    }
                }
            }

            let releaseForms = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.log("====>FMS_releaseForm_1300 releaseForms start ====>"+ JSON.stringify(data));
                commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);
                console.info(`FMS_releaseForm_1300 releaseForms start  formIdList: ${JSON.stringify(formIdList)} length ${formIdList.length}`)
                for(let iIndex = 0; iIndex < formIdList.length; iIndex++) {
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbility start`);
                    await featureAbility.startAbility({
                        want: {
                            bundleName: "com.ohos.st.formsystemhostc",
                            abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                            parameters: {
                                "formId" : "0",
                                "name" : "Form_Js001",
                                "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                                "ability" : "FormAbility",
                                "moduleName" : "entry",
                                "temporary" : false,
                                "releaseForm" : true,
                                "releaseId" : formIdList[iIndex],
                                "isCreate" : false
                            }
                        }
                    }).then((res) => {
                        console.log(`FMS_releaseForm_1300 releaseForms res: ${JSON.stringify(res)}`);
                        console.log("====>FMS_releaseForm_1300 releaseForms publish data 1====>"+ JSON.stringify(data));
                        data.code = res;
                        data.data = 'FMS_FormOnReleased_commonEvent';
                        console.log("====>FMS_releaseForm_1300 releaseForms publish data 2 ====>"+ JSON.stringify(data));
                        commonEvent.publish("FMS_FormOnReleased_commonEvent", data, () => {
                            console.info(`FMS_releaseForm_1300 onReleasedCallBack publish start`)})
                    }).catch((err: BusinessError) => {
                        console.log(`FMS_releaseForm_1300 releaseForms error: ${JSON.stringify(err)}`);
                    });
                    await sleep(1000)
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbility end`);
                }
            }

            let onAcquiredCallBack1 = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_releaseForm_1300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("Second_FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_releaseForm_1300"));
                if(data.data){
                    formIdList.push(data.data);
                }
                releaseForms(_, data);
            }

            let onAcquiredStartAbility = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) =>{
                if(data.data){
                    formIdList.push(data.data);
                }
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
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    data.code = res;
                    data.data = 'Second_FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", data, () => {
                        console.info(`FMS_releaseForm_1300 onAcquiredCallBack1 publish start`)})
                }).catch((err: BusinessError) => {
                    console.log(`FMS_releaseForm_1300 onAcquiredStartAbility error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_releaseForm_1300 featureAbility.startAbility end`);
            }

            let onAcquiredCallBack = async (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_releaseForm_1300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => {
                    console.log(`====>FMS_releaseForm_1300 unsubscribeOnAcquiredCallback====>`);
                    onAcquiredStartAbility(_, data)
                });
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                    console.info(`FMS_releaseForm_1300 onAcquiredCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_releaseForm_1300 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_releaseForm_1400
        * @tc.name: release temp form
        * @tc.desc: 1.host create one temp form
        *           2.release the form and judge the result is true
        */
        it(`FMS_releaseForm_1400`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_1400 start`);

            let onReleasedCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_releaseForm_1400 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.publish(deleteForm_Event, data, async (err) => {
                    console.info('FMS_releaseForm_1400 publish' + JSON.stringify(err));
                    await sleep(2000);
		            done();
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : true,
                        "releaseForm" : true,
                        "releaseId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_releaseForm_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                options.data = 'FMS_FormOnReleased_commonEvent';
                commonEvent.publish("FMS_FormOnReleased_commonEvent", options, () => {
                    console.info(`FMS_releaseForm_1400 onReleasedCallBack publish start`)})
            }).catch((err: BusinessError) => {
                console.log(`FMS_releaseForm_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_releaseForm_1400 featureAbility.startAbility end`);
        });
    });
}

const delPublishCallBack = async (tcNumber: string, done: () => void)=> {
    console.info(`${tcNumber} delPublishCallBack start`);
    setTimeout(() => {
        console.info(`${tcNumber} delPublishCallBack end`);
        done();
    }, 1000);
}

const unsubscribeOnReleasedCallback = (tcNumber: string)  => {
    console.log(`====>${tcNumber} unsubscribeOnReleasedCallback====>`);
}

const unsubscribeOnAcquiredCallback = (tcNumber: string)  => {
    console.log(`====>${tcNumber} unsubscribeOnAcquiredCallback====>`);
}