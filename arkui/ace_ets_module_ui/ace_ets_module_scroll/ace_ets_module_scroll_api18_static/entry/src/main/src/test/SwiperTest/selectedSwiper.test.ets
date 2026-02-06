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

import events_emitter from '@ohos.events.emitter';
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { startAbility, UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function selectedSwiper() {
  describe('selectedSwiper', () => {
    beforeAll(() => {
      console.info("selectedSwiper beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.scroll18.static", "EntryAbility");
      
    });

    beforeEach(async () => {
      console.info("selectedSwiper beforeEach start");
      const selectedSwiper = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/selectedSwiper",
      }
      try {
        selectedSwiper.clear();
        let pages = selectedSwiper.getState();
        console.info("get selectedSwiper state pages:" + JSON.stringify(pages));
        if (!("selectedSwiper" == pages.name)) {
          console.info("get selectedSwiper pages.name:" + JSON.stringify(pages.name));
          selectedSwiper.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push selectedSwiper page error:" + err);
      }
      console.info("selectedSwiper beforeEach end");
    });

    
    
/**
     * @tc.number   selectedSwiper_static_0100
     * @tc.name     selectedSwiper_static_0100
     * @tc.desc     selectedSwiper_static_0100
     * @tc.level    Level.LEVEL0
     */
it('selectedSwiper_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[selectedSwiper_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('onSelect_swiper');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("selectedSwiper_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width * 0.8).toInt(), Math.round(top + height / 2).toInt(), Math.round(left + width * 0.2).toInt(),
        Math.round(top + height / 2).toInt());
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('onUnselected_swiper_index');
      console.info("[selectedSwiper_static_0100] component obj1 is: " +
      JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info("[selectedSwiper_static_0100] content1: " +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('index: 1');

      let strJson2 = inspector.getInspectorByKey('onSelected_swiper_index');
      console.info("[selectedSwiper_static_0100] component obj2 is: " +
      JSON.stringify(JSON.parseJsonElement(strJson2)));
      console.info("[selectedSwiper_static_0100] content2: " +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('selectedIndex: 2');
      console.info('[selectedSwiper_static_0100] END');
      done();
    });
  })
}
