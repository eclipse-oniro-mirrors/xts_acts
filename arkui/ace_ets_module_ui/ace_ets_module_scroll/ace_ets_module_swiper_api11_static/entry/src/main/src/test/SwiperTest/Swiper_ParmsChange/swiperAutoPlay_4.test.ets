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

export default function swiperAutoPlay_4() {
  describe('swiperAutoPlayTest01', () => {
    beforeAll(() => {
      console.info("swiperAutoPlay_4 beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperAutoPlay_4',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperAutoPlay_4 state success " + JSON.stringify(pages));
        if (!("swiperAutoPlay_4" == pages.name)) {
          console.info("get swiperAutoPlay_4 state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push swiperAutoPlay_4 page success ");
        }

      } catch (err) {
        console.error("push swiperAutoPlay_4 page error " + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      console.info("swiperAutoPlay_4 after each called");
    });


    
    /**
     * @tc.number   testSwiperAutoPlaySetting_static_4
     * @tc.name     testSwiperAutoPlaySetting_static_4
     * @tc.desc     testSwiperAutoPlaySetting_static_4
     * @tc.level    Level.LEVEL0
     */
it('testSwiperAutoPlaySetting_static_4', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testSwiperAutoPlaySetting_static_4 START');
      let strJson = inspector.getInspectorByKey('autoPlay04');

      let autoPlay04: RectValue = CommonFunc.getComponentRect('autoPlay04');
      let autoPlay04_1: RectValue = CommonFunc.getComponentRect('autoPlay04_1');
      let autoPlay04_2: RectValue = CommonFunc.getComponentRect('autoPlay04_2');
      let autoPlay04_3: RectValue = CommonFunc.getComponentRect('autoPlay04_3');
      let autoPlay04_4: RectValue = CommonFunc.getComponentRect('autoPlay04_4');
      let autoPlay04_5: RectValue = CommonFunc.getComponentRect('autoPlay04_5');
      let autoPlay04_6: RectValue = CommonFunc.getComponentRect('autoPlay04_6');
      // Automatically flip to the second page.
      console.info("Autoplay page turning , the autoPlay04.left value is " + JSON.stringify(autoPlay04.left));
      console.info("Autoplay page turning , the autoPlay04_2.left value is " + JSON.stringify(autoPlay04_2.left));
      expect(autoPlay04.left).assertEqual(autoPlay04_2.left);
      expect(autoPlay04.right).assertEqual(autoPlay04_2.right);
      expect(autoPlay04.top).assertEqual(autoPlay04_2.top);
      expect(autoPlay04.bottom).assertEqual(autoPlay04_2.bottom);
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
      console.info("The interval value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('interval')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')).assertEqual('1')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')).assertEqual('0.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('interval')).assertEqual('3000');
      console.info('new testSwiperAutoPlaySetting_static_4 END');
      done();
    });
  })
}