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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@kit.TestKit';

export default function layoutGravityTest() {

  describe('LayoutGravityTest', () => {

    let PAGE_TAG = 'LayoutGravityTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`layout/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   LayoutGravity_0100
     * @tc.number LayoutGravity_0100
     * @tc.desc   test NODE_LAYOUT_GRAVITY value is TOP_START
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutGravity_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('LayoutGravity_0100 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonGravity0'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('textGravity');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[LayoutGravity_0100] layoutGravity: ' + obj1.$attrs.layoutGravity);
      expect(obj1.$attrs.layoutGravity).assertEqual('Alignment.TopStart');
      console.info('LayoutGravity_0100 END');
      done();
    });

    /**
     * @tc.name   LayoutGravity_0200
     * @tc.number LayoutGravity_0200
     * @tc.desc   test NODE_LAYOUT_GRAVITY value is TOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutGravity_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('LayoutGravity_0200 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonGravity1'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('textGravity');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[LayoutGravity_0200] layoutGravity: ' + obj1.$attrs.layoutGravity);
      expect(obj1.$attrs.layoutGravity).assertEqual('Alignment.Top');
      console.info('LayoutGravity_0200 END');
      done();
    });

    /**
     * @tc.name   LayoutGravity_0300
     * @tc.number LayoutGravity_0300
     * @tc.desc   test NODE_LAYOUT_GRAVITY value is TOP_END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutGravity_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('LayoutGravity_0300 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonGravity2'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('textGravity');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[LayoutGravity_0300] layoutGravity: ' + obj1.$attrs.layoutGravity);
      expect(obj1.$attrs.layoutGravity).assertEqual('Alignment.TopEnd');
      console.info('LayoutGravity_0300 END');
      done();
    });

    /**
     * @tc.name   LayoutGravity_0400
     * @tc.number LayoutGravity_0400
     * @tc.desc   test NODE_LAYOUT_GRAVITY value is START
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutGravity_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('LayoutGravity_0400 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonGravity3'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('textGravity');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[LayoutGravity_0400] layoutGravity: ' + obj1.$attrs.layoutGravity);
      expect(obj1.$attrs.layoutGravity).assertEqual('Alignment.Start');
      console.info('LayoutGravity_0400 END');
      done();
    });

    /**
     * @tc.name   LayoutGravity_0500
     * @tc.number LayoutGravity_0500
     * @tc.desc   test NODE_LAYOUT_GRAVITY value is CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutGravity_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('LayoutGravity_0500 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonGravity4'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('textGravity');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[LayoutGravity_0500] layoutGravity: ' + obj1.$attrs.layoutGravity);
      expect(obj1.$attrs.layoutGravity).assertEqual('Alignment.Center');
      console.info('LayoutGravity_0500 END');
      done();
    });

    /**
     * @tc.name   LayoutGravity_0600
     * @tc.number LayoutGravity_0600
     * @tc.desc   test NODE_LAYOUT_GRAVITY value is END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutGravity_0600',  Level.LEVEL0, async (done: Function) => {
      console.info('LayoutGravity_0600 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonGravity5'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('textGravity');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[LayoutGravity_0600] layoutGravity: ' + obj1.$attrs.layoutGravity);
      expect(obj1.$attrs.layoutGravity).assertEqual('Alignment.End');
      console.info('LayoutGravity_0600 END');
      done();
    });

    /**
     * @tc.name   LayoutGravity_0700
     * @tc.number LayoutGravity_0700
     * @tc.desc   test NODE_LAYOUT_GRAVITY value is BOTTOM_START
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutGravity_0700',  Level.LEVEL0, async (done: Function) => {
      console.info('LayoutGravity_0700 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonGravity6'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('textGravity');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[LayoutGravity_0700] layoutGravity: ' + obj1.$attrs.layoutGravity);
      expect(obj1.$attrs.layoutGravity).assertEqual('Alignment.BottomStart');
      console.info('LayoutGravity_0700 END');
      done();
    });

    /**
     * @tc.name   LayoutGravity_0800
     * @tc.number LayoutGravity_0800
     * @tc.desc   test NODE_LAYOUT_GRAVITY value is BOTTOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutGravity_0800',  Level.LEVEL0, async (done: Function) => {
      console.info('LayoutGravity_0800 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonGravity7'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('textGravity');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[LayoutGravity_0800] layoutGravity: ' + obj1.$attrs.layoutGravity);
      expect(obj1.$attrs.layoutGravity).assertEqual('Alignment.Bottom');
      console.info('LayoutGravity_0800 END');
      done();
    });

    /**
     * @tc.name   LayoutGravity_0900
     * @tc.number LayoutGravity_0900
     * @tc.desc   test NODE_LAYOUT_GRAVITY value is BOTTOM_END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutGravity_0900',  Level.LEVEL0, async (done: Function) => {
      console.info('LayoutGravity_0900 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonGravity8'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('textGravity');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[LayoutGravity_0900] layoutGravity: ' + obj1.$attrs.layoutGravity);
      expect(obj1.$attrs.layoutGravity).assertEqual('Alignment.BottomEnd');
      console.info('LayoutGravity_0900 END');
      done();
    });

    /**
     * @tc.name   LayoutGravity_0010
     * @tc.number LayoutGravity_0010
     * @tc.desc   test NODE_LAYOUT_GRAVITY value is 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LayoutGravity_0010',  Level.LEVEL1, async (done: Function) => {
      console.info('LayoutGravity_0010 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonGravity9'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('textGravity');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[LayoutGravity_0010] layoutGravity: ' + obj1.$attrs.layoutGravity);
      expect(obj1.$attrs.layoutGravity).assertEqual('Alignment.Center');
      console.info('LayoutGravity_0010 END');
      done();
    });
  })
}