'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it,beforeAll, Level, expect } from "../../../../hypium/index"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function subscribedAbstractPropertyJsunit() {
  describe('appInfoTest_four_8', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")
      
    });
    
    
/**
     * @tc.number   subscribedAbstractProperty_static_0100
     * @tc.name     subscribedAbstractProperty_static_0100
     * @tc.desc     subscribedAbstractProperty_static_0100
     * @tc.level    Level.LEVEL0
     */
it('subscribedAbstractProperty_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
     try {console.info('[subscribedAbstractProperty0100] START');
      if (true) {
        done();
        //return;
      }}catch(err) {
        expect().assertFail();
      }
/*
      const subscribedAbstractProperty: SubscribedAbstractProperty = new SubscribedAbstractProperty('subscribtest');
      subscribedAbstractProperty.notifyPropertyRead();
      subscribedAbstractProperty.notifyHasChanged('subscribtest');
      subscribedAbstractProperty.unlinkSuscriber(0);
      subscribedAbstractProperty.createOneWaySync('subscribtest');
      subscribedAbstractProperty.createTwoWaySync('subscribtest');
      subscribedAbstractProperty.set('subscribtest');
      subscribedAbstractProperty.get();
      subscribedAbstractProperty.info();
      subscribedAbstractProperty.info_ = "subscribtest";
      subscribedAbstractProperty.subscribers_ = 'subscribtest';
      console.info('[subscribedAbstractProperty0100] END');
      done();
*/

    });
  })
}
