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

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { Message, GlobalMessage } from '../../../../ets/MainAbility/common/MessageManager1';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { UtilsTest, startAbility } from '../../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function swiperItemMargin() {
  describe('swiperItemPadMarTest', () => {
    beforeAll(() => {
      console.info("swiperItemMargin beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ItemChange/swiperItemMargin',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperItemPadMar state success " + JSON.stringify(pages));
        if (!("swiperItemMargin" == pages.name)) {
          console.info("get swiperItemPadMar state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push swiperItemPadMar page success ");
        }
      } catch (err) {
        console.error("push swiperItemPadMar page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      const globalMessage =
        AppStorage.get<GlobalMessage<number>>('SwiperItemMarginTest');
      if (globalMessage !== null) {
        globalMessage?.message.notify({
          name: 'index', value: 0
        });
        globalMessage?.message.notify({
          name: 'margin', value: 0
        });
        globalMessage?.message.notify({
          name: 'padding', value: 0
        });
      }
      console.info("swiperItemPadMar after each called");
    });


    
    /**
     * @tc.number   testSwiperItemSetMargin_static
     * @tc.name     testSwiperItemSetMargin_static
     * @tc.desc     testSwiperItemSetMargin_static
     * @tc.level    Level.LEVEL0
     */
it('testSwiperItemSetMargin_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testSwiperItemSetMargin_static START');
      let strJson = inspector.getInspectorByKey('swiperItemMargin');

      let swiperItemMargin: RectValue = CommonFunc.getComponentRect('swiperItemMargin');
      let swiperItemMargin01: RectValue = CommonFunc.getComponentRect('swiperItemMargin01');
      let swiperItemMargin02: RectValue = CommonFunc.getComponentRect('swiperItemMargin02');
      let swiperItemMargin03: RectValue = CommonFunc.getComponentRect('swiperItemMargin03');
      let swiperItemMargin04: RectValue = CommonFunc.getComponentRect('swiperItemMargin04');
      let swiperItemMargin05: RectValue = CommonFunc.getComponentRect('swiperItemMargin05');
      let swiperItemMargin06: RectValue = CommonFunc.getComponentRect('swiperItemMargin06');
      // Before flipping the page
      console.info("Before page turningsizepmkey01.left - swiperItemMargin.left value is " +
      JSON.stringify(swiperItemMargin01.left - swiperItemMargin.left));
      const uiContext = new UIContext();
      expect(Math.round(swiperItemMargin01.left - swiperItemMargin.left)).assertEqual(UIContext.resolveUIContext()!.vp2px(20));
      expect(Math.round(swiperItemMargin.right - swiperItemMargin01.right)).assertEqual(UIContext.resolveUIContext()!.vp2px(20));
      expect(Math.round(swiperItemMargin01.top - swiperItemMargin.top)).assertEqual(UIContext.resolveUIContext()!.vp2px(20));
      expect(Math.round(swiperItemMargin.bottom - swiperItemMargin01.bottom)).assertEqual(UIContext.resolveUIContext()!.vp2px(20));
      // Page turning.
      let driver = Driver.create();
      // await driver.swipe(250, 230, 200, 230);
      await CommonFunc.sleep(1000);
      swiperItemMargin = CommonFunc.getComponentRect('swiperItemMargin');
      swiperItemMargin01 = CommonFunc.getComponentRect('swiperItemMargin01');
      swiperItemMargin02 = CommonFunc.getComponentRect('swiperItemMargin02');
      swiperItemMargin03 = CommonFunc.getComponentRect('swiperItemMargin03');
      swiperItemMargin04 = CommonFunc.getComponentRect('swiperItemMargin04');
      swiperItemMargin05 = CommonFunc.getComponentRect('swiperItemMargin05');
      swiperItemMargin06 = CommonFunc.getComponentRect('swiperItemMargin06');
      // After flipping the page.
      console.info("After page turning, the swiperItemMargin.left value is " + JSON.stringify(swiperItemMargin.left));
      console.info("After page turning,the swiperItemMargin02.left.left value is " +
      JSON.stringify(swiperItemMargin02.left));
      expect(swiperItemMargin.left).assertEqual(swiperItemMargin02.left);
      expect(swiperItemMargin.right).assertEqual(swiperItemMargin02.right);
      expect(swiperItemMargin.top).assertEqual(swiperItemMargin02.top);
      expect(swiperItemMargin.bottom).assertEqual(swiperItemMargin02.bottom);
      console.info("The type value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("The loop value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
      console.info("The displayCount value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
      console.info('new testSwiperItemSetMargin_static END');
      done();
    });
  })
}