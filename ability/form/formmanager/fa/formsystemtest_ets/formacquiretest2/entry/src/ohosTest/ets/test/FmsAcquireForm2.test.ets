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

let options:CommonEventManager.CommonEventPublishData = {
    code: 1,
    data: "initial data",
    isOrdered: true
}

let deleteForm_Event: string = "FMS_FormDelete_commonEvent";

let subscriberOnError: CommonEventManager.CommonEventSubscriber;
let subscriberOnAcquired: CommonEventManager.CommonEventSubscriber;
let subscriberCast: CommonEventManager.CommonEventSubscriber;
let subscriberSupply: CommonEventManager.CommonEventSubscriber;

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

export default function test() {
    describe(`FmsAcquiredFormTest2`, () => {

        beforeEach(async () => {
            subscriberOnError = await commonEvent.createSubscriber(onErrorForm_Event);
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberCast = await commonEvent.createSubscriber(subscriberFormCastEvent);
            subscriberSupply = await commonEvent.createSubscriber(onSupplyEvent);
        })

        afterEach(async() => {
            commonEvent.unsubscribe(subscriberOnError, () => unsubscribeCallback("FMS_acquireForm_3800 afterEach unsubscribe subscriberOnError"));
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("FMS_acquireForm_3800 afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberCast, () => unsubscribeCallback("FMS_acquireForm_3800 afterEach unsubscribe subscriberCast"));
            commonEvent.unsubscribe(subscriberSupply, () => unsubscribeCallback("FMS_acquireForm_3800 afterEach unsubscribe subscriberSupply"));
            await sleep(1000);
        })

        /**
         * @tc.name   FMS_acquireForm_3800
         * @tc.number FMS_acquireForm_3800
         * @tc.desc   Failed to create form when verifying that the parameter (formId) of creating form is wrong.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_acquireForm_3800`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void) => {
            console.info(`FMS_acquireForm_3800 start`);

            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_acquireForm_3800 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.code).assertEqual(1);
                commonEvent.unsubscribe(subscriberOnError, () => {
                    console.info(`FMS_acquireForm_3800 unsubscribe callback`);
                });
            }

            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_3800 featureAbility.startAbility start`);
            setTimeout(async () => {
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_3800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect(res).assertEqual(0);
                    done()
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_3800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    options.code = err.code;
                    options.data = 'FMS_FormOnError_commonEvent';
                    commonEvent.publish("FMS_FormOnError_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_3800 onErrorCallBack publish start`)})
                });
            }, 500);
            console.info(`FMS_acquireForm_3800 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_acquireForm_3900
         * @tc.number FMS_acquireForm_3900
         * @tc.desc   Failed to create form when verifying that the parameter (bundleName) of creating form is wrong.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_acquireForm_3900`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void) => {
            console.info(`FMS_acquireForm_3900 start`);

            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_acquireForm_3900 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.code).assertEqual(1);
                commonEvent.unsubscribe(subscriberOnError, () => {
                    console.info(`FMS_acquireForm_3900 unsubscribe callback`);
                });
            }

            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_3900 featureAbility.startAbility start`);
            setTimeout(async () => {
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_3900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect(res).assertEqual(0);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_3900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    options.code = err.code;
                    options.data = 'FMS_FormOnError_commonEvent';
                    commonEvent.publish("FMS_FormOnError_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_3800 onErrorCallBack publish start`)})
                });
            }, 500);
            console.info(`FMS_acquireForm_3900 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_acquireForm_4000
         * @tc.number FMS_acquireForm_4000
         * @tc.desc   Return failed.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_acquireForm_4000`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void) => {
            console.info(`FMS_acquireForm_4000 start`);

            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_acquireForm_4000 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.code).assertEqual(1);
                commonEvent.unsubscribe(subscriberOnError, () => unsubscribeOnErrorCallback("FMS_acquireForm_4000"));
                console.info(`FMS_acquireForm_4000 end`);
                commonEvent.publish(deleteForm_Event, data, (err) => {
                    console.info('FMS_acquireForm_4000 publish' + JSON.stringify(err));
                });
            }

            let onAcquiredCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_acquireForm_4000 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_4000"))
                commonEvent.subscribe(subscriberOnError, onErrorCallBack);

                console.info(`FMS_acquireForm_4000 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": data.data,
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "dimension": "2",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_4000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect(res).assertEqual(0);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_4000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    data.code = err.code;
                    data.data = 'FMS_FormOnError_commonEvent';
                    commonEvent.publish("FMS_FormOnError_commonEvent", data, () => {
                        console.info(`FMS_acquireForm_4000 onErrorCallBack publish start`)})
                });
                console.info(`FMS_acquireForm_4000 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.info(`FMS_acquireForm_4000 featureAbility.startAbility start`);
            setTimeout(async () => {
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
                            "dimension": "1",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_4000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    options.data = 'FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_4000 onAcquiredCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_4000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
            }, 500);
            console.info(`FMS_acquireForm_4000 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_acquireForm_4200
         * @tc.number FMS_acquireForm_4200
         * @tc.desc   Success to create form when verifying that the parameter (formName) of creating form is success.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_acquireForm_4200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void) => {
            console.info(`FMS_acquireForm_4200 start`);

            let onAcquiredCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_acquireForm_4200 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_4200"))
                commonEvent.publish(deleteForm_Event, data,
                    () => delPublishCallBack('FMS_acquireForm_4200', done));
            }
            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);

            let onSupplyCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("====>FMS_acquireForm_4200 onSupplyCallBack====>" + JSON.stringify(data));
                if (data.data == "FMS_FormSupply_commonEvent") {
                    commonEvent.unsubscribe(subscriberSupply, () => unsubscribeSupplyCallback("FMS_acquireForm_4200"));
                    expect(data.code).assertEqual(0);
                    commonEvent.publish(deleteForm_Event, data, ()=>{
                        console.info("====>FMS_acquireForm_4200 onSupplyCallBack end");
                    });
                }

                data.data = 'FMS_FormOnAcquired_commonEvent';
                commonEvent.publish("FMS_FormOnAcquired_commonEvent", data, () => {
                    console.info(`FMS_acquireForm_4200 onAcquiredCallBack publish start`)})

            }

            commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            console.info(`FMS_acquireForm_4200 featureAbility.startAbility start`);
            setTimeout(async () => {
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_4200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    options.data = 'FMS_FormSupply_commonEvent';
                    commonEvent.publish("FMS_FormSupply_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_4200 onSupplyCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_4200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
            }, 500); 
            console.info(`FMS_acquireForm_4200 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_acquireForm_4300
         * @tc.number FMS_acquireForm_4300
         * @tc.desc   Success to create form when verifying that the parameter (dimension) of creating form.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_acquireForm_4300`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void) => {
            console.info(`FMS_acquireForm_4300 start`);
            let onAcquiredCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) =>{
                console.info("!!!====>FMS_acquireForm_4300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_4300"));
                console.info(`FMS_acquireForm_4300 end`);
                done();
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.info(`FMS_acquireForm_4300 featureAbility.startAbility start`);
            setTimeout(async () => {
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhosti",
                        abilityName: "com.ohos.st.formsystemhosti.MainAbility",
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
                    console.info(`FMS_acquireForm_4300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    options.data = 'FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_4300 onAcquiredCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_4300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
            }, 500);
            console.info(`FMS_acquireForm_4300 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_acquireForm_4400
         * @tc.number FMS_acquireForm_4400
         * @tc.desc   Failed to create form when verifying that the parameter (dimension) of creating form is wrong.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_acquireForm_4400`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void) => {
            console.info(`FMS_acquireForm_4400 start`);

            let onErrorCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_acquireForm_4400 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.code).assertEqual(1);
                commonEvent.unsubscribe(subscriberOnError, () => {
                    console.info(`FMS_acquireForm_4400 unsubscribe callback`);
                });
            }

            commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            console.info(`FMS_acquireForm_4400 featureAbility.startAbility start`);
            setTimeout(async () => {
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhosti",
                        abilityName: "com.ohos.st.formsystemhosti.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "dimension": "6",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_4400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect(res).assertEqual(0);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_4400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    options.code = err.code;
                    options.data = 'FMS_FormOnError_commonEvent';
                    commonEvent.publish("FMS_FormOnError_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_4300 onErrorCallBack publish start`)})
                });
            }, 500);
            console.info(`FMS_acquireForm_4400 featureAbility.startAbility end`);
        });

        /**
         * @tc.name   FMS_acquireForm_4900
         * @tc.number FMS_acquireForm_4900
         * @tc.desc   When the verification formId is set to 0, the form is created failed.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_acquireForm_4900`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void) => {
            console.info(`FMS_acquireForm_4900 start`);

            let onCastCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_acquireForm_4900 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormCast_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberCast, () => unsubscribeOnCastCallback("FMS_acquireForm_4900"))
                let formId: string = ''
                if(data.parameters?.formId){
                    formId = data.parameters.formId
                }
                commonEvent.publish(deleteForm_Event, data,(err) => {
                    console.info('FMS_acquireForm_4900 publish' + JSON.stringify(err));
		            done()
                });
            }

            let onAcquiredCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) =>{
                console.info("!!!====>FMS_acquireForm_4900 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.data).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.code).assertEqual(0);
                commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeOnAcquiredCallback("FMS_acquireForm_4900"))
                commonEvent.subscribe(subscriberCast, onCastCallBack);

                console.info(`FMS_acquireForm_4900 featureAbility.startAbility again start`);
                featureAbility.startAbility({
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
                    console.info(`FMS_acquireForm_4900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`)
                    data.code = res;
                    data.data = 'FMS_FormCast_commonEvent';
                    commonEvent.publish("FMS_FormCast_commonEvent", data, () => {
                        console.info(`FMS_acquireForm_4900 onCastCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_4900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_4900 featureAbility.startAbility again end`);
            }

            commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            console.info(`FMS_acquireForm_4900 featureAbility.startAbility start`);
            setTimeout(async () => {
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
                    console.info(`FMS_acquireForm_4900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    options.code = res;
                    options.data = 'FMS_FormOnAcquired_commonEvent';
                    commonEvent.publish("FMS_FormOnAcquired_commonEvent", options, () => {
                        console.info(`FMS_acquireForm_4900 onAcquiredCallBack publish start`)})
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_4900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
            }, 500);
            console.info(`FMS_acquireForm_4900 featureAbility.startAbility end`);
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

const unsubscribeOnErrorCallback = (tcNumber: string) => {
    console.debug(`====>${tcNumber} unsubScribeOnErrorCallback====>`);
}

const unsubscribeOnAcquiredCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unSubscribeOnAcquiredCallback====>`);
}

const unsubscribeSupplyCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unSubscribeSupplyCallback====>`);
}

const unsubscribeOnCastCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeOnCastCallback====>`);
}