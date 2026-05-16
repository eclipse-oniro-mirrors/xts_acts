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

export default function ratingUndefinedTest() {
  describe('ratingUndefinedTest', () => {
    beforeAll(async ():Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("ratingUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/rating/ratingUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ratingUndefined state pages:" + JSON.stringify(pages));
        if (!("ratingUndefined" == pages.name)) {
          console.info("get ratingUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ratingUndefined page error:" + err);
      }
      console.info("ratingUndefined beforeEach end");
    });

    /**
     * @tc.number    ratingUndefinedTest_static_0100
     * @tc.name      ratingUndefinedTest_static_0100
     * @tc.desc      ratingUndefinedTest_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('ratingUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ratingUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('rating');
      let starsValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('stars');
      console.info('$stars: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('stars')));
      expect(starsValue.asString()).assertEqual('5');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('rating_stars')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('rating');
      let starsValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('stars');
      console.info('$stars: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('stars')));
      expect(starsValue1.asString()).assertEqual('6');

      console.info('[ratingUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    ratingUndefinedTest_static_0200
     * @tc.name      ratingUndefinedTest_static_0200
     * @tc.desc      ratingUndefinedTest_static_0200
     * @tc.level     Level.LEVEL0
     */
    it('ratingUndefinedTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ratingUndefinedTest_static_0200] START.');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('rating');
      let stepSizeValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('stepSize');
      console.info('$stepSize: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('stepSize')));
      expect(stepSizeValue.asString()).assertEqual('0.500000');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('rating_stepSize')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('rating');
      let stepSizeValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('stepSize');
      console.info('$stepSize: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('stepSize')));
      expect(stepSizeValue1.asString()).assertEqual('3.000000');

      console.info('[ratingUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number    ratingUndefinedTest_static_0300
     * @tc.name      ratingUndefinedTest_static_0300
     * @tc.desc      ratingUndefinedTest_static_0300
     * @tc.level     Level.LEVEL0
     */
    it('ratingUndefinedTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ratingUndefinedTest_static_0300] START.');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('rating_stars')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('rating_onChange1');
      let onChangeValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      console.info('$onChange: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(onChangeValue.asString()).assertEqual('count:1');

      let btn1 = await driver.findComponent(ON.id('rating_onChange2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('rating_onChange1');
      let onChangeValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      console.info('$onChange: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
      expect(onChangeValue1.asString()).assertEqual('count:1');

      console.info('[ratingUndefinedTest_static_0300] END');
      done();
    });
  })
}