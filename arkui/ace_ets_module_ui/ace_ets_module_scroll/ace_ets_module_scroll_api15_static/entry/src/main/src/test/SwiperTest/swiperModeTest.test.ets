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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, afterAll } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../Util.test';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function swiperModeTest() {
  describe('swiperModeTest', () => {
    beforeAll(() => {
      console.info("swiperModeTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.scroll15.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("swiperModeTest beforeEach start");
      const swiperMode = AppStorage.get<Router>("router") as Router
      swiperMode.clear()
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/swiperMode",
      }
      try {
        let pages = swiperMode.getState();
        console.info("get swiperModeTest state pages:" + JSON.stringify(pages));
        if (!("swiperMode" == pages.name)) {
          console.info("get swiperModeTest pages.name:" + JSON.stringify(pages.name));
          swiperMode.pushUrl(options);
        }
      } catch (err) {
        console.error("push swiperModeTest page error:" + err);
      }
      console.info("swiperModeTest beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiperModeTest after each called");
    });



    
    /**
     * @tc.number   swiperModeTest_static_0100
     * @tc.name     swiperModeTest_static_0100
     * @tc.desc     swiperModeTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('swiperModeTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[swiperModeTest_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('swiper_mode_no')) as Component;
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper_mode_text');
      console.info("[swiperModeTest_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[swiperModeTest_static_0100] swiperMode1: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual("changeMode: NO_ANIMATION");
      let strJson2 = inspector.getInspectorByKey('swiper_aniMode_text');
      console.info("[swiperModeTest_static_0100] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual("changeIndex: 2");
      console.info('[swiperModeTest_static_0100] SwiperAnimationMode.NO_ANIMATION END');
      done();
    });


    
    /**
     * @tc.number   swiperModeTest_static_0200
     * @tc.name     swiperModeTest_static_0200
     * @tc.desc     swiperModeTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('swiperModeTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[swiperModeTest_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('swiper_mode_default')) as Component;
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper_mode_text');
      console.info("[swiperModeTest_static_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[swiperModeTest_static_0200] swiperMode2: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual("changeMode: DEFAULT_ANIMATION");
      let strJson2 = inspector.getInspectorByKey('swiper_aniMode_text');
      console.info("[swiperModeTest_static_0200] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual("changeIndex: 6");
      console.info('[swiperModeTest_static_0200] SwiperAnimationMode.DEFAULT_ANIMATION END');
      done();
    });


    
    /**
     * @tc.number   swiperModeTest_static_0300
     * @tc.name     swiperModeTest_static_0300
     * @tc.desc     swiperModeTest_static_0300
     * @tc.level    Level.LEVEL1
     */
it('swiperModeTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[swiperModeTest_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('swiper_mode_fast')) as Component;
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('swiper_mode_text');
      console.info("[swiperModeTest_static_0300] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[swiperModeTest_static_0300] swiperMode3: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual("changeMode: FAST_ANIMATION");
      let strJson2 = inspector.getInspectorByKey('swiper_aniMode_text');
      console.info("[swiperModeTest_static_0300] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual("changeIndex: 9");
      console.info('[swiperModeTest_static_0300] SwiperAnimationMode.FAST_ANIMATION END');
      done();
    });
  })
}