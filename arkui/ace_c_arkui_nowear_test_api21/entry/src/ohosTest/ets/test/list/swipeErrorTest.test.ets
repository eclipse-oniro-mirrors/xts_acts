/*
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
import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import hilog from '@ohos.hilog';
const distance = 500;
const SLEEP_TIME = 1000;
const SLEEP_TIME_2000 = 2000;
const ARKUI_ERROR_CODE_PARAM_INVALID = 401;
const ARKUI_ERROR_CODE_PARAM_ERROR = 100023;
const ARKUI_ERROR_CODE_NODE_NOT_ON_MAIN_TREE = 106203;

export default function SwipeErrorTest(){

  describe('SwipeErrorTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(SLEEP_TIME);
      done();
    })

    /**
     * @tc.name   swipeActionErrorTest001
     * @tc.number swipeActionErrorTest001
     * @tc.desc   test listItem0 is not on the Component tree,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('swipeActionErrorTest001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'swipeErrorTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      let button1 = await driver.findComponent(ON.text('expandList'));
      await button1.click();
      await Utils.sleep(SLEEP_TIME);
      let button2 = await driver.findComponent(ON.text('collapseList'));
      await button2.click();
      await Utils.sleep(SLEEP_TIME);
      let list = await driver.findComponent(ON.id('list'));
      let rect = await list.getBounds();
      let y = Math.round(rect.right);
      let x = Math.round(rect.top);
      driver.swipe(y, Math.round(x + distance), y, Math.round(x));
      await Utils.sleep(SLEEP_TIME);
      driver.swipe(y, Math.round(x + distance), y, Math.round(x));
      await Utils.sleep(SLEEP_TIME);
      driver.swipe(y, Math.round(x + distance), y, Math.round(x));
      await Utils.sleep(SLEEP_TIME);
      driver.swipe(y, Math.round(x + distance), y, Math.round(x));
      await Utils.sleep(SLEEP_TIME);
      driver.swipe(y, Math.round(x + distance), y, Math.round(x));
      await Utils.sleep(SLEEP_TIME_2000);
      await button1.click();
      await Utils.sleep(SLEEP_TIME);
      try {
        console.info('swipeActionErrorTest001 Parameters are correct');
      } catch (err) {
        hilog.error(0x0000, "Error expand item:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(ARKUI_ERROR_CODE_NODE_NOT_ON_MAIN_TREE);
      };
      done();
    });

    /**
     * @tc.name   swipeActionErrorTest002
     * @tc.number swipeActionErrorTest002
     * @tc.desc   test ListItemSwipeActionManager node is nullptr,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('swipeActionErrorTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('swipeActionErrorTest002 START');
      let PAGE_TAG = 'swipeErrorTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver: Driver = Driver.create();
      let btn6 = await driver.findComponent(ON.id('nullptr'));
      await btn6.click();
      await Utils.sleep(SLEEP_TIME);
      try {
        console.info('swipeActionErrorTest002 Parameters are correct');
      } catch (err) {
        hilog.error(0x0000, "Error expand item:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
      };
      done();
    });

    /**
     * @tc.name   swipeActionErrorTest003
     * @tc.number swipeActionErrorTest003
     * @tc.desc   test ListItemSwipeActionManager node is inCorrect node,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('swipeActionErrorTest003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('swipeActionErrorTest003 START');
      let PAGE_TAG = 'swipeErrorTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver: Driver = Driver.create();
      let btn6 = await driver.findComponent(ON.id('column'));
      await btn6.click();
      await Utils.sleep(SLEEP_TIME);
      try {
        console.info('swipeActionErrorTest003 Parameters are correct');
      } catch (err) {
        hilog.error(0x0000, "Error expand item:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(ARKUI_ERROR_CODE_PARAM_ERROR);
      };
      done();
    });

  })
}