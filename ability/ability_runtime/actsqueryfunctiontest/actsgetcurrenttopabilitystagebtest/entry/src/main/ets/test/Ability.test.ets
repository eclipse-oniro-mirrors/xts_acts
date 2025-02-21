/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import commonEvent from "@ohos.commonEvent"

var subscriberInfo_MainAbility2 = {
    events: ["GetCurrentTopAbility"],
};
const START_ABILITY_TIMEOUT = 4000;
export default function abilityTest() {
    describe('ActsParticleAbilityStageBTest', function () {
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        afterEach(async (done) => {
            console.debug('= ACTS_afterEach ====<begin');
            await sleep(2000);
            console.debug('= ACTS_afterEach ====<end');
            done();
        })

        /**
         *@tc.number: ACTS_GetCurrentTopAbility_0200
         *@tc.name: Verify the interface for obtaining the Ability of the foreground
         *@tc.desc:Start PageAbility2,Ability1 to be tested in turn, and get the current foreground Ability (AsyncCallback)
         */
        it('ACTS_GetCurrentTopAbility_0200', 0, async function (done) {
            console.log("ACTS_GetCurrentTopAbility_0200 --- start")
            abilityDelegatorRegistry.getAbilityDelegator()
            var flag=true;
            var Subscriber;
            var AbilityDelegator=await abilityDelegatorRegistry.getAbilityDelegator();

            async function SubscribeCallBack(err, data) {
                console.debug("ACTS_GetCurrentTopAbility_0200====>Subscribe CallBack data:====>" + JSON.stringify(data));
                expect(data.event == 'GetCurrentTopAbility').assertTrue();
                if (data.event == 'GetCurrentTopAbility') {
                  await sleep(1000);
                    AbilityDelegator.getCurrentTopAbility((err,data) => {
                        console.debug("====>thisTopAbility====>"+JSON.stringify(data.lastRequestWant))
                        console.debug("====>start startAbility====>");
                        expect(data.lastRequestWant.abilityName).assertEqual('Ability1')
                        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
                    })
                }
            }

            commonEvent.createSubscriber(subscriberInfo_MainAbility2).then(async (data) => {
                console.debug("ACTS_GetCurrentTopAbility_0200====>Create Subscriber====>");
                Subscriber = data;
                await commonEvent.subscribe(Subscriber, SubscribeCallBack);
                await globalThis.abilityContext.startAbility(
                    {
                        bundleName: 'com.example.actsgetcurrenttopabilitystagebtest',
                        abilityName: 'Ability2'
                    })
            })

            function UnSubscribeCallback() {
                console.debug("ACTS_GetCurrentTopAbility_0200====>UnSubscribe CallBack====>");
                globalThis.ability2Context.terminateSelf();
                globalThis.ability3Context.terminateSelf();
                done();
            }

        })

        /**
         *@tc.number: ACTS_GetCurrentTopAbility_0500
         *@tc.name: Verify the interface for obtaining the Ability of the foreground
         *@tc.desc:Start PageAbility1,Ability2 to be tested in turn, and get the current foreground Ability (Promise)
         */
        it('ACTS_GetCurrentTopAbility_0500', 0, async function (done) {
            console.log("ACTS_GetCurrentTopAbility_0500 --- start")
            abilityDelegatorRegistry.getAbilityDelegator()
            var flag=true;
            var Subscriber;
            var AbilityDelegator=await abilityDelegatorRegistry.getAbilityDelegator();

            function SubscribeCallBack(err, data) {
                console.debug("ACTS_GetCurrentTopAbility_0500====>Subscribe CallBack data:====>" + JSON.stringify(data));
                expect(data.event == 'GetCurrentTopAbility').assertTrue();
                if (data.event == 'GetCurrentTopAbility') {
                    AbilityDelegator.getCurrentTopAbility().then((data) => {
                        console.debug("====>thisTopAbility====>"+JSON.stringify(data.lastRequestWant))
                        console.debug("====>start startAbility====>");
                        expect(data.lastRequestWant.abilityName).assertEqual('Ability1')
                        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
                    })
                }
            }

            commonEvent.createSubscriber(subscriberInfo_MainAbility2).then(async (data) => {
                console.debug("ACTS_GetCurrentTopAbility_0500====>Create Subscriber====>");
                Subscriber = data;
                await commonEvent.subscribe(Subscriber, SubscribeCallBack);
                await globalThis.abilityContext.startAbility(
                    {
                        bundleName: 'com.example.actsgetcurrenttopabilitystagebtest',
                        abilityName: 'Ability2',
                    })
            })

            function UnSubscribeCallback() {
                console.debug("ACTS_GetCurrentTopAbility_0500====>UnSubscribe CallBack====>");
                globalThis.ability2Context.terminateSelf();
                globalThis.ability3Context.terminateSelf();
                done();
            }
        })
    })
}