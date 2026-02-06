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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Driver,
  Component,
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
import { Router } from '@ohos.arkui.UIContext';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'

import { UtilsTest } from '../Util.test';

let testAbilityContext: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
const waitUiReadyMs = 1000;

export default function scrollOffsetJsunit() {
  describe('scrollOffsetJsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("scrollOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollOffset',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get scrollOffsetJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollOffset" == pages.name)) {
          console.info("get scrollOffsetJsunit state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push scrollOffsetJsunit page error: " + err);
        expect().assertFail();
      }
    });




    
      
  
/**
     * @tc.number   scrollOffsetJsunit_0100
     * @tc.name     scrollOffsetJsunit_0100
     * @tc.desc     scrollOffsetJsunit_0100
     * @tc.level    Level.LEVEL0
     */
it('scrollOffsetJsunit_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('scrollOffsetJsunit_0100 START');
      let strJson = inspector.getInspectorByKey('Scroll_Offset');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollOffsetJsunit_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[scrollOffsetJsunit_0100] initialOffset: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('initialOffset')));
      expect(obj.getElement('$attrs').getElement('initialOffset').getString('xOffset')).assertEqual("0.00vp");
      expect(obj.getElement('$attrs').getElement('initialOffset').getString('yOffset')).assertEqual("250.00vp");
      console.info('[scrollOffsetJsunit_0100] END');
      done();
    });
    
      
  
/**
     * @tc.number   scrollOffsetJsunit_0200
     * @tc.name     scrollOffsetJsunit_0200
     * @tc.desc     scrollOffsetJsunit_0200
     * @tc.level    Level.LEVEL0
     */
it('scrollOffsetJsunit_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('scrollOffsetJsunit_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('canOver_scroll'));
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info("[RepeatEachJsunit_0100] canOverScroll success");
      let strJson = inspector.getInspectorByKey('scroll_mess1');
      let strJson1 = inspector.getInspectorByKey('scroll_mess2');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[scrollOffsetJsunit_0200] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[scrollOffsetJsunit_0200] component obj1 is: " + JSON.stringifyJsonElement(obj1));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onWillScroll');
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onDidScroll');
      console.info('[scrollOffsetJsunit_0200] END');
      done();
    });
  })
}

