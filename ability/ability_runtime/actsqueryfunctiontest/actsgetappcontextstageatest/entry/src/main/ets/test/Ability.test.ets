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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commonEvent from '@ohos.commonEvent'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
const START_ABILITY_TIMEOUT = 5000;
var GetAppContext1 = {
    events: ["ACTS_GetAppContext"]
};
export default function abilityTest() {
    describe('ACTS_GetAppContext_TEST', function () {
        /*
         * @tc.number  : ACTS_GetAppContext_0200
         * @tc.name    : The test framework needs to provide the following query-related functions
         * @tc.desc    : Get the context of the application, Ability
         */
        it('ACTS_GetAppContext_0200', 0, async function (done) {
            let Subscriber
            var flag = true
            var AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
            function UnSubscribeCallback() {
                console.debug("====>UnSubscribeCallback====");
                flag = false
                done();
            }
            function SubscribeCallBack (err, data) {
                expect(data.event == "ACTS_GetAppContext").assertTrue();
                console.debug("====>0200 Subscribe CallBack data:" + JSON.stringify(data));
                var context = AbilityDelegator.getAppContext();
                console.debug("====>ACTS_GetAppContext_0200 context:" + context);
                expect(context.applicationInfo.name).assertEqual("com.example.actsgetappcontextstageatest");
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }
            commonEvent.createSubscriber(GetAppContext1).then(async (data) => {
                console.debug("ACTS_GetAppContext_0200====>Create Subscriber====");
                Subscriber = data;
                await commonEvent.subscribe(Subscriber, SubscribeCallBack);
                console.debug("====>start startAbility====");
                globalThis.abilityContext.startAbility(
                    {
                        bundleName: 'com.example.actsgetappcontextstageatest',
                        abilityName: 'MainAbility1'
                    }).then(()=>{
                    console.debug("====>startAbility end====");
                })
            })
            function timeout() {
                if(flag == true) {
                    expect().assertFail();
                    console.debug('ACTS_GetAppContext_0200 - timeout');
                    done();
                }
            }
            setTimeout(timeout, START_ABILITY_TIMEOUT);
        })
    })
}