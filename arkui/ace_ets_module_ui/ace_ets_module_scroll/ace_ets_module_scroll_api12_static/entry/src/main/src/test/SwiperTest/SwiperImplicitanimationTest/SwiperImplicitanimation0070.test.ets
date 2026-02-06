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
  Driver,
  Point,
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

export default function SwiperImplicitanimation0070() {
  describe('SwiperImplicitanimation0070', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperImplicitanimation0070 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperImplicitanimation0070 state pages:" + JSON.stringify(pages));
        if (!("SwiperImplicitanimation0070" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperImplicitanimation/SwiperImplicitanimation0070'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperImplicitanimation0070 page result:");
        }
      } catch (err) {
        console.error("push SwiperImplicitanimation0070 page error:" + err);
      }
      console.info("SwiperImplicitanimation0070 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperImplicitanimation0070 after each called");
    });



    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0070
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0070
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0070
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0070 START");
        let driver: Driver = Driver.create();
        let swiperArrow = await driver.findComponent(ON.id("implicitanimation_0070"));
        let point2 = await (swiperArrow?.getBoundsCenter() as Promise<Point>);
        await driver.fling({
          x: point2.x + 20, y: point2.y
        }, {
          x: point2.x - 30, y: point2.y
        }, 5, 600);
        await CommonFunc.sleep(300);
        let strIndex: string = inspector.getInspectorByKey('implicitanimation_0070_1')
        let jsonIndex = JSON.parseJsonElement(strIndex).getElement('$attrs').getString('content');
        expect(jsonIndex).assertEqual('0')
        await driver.drag(point2.x - 200, point2.y, point2.x + 150, point2.y, 500);
        await CommonFunc.sleep(300);
        let strIndex0: string = inspector.getInspectorByKey('implicitanimation_0070_1')
        let jsonIndex0 = JSON.parseJsonElement(strIndex0).getElement('$attrs').getString('content');
        expect(jsonIndex0).assertEqual('0')
        let tarindex2: string = inspector.getInspectorByKey('implicitanimation_0070_2')
        let jsonIndex2 = JSON.parseJsonElement(tarindex2).getElement('$attrs').getString('content');
        expect(parseFloat(jsonIndex2) != 0).assertTrue();
        await driver.fling({
          x: point2.x + 150, y: point2.y
        }, {
          x: point2.x - 250, y: point2.y
        }, 5, 5000);
        await CommonFunc.sleep(300);
        await driver.fling({
          x: point2.x + 150, y: point2.y
        }, {
          x: point2.x - 250, y: point2.y
        }, 5, 5000);
        await CommonFunc.sleep(300);
        let strIndex3: string = inspector.getInspectorByKey('implicitanimation_0070_1')
        let jsonIndex3 = JSON.parseJsonElement(strIndex3).getElement('$attrs').getString('content');
        expect(jsonIndex3).assertEqual('1')
        await driver.drag(point2.x + 200, point2.y, point2.x - 200, point2.y, 500);
        await CommonFunc.sleep(300);
        let strIndex4: string = inspector.getInspectorByKey('implicitanimation_0070_1')
        let jsonIndex4 = JSON.parseJsonElement(strIndex4).getElement('$attrs').getString('content');
        expect(jsonIndex4).assertEqual('2')
        let tarindex: string = inspector.getInspectorByKey('implicitanimation_0070_2')
        let tarindex1 = JSON.parseJsonElement(tarindex).getElement('$attrs').getString('content');
        expect(parseFloat(tarindex1) != 0).assertTrue();
        console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0070 END');
        done();
      });
  })
}