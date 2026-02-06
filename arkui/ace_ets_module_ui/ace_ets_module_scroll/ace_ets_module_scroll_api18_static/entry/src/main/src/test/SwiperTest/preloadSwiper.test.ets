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

export default function preloadSwiper() {
  describe('preloadSwiper', () => {
    beforeAll(() => {
      console.info("preloadSwiper beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.scroll18.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("preloadSwiper beforeEach start");
      const preloadSwiper = AppStorage.get<Router>("router") as Router
      preloadSwiper.clear();
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/preloadSwiper",
      }
      try {
        let pages = preloadSwiper.getState();
        console.info("get preloadSwiper state pages:" + JSON.stringify(pages));
        if (!("preloadSwiper" == pages.name)) {
          console.info("get preloadSwiper pages.name:" + JSON.stringify(pages.name));
          preloadSwiper.pushUrl(options);
          await CommonFunc.sleep(1500);
        }
      } catch (err) {
        console.error("push preloadSwiper page error:" + err);
      }
      console.info("preloadSwiper beforeEach end");
    });

    
    
/**
     * @tc.number   preloadSwiper_static_0100
     * @tc.name     preloadSwiper_static_0100
     * @tc.desc     preloadSwiper_static_0100
     * @tc.level    Level.LEVEL0
     */
it('preloadSwiper_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[preloadSwiper_static_0100] START');
      let driver = Driver.create()
      let btn1 = await driver.findComponent(ON.id('preloadItems_swiper_succ')) as Component;
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('preloadItems_swiper_text');
      console.info("[preloadSwiper_static_0100] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[preloadSwiper_static_0100] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('preloadItems: success');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('preloadItems_swiper_401')) as Component;
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson2 = inspector.getInspectorByKey('preloadItems_swiper_text');
      console.info("[preloadSwiper_static_0100] content2: " +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
        .assertEqual('preloadItems: "401"');

      let btn3 = await driver.findComponent(ON.id('preloadItems_swiper_1004')) as Component;
      await (btn3.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson3 = inspector.getInspectorByKey('preloadItems_swiper_text');
      console.info("[preloadSwiper_static_0100] content3: " +
      JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
        .assertEqual('preloadItems: "100004"');
      console.info('[preloadSwiper_static_0100] END');
      done();
    });
  })
}
