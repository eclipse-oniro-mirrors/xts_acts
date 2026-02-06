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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commonEvent from "@ohos.commonEvent";
import common from '@ohos.app.ability.common';
import CommonEventManager from '@ohos.commonEventManager';
import emitter from '@ohos.events.emitter';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

let subscriberInfo_startdebugapp: CommonEventManager.CommonEventSubscribeInfo = {
  events: ["AACommand_Debugapp"],
};
const START_ABILITY_TIMEOUT = 4000;
let Subscriber: CommonEventManager.CommonEventSubscriber;
let flag = true;

function SubscribeCallBack(err: BusinessError, data: CommonEventManager.CommonEventData) {
  console.debug("====>ACTS_AACommand_package_0700 startAbility start====>");
  let Delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  Delegator.getCurrentTopAbility().then((data: UIAbility) => {
    console.debug("====>ACTS_AACommand_package_0700 thisTopAbility====>" + JSON.stringify(data.lastRequestWant));
    console.debug("====>thisTopAbility 0700 ====>" + JSON.stringify(data.launchWant));
    let i = JSON.stringify(data.launchWant).indexOf('debugApp":true');
    console.debug("ACTS_AACommand_package_0700 i = " + i);
    expect(i == -1).assertEqual(false);
  }).catch((err: BusinessError) => {
    console.debug("====>ACTS_AACommand_package_0700 err thisTopAbility====>" + JSON.stringify(err));
  })
  commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
}

function UnSubscribeCallback() {
  flag = false;
  console.debug("ACTS_AACommand_package_0700====>UnSubscribe CallBack====>");
  AppStorage.get<common.UIAbilityContext>("ability2Context").terminateSelf();
  AppStorage.get<common.UIAbilityContext>("ability3Context").terminateSelf();
  emitter.emit({ eventId: 1 });
}

export default function abilityTest() {
  describe('ACTS_AACommand_01_3', () => {
    it('ACTS_AACommand_package_0700', Level.LEVEL0, async (done: Function) => {
      emitter.on({
        eventId: 1
      }, () => {
        done();
      })
      commonEvent.createSubscriber(subscriberInfo_startdebugapp).then(async (data: CommonEventManager.CommonEventSubscriber) => {
        console.debug("ACTS_AACommand_package_0700====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
        await AppStorage.get<common.UIAbilityContext>("abilityContext").startAbility(
          {
            bundleName: 'com.example.aacommand07',
            abilityName: 'MainAbility3'
          })
      })
      setTimeout(() => {
        if (flag == true) {
          console.debug("====>0700====>end====>flag" + flag);
          console.debug("in ACTS_AACommand_package_0700 - timeout");
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          expect().assertFail();
        }
        console.debug("ACTS_AACommand_package_0700 - timeout");
      }, START_ABILITY_TIMEOUT);
    })
  })
}
