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
  Point,
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

export default function SwiperImplicitanimation0020() {
  describe('SwiperImplicitanimation0020', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperImplicitanimation0020 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperImplicitanimation0020 state pages:" + JSON.stringify(pages));
        if (!("SwiperImplicitanimation0020" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperImplicitanimation/SwiperImplicitanimation0020'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperImplicitanimation0020 page result:");
        }
      } catch (err) {
        console.error("push SwiperImplicitanimation0020 page error:" + err);
      }
      console.info("SwiperImplicitanimation0020 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperImplicitanimation0020 after each called");
    });


    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0020
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0020
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0020
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0020 START");
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn1 = await driver.findComponent(ON.id("btn_implicitanimation_0020_1"));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let strIndex: string = inspector.getInspectorByKey('implicitanimation_0020_1')
        let jsonIndex = JSON.parseJsonElement(strIndex).getElement('$attrs').getString('content');
        expect(jsonIndex).assertEqual('1')
        let swiperArrow = await driver.findComponent(ON.id("implicitanimation_0020"));
        let point2 = await (swiperArrow?.getBoundsCenter() as Promise<Point>);
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let x: number = parseInt(uiContext.vp2px(120).toString());
        let x1: number = parseInt(uiContext.vp2px(90).toString());
        await driver.drag((point2.x + x).toInt(), (point2.y).toInt(), (point2.x - x1).toInt(), (point2.y).toInt(), 3000)
        await CommonFunc.sleep(1000);
        let strIndex4: string = inspector.getInspectorByKey('implicitanimation_0020_1')
        let jsonIndex4 = JSON.parseJsonElement(strIndex4).getElement('$attrs').getString('content');
        expect(jsonIndex4).assertEqual('2')
        let strIndex5: string = inspector.getInspectorByKey('implicitanimation_0020_2')
        let jsonIndex5 = JSON.parseJsonElement(strIndex5).getElement('$attrs').getString('content');
        expect(jsonIndex5).assertEqual('2')

        let currindex_1: string = inspector.getInspectorByKey('implicitanimation_0020_3')
        let currindex2_1 = JSON.parseJsonElement(currindex_1).getElement('$attrs').getString('content');
        expect(currindex2_1).assertEqual('0')

        let taroffindex_1: string = inspector.getInspectorByKey('implicitanimation_0020_4')
        let taroffindex2_1 = JSON.parseJsonElement(taroffindex_1).getElement('$attrs').getString('content');
        expect(taroffindex2_1).assertEqual('0')
        let velocity_1: string = inspector.getInspectorByKey('implicitanimation_0020_5')
        let velocity1_1 = JSON.parseJsonElement(velocity_1).getElement('$attrs').getString('content');
        expect(velocity1_1).assertEqual('0')

        let showPrevious = await driver.findComponent(ON.id("btn_implicitanimation_0020"));
        await (showPrevious?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        await driver.drag((point2.x - x).toInt(), (point2.y).toInt(), (point2.x + x1).toInt(), (point2.y).toInt(), 3000)
        await CommonFunc.sleep(1000);
        let strIndex0: string = inspector.getInspectorByKey('implicitanimation_0020_1')
        let jsonIndex0 = JSON.parseJsonElement(strIndex0).getElement('$attrs').getString('content');
        expect(jsonIndex0).assertEqual('0')
        let tarindex: string = inspector.getInspectorByKey('implicitanimation_0020_2')
        let tarindex1 = JSON.parseJsonElement(tarindex).getElement('$attrs').getString('content');
        expect(tarindex1).assertEqual('0')

        let currindex: string = inspector.getInspectorByKey('implicitanimation_0020_3')
        let currindex2 = JSON.parseJsonElement(currindex).getElement('$attrs').getString('content');
        expect(currindex2).assertEqual('0')

        let taroffindex: string = inspector.getInspectorByKey('implicitanimation_0020_4')
        let taroffindex2 = JSON.parseJsonElement(taroffindex).getElement('$attrs').getString('content');
        expect(taroffindex2).assertEqual('0')
        let velocity: string = inspector.getInspectorByKey('implicitanimation_0020_5')
        let velocity1 = JSON.parseJsonElement(velocity).getElement('$attrs').getString('content');
        expect(velocity1).assertEqual('0')
        console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0020 END');
        done();
      });

  })
}