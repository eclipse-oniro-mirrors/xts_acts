/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import formInfo  from '@ohos.app.form.formInfo';
import formHost from '@ohos.app.form.formHost';
import commonEvent from '@ohos.commonEvent';
import { beforeAll, beforeEach, afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@kit.BasicServicesKit';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Want } from '@kit.AbilityKit';

interface onFormEvent {
    events: string[];
}

const INTERVAL_TIME = 2500;
const DELEGATOR: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let onUpdateSizeFormEvent: onFormEvent = {
    events: ["FMS_FormOnUpdateSize_commonEvent"],
};

let onFormLocationChanged: onFormEvent = {
    events: ["FMS_FormOnLocationChanged_commonEvent"],
};

let finishForm_Event: string = "FMS_FormTestFinish_commonEvent";

let subscriberOnUpdateSize: CommonEventManager.CommonEventSubscriber;
let subscriberonFormLocationChanged: CommonEventManager.CommonEventSubscriber;

const unsubscribeCallback = (tcNumber: string)  => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

let options:CommonEventManager.CommonEventPublishData = {
    code: 1,
    data: "initial data",
    isOrdered: true
}

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

export default function UpdateFormSizeTest() {
  describe(`UpdateFormSizeTest`, () => {
    beforeAll(async (done: () => void) => {
        done();
    })

    beforeEach(async () => {
        subscriberOnUpdateSize = await commonEvent.createSubscriber(onUpdateSizeFormEvent);
        subscriberonFormLocationChanged = await commonEvent.createSubscriber(onFormLocationChanged);
        await sleep(1000);
    })

    afterEach(async () => {
        commonEvent.unsubscribe(subscriberOnUpdateSize, () => unsubscribeCallback("afterEach unsubscribe subscriberOnUpdateSize"));
        commonEvent.unsubscribe(subscriberonFormLocationChanged, () => unsubscribeCallback("afterEach unsubscribe subscriberonFormLocationChanged"));
    })

    /*
     * @tc.number  UpdateFormSize_0100
     * @tc.name    UpdateFormSize_0100
     * @tc.desc    Function UpdateFormSize test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`UpdateFormSize_0100`, 0, async (done:Function) => {
        console.log(`UpdateFormSize_0100 start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            console.info("!!!====>UpdateFormSize_0100 onUpdateSizeCallBack data:====>" + JSON.stringify(data));
            expect(data.code).assertEqual(16501001);
            
            commonEvent.publish(finishForm_Event, data, async (err) => {
                console.info('UpdateFormSize_0100 publish' + JSON.stringify(err));
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        console.log(`UpdateFormSize_0100 startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": true,
                "testFormId": "0",
                "newDimension" : 3,
            }
        }).then(() => {
            console.log(`UpdateFormSize_0100 startAbilityhost end`);
        }).catch((err: BusinessError) => {
            console.log(`UpdateFormSize_0100 startAbilityhost error: ${JSON.stringify(err)}`);
        });
        console.log(`UpdateFormSize_0100 startAbility end`);
    });

    /*
     * @tc.number  UpdateFormSize_0200
     * @tc.name    UpdateFormSize_0200
     * @tc.desc    Function UpdateFormSize test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`UpdateFormSize_0200`, 0, async (done:Function) => {
        console.log(`UpdateFormSize_0200 start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            console.info("!!!====>UpdateFormSize_0200 onUpdateSizeCallBack data:====>" + JSON.stringify(data));
            expect(data.code).assertEqual(16501001);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                console.info('UpdateFormSize_0200 publish' + JSON.stringify(err));
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        console.log(`UpdateFormSize_0200 startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": true,
                "testFormId": "1",
                "newDimension" : 3,
            }
        }).then(() => {
            console.log(`UpdateFormSize_0200 startAbilityhost end`);
        }).catch((err: BusinessError) => {
            console.log(`UpdateFormSize_0200 startAbilityhost error: ${JSON.stringify(err)}`);
        });
        console.log(`UpdateFormSize_0200 startAbility end`);
    });

    /*
     * @tc.number  UpdateFormSize_0300
     * @tc.name    UpdateFormSize_0300
     * @tc.desc    Function UpdateFormSize test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`UpdateFormSize_0300`, 0, async (done:Function) => {
        console.log(`UpdateFormSize_0300 start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            console.info("!!!====>UpdateFormSize_0300 onUpdateSizeCallBack data:====>" + JSON.stringify(data));
            expect(data.code).assertEqual(16501001);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                console.info('UpdateFormSize_0300 publish' + JSON.stringify(err));
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        console.log(`UpdateFormSize_0300 startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": true,
                "testFormId": "1",
                "newDimension" : 3,
            }
        }).then(() => {
            console.log(`UpdateFormSize_0300 startAbilityhost end`);
        }).catch((err: BusinessError) => {
            console.log(`UpdateFormSize_0300 startAbilityhost error: ${JSON.stringify(err)}`);
        });
        console.log(`UpdateFormSize_0300 startAbility end`);
    });

    /*
     * @tc.number  UpdateFormSize_0400
     * @tc.name    UpdateFormSize_0400
     * @tc.desc    Function UpdateFormSize test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`UpdateFormSize_0400`, 0, async (done:Function) => {
        console.log(`UpdateFormSize_0400 start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            console.info("!!!====>UpdateFormSize_0400 onUpdateSizeCallBack data:====>" + JSON.stringify(data));
            expect(data.code).assertEqual(16501001);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                console.info('UpdateFormSize_0400 publish' + JSON.stringify(err));
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        console.log(`UpdateFormSize_0400 startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": true,
                "testFormId": "2147483647",
                "newDimension" : 3,
            }
        }).then(() => {
            console.log(`UpdateFormSize_0400 startAbilityhost end`);
        }).catch((err: BusinessError) => {
            console.log(`UpdateFormSize_0400 startAbilityhost error: ${JSON.stringify(err)}`);
        });
        console.log(`UpdateFormSize_0400 startAbility end`);
    });

    /*
     * @tc.number  UpdateFormSize_0500
     * @tc.name    UpdateFormSize_0500
     * @tc.desc    Function UpdateFormSize test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`UpdateFormSize_0500`, 0, async (done:Function) => {
        console.log(`UpdateFormSize_0500 start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            console.info("!!!====>UpdateFormSize_0500 onUpdateSizeCallBack data:====>" + JSON.stringify(data));
            expect(data.code).assertEqual(0);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                console.info('UpdateFormSize_0500 publish' + JSON.stringify(err));
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        console.log(`UpdateFormSize_0500 startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": false,
                "newDimension" : 3,
            }
        }).then(() => {
            console.log(`UpdateFormSize_0500 startAbilityhost end`);
        }).catch((err: BusinessError) => {
            console.log(`UpdateFormSize_0500 startAbilityhost error: ${JSON.stringify(err)}`);
        });
        console.log(`UpdateFormSize_0500 startAbility end`);
    });

    /*
     * @tc.number  UpdateFormSize_0600
     * @tc.name    UpdateFormSize_0600
     * @tc.desc    Function UpdateFormSize test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`UpdateFormSize_0600`, 0, async (done:Function) => {
        console.log(`UpdateFormSize_0600 start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            console.info("!!!====>UpdateFormSize_0600 onUpdateSizeCallBack data:====>" + JSON.stringify(data));
            expect(data.code).assertEqual(16501012);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                console.info('UpdateFormSize_0600 publish' + JSON.stringify(err));
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        console.log(`UpdateFormSize_0600 startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": false,
                "newDimension" : 0,
            }
        }).then(() => {
            console.log(`UpdateFormSize_0600 startAbilityhost end`);
        }).catch((err: BusinessError) => {
            console.log(`UpdateFormSize_0600 startAbilityhost error: ${JSON.stringify(err)}`);
        });
        console.log(`UpdateFormSize_0600 startAbility end`);
    });

    /*
     * @tc.number  UpdateFormSize_0700
     * @tc.name    UpdateFormSize_0700
     * @tc.desc    Function UpdateFormSize test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`UpdateFormSize_0700`, 0, async (done:Function) => {
        console.log(`UpdateFormSize_0700 start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            console.info("!!!====>UpdateFormSize_0700 onUpdateSizeCallBack data:====>" + JSON.stringify(data));
            expect(data.code).assertEqual(16501012);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                console.info('UpdateFormSize_0700 publish' + JSON.stringify(err));
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        console.log(`UpdateFormSize_0700 startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": false,
                "newDimension" : 5,
            }
        }).then(() => {
            console.log(`UpdateFormSize_0700 startAbilityhost end`);
        }).catch((err: BusinessError) => {
            console.log(`UpdateFormSize_0700 startAbilityhost error: ${JSON.stringify(err)}`);
        });
        console.log(`UpdateFormSize_0700 startAbility end`);
    });

    /*
     * @tc.number  UpdateFormSize_0800
     * @tc.name    UpdateFormSize_0800
     * @tc.desc    Function UpdateFormSize test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`UpdateFormSize_0800`, 0, async (done:Function) => {
        console.log(`UpdateFormSize_0800 start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            console.info("!!!====>UpdateFormSize_0800 onUpdateSizeCallBack data:====>" + JSON.stringify(data));
            expect(data.code).assertEqual(401);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                console.info('UpdateFormSize_0800 publish' + JSON.stringify(err));
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        console.log(`UpdateFormSize_0800 startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": false,
                "isTestRect": true,
                "newDimension" : 3,
            }
        }).then(() => {
            console.log(`UpdateFormSize_0800 startAbilityhost end`);
        }).catch((err: BusinessError) => {
            console.log(`UpdateFormSize_0800 startAbilityhost error: ${JSON.stringify(err)}`);
        });
        console.log(`UpdateFormSize_0800 startAbility end`);
    });

    /*
     * @tc.number  FormLocationChanged_0100
     * @tc.name    FormLocationChanged_0100
     * @tc.desc    Function FormLocationChanged test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`FormLocationChanged_0100`, 0, async (done:Function) => {
        console.log(`FormLocationChanged_0100 start`);
        let onFormLocationChangedCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            console.info("!!!====>FormLocationChanged_0100 onFormLocationChangedCallBack data:====>" + JSON.stringify(data));
            expect(data.code).assertEqual(0);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                console.info('FormLocationChanged_0100 publish' + JSON.stringify(err));
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberonFormLocationChanged, onFormLocationChangedCallBack);
        console.log(`FormLocationChanged_0100 startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "isFormLocation" : true,
                "formLocation" : 0,
            }
        }).then(() => {
            console.log(`FormLocationChanged_0100 startAbilityhost end`);
        }).catch((err: BusinessError) => {
            console.log(`FormLocationChanged_0100 startAbilityhost error: ${JSON.stringify(err)}`);
        });
        console.log(`FormLocationChanged_0100 startAbility end`);
    });
  })
}