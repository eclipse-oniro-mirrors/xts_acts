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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import commonEvent from "@ohos.commonEvent"
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import { Want } from '@kit.AbilityKit';

function sleep(time:number) {
    return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

let subscriberInfo_MainAbility2: CommonEventManager.CommonEventSubscribeInfo = {
    events: ["GetCurrentTopAbility"],
};
const START_ABILITY_TIMEOUT = 4000;
export default function abilityTest() {
    describe('ActsParticleAbilityStageBTest', () => {
        afterEach(async (done: Function) => {
            console.info('= ACTS_afterEach ====<begin');
            let AbilityDelegator = await abilityDelegatorRegistry.getAbilityDelegator();
            AbilityDelegator.getCurrentTopAbility().then((data) => {
                console.info("====>thisTopAbility====>"+JSON.stringify(data.lastRequestWant))
                let want: Want = {
                    bundleName: 'com.example.actsgetcurrenttopabilitystagebtest',
                    abilityName: 'MainAbility'
                }
                console.info("====>start startAbility====>");
                if(data.lastRequestWant.abilityName!='MainAbility'){
                    AbilityDelegator.startAbility(want)
                }
            })
            await sleep(2000);
            console.info('= ACTS_afterEach ====<end');
            done();
        })

        /**
         * @tc.name   ACTS_GetCurrentTopAbility_0200
         * @tc.number ACTS_GetCurrentTopAbility_0200
         * @tc.desc   Start PageAbility2,Ability1 to be tested in turn, and get the current foreground Ability (AsyncCallback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_GetCurrentTopAbility_0200', Level.LEVEL0, async (done:Function) => {
            console.log("ACTS_GetCurrentTopAbility_0200 --- start")
            abilityDelegatorRegistry.getAbilityDelegator()
            let flag=true;
            let Subscriber:CommonEventManager.CommonEventSubscriber;
            let AbilityDelegator=await abilityDelegatorRegistry.getAbilityDelegator();

            commonEvent.createSubscriber(subscriberInfo_MainAbility2).then(async (data) => {
                console.info("ACTS_GetCurrentTopAbility_0200====>Create Subscriber====>");
                Subscriber = data;
                await commonEvent.subscribe(Subscriber, async (err, data) => {
                    console.info("ACTS_GetCurrentTopAbility_0200====>Subscribe CallBack data:====>" + JSON.stringify(data));
                    expect(data.event == 'GetCurrentTopAbility').assertTrue();
                    if (data.event == 'GetCurrentTopAbility') {
                    await sleep(1000);
                    AbilityDelegator.getCurrentTopAbility((err,data) => {
                        console.info("====>thisTopAbility====>"+JSON.stringify(data.lastRequestWant))
                        console.info("====>start startAbility====>");
                        expect(data.lastRequestWant.abilityName).assertEqual('Ability1')
                        commonEvent.unsubscribe(Subscriber, async () => {
                            console.debug("ACTS_GetCurrentTopAbility_0200====>UnSubscribe CallBack====>");
                            await globalThis.ability2Context.terminateSelf();
                            await globalThis.ability3Context.terminateSelf();
                            done();
                        })
                    })}
                });

                await globalThis.abilityContext.startAbility(
                    {
                        bundleName: 'com.example.actsgetcurrenttopabilitystagebtest',
                        abilityName: 'Ability2'
                    }
                ).then(()=>{
                    console.info("====>ACTS_GetCurrentTopAbility_0200 startAbility Ability2 start ====>");
                }).catch((err:BusinessError) =>{
                    console.info("====>ACTS_GetCurrentTopAbility_0200 startAbility Ability2 err ====>"+JSON.stringify(err));
                })
            
            })
        })

        /**
         * @tc.name   ACTS_GetCurrentTopAbility_0500
         * @tc.number ACTS_GetCurrentTopAbility_0500
         * @tc.desc   Start PageAbility1,Ability2 to be tested in turn, and get the current foreground Ability (Promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_GetCurrentTopAbility_0500', Level.LEVEL0, async (done:Function) => {
            console.log("ACTS_GetCurrentTopAbility_0500 --- start")
            abilityDelegatorRegistry.getAbilityDelegator()
            let flag=true;
            let Subscriber:CommonEventManager.CommonEventSubscriber;
            let AbilityDelegator=await abilityDelegatorRegistry.getAbilityDelegator();

            commonEvent.createSubscriber(subscriberInfo_MainAbility2).then(async (data) => {
                console.info("ACTS_GetCurrentTopAbility_0500====>Create Subscriber====>");
                Subscriber = data;
                await commonEvent.subscribe(Subscriber, (err, data) => {
                    console.info("ACTS_GetCurrentTopAbility_0500====>Subscribe CallBack data:====>" + JSON.stringify(data));
                    expect(data.event == 'GetCurrentTopAbility').assertTrue();
                    if (data.event == 'GetCurrentTopAbility') {
                        AbilityDelegator.getCurrentTopAbility().then((data) => {
                            console.info("====>thisTopAbility====>"+JSON.stringify(data.lastRequestWant))
                            console.info("====>start startAbility====>");
                            expect(data.lastRequestWant.abilityName).assertEqual('Ability1')
                            commonEvent.unsubscribe(Subscriber, async () => {
                                console.info("ACTS_GetCurrentTopAbility_0500====>UnSubscribe CallBack====>");
                                await globalThis.ability2Context.terminateSelf();
                                await globalThis.ability3Context.terminateSelf();
                                done();
                            })
                        })
                    }
                });

                await globalThis.abilityContext.startAbility(
                    {
                        bundleName: 'com.example.actsgetcurrenttopabilitystagebtest',
                        abilityName: 'Ability2',
                    }).then(()=>{
                        console.info("====>ACTS_GetCurrentTopAbility_0500 startAbility Ability2 start ====>");
                    }).catch((err:BusinessError) =>{
                        console.info("====>ACTS_GetCurrentTopAbility_0500 startAbility Ability2 err ====>"+JSON.stringify(err));
                    })
            })
        })
    })
}