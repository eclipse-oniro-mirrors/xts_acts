/*

Copyright (c) 2021-2024 Huawei Device Co., Ltd.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
import featureAbility from "@ohos.ability.featureAbility";
import commonEvent from '@ohos.commonEvent';
import { beforeAll, beforeEach, afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import CommonEventManager from '@ohos.commonEventManager';

interface onFormEvent {
    events: string[];
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
    return new Promise((resolve)=>setTimeout(resolve,time));
}

export default function FmsUpdateRefreshNoPerTest() {
    describe('FmsUpdateRefreshNoPerTest', () => {

        beforeAll(async (done: ()=> void) => {
            done();
        })

        beforeEach(async () => {
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberOnDeleted = await commonEvent.createSubscriber(onDeletedFormEvent);
            subscriberOnRefresh = await commonEvent.createSubscriber(onUpdateRefreshEvent);
            subscriberOnRequest = await commonEvent.createSubscriber(onRequestFormEvent);
        })

        afterEach(async () => {
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
                console.log("FmsUpdateRefreshFormTest startAbility data: " + JSON.stringify(data));
            }).catch((err: BusinessError) => {
                console.log("FmsUpdateRefreshFormTest startAbility err: " + JSON.stringify(err));
            })
        })

        /**
         * @tc.name   FMS_hostRefreshNoPer_0100
         * @tc.number FMS_hostRefreshNoPer_0100
         * @tc.desc   1.The form user A to invoke the intiative timed refresh interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_hostRefreshNoPer_0100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
            console.log('FMS_hostRefreshNoPer_0100 start');

            let onRequestCallBack = (err:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
                console.info("!!!====>FMS_hostRefreshNoPer_0100 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.code).assertEqual(0);
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRequestCallback("FMS_hostRefreshNoPer_0100"));

                setTimeout(() => {
                    console.info('FMS_hostRefreshNoPer_0100 onRequestCallBack end');
                    console.log(`FMS_hostRefreshNoPer_0100 end`);
                    done();
                }, 1000);
            }

            commonEvent.subscribe(subscriberOnRequest, onRequestCallBack);
            console.log(`FMS_hostRefreshNoPer_0100 featureAbility.startAbility start`);
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
                console.log(`FMS_hostRefreshNoPer_0100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                options.code = res;
                commonEvent.publish("FMS_FormOnRequest_commonEvent", options,
                    () => delPublishCallBack("FMS_hostRefreshNoPer_0100", done));
            }).catch((err: BusinessError) => {
                console.log(`FMS_hostRefreshNoPer_0100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefreshNoPer_0100 featureAbility.startAbility end`);
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