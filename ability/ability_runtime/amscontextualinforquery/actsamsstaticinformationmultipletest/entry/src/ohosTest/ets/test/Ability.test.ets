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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import commonEvent from '@ohos.commonEvent';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import bundleManager from '@ohos.bundle.bundleManager'

let subscriberInfo:commonEventManager.CommonEventSubscribeInfo = {
  events: ['MainAbility_Start_CommonEvent_multi_hap_entryB', 'MainAbility_Start_CommonEvent_multiple_hap_entry']
};


export default function abilityTest() {
  describe('ActsAbilityMultipleTest', () => {

    /*
     * @tc.number: ACTS_getAbilityInfo_0500
     * @tc.name: Starting singleton ability the second time does triggers onNewWant.
     * @tc.desc: Starting singleton ability the second time does triggers onNewWant.
     */
    it('ACTS_getAbilityInfo_0500', 0, async (done:Function) => {
      console.log("ACTS_getAbilityInfo_0500 --- start")
      let Subscriber:commonEventManager.CommonEventSubscriber;
      let EntryHap = false;
      let FeatureHap = false;

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.staticquerytesttwo",
        abilityName: "com.example.staticquerytesttwo.MainAbility",
        action:"startmultiple"
      }, (error:BusinessError, data:common.AbilityResult) => {
        console.log('ACTS_getAbilityInfo_0500 - startAbility start HapA: '
        + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_getAbilityInfo_0500====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      let SubscribeCallBack = (err:BusinessError, data:commonEventManager.CommonEventData):void => {
        console.debug("ACTS_getAbilityInfo_0500====>Subscribe CallBack data:====>"
        + JSON.stringify(data));
        console.debug("ACTS_getAbilityInfo_0500====>Subscribe CallBack data.event:====>"
        + JSON.stringify(data.event));
        if (data.event == 'MainAbility_Start_CommonEvent_multi_hap_entryB') {
          EntryHap = true;
          console.log("ACTS_getAbilityInfo_0500====> MainAbility_Start_CommonEvent_multi_hap_entryB")
          let abilityInfo:bundleManager.AbilityInfo = JSON.parse(data.parameters!['abilityInfo'])
          let hapModuleInfo:bundleManager.HapModuleInfo = JSON.parse(data.parameters!['hapModuleInfo'])
          let applicationInfo:bundleManager.ApplicationInfo =JSON.parse(data.parameters!['applicationInfo'])
          console.log("ACTS_getAbilityInfo_0500_entry_abilityInfo" + abilityInfo.name)
          console.log("ACTS_getAbilityInfo_0500_entry_applicationInfo" + applicationInfo.name)
          console.log("ACTS_getAbilityInfo_0500_entry_hapModuleInfo" + hapModuleInfo.name)
          expect(abilityInfo.name).assertEqual("com.example.staticquerytesttwo.MainAbility");
          expect(applicationInfo.name).assertEqual("com.example.staticquerytesttwo");
          expect(hapModuleInfo.name).assertEqual("com.example.staticquerytesttwo");
        } else if (data.event == 'MainAbility_Start_CommonEvent_multiple_hap_entry'){
          FeatureHap = true;
          console.log("ACTS_getAbilityInfo_0500====> MainAbility_Start_CommonEvent_multi_hap_feature")
          let abilityInfo1:bundleManager.AbilityInfo = JSON.parse(data.parameters!['abilityInfo'])
          let hapModuleInfo1:bundleManager.HapModuleInfo = JSON.parse(data.parameters!['hapModuleInfo'])
          let applicationInfo1:bundleManager.ApplicationInfo =JSON.parse(data.parameters!['applicationInfo'])
          console.log("ACTS_getAbilityInfo_0500_feature_abilityInfo" + abilityInfo1.name)
          console.log("ACTS_getAbilityInfo_0500_feature_applicationInfo" + applicationInfo1.name)
          console.log("ACTS_getAbilityInfo_0500_feature_hapModuleInfo" + hapModuleInfo1.name)
          expect(abilityInfo1.name).assertEqual("com.acts.stinformationmulapp.MainAbility");
          expect(applicationInfo1.name).assertEqual("com.acts.stinformationmulapp");
          expect(hapModuleInfo1.name).assertEqual("com.acts.stinformationmulapp");
        }
        if(EntryHap && FeatureHap){
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      let UnSubscribeCallback = ():void => {
        console.debug("ACTS_getAbilityInfo_0500====>UnSubscribe CallBack====>");
        done();
      }
    })

  })
}