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
import commonEvent from '@ohos.commonEvent';
import {Driver, ON} from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import bundleManager from '@ohos.bundle.bundleManager'
import commonEventManager from '@ohos.commonEventManager';

let driver = Driver.create();
let subscriberInfo:commonEventManager.CommonEventSubscribeInfo  = {
    events: ['MainAbility_Start_CommonEvent_multi_hap_entry', 'MainAbility_Start_CommonEvent_multi_hap_feature'],
};


export default function abilityTest() {
    describe('ActsAbilityMultiTest', () => {
        beforeEach(async (done:Function) => {
            setTimeout(() => { done(); }, 3000)
        })
        /**
         * @tc.name   ACTS_getAbilityInfo_0400
         * @tc.number ACTS_getAbilityInfo_0400
         * @tc.desc   Starting singleton ability the second time does triggers onNewWant.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_getAbilityInfo_0400', Level.LEVEL0, async (done:Function) => {
            console.log("ACTS_getAbilityInfo_0400 --- start")
            let Subscriber:commonEventManager.CommonEventSubscriber;
            let EntryHap = false;
            let FeatureHap = false;

            globalThis.abilityContext.startAbility({
                bundleName: "com.acts.stinformationmulapp",
                abilityName: "com.acts.stinformationmulapp.MainAbility",
                action:"startHapA"
            }, (error:BusinessError, data:common.AbilityResult) => {
                console.log('ACTS_getAbilityInfo_0400 - startAbility start HapA: '
                + JSON.stringify(error) + ", " + JSON.stringify(data))
            })

            commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
                console.debug("ACTS_getAbilityInfo_0400====>Create Subscriber====>");
                Subscriber = data;
                await commonEvent.subscribe(Subscriber, SubscribeCallBack);
            })

            let SubscribeCallBack = (err:BusinessError, data:commonEventManager.CommonEventData):void => {
                console.debug("ACTS_getAbilityInfo_0400====>Subscribe CallBack data:====>"
                + JSON.stringify(data));
                console.debug("ACTS_getAbilityInfo_0400====>Subscribe CallBack data.event:====>"
                + JSON.stringify(data.event));
                if (data.event == 'MainAbility_Start_CommonEvent_multi_hap_entry') {
                    EntryHap = true;
                    console.log("ACTS_getAbilityInfo_0400====> MainAbility_Start_CommonEvent_multi_hap_entry")
                    let abilityInfo:bundleManager.AbilityInfo = JSON.parse(data.parameters!['abilityInfo'])
                    let hapModuleInfo:bundleManager.HapModuleInfo = JSON.parse(data.parameters!['hapModuleInfo'])
                    let applicationInfo:bundleManager.ApplicationInfo =JSON.parse(data.parameters!['applicationInfo'])
                    console.log("ACTS_getAbilityInfo_0400_entry_abilityInfo" + abilityInfo.name)
                    console.log("ACTS_getAbilityInfo_0400_entry_applicationInfo" + applicationInfo.name)
                    console.log("ACTS_getAbilityInfo_0400_entry_hapModuleInfo" + hapModuleInfo.name)
                    expect(abilityInfo.name).assertEqual("com.acts.stinformationmulapp.MainAbility");
                    expect(applicationInfo.name).assertEqual("com.acts.stinformationmulapp");
                    expect(hapModuleInfo.name).assertEqual("com.acts.stinformationmulapp");
                } else if (data.event == 'MainAbility_Start_CommonEvent_multi_hap_feature'){
                    FeatureHap = true;
                    console.log("ACTS_getAbilityInfo_0400====> MainAbility_Start_CommonEvent_multi_hap_feature")
                    let abilityInfo1:bundleManager.AbilityInfo = JSON.parse(data.parameters!['abilityInfo'])
                    let hapModuleInfo1:bundleManager.HapModuleInfo = JSON.parse(data.parameters!['hapModuleInfo'])
                    let applicationInfo1:bundleManager.ApplicationInfo =JSON.parse(data.parameters!['applicationInfo'])
                    console.log("ACTS_getAbilityInfo_0400_feature_abilityInfo" + abilityInfo1.name)
                    console.log("ACTS_getAbilityInfo_0400_feature_applicationInfo" + applicationInfo1.name)
                    console.log("ACTS_getAbilityInfo_0400_feature_hapModuleInfo" + hapModuleInfo1.name)
                    expect(abilityInfo1.name).assertEqual("com.example.feature.MainAbility");
                    expect(applicationInfo1.name).assertEqual("com.acts.stinformationmulapp");
                    expect(hapModuleInfo1.name).assertEqual("com.example.feature");
                }
                if(EntryHap && FeatureHap){
                    commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
                }
            }
            let UnSubscribeCallback = ():void => {
                console.debug("ACTS_getAbilityInfo_0400====>UnSubscribe CallBack====>");
                done();
            }

            await driver.delayMs(2000);
            let allowed = await driver.findComponent(ON.text("��"));
            if (allowed) {
              console.log("find button");
              let point = await allowed.getBoundsCenter();
              console.log('point.x : ' + point.x +'point.y : '+ point.y);
              await driver.click(point.x, point.y);
            }
        })

    })
}