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

export default function search_caret() {
  describe('search_caret', () => {
    beforeAll(() => {
      console.info("search_caret beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/search_caret',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get search_caret state pages: " + JSON.stringify(pages));
        if (!("search_caret" == pages.name)) {
          console.info("get search_caret state pages.name: " + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push search_caret page result: " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push search_caret page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   search_caret_static_001
     * @tc.name     search_caret_static_001
     * @tc.desc     search_caret_static_001
     * @tc.level    Level.LEVEL3
     */
    it('search_caret_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[search_caret_static_001] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('search_caret_static_002 click success');
      let strJson1 = inspector.getInspectorByKey('SearchCaretText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[search_caret_static_001] END');
      done();
    });

    
    /**
     * @tc.number   search_caret_static_002
     * @tc.name     search_caret_static_002
     * @tc.desc     search_caret_static_002
     * @tc.level    Level.LEVEL3
     */
    it('search_caret_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[search_caret_static_002] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret5'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('search_caret_static_002 click success');
      let strJson1 = inspector.getInspectorByKey('SearchCaretText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('5');
      console.info('[search_caret_static_002] END');
      done();
    });

    
    /**
     * @tc.number   search_caret_static_003
     * @tc.name     search_caret_static_003
     * @tc.desc     search_caret_static_003
     * @tc.level    Level.LEVEL3
     */
    it('search_caret_static_003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[search_caret_static_003] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('search_caret_static_003 click success');
      let strJson1 = inspector.getInspectorByKey('SearchCaretText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[search_caret_static_003] END');
      done();
    });

    
    /**
     * @tc.number   search_caret_static_004
     * @tc.name     search_caret_static_004
     * @tc.desc     search_caret_static_004
     * @tc.level    Level.LEVEL3
     */
    it('search_caret_static_004', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[search_caret_static_004] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret20'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('search_caret_static_004 click success');
      let strJson1 = inspector.getInspectorByKey('SearchCaretText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('9');
      console.info('[search_caret_static_004] END');
      done();
    });

    
    /**
     * @tc.number   search_caret_static_005
     * @tc.name     search_caret_static_005
     * @tc.desc     search_caret_static_005
     * @tc.level    Level.LEVEL3
     */
    it('search_caret_static_005', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[search_caret_static_005] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret_1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('search_caret_static_005 click success');
      let strJson1 = inspector.getInspectorByKey('SearchCaretText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[search_caret_static_005] END');
      done();
    });
  })
}
