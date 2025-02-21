
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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import commonEvent from "@ohos.commonEvent"

let subscriberInfo_MainAbility = {
  events: ["GetCurrentTopAbility"],
};
export default function abilityTest() {
    describe('ActsGetAbilityStateStageTest', function () {

        /*
         * @tc.number  : ACTS_GetAbilityState_0200
         * @tc.name    : The test framework needs to provide the following query-related functions
         * @tc.desc    : Get the status of the Ability in the BACKGROUND state
         */
        it('ACTS_GetAbilityState_0200', 0, async function (done) {
            console.log('====>start ACTS_GetAbilityState_0200====');
            let ability;
            let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
            let count = 0;
            let subscriber;
            function onAbilityForegroundCallback2(){
                console.log("====>onAbilityForegroundCallback2====");
                count ++;
                if (count == 2) {
                  abilityDelegator.getCurrentTopAbility((err, data)=>{
                    console.log("====>getCurrentTopAbility_0200 err:" + JSON.stringify(err) + " data:" + JSON.stringify(data));
                    ability = data;
                    abilityDelegator.doAbilityBackground(ability, (err)=>{
                        console.log("====>doAbilityBackground_0200 data:" + JSON.stringify(err));
                        expect(err.code).assertEqual(0);
                    })
                })
                }
            }
            function onAbilityBackgroundCallback2(){
                console.log("====>onAbilityBackgroundCallback2====");
                let state = abilityDelegator.getAbilityState(ability);
                console.log("====>ACTS_GetAbilityState_0200 state:" + state);
                expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
                console.log("====>ACTS_GetAbilityState_0200 end====");
                commonEvent.unsubscribe(subscriber, UnSubscribeCallback);
            }

            commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
              console.log("ACTS_GetAbilityState_0200====>Create Subscriber====>");
              subscriber = data;
              await commonEvent.subscribe(subscriber, onAbilityForegroundCallback2);
            })

            function UnSubscribeCallback() {
              console.log("ACTS_GetAbilityState_0200====>UnSubscribe CallBack====>");
              done();
            }

            abilityDelegator.addAbilityMonitor(
                {abilityName: 'MainAbility2',
                    onAbilityForeground:onAbilityForegroundCallback2,
                    onAbilityBackground:onAbilityBackgroundCallback2
                }
            ).then(()=>{
                console.log("====>addAbilityMonitor_0200 finish====");
                globalThis.abilityContext.startAbility(
                    {
                        bundleName: 'com.example.actsgetabilitystatestagetest',
                        abilityName: 'MainAbility2',
                    }, (err)=>{
                    console.log("====>startAbility_0200 err:" + JSON.stringify(err));
                })
            })
        })

        /*
         * @tc.number  : ACTS_GetAbilityState_0300
         * @tc.name    : The test framework needs to provide the following query-related functions
         * @tc.desc    : Get the status of the Ability in the FOREGROUND state
         */
        it('ACTS_GetAbilityState_0300', 0, async function (done) {
            console.log('====>start ACTS_GetAbilityState_0300====');
            let ability;
            let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
            let count = 0;
            let subscriber;
            function onAbilityForegroundCallback3(){
                console.log("====>onAbilityForegroundCallback3====");
                count++;
                if (count == 2) {
                  abilityDelegator.getCurrentTopAbility((err, data)=>{
                    console.log("====>getCurrentTopAbility_0300 err:" + JSON.stringify(err) + "data:" + JSON.stringify(data));
                    ability = data;
                    let state = abilityDelegator.getAbilityState(ability);
                    console.log("====>ACTS_GetAbilityState_0300 state:" + state);
                    expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
                    expect(state != AbilityDelegatorRegistry.AbilityLifecycleState.CREATE).assertTrue();
                    expect(state != AbilityDelegatorRegistry.AbilityLifecycleState.DESTROY).assertTrue();
                    abilityDelegator.doAbilityBackground(ability, (err)=>{
                        console.log("====>doAbilityBackground_0300 data:" + JSON.stringify(err));
                        expect(err.code).assertEqual(0);
                        console.log("====>ACTS_GetAbilityState_0300 end====");
                        commonEvent.unsubscribe(subscriber, UnSubscribeCallback);
                    })
                })
                }
            }

            commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
              console.log("ACTS_GetAbilityState_0300====>Create Subscriber====>");
              subscriber = data;
              await commonEvent.subscribe(subscriber, onAbilityForegroundCallback3);
            })

            function UnSubscribeCallback() {
              console.log("ACTS_GetAbilityState_0300====>UnSubscribe CallBack====>");
              done();
            }

            abilityDelegator.addAbilityMonitor(
                {abilityName: 'MainAbility3',
                    onAbilityForeground:onAbilityForegroundCallback3}).then(()=>{
                console.log("====>addAbilityMonitor_0300 finish====");
                globalThis.abilityContext.startAbility(
                    {
                        bundleName: 'com.example.actsgetabilitystatestagetest',
                        abilityName: 'MainAbility3',
                    }, (err)=>{
                    console.log("====>startAbility_0300 err:" + JSON.stringify(err));
                })
            })
        })

        /*
         * @tc.number  : ACTS_GetAbilityState_0500
         * @tc.name    : The test framework needs to provide the following query-related functions
         * @tc.desc    : Get the status of an inactive or nonexistent Ability
         */
        it('ACTS_GetAbilityState_0500', 0, async function (done) {
            console.log('====>start ACTS_GetAbilityState_0500====');
            let ability = Object.create(null);
            let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
            let state = abilityDelegator.getAbilityState(ability);
            console.log("====>ACTS_GetAppState_0500 state:" + state);
            expect(state).assertEqual(undefined);
            console.log("====>ACTS_GetAbilityState_0500 end====");
            done();
        })

        /*
         * @tc.number  : ACTS_GetAbilityState_0600
         * @tc.name    : The test framework needs to provide the following query-related functions
         * @tc.desc    : Get the status of the Ability in the uninitialized state
         */
        it('ACTS_GetAbilityState_0600', 0, async function (done) {
            console.log('====>start ACTS_GetAbilityState_0600====');
            let ability;
            let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
            let count = 0;
            let subscriber;
            function onAbilityForegroundCallback6(){
                console.log("====>onAbilityForegroundCallback6====");
                count++;
                if (count == 2) {
                  abilityDelegator.getCurrentTopAbility((err, data)=>{
                    console.log("====>getCurrentTopAbility_0600 err:" + JSON.stringify(err) + "data:" + JSON.stringify(data));
                    ability = data;
                    globalThis.ability4Context.terminateSelf();
                  })
                }
            }
            function onAbilityDestroyCallback6(){
                console.log("====>onAbilityDestroyCallback6====");
                let state = abilityDelegator.getAbilityState(ability);
                console.log("====>ACTS_GetAbilityState_0600 data:" + state);
                console.log("====>UNINITIALIZED:"+ AbilityDelegatorRegistry.AbilityLifecycleState.UNINITIALIZED);
                expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.UNINITIALIZED);
                console.log("====>ACTS_GetAbilityState_0600 end====");
                commonEvent.unsubscribe(subscriber, UnSubscribeCallback);
            }

            commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
              console.log("ACTS_GetAbilityState_0600====>Create Subscriber====>");
              subscriber = data;
              await commonEvent.subscribe(subscriber, onAbilityForegroundCallback6);
            })

            function UnSubscribeCallback() {
              console.log("ACTS_GetAbilityState_0600====>UnSubscribe CallBack====>");
              done();
            }

            abilityDelegator.addAbilityMonitor(
                {abilityName: 'MainAbility4',
                    onAbilityForeground:onAbilityForegroundCallback6,
                    onAbilityDestroy:onAbilityDestroyCallback6}).then(()=>{
                console.log("====>addAbilityMonitor_0600 finish====");
                globalThis.abilityContext.startAbility(
                    {
                        bundleName: 'com.example.actsgetabilitystatestagetest',
                        abilityName: 'MainAbility4',
                    }, (err)=>{
                    console.log("====>startAbility_0600 err:" + JSON.stringify(err));
                })
            })
        })
    })
}