'use static';
/**
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
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
let testAbilityContext: common.UIAbilityContext;

export default function backgroundEffectTest() {
  describe('backgroundEffectTest', () => {
    beforeAll(() => {
      console.info("backgroundBrightness beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api14.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("backgroundEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/background/backgroundEffect',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get backgroundEffectTest state pages: " + JSON.stringify(pages));
        if (!("backgroundEffect" == pages.name)) {
          console.info("get backgroundEffectTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push backgroundEffectTest page error: " + err);
      }
    });


    
    
/**
     * @tc.number   backgroundEffectTest_static_0100
     * @tc.name     backgroundEffectTest_static_0100
     * @tc.desc     backgroundEffectTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('backgroundEffectTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('backgroundEffectTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('backgroundEffectValue');
      await CommonFunc.sleep(1000);
      console.log('backgroundEffectTest_static_0100',
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')))
      await CommonFunc.sleep(1000);
      // expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundEffect').getDouble('radius'))
      //   .assertEqual(10);
      // expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundEffect').getDouble('saturation'))
      //   .assertEqual(50);
      // expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundEffect').getDouble('brightness'))
      //   .assertEqual(2);
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('inactiveColor')).assertEqual("#FFFF0000");
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('policy')).assertEqual("BlurStyleActivePolicy.ALWAYS_ACTIVE");
      console.info('backgroundEffectTest_static_0100 END');
      done();
    });
  })
}
