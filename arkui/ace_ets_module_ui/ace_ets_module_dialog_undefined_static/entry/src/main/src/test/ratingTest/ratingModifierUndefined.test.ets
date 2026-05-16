'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, ON, Point, UiWindow, WindowMode } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';

export default function ratingModifierUndefinedTest() {
  describe('ratingModifierUndefinedTest', () => {
    beforeAll(async ():Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("ratingModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/rating/ratingModifierUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ratingModifierUndefined state pages:" + JSON.stringify(pages));
        if (!("ratingModifierUndefined" == pages.name)) {
          console.info("get ratingModifierUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ratingModifierUndefined page error:" + err);
      }
      console.info("ratingModifierUndefined beforeEach end");
    });

    /**
     * @tc.number    ratingModifierUndefinedTest_static_0100
     * @tc.name      ratingModifierUndefinedTest_static_0100
     * @tc.desc      ratingModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('ratingModifierUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ratingModifierUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('ratingModifier');
      let starStyleModifierValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('starStyle');
      console.info('$starStyleModifier: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('starStyle')));
      expect(starStyleModifierValue.asString()).assertEqual('{"backgroundUri":"resource:///16777256.png","foregroundUri":"resource:///16777256.png","secondaryUri":"resource:///16777256.png"}');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('rating_starStyleModifier')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('ratingModifier');
      let starStyleModifierValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('starStyle');
      console.info('$starStyleModifier: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('starStyle')));
      expect(starStyleModifierValue1.asString()).assertEqual('{"backgroundUri":"","foregroundUri":"","secondaryUri":""}');

      console.info('[ratingModifierUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    ratingModifierUndefinedTest_static_0200
     * @tc.name      ratingModifierUndefinedTest_static_0200
     * @tc.desc      ratingModifierUndefinedTest_static_0200
     * @tc.level     Level.LEVEL0
     */
    it('ratingModifierUndefinedTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ratingModifierUndefinedTest_static_0200] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('ratingModifier');
      let starsModifierValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('stars');
      console.info('$starsModifier: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('stars')));
      expect(starsModifierValue.asString()).assertEqual('5');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('rating_starsModifier')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('ratingModifier');
      let starsModifierValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('stars');
      console.info('$starsModifier: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('stars')));
      expect(starsModifierValue1.asString()).assertEqual('6');

      console.info('[ratingModifierUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number    ratingModifierUndefinedTest_static_0300
     * @tc.name      ratingModifierUndefinedTest_static_0300
     * @tc.desc      ratingModifierUndefinedTest_static_0300
     * @tc.level     Level.LEVEL0
     */
    it('ratingModifierUndefinedTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ratingModifierUndefinedTest_static_0300] START.');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('ratingModifier');
      let stepSizeModifierValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('stepSize');
      console.info('$stepSizeModifier: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('stepSize')));
      expect(stepSizeModifierValue.asString()).assertEqual('0.500000');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('rating_stepSizeModifier')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('ratingModifier');
      let stepSizeModifierValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('stepSize');
      console.info('$stepSizeModifier: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('stepSize')));
      expect(stepSizeModifierValue1.asString()).assertEqual('3.000000');

      console.info('[ratingModifierUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number    ratingModifierUndefinedTest_static_0400
     * @tc.name      ratingModifierUndefinedTest_static_0400
     * @tc.desc      ratingModifierUndefinedTest_static_0400
     * @tc.level     Level.LEVEL0
     */
    it('ratingModifierUndefinedTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ratingModifierUndefinedTest_static_0400] START.');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('rating_starsModifier')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('rating_onChangeModifier1');
      let onChangeModifierValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      console.info('$onChangeModifier: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(onChangeModifierValue.asString()).assertEqual('count:1');

      let btn1 = await driver.findComponent(ON.id('rating_onChangeModifier2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('rating_onChangeModifier1');
      let onChangeModifierValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      console.info('$onChangeModifier: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
      expect(onChangeModifierValue1.asString()).assertEqual('count:1');

      console.info('[ratingModifierUndefinedTest_static_0400] END');
      done();
    });

  })
}