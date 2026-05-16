/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the `License`);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an `AS IS` BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import featureAbility from '@ohos.ability.featureAbility';
import commonEvent from '@ohos.commonEvent';
import { beforeEach, afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

interface onFormEvent {
    events: string[];
}

interface infoType {
    formId: string
    isCreate: boolean
    requestForm: boolean
    requestId: string
    subscribeTerminate: boolean
}

const onAcquiredEvent: onFormEvent = {
    events: [`FMS_FormOnAcquired_commonEvent`],
};
const onSupplyEvent: onFormEvent = {
    events: [`FMS_FormSupply_commonEvent`],
};
const onRequestEvent: onFormEvent = {
    events: [`FMS_FormOnRequest_commonEvent`],
};
const formOnTerminateEvent: string = `FMS_FormTerminate_commonEvent`;

const unsubscribeCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

let options:CommonEventManager.CommonEventPublishData = {
    code: 1,
    data: "initial data",
    isOrdered: true
}

let normalFormId: string = '';
let tempFormId: string = '';
let hostFormId: string = '';
let tcNumber: string;
let hostCounter: number;
let providerCounter: number;
let onAcquiredEventSubscriber: CommonEventManager.CommonEventSubscriber;
let onSupplyEventSubscriber: CommonEventManager.CommonEventSubscriber;
let onRequestEventSubscriber: CommonEventManager.CommonEventSubscriber;

export default function test() {
    describe(`FmsHostDeathRecipientTest`, () => {

        beforeEach(async () => {
            tcNumber = `FmsHostDeathRecipientTest`;
            hostCounter = 0;
            providerCounter = 0;
            onAcquiredEventSubscriber = await commonEvent.createSubscriber(onAcquiredEvent);
            onSupplyEventSubscriber = await commonEvent.createSubscriber(onSupplyEvent);
            onRequestEventSubscriber = await commonEvent.createSubscriber(onRequestEvent);
        });

        afterEach(async() => {
            commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeCallback("afterEach unsubscribe onAcquiredEventSubscriber"));
            commonEvent.unsubscribe(onSupplyEventSubscriber, () => unsubscribeCallback("afterEach unsubscribe onSupplyEventSubscriber"));
            commonEvent.unsubscribe(onRequestEventSubscriber, () => unsubscribeCallback("afterEach unsubscribe onRequestEventSubscriber"));
            await sleep(1000);
        })

        /**
         * @tc.name   FMS_hostDeathRecipient_0200
         * @tc.number FMS_hostDeathRecipient_0200
         * @tc.desc   The provider's onDestroy event will be triggered.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(`FMS_hostDeathRecipient_0200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void) => {
            tcNumber = `FMS_hostDeathRecipient_0200`;
            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                if(data.data){
                    hostFormId = data.data;
                }
                console.info(`${tcNumber} onAcquiredCallBack formId: ${hostFormId}`);
                if (data.parameters?.cast) {
                    tempFormId = hostFormId;
                } else {
                    normalFormId = hostFormId;
                }
                console.info(`${tcNumber} onAcquiredCallBack hostCounter: ${hostCounter}`);
                if (++hostCounter == 2) {
                    // onAcquired * 2
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, unsubscribeOnAcquiredCallback);
                    // terminate host
                    commonEvent.publish(formOnTerminateEvent, publishOnTerminateCallback);
                    await sleep(2000);
                    // reset host
                    await startAbility(`com.ohos.st.formsystemhostk`, `com.ohos.st.formsystemhostk.MainAbility`, false);
                    console.info(`${tcNumber} onAcquiredCallBack end`);
                }
            });

            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                let kind: string = ''
                if (data.parameters?.kind) {
                    kind = data.parameters.kind;
                }

                const supplyFormId: string = getSupplyFormId(data);
                console.info(`${tcNumber} onSupplyCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onSupplyCallBack formId: ${supplyFormId} kind: ${kind}`);

                if (`onDestroy` == kind) {
                    expect(tempFormId).assertEqual(supplyFormId);
                    done()
                } else if (`onUpdate` == kind) {
                    expect(normalFormId).assertEqual(supplyFormId);
                    done()
                }
                if (++providerCounter == 4) {
                     console.info(`${tcNumber} onSupplyCallBack 123`);
                    // onCreate * 2 onDestroy * 1 onUpdate * 1
                    commonEvent.unsubscribe(onSupplyEventSubscriber, unsubscribeOnSupplyCallback);
                    console.info(`${tcNumber} onSupplyCallBack end`);
                    //await sleep(1000);
                }
                done();
            });

            await startAbility(`com.ohos.st.formsystemhostk`, `com.ohos.st.formsystemhostk.MainAbility`, true);
            await sleep(3000);
            done();
        });
    });
}

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

const getSupplyFormId = (data: CommonEventManager.CommonEventPublishData): string => {
    console.info(`${tcNumber} getSupplyFormId  run data: ${JSON.stringify(data)}`);
    if(!data.parameters?.kind){
        console.info(`${tcNumber} kind is null`);
        return '';
    }
    switch (data.parameters?.kind) {
        case `onCreate`:
            return JSON.parse(data.parameters.parameters).parameters[`ohos.extra.param.key.form_identity`];
        case `onVisibilityChange`:
            return Object.keys(JSON.parse(data.parameters.parameters))[0]
        default:
            return data.parameters.parameters;
    }
}

const unsubscribeOnAcquiredCallback = () => {
    console.info(`${tcNumber} unsubscribeOnAcquired callback`);
}
const unsubscribeOnSupplyCallback = () => {
    console.info(`${tcNumber} unsubscribeOnSupply callback`);
}
const unsubscribeOnRequestCallback = () => {
    console.info(`${tcNumber} unsubscribeOnRequest callback`);
}
const publishOnTerminateCallback = () => {
    console.info(`${tcNumber} publishOnTerminate callback`);
}

const startAbility = async (
    bundleName: string,
    abilityName: string,
    createTempAndNormal: boolean) => {
    try {
        if (createTempAndNormal) {
            const res = await featureAbility.startAbility({
                want: {
                    bundleName: bundleName,
                    abilityName: abilityName,
                    parameters: {
                        formId: `0`,
                        name: `Form_Js001`,
                        bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                        ability: `FormAbility`,
                        moduleName: `entry`,
                        temporary: false,
                        isCreate: true,
                        createTempAndNormal: true,
                        subscribeTerminate: true,
                        tempParam: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                            ability: `FormAbility`,
                            moduleName: `entry`
                        }
                    }
                }
            });
            console.info(`${tcNumber} featureAbility.startAbility defaultParameterInfo res: ${JSON.stringify(res)}`);
            commonEvent.publish('FMS_FormOnAcquired_commonEvent', (err) => {
                console.info(`${tcNumber} onAcquiredCallback publish` + JSON.stringify(err));
            });
            return;
        }
        const res = await featureAbility.startAbility({
            want: {
                bundleName: bundleName,
                abilityName: abilityName,
                parameters: {
                    name: `Form_Js001`,
                    bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                    ability: `FormAbility`,
                    moduleName: `entry`,
                    temporary: false,
                    createTempAndNormal: false,
                    formId: normalFormId,
                    isCreate: true,
                    requestForm: true,
                    requestId: normalFormId,
                    subscribeTerminate: true
                }
            }
        });
        console.info(`${tcNumber} featureAbility.startAbility newParameterInfo res: ${JSON.stringify(res)}`);
        commonEvent.publish('FMS_FormSupply_commonEvent', (err) => {
            console.info(`${tcNumber} onFormSupplyCallback publish` + JSON.stringify(err));
        });
    } catch (error) {
        console.info(`${tcNumber} featureAbility.startAbility error: ${JSON.stringify(error)}`);
        console.info(`${tcNumber} should not reach here`);
        expect().assertFail();
    }
};