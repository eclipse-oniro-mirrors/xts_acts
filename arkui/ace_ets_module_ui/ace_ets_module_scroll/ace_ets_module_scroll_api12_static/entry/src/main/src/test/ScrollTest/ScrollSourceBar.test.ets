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


export default function ScrollSourceBar() {
  describe('ScrollSourceBar', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("ScrollSourceBar beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/ScrollSourceBar",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ScrollSourceBar state pages: " + JSON.stringify(pages));
        if (!("ScrollSourceBar" == pages.name)) {
          console.info("get ScrollSourceBar state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ScrollSourceBar page error: " + err);
        expect().assertFail();
      }
    });

    
      
  
/**
     * @tc.number   ScrollSourceBar_0100
     * @tc.name     ScrollSourceBar_0100
     * @tc.desc     ScrollSourceBar_0100
     * @tc.level    Level.LEVEL0
     */
it('ScrollSourceBar_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ScrollSourceBar_0100 START');
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('scroller_scrollbar_bar');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("ScrollSourceBar_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(
        (Math.round(left + width / 2)).toInt(),
        (Math.round(top + height * 0.1)).toInt(),
        (Math.round(left + width / 2)).toInt(),
        (Math.round(top + height * 0.6)).toInt(),
        600);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('scrollSource_4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ScrollSourceBar_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[ScrollSourceBar_0100] content obj is: " + obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('ScrollSource.SCROLL_BAR'); //SCROLL_BAR

      let strJson2 = inspector.getInspectorByKey('scrollSource_5');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ScrollSourceBar_0100] component obj2 is: " + JSON.stringifyJsonElement(obj2));
      console.info("[ScrollSourceBar_0100] content obj2 is: " +
      JSON.stringify(obj2.getElement('$attrs').getString('label')));
      expect(obj2.getElement('$attrs').getString('label'))
        .assertEqual('ScrollSource.SCROLL_BAR_FLING'); //SCROLL_BAR_FLING
      console.info('[ScrollSourceBar_0100] END');
      done();
    });

  })
}

