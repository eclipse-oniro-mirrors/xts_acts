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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import hilog from '@ohos.hilog';
const SLEEP_TIME = 1000;
const SLEEP_TIME_2000 = 2000;
const PARAMETER_ERROR_CODE_1 = 106203;
const PARAMETER_ERROR_CODE_2 = 100023;
const PARAMETER_ERROR_CODE_3 = 401;

export default function listActionWithErrorTest() {
  describe('listActionWithErrorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperActionTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/list/listActionWithError",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listActionWithErrorTest state pages:" + JSON.stringify(pages));
        if (!("listActionWithError" == pages.name)) {
          console.info("get listActionTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_2000);
          console.info("push listActionWithErrorTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listActionWithErrorTest page error:" + err);
      }
      console.info("listActionWithErrorTest beforeEach end");
      done();
    });

    /**
     * @tc.name   test_list_swiper_001
     * @tc.number test_list_swiper_001
     * @tc.desc   test listItem0 expand is not on the Component tree,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_list_swiper_001', Level.LEVEL1, async (done: Function) => {
      console.info('test_list_swiper_001 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn1 = await driver.findComponent(ON.id('expand inList'));
      await btn1.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let list = await driver.findComponent(ON.id('list'));
      let rect = await list.getBounds();
      let y = Math.round(rect.right);
      let x = Math.round(rect.top);
      driver.swipe(y, Math.round(x + 500), y, Math.round(x));
      await CommonFunc.sleep(SLEEP_TIME);
      driver.swipe(y, Math.round(x + 500), y, Math.round(x));
      await CommonFunc.sleep(SLEEP_TIME_2000);
      let btn2 = await driver.findComponent(ON.id('expand inList'));
      await btn2.click();
      await CommonFunc.sleep(SLEEP_TIME);
      await btn2.click();
      await CommonFunc.sleep(SLEEP_TIME);
      try {
        console.info('swiperActionTest0001 Parameters are correct');
      } catch (err) {
        hilog.error(0x0000, "Error expand item:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(PARAMETER_ERROR_CODE_1);
      };
      done();
    });

    /**
     * @tc.name   test_list_swiper_002
     * @tc.number test_list_swiper_002
     * @tc.desc   test ListItemSwipeActionManager collapse node is inCorrect node,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_list_swiper_002', Level.LEVEL1, async (done: Function) => {
      console.info('test_list_swiper_002 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn3 = await driver.findComponent(ON.id('invalid'));
      await btn3.click();
      await CommonFunc.sleep(SLEEP_TIME);
      try {
        console.info('swiperActionTest0002 Parameters are correct');
      } catch (err) {
        hilog.error(0x0000, "Error expand item:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(PARAMETER_ERROR_CODE_2);
      };
      done();
    });

    /**
     * @tc.name   test_list_swiper_003
     * @tc.number test_list_swiper_003
     * @tc.desc   test ListItemSwipeActionManager expand node is undefined,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_list_swiper_003', Level.LEVEL1, async (done: Function) => {
      console.info('test_list_swiper_003 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn4 = await driver.findComponent(ON.id('invalid001'));
      await btn4.click();
      await CommonFunc.sleep(SLEEP_TIME);
      try {
        console.info('swiperActionTest0003 Parameters are correct');
      } catch (err) {
        hilog.error(0x0000, "Error expand item:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(PARAMETER_ERROR_CODE_3);
      };
      done();
    });

    /**
     * @tc.name   test_list_swiper_004
     * @tc.number test_list_swiper_004
     * @tc.desc   test ListItemSwipeActionManager expand node is collapse,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_list_swiper_004', Level.LEVEL1, async (done: Function) => {
      console.info('test_list_swiper_004 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let btn5 = await driver.findComponent(ON.id('invalid002'));
      await btn5.click();
      await CommonFunc.sleep(1000);
      try {
        console.info('swiperActionTest0004 Parameters are correct');
      } catch (err) {
        hilog.error(0x0000, "Error expand item:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(PARAMETER_ERROR_CODE_3);
      };
      done();
    });

    /**
     * @tc.name   test_list_swiper_005
     * @tc.number test_list_swiper_005
     * @tc.desc   test listItem0 collapse is not on the Component tree,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_list_swiper_005', Level.LEVEL1, async (done: Function) => {
      console.info('test_list_swiper_005 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn7 = await driver.findComponent(ON.id('collapse inList'));
      await btn7.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let list = await driver.findComponent(ON.id('list'));
      let rect = await list.getBounds();
      let y = Math.round(rect.right);
      let x = Math.round(rect.top);
      driver.swipe(y, Math.round(x + 500), y, Math.round(x));
      await CommonFunc.sleep(SLEEP_TIME);
      driver.swipe(y, Math.round(x + 500), y, Math.round(x));
      await CommonFunc.sleep(SLEEP_TIME_2000);
      let btn8 = await driver.findComponent(ON.id('collapse inList'));
      await btn8.click();
      await CommonFunc.sleep(SLEEP_TIME);
      await btn8.click();
      await CommonFunc.sleep(SLEEP_TIME);
      try {
        console.info('swiperActionTest0001 Parameters are correct');
      } catch (err) {
        hilog.error(0x0000, "Error expand item:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(PARAMETER_ERROR_CODE_1);
      };
      done();
    });

    /**
     * @tc.name   test_list_swiper_006
     * @tc.number test_list_swiper_006
     * @tc.desc   test ListItemSwipeActionManager expand is inCorrect node,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_list_swiper_006', Level.LEVEL1, async (done: Function) => {
      console.info('test_list_swiper_006 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn3 = await driver.findComponent(ON.id('invalid003'));
      await btn3.click();
      await CommonFunc.sleep(SLEEP_TIME);
      try {
        console.info('swiperActionTest0006 Parameters are correct');
      } catch (err) {
        hilog.error(0x0000, "Error expand item:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(PARAMETER_ERROR_CODE_2);
      };
      done();
    });

  })
}
