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

export default function swiperLoopFalse() {
  describe('swiperLoopTest', () => {
    beforeAll(() => {
      console.info("swiperLoopFalse beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperLoopFalse',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperLoopFalse state success " + JSON.stringify(pages));
        if (!("swiperLoopFalse" == pages.name)) {
          console.info("get swiperLoopFalse state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push swiperLoopFalse page success ");
        }

      } catch (err) {
        console.error("push swiperLoopFalse page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiperVertical after each called");
    });


    
    /**
     * @tc.number   testSwiperSetLoopFalse_static
     * @tc.name     testSwiperSetLoopFalse_static
     * @tc.desc     testSwiperSetLoopFalse_static
     * @tc.level    Level.LEVEL0
     */
it('testSwiperSetLoopFalse_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testSwiperSetLoopFalse_static START');
      await CommonFunc.sleep(2000);
      // Page turning.
      // let driver = Driver.create();
      //   await driver.swipe(250, 230, 200, 230);
      let driver = Driver.create()
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('loopFalse')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        1000);
      await CommonFunc.sleep(3000);
      let loopFalse = CommonFunc.getComponentRect('loopFalse');
      let strJson = inspector.getInspectorByKey('loopFalse');

      let loopFalse01: RectValue = CommonFunc.getComponentRect('loopFalse01');
      let loopFalse02: RectValue = CommonFunc.getComponentRect('loopFalse02');
      let loopFalse03: RectValue = CommonFunc.getComponentRect('loopFalse03');
      let loopFalse04: RectValue = CommonFunc.getComponentRect('loopFalse04');
      let loopFalse05: RectValue = CommonFunc.getComponentRect('loopFalse05');
      let loopFalse06: RectValue = CommonFunc.getComponentRect('loopFalse06');
      // After flipping the page
      console.info("After page turning , the loopFalse.left value is " + JSON.stringify(loopFalse.left));
      console.info("After page turning , the loopFalse06.left value is " + JSON.stringify(loopFalse06.left));
      expect(loopFalse.left).assertEqual(loopFalse06.left);
      expect(loopFalse.right).assertEqual(loopFalse06.right);
      expect(loopFalse.top).assertEqual(loopFalse06.top);
      expect(loopFalse.bottom).assertEqual(loopFalse06.bottom);
      console.info("The type value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("The index value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')));
      console.info("The autoPlay value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')));
      console.info("The loop value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
      console.info("The itemSpace value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')));
      console.info("The displayCount value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual('5');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoPlay')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('false');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')).assertEqual('0.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
      console.info('new testSwiperSetLoopFalse_static END');
      done();
    });
  })
}