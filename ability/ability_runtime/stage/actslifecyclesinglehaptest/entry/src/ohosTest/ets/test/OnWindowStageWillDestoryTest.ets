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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commonEventManager from '@ohos.commonEventManager';
import UIAbility from '@ohos.app.ability.UIAbility';

export default function OnWindowStageWillDestroyTest() {
  describe('OnWindowStageWillDestroyTest', function () {

    let TAG = '';
    let events = ['MainAbility13onDestroy', 'MainAbility13onForeground', 'MainAbility13onBackground']
    let delegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let subscriber = undefined;

    afterEach(async (done) => {
      if (subscriber) {
        commonEventManager.unsubscribe(subscriber)
      }
      setTimeout(()=>{
        done()
      }, 1000)
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0100
     * @tc.number SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0100
     * @tc.desc   check if the lifecycle is executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0100", Level.LEVEL0, async function (done) {
      TAG = 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0100'
      console.info(TAG + ' start.');
      commonEventManager.createSubscriber({
        events: events
      }).then((data) => {
        console.info(TAG + ' createSubscriber successful. ');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
        console.info(TAG + ' subscriber successful. ');
        globalThis.abilityContext.startAbility({
          abilityName:'MainAbility13',
          bundleName:'com.example.lifecycle_xts',
          parameters:{
            type:0
          }
        }, (err, data)=>{
          console.info(TAG + ' startAbility err: ' + JSON.stringify(err));
          console.info(TAG + ' startAbility data: ' + JSON.stringify(data));
        })
      })
      let subscribeCallBack = (err, data) => {
        console.info(TAG + ' subscribeCallBack , data = ' + JSON.stringify(data));
        let event = data.event;
        let parameters = data['parameters']
        if (event === 'MainAbility13onDestroy') {
          let onWindowStageWillDestroyExecutCount = parameters.onWindowStageWillDestoryExecutCount;
          expect(onWindowStageWillDestroyExecutCount).assertEqual(1);
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0200
     * @tc.number SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0200
     * @tc.desc   check if the lifecycle is executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0200", Level.LEVEL0, async function (done) {
      TAG = 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0200'
      console.info(TAG + ' start.');
      let ability13:UIAbility
      commonEventManager.createSubscriber({
        events: events
      }).then((data) => {
        console.info(TAG + ' createSubscriber successful. ');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
        console.info(TAG + ' subscriber successful. ');
        globalThis.abilityContext.startAbility({
          abilityName:'MainAbility13',
          bundleName:'com.example.lifecycle_xts',
          parameters:{
            type:1
          }
        }, (err, data)=>{
          console.info(TAG + ' startAbility err: ' + JSON.stringify(err));
          console.info(TAG + ' startAbility data: ' + JSON.stringify(data));
        })
      })

      let subscribeCallBack = (err, data) => {
        console.info(TAG + ' subscribeCallBack , data = ' + JSON.stringify(data));
        let event = data.event;
        let parameters = data['parameters']
        if (event === 'MainAbility13onForeground') {
          let mainAbility13onForeground = parameters.mainAbility13onForeground;
          if (mainAbility13onForeground == 1) {
            delegator.getCurrentTopAbility().then(ab=>{
              ability13 = ab;
              setTimeout(()=>{
                delegator.doAbilityBackground(ability13);
              }, 500)
            }).catch((error)=>{
              console.info(TAG + ' getCurrentTopAbility , catch error = ' + JSON.stringify(error));
              console.info(TAG + ' getCurrentTopAbility , catch error = ' + error);
            })
          }
        }
        if (event === 'MainAbility13onBackground' && ability13) {
          console.info(TAG + ' doAbilityForeground , start .');
          delegator.doAbilityForeground(ability13).catch(error=>{
            console.info(TAG + ' doAbilityForeground , catch error = ' + JSON.stringify(error));
          });
        }
        if (event === 'MainAbility13onDestroy') {
          let onWindowStageWillDestroyExecutCount = parameters.onWindowStageWillDestoryExecutCount;
          expect(onWindowStageWillDestroyExecutCount).assertEqual(1);
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0300
     * @tc.number SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0300
     * @tc.desc   check if the lifecycle is executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0300", Level.LEVEL0, async function (done) {
      TAG = 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0300'
      console.info(TAG + ' start.');
      let destoryCount = 0;
      commonEventManager.createSubscriber({
        events: events
      }).then((data) => {
        console.info(TAG + ' createSubscriber successful. ');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
        console.info(TAG + ' subscriber successful. ');
        globalThis.abilityContext.startAbility({
          abilityName:'MainAbility13',
          bundleName:'com.example.lifecycle_xts',
          parameters:{
            type:0
          }
        })
        setTimeout(()=>{
          globalThis.abilityContext.startAbility({
            abilityName:'MainAbility13',
            bundleName:'com.example.lifecycle_xts',
            parameters:{
              type:0
            }
          })
        }, 5000)
      })
      let subscribeCallBack = (err, data) => {
        console.info(TAG + ' subscribeCallBack , data = ' + JSON.stringify(data));
        let event = data.event;
        if (event === 'MainAbility13onDestroy') {
          destoryCount++;
        }
        if (destoryCount == 2) {
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0400
     * @tc.number SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0400
     * @tc.desc   check if the lifecycle is executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0400", Level.LEVEL0, async function (done) {
      TAG = 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestroy_0400'
      console.info(TAG + ' start.');
      commonEventManager.createSubscriber({
        events: events
      }).then((data) => {
        console.info(TAG + ' createSubscriber successful. ');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
        console.info(TAG + ' subscriber successful. ');
        globalThis.abilityContext.startAbility({
          abilityName:'MainAbility13',
          bundleName:'com.example.lifecycle_xts',
          parameters:{
            type:2
          }
        })
      })
      let subscribeCallBack = (err, data) => {
        console.info(TAG + ' subscribeCallBack , data = ' + JSON.stringify(data));
        let event = data.event;
        let parameters = data['parameters']
        if (event === 'MainAbility13onDestroy') {
          let onWindowStageWillDestroyExecutCount = parameters.onWindowStageWillDestoryExecutCount;
          let offCatchError = parameters.offCatchError;
          expect(onWindowStageWillDestroyExecutCount).assertEqual(1);
          expect(offCatchError).assertFalse();
          done();
        }
      }
    });
  })
}