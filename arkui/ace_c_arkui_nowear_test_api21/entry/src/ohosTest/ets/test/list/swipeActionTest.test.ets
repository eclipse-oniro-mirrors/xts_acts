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
const SLEEP_TIME = 1000;
const PARAMETER_ERROR_CODE = 401;

export default function SwipeActionTest(){

  describe('SwipeActionTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(SLEEP_TIME);
      done();
    })

    /**
     * @tc.name   swipeActionTest001
     * @tc.number swipeActionTest001
     * @tc.desc   test ListItemSwipeActionManager is EXPANDED,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('swipeActionTest001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'swipeActionTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let list = await driver.findComponent(ON.text('listItem 0'));
      let rect = await list.getBounds();
      let left = rect.left;
      let button1 = await driver.findComponent(ON.id('expandList'));
      await button1.click();
      await Utils.sleep(SLEEP_TIME);
      let list1 = await driver.findComponent(ON.text('listItem 0'));
      let rect1 = await list1.getBounds();
      let left1 = rect1.left;
      let distance = left1-left;
      expect(distance>0).assertEqual(true);
      let button2 = await driver.findComponent(ON.id('collapseList'));
      await button2.click();
      await Utils.sleep(SLEEP_TIME);
      done();
    });

    /**
     * @tc.name   swipeActionTest002
     * @tc.number swipeActionTest002
     * @tc.desc   test ListItemSwipeActionManager is collapse,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('swipeActionTest002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'swipeActionTest';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button1 = await driver.findComponent(ON.id('expandList'));
      await button1.click();
      await Utils.sleep(SLEEP_TIME);
      let list = await driver.findComponent(ON.text('listItem 0'));
      let rect = await list.getBounds();
      let left = rect.left;
      let button2 = await driver.findComponent(ON.id('collapseList'));
      await button2.click();
      await Utils.sleep(SLEEP_TIME);
      let list1 = await driver.findComponent(ON.text('listItem 0'));
      let rect1 = await list1.getBounds();
      let left1 = rect1.left;
      let distance = left-left1;
      expect(distance>0).assertEqual(true);
      done();
    });

    /**
     * @tc.name   swiperActionTest003
     * @tc.number swipeActionTest003
     * @tc.desc   test ListItemSwipeActionManager is EXPANDED and direction is right,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('swiperActionTest003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'swipeActionTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let list = await driver.findComponent(ON.text('listItem 1'));
      let rect = await list.getBounds();
      let right = rect.right;
      let button3 = await driver.findComponent(ON.id('expandListBtn_right'));
      await button3.click();
      await Utils.sleep(SLEEP_TIME);
      let list1 = await driver.findComponent(ON.text('listItem 1'));
      let rect1 = await list1.getBounds();
      let right1 = rect1.right;
      let distance = right-right1;
      expect(distance>0).assertEqual(true);
      let button4 = await driver.findComponent(ON.id('collapseListBtn_right'));
      await button4.click();
      await Utils.sleep(SLEEP_TIME);
      done();
    });

    /**
     * @tc.name   swiperActionTest004
     * @tc.number swipeActionTest004
     * @tc.desc   test ListItemSwipeActionManager is collapse,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('swiperActionTest004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'swipeActionTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button3 = await driver.findComponent(ON.id('expandListBtn_right'));
      await button3.click();
      await Utils.sleep(1000);
      let list = await driver.findComponent(ON.text('listItem 1'));
      let rect = await list.getBounds();
      let right = rect.right;
      let button4 = await driver.findComponent(ON.id('collapseListBtn_right'));
      await button4.click();
      await Utils.sleep(SLEEP_TIME);
      let list1 = await driver.findComponent(ON.text('listItem 1'));
      let rect1 = await list1.getBounds();
      let right1 = rect1.right;
      let distance = right1-right;
      expect(distance>0).assertEqual(true);
      done();
    });

    /**
     * @tc.name   swiperActionTest005
     * @tc.number swipeActionTest005
     * @tc.desc   test ListItemSwipeActionManager node is nullptr,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('swiperActionTest005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperActionTest005 START');
      let PAGE_TAG = 'swipeActionTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver: Driver = Driver.create();
      let btn5 = await driver.findComponent(ON.id('invalidBtn'));
      await btn5.click();
      await Utils.sleep(SLEEP_TIME);
      try {
        console.info('swiperActionTest005 Parameters are correct');
      } catch (err) {
        hilog.error(0x0000, "Error expand item:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
      };
      done();
    });

  })
}