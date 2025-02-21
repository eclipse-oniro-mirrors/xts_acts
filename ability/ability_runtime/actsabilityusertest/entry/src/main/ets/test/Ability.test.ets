/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import commonEvent from '@ohos.commonEvent'
var subscriberInfo_MainAbility = {
    events: ["ACTS_StartAbility_CommonEvent"]
};
const START_ABILITY_TIMEOUT = 4000;
export default function abilityTest() {
    describe('ACTS_StartAbility_Test', function () {

        /*
       * @tc.number    : ACTS_StartAbility_Callback_Successfully_0100
       * @tc.name      : start new ability
       * @tc.desc      : Starting mainability2 with startability succeeded.(callback)
       */
        it('ACTS_StartAbility_Callback_Successfully_0100', 0, async function (done) {
            var Subscriber
            var flag = true
            var startresult = false

            function SubscribeCallBack(err, data) {
                expect(data.event == "ACTS_StartAbility_CommonEvent").assertTrue();
                console.log("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
                if (data.event == "ACTS_StartAbility_CommonEvent") {
                    startresult = true
                }
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }

            function UnSubscribeCallback() {
                console.log("====>UnSubscribeCallback====>");
                flag = false
                expect(startresult).assertEqual(true);
                done();
            }

            await commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data) => {
                console.log("====>Create Subscriber====>");
                data.getSubscribeInfo().then(async (SubscribeInfo) => {
                    console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
                    Subscriber = data;
                    commonEvent.subscribe(Subscriber, SubscribeCallBack);
                    console.log("====>start startAbility====>");
                    globalThis.abilityContext.startAbility(
                        {
                            bundleName: 'com.example.actsabilityusertest',
                            abilityName: 'MainAbility2'
                        }, () => {
                        console.log("====>startAbility end====>");
                    })
                })
            })

            function timeout() {
                if (flag == true) {
                    expect().assertFail();
                    console.log('ACTS_StartAbility_Callback_Successfully_0100 - timeout')
                    commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
                }
            }

            setTimeout(timeout, START_ABILITY_TIMEOUT);
        })

        /*
       * @tc.number    : ACTS_StartAbility_Callback_Error_0200
       * @tc.name      : start new ability
       * @tc.desc      : Starting mainability2 with startability failed.(callback)
       */
        it('ACTS_StartAbility_Callback_Error_0200', 0, async function (done) {
            var AbilityDelegatorArgs = AbilityDelegatorRegistry.getArguments()
            console.log("====>getArguments is====>" + JSON.stringify(AbilityDelegatorArgs));
            var Subscriber

            function SubscribeCallBack(err, data) {
                expect().assertFail();
                console.log("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }

            function UnSubscribeCallback() {
                console.log("====>UnSubscribeCallback====>");
                done();
            }

            await commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data) => {
                console.log("====>Create Subscriber====>");
                data.getSubscribeInfo().then(async (SubscribeInfo) => {
                    console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
                    Subscriber = data;
                    commonEvent.subscribe(Subscriber, SubscribeCallBack);
                    console.log("====>start startAbility====>");
                    await globalThis.abilityContext.startAbility(
                        {
                            bundleName: 'com.example.error',
                            abilityName: 'com.example.error.MainAbility2'
                        }, () => {
                        console.log("====>startAbility end====>");
                    })
                })
            })

            function timeout() {
                console.log('ACTS_StartAbility_Callback_Error_0200 - timeout');
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            }

            setTimeout(timeout, START_ABILITY_TIMEOUT);
        })

        /*
       * @tc.number    : ACTS_StartAbility_Promise_Successfully_0100
       * @tc.name      : start new ability
       * @tc.desc      : Starting mainability2 with startability succeeded.(callback)
       */
        it('ACTS_StartAbility_Promise_Successfully_0100', 0, async function (done) {
            var Subscriber
            var flag = true
            var startresult = false

            function SubscribeCallBack(err, data) {
                expect(data.event == "ACTS_StartAbility_CommonEvent").assertTrue();
                console.log("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
                if (data.event == "ACTS_StartAbility_CommonEvent") {
                    startresult = true
                }
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }

            function UnSubscribeCallback() {
                console.log("====>UnSubscribeCallback====>");
                flag = false
                expect(startresult).assertEqual(true);
                done();
            }

            commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data) => {
                console.log("====>Create Subscriber====>");
                data.getSubscribeInfo().then(async (SubscribeInfo) => {
                    console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
                    Subscriber = data;
                    commonEvent.subscribe(Subscriber, SubscribeCallBack);
                    console.log("====>start startAbility====>");
                    await globalThis.abilityContext.startAbility(
                        {
                            bundleName: 'com.example.actsabilityusertest',
                            abilityName: 'MainAbility3'
                        }).then(() => {
                        console.log("====>startAbility end====>");
                    })
                })
            })

            function timeout() {
                if (flag == true) {
                    expect().assertFail();
                    console.log('ACTS_StartAbility_Promise_Successfully_0100 - timeout');
                    commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
                }
            }

            setTimeout(timeout, START_ABILITY_TIMEOUT);
        })

        /*
       * @tc.number    : ACTS_StartAbility_Promise_Error_0200
       * @tc.name      : start new ability
       * @tc.desc      : Starting mainability2 with startability failed.(callback)
       */
        it('ACTS_StartAbility_Promise_Error_0200', 0, async function (done) {
            var AbilityDelegatorArgs = AbilityDelegatorRegistry.getArguments()
            console.log("====>getArguments is====>" + JSON.stringify(AbilityDelegatorArgs));
            var Subscriber

            function SubscribeCallBack(err, data) {
                expect().assertFail();
                console.log("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }

            function UnSubscribeCallback() {
                console.log("====>UnSubscribeCallback====>");
                done();
            }

            commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data) => {
                console.log("====>Create Subscriber====>");
                data.getSubscribeInfo().then(async (SubscribeInfo) => {
                    console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
                    Subscriber = data;
                    commonEvent.subscribe(Subscriber, SubscribeCallBack);
                    console.log("====>start startAbility====>");
                    globalThis.abilityContext.startAbility(
                        {
                            bundleName: 'com.example.error',
                            abilityName: 'com.example.error.MainAbility2'
                        }).then(() => {
                        console.log("====>startAbility end====>");
                    })
                })
            })

            function timeout() {
                console.log('ACTS_StartAbility_Promise_Error_0200 - timeout');
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            }

            setTimeout(timeout, START_ABILITY_TIMEOUT);
        })
    })
}