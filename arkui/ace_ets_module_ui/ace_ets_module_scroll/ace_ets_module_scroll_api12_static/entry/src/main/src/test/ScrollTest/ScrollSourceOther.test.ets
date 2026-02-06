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
import { BusinessError } from '@ohos.base';
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

export default function ScrollSourceOther() {
  describe('ScrollSourceOther', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("ScrollSourceOther beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/ScrollSourceOther",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ScrollSourceOther state pages: " + JSON.stringify(pages));
        if (!("ScrollSourceOther" == pages.name)) {
          console.info("get ScrollSourceOther state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ScrollSourceOther page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('SCROLL_BAR_FLING'));
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info("column after each called");
    });

    
      
  
/**
     * @tc.number   ScrollSourceOther_0100
     * @tc.name     ScrollSourceOther_0100
     * @tc.desc     ScrollSourceOther_0100
     * @tc.level    Level.LEVEL0
     */
it('ScrollSourceOther_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ScrollSourceOther_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('SCROLLER_ANIMATION'));
      await button!.click();

      let button2 = await driver.findComponent(ON.id('EDGE_EFFECT'));
      await button2!.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SCROLLER_ANIMATION');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ScrollSourceOther_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[ScrollSourceOther_0100] content obj is: " + obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('EDGE_EFFECT'); //EDGE_EFFECT
      console.info('[ScrollSourceOther_0100] END');
      done();
    });

    
      
  
/**
     * @tc.number   ScrollSourceOther_0200
     * @tc.name     ScrollSourceOther_0200
     * @tc.desc     ScrollSourceOther_0200
     * @tc.level    Level.LEVEL0
     */
it('ScrollSourceOther_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ScrollSourceOther_0200 START');
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('scrollSourceOther');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("ScrollSourceOther_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width / 2)).toInt(), (Math.round(top + height * 0.6)).toInt(),
        (Math.round(left + width / 2)).toInt(), (Math.round(top + height * 0.2)).toInt());
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('EDGE_EFFECT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ScrollSourceOther_0200] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[ScrollSourceOther_0200] content obj is: " + obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('FLING'); //FLING
      console.info('[ScrollSourceOther_0200] END');
      done();
    });

    
      
  
/**
     * @tc.number   ScrollSourceOther_0300
     * @tc.name     ScrollSourceOther_0300
     * @tc.desc     ScrollSourceOther_0300
     * @tc.level    Level.LEVEL0
     */
it('ScrollSourceOther_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ScrollSourceOther_0300 START');
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('scrollSourceOther');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("ScrollSourceOther_0300 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await CommonFunc.sleep(1000);

      await driver.mouseScroll({
        x: (Math.round(left + width / 2)).toInt(),
        y: (Math.round(top + height * 0.3)).toInt()
      }, false, 20)
      await CommonFunc.sleep(3000);
      await driver.mouseScroll({
        x: (Math.round(left + width / 2)).toInt(),
        y: (Math.round(top + height * 0.3)).toInt()
      }, true, 20)
      await CommonFunc.sleep(3000);

      let strJson = inspector.getInspectorByKey('SCROLLER_ANIMATION');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ScrollSourceOther_0300] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[ScrollSourceOther_0300] content obj is: " + obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('OTHER_USER_INPUT'); //OTHER_USER_INPUT
      console.info('[ScrollSourceOther_0300] END');
      done();
    });

  })
}

