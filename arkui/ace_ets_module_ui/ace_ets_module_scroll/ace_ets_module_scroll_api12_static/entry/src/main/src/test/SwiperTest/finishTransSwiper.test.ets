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
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function finishTransSwiper() {
  describe('finishTransSwiper', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("finishTransSwiper beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/finishTransSwiper",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get finishTransSwiper state pages:" + JSON.stringify(pages));
        if (!("finishTransSwiper" == pages.name)) {
          console.info("get finishTransSwiper pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push finishTransSwiper page error:" + err);
      }
      console.info("finishTransSwiper beforeEach end");
    });

    
      
  
/**
     * @tc.number   finishTransSwiper_static_0100
     * @tc.name     finishTransSwiper_static_0100
     * @tc.desc     finishTransSwiper_static_0100
     * @tc.level    Level.LEVEL0
     */
it('finishTransSwiper_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[finishTransSwiper_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('finishTransition_swiper');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("finishTransSwiper_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width * 0.8)
      ).toInt(), (Math.round(top + height / 2)
      ).toInt(), (Math.round(left + width * 0.2)
      ).toInt(),
        (Math.round(top + height / 2)
        ).toInt());
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('finishTransitionSwiper_text');
      console.info("[scrollSourceDrag_static_0100] component obj1 is: " +
      JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info("[scrollSourceDrag_static_0100] content1: " +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('ContentDidScroll');

      let strJson2 = inspector.getInspectorByKey('selectedIndexSwiper_text');
      console.info("[scrollSourceDrag_static_0100] component obj2 is: " +
      JSON.stringify(JSON.parseJsonElement(strJson2)));
      console.info("[scrollSourceDrag_static_0100] content2: " +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('selectedIndex: 0');
      console.info('[finishTransSwiper_static_0100] END');
      done();
    });
  })
}
