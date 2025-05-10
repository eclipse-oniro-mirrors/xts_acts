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
import { beforeAll, beforeEach, afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import CommonEventManager from '@ohos.commonEventManager';

interface onFormEvent {
    events: string[];
}

interface CommonEventPublishData {
    data: string;
}

interface DataParameter {
    formId: string;
}

interface Data {
    event: string;
    data: string;
    parameters: DataParameter;
}

let onAcquiredForm_Event: onFormEvent = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};
let onDeletedFormEvent: onFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};
let onUpdateRefreshEvent: onFormEvent = {
    events: ["FMS_FormUpdateRefresh_commonEvent"],
};
let onRequestFormEvent: onFormEvent = {
    events: ["FMS_FormOnRequest_commonEvent"],
};

let options:CommonEventManager.CommonEventPublishData = {
    code: 1,
    data: "initial data",
    isOrdered: true
}

const unsubscribeCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

let deleteForm_Event: string = "FMS_FormDelete_commonEvent";

let subscriberOnAcquired: CommonEventManager.CommonEventSubscriber;
let subscriberOnDeleted: CommonEventManager.CommonEventSubscriber;
let subscriberOnRefresh: CommonEventManager.CommonEventSubscriber;
let subscriberOnRequest: CommonEventManager.CommonEventSubscriber;

function sleep(time: number): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve,time));
}

export default function FmsUpdateRefreshTest() {
    describe('FmsUpdateRefreshTest', () => {

        beforeAll(async (done: ()=> void) => {
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
                    bundleName: "com.ohos.st.formupdatetest",
                    abilityName: "com.ohos.st.formupdatetest.MainAbility"
                }
            }).then((data) => {
                console.log("FMS_updateForm_0100 FmsUpdateRefreshFormTest startAbility data: " + JSON.stringify(data));
            }).catch((err: BusinessError) => {
                console.log("FMS_updateForm_0100 FmsUpdateRefreshFormTest startAbility err: " + JSON.stringify(err));
            })
            await sleep(2000);
        })

        /**
         * @tc.number: FMS_updateForm_0100
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            console.log(`FMS_updateForm_0100 start`);

            let onRefreshCallBack = (err:BusinessError, data: Data) => {
                console.info("!!!====>FMS_updateForm_0100 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormUpdateRefresh_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback("FMS_updateForm_0100"));
                commonEvent.publish(deleteForm_Event, data,
                    () => delPublishCallBack("FMS_updateForm_0100 onRefreshCallBack", done));
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "updateForm" : true,
                        "updateId" : "-1",
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_updateForm_0100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormUpdateRefresh_commonEvent", options,
                    () => delPublishCallBack("FMS_updateForm_0100", done));
            }).catch((err: BusinessError) => {
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
        it(`FMS_updateForm_0200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            console.log(`FMS_updateForm_0200 start`);

            let onRefreshCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_updateForm_0200 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback("FMS_updateForm_0200"));
                commonEvent.publish(deleteForm_Event, data,
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "updateForm" : true,
                        "updateId" : "0",
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_updateForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormUpdateRefresh_commonEvent", options,
                    () => delPublishCallBack("FMS_updateForm_0100", done));
            }).catch((err: BusinessError) => {
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
        it(`FMS_updateForm_0300`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            console.log(`FMS_updateForm_0300 start`);

            let formId: string;
            let onRefreshCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_updateForm_0300 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback("FMS_updateForm_0300"));
                commonEvent.publish(deleteForm_Event, data,
                    () => delPublishCallBack("FMS_updateForm_0300", done));
                done();
            }

            let onAcquiredCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_updateForm_0300 onAquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_updateForm_0300"));
                formId = 'formId';
                commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);

                console.log(`FMS_updateForm_0300 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "updateForm" : true,
                            "updateId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    commonEvent.publish("FMS_FormUpdateRefresh_commonEvent", options,
                        () => delPublishCallBack("FMS_updateForm_0300", done));
                }).catch((err: BusinessError) => {
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options,
                    () => delPublishCallBack("FMS_updateForm_0300", done));
            }).catch((err: BusinessError) => {
                console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_updateForm_0300 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_updateForm_0400
         * @tc.name: Form ID error (FormID does not exist)
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         * 2.Verify the result of the intiative timed refresh interface.
         */
        it('FMS_updateForm_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            console.log('FMS_updateForm_0400 start');

            let formId: string | null;
            let onRefreshCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_updateForm_0400 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback("FMS_updateForm_0400"));
                setTimeout(() => {
                    console.info('FMS_updateForm_0400 onRefreshCallBack end');
                    done();
                }, 1000);
            }

            let onDeletedCallBack = (_:BusinessError, data:  CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_updateForm_0400 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeDeletedCallback("FMS_updateForm_0400"));
                formId = '-1';
                commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);;

                console.log(`FMS_updateForm_0400 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "updateForm" : true,
                            "updateId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_updateForm_0400 onDeletedCallBack featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    commonEvent.publish("FMS_FormUpdateRefresh_commonEvent", options,
                        () => delPublishCallBack("FMS_updateForm_0100", done));
                }).catch((err: BusinessError) => {
                    console.log(`FMS_updateForm_0400 onDeletedCallBack featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
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
                console.log(`FMS_updateForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnDeleted_commonEvent", options,
                    () => delPublishCallBack("FMS_updateForm_0100", done));
            }).catch((err: BusinessError) => {
                console.log(`FMS_updateForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_updateForm_0400 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_updateForm_0500
         * @tc.name: The jsonData of form in the provider is empty.
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0500`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            console.log(`FMS_updateForm_0500 start`);

            let onRefreshCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_updateForm_0500 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeOnRefreshCallback("FMS_updateForm_0500"));
                commonEvent.publish(deleteForm_Event, data,
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "updateForm" : true,
                        "updateId" : "self",
                        "jsonEmpty" : true,
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_updateForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormUpdateRefresh_commonEvent", options,
                    () => delPublishCallBack("FMS_updateForm_0500", done));
            }).catch((err: BusinessError) => {
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
        it(`FMS_hostRefresh_0100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            console.log(`FMS_hostRefresh_0100 start`);

            let onRequestCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_hostRefresh_0100 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRequestCallback("FMS_hostRefresh_0100"));
                commonEvent.publish(deleteForm_Event, data,
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "-1",
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_hostRefresh_0100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnRequest_commonEvent", options,
                    () => delPublishCallBack("FMS_updateForm_0100", done));
            }).catch((err: BusinessError) => {
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
        it(`FMS_hostRefresh_0200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            console.log(`FMS_hostRefresh_0200 start`);

            let onRequestCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_hostRefresh_0200 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRequestCallback("FMS_hostRefresh_0200"));
                commonEvent.publish(deleteForm_Event, data,
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "0",
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_hostRefresh_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnRequest_commonEvent", options,
                    () => delPublishCallBack("FMS_updateForm_0100", done));
            }).catch((err: BusinessError) => {
                console.log(`FMS_hostRefresh_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0200 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_hostRefresh_0300
         * @tc.name: formID id is error because formId is not self
         * @tc.desc: 1.The form user B to invoke the intiative timed refresh interface.
         * 2.Verify the result of the intiative timed refresh interface.
         */
        it('FMS_hostRefresh_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            console.log('FMS_hostRefresh_0300 start');
            let formId: string;
            let onRequestCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_hostRefresh_0300 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRefreshCallback("FMS_hostRefresh_0300"));
                let commonEventPublishData: CommonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData,
                    () => delPublishCallBack("FMS_hostRefresh_0300", done));
                done();
            }

            let onAcquiredCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_hostRefresh_0300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_hostRefresh_0300"));
                formId = 'formId';
                commonEvent.subscribe(subscriberOnRequest, onRequestCallBack);
                console.log(`FMS_hostRefresh_0300 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "requestForm" : true,
                            "requestId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_hostRefresh_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    commonEvent.publish("FMS_FormOnRequest_commonEvent", options,
                        () => delPublishCallBack("FMS_hostRefresh_0300", done));
                }).catch((err: BusinessError) => {
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_hostRefresh_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", options,
                    () => delPublishCallBack("FMS_hostRefresh_0300", done));
            }).catch((err: BusinessError) => {
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
        it(`FMS_hostRefresh_0400`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            console.log(`FMS_hostRefresh_0400 start`);

            let formId: string | null;
            let onRequestCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_hostRefresh_0400 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRequestCallback("FMS_hostRefresh_0400"));
                setTimeout(() => {
                    console.info('FMS_hostRefresh_0400 onRequestCallBack end');
                    done();
                }, 10);
            }

            let onDeletedCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_hostRefresh_0400 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeDeletedCallback("FMS_hostRefresh_0400"));
                formId = null;
                commonEvent.subscribe(subscriberOnRequest, onRequestCallBack);
                console.log(`FMS_hostRefresh_0400 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "requestForm" : true,
                            "requestId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_hostRefresh_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    commonEvent.publish("FMS_FormOnRequest_commonEvent", options,
                        () => delPublishCallBack("FMS_hostRefresh_0400", done));
                }).catch((err: BusinessError) => {
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
                console.log(`FMS_hostRefresh_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnDeleted_commonEvent", options,
                    () => delPublishCallBack("FMS_updateForm_0100", done));
            }).catch((err: BusinessError) => {
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
        it(`FMS_hostRefresh_0600`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            console.log(`FMS_hostRefresh_0600 start`);

            let onRequestCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_hostRefresh_0600 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRequestCallback("FMS_hostRefresh_0600"));

                setTimeout(()=>{
                    console.info('FMS_hostRefresh_0600 onRequestCallBack end');
                    done();
                }, 1000);
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "1",
                        "isCreate" : false
                    }
                }
            }).then((res) => {
                console.log(`FMS_hostRefresh_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnRequest_commonEvent", options,
                    () => delPublishCallBack("FMS_updateForm_0300", done));
            }).catch((err: BusinessError) => {
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
        it(`FMS_hostRefresh_0700`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
            console.log(`FMS_hostRefresh_0700 start`);

            let formId: string;
            let onRequestCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_hostRefresh_0700 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRequestCallback("FMS_hostRefresh_0700"));
                commonEvent.publish(deleteForm_Event, data, () => delPublishCallBack("FMS_hostRefresh_0700", done));
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
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res) => {
                console.log(`FMS_hostRefresh_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                commonEvent.publish("FMS_FormOnRequest_commonEvent", options,
                    () => delPublishCallBack("FMS_updateForm_0300", done));
            }).catch((err: BusinessError) => {
                console.log(`FMS_hostRefresh_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0700 featureAbility.startAbility end`);
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

const unsubscribeOnRequestCallback = (tcNumber: string) => {
    console.debug(`====>${tcNumber} unsubscribeOnRequestCallback CallBack====>`);
}

const unsubscribeOnRefreshCallback = (tcNumber: string) => {
    console.debug(`====>${tcNumber} unsubscribeOnRefreshCallback CallBack====>`);
}

const unsubscribeDeletedCallback = (tcNumber: string) => {
    console.debug(`====>${tcNumber} unsubscribeDeletedCallback====>`);
}

const unsubscribeOnAcquiredCallback = (tcNumber: string) => {
    console.debug(`====>${tcNumber} unsubscribeOnAcquiredCallback CallBack====>`);
}