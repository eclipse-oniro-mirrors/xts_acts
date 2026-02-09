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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function search_maxLength2() {
  describe('search_maxLength2', () => {
    beforeAll(() => {
      console.info("search_maxLength2 beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/search_maxLength2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get search_maxLength2 state pages: " + JSON.stringify(pages));
        if (!("search_maxLength2" == pages.name)) {
          console.info("get search_maxLength2 state pages.name: " + '');
          await CommonFunc.sleep(2000);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push search_maxLength2 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search_maxLength2 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SearchMaxLength2_static_001
     * @tc.name     SearchMaxLength2_static_001
     * @tc.desc     SearchMaxLength2_static_001
     * @tc.level    Level.LEVEL3
     */
    it('SearchMaxLength2_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('SearchMaxLength2_static_001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchMaxLength9'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let setText = await driver.findComponent(ON.id('setText'));
      await (setText?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('SearchMaxLength2_static_001 click success');
      let strJson1 = inspector.getInspectorByKey('SearchMaxLength2');
      let obj2 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[SearchMaxLength2_static_001] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1)));
      expect(obj2.getElement('$attrs').getString('value')).assertEqual('123456789');
      console.info('[SearchMaxLength2_static_001] END');
      done();
    });

    
    /**
     * @tc.number   SearchMaxLength2_static_002
     * @tc.name     SearchMaxLength2_static_002
     * @tc.desc     SearchMaxLength2_static_002
     * @tc.level    Level.LEVEL3
     */
    it('SearchMaxLength2_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('SearchMaxLength2_static_002 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchMaxLength5'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let setText = await driver.findComponent(ON.id('setText'));
      await (setText?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('SearchMaxLength2_static_002 click success');
      let strJson1 = inspector.getInspectorByKey('SearchMaxLength2');
      let obj4 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[SearchMaxLength2_static_002] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1)));
      expect(obj4.getElement('$attrs').getString('value')).assertEqual('12345');
      console.info('[SearchMaxLength2_static_002] END');
      done();
    });
  })
}
