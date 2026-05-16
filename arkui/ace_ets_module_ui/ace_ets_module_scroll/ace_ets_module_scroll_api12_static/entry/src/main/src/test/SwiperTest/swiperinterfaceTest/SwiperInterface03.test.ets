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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SwiperInterface03() {
  describe('SwiperInterface03', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperInterface03 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperInterface03 state pages:" + JSON.stringify(pages));
        if (!("SwiperInterface03" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperInterface/SwiperInterface03'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperInterface03 page result:");
        }
      } catch (err) {
        console.error("push SwiperInterface03 page error:" + err);
      }
      console.info("SwiperInterface03 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperInterface03 after each called");
    });

    
      
  
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0190
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0190
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0190
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0190', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0190 START");
      await CommonFunc.sleep(6000);
      let strJson: string = inspector.getInspectorByKey('SWIPER_INTERFACE_0190');
      let marq = JSON.parseJsonElement(strJson).getElement('$attrs').getString('curve');
      let marq2 = JSON.parseJsonElement(strJson).getElement('$attrs').getString('indicator');
      expect(marq2).assertEqual("true");
      expect(marq).assertEqual("Curves.Linear");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0190 END');
      done();
    });


    
      
  
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0200
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0200
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0200 START");
      await CommonFunc.sleep(6000);
      let strJson: string = inspector.getInspectorByKey('SWIPER_INTERFACE_0200');
      let marq = JSON.parseJsonElement(strJson).getElement('$attrs').getString('curve');
      let marq2 = JSON.parseJsonElement(strJson).getElement('$attrs').getString('indicator');
      expect(marq2).assertEqual("true");
      expect(marq).assertEqual("Curves.EaseIn");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0200 END');
      done();
    });

    
      
  
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0210
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0210
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0210
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0210', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0210 START");
      await CommonFunc.sleep(6000);
      let strJson: string = inspector.getInspectorByKey('SWIPER_INTERFACE_0210');
      let marq = JSON.parseJsonElement(strJson).getElement('$attrs').getString('curve');
      let marq2 = JSON.parseJsonElement(strJson).getElement('$attrs').getString('indicator');
      expect(marq2).assertEqual("true");
      expect(marq).assertEqual("Curves.EaseInOut");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0210 END');
      done();
    });

    
      
  
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0220
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0220
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0220
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0220', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0220 START");
      await CommonFunc.sleep(6000);
      let strJson: string = inspector.getInspectorByKey('SWIPER_INTERFACE_0220');
      let marq = JSON.parseJsonElement(strJson).getElement('$attrs').getString('curve');
      let marq2 = JSON.parseJsonElement(strJson).getElement('$attrs').getString('indicator');
      expect(marq2).assertEqual("true");
      expect(marq).assertEqual("Curves.EaseOut");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0220 END');
      done();
    });


  })
}