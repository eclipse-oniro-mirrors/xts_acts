'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function systemBarEffectTest() {

  describe('systemBarEffectTest', () => {
    beforeAll(() => {
      console.info("systemBarEffectTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api12.static", "EntryAbility")
      
    });
    beforeEach(() => {
      console.info("systemBarEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageEffect/systemBarEffect',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get systemBarEffectTest state pages: " + JSON.stringify(pages));
        if (!("systemBarEffect" == pages.name)) {
          console.info("get systemBarEffectTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push systemBarEffectTest page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("systemBarEffectTest after each called");
    });

    
    
    
/**
     * @tc.number   systemBarEffectTest_static_0100
     * @tc.name     systemBarEffectTest_static_0100
     * @tc.desc     systemBarEffectTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('systemBarEffectTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('systemBarEffectTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('SystemBarEffect_id'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SystemBarEffect_text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('systemBarEffect succ');
      console.info('[systemBarEffectTest_static_0100] END');
      done();
    });
  })
}
