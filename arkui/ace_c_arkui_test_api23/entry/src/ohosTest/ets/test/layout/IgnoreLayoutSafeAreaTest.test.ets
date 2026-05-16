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

export default function ignoreLayoutSafeAreaTest() {

  describe('IgnoreLayoutSafeAreaTest', () => {

    let PAGE_TAG = 'IgnoreLayoutSafeAreaTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`layout/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   IgnoreLayoutSafeArea_0100
     * @tc.number IgnoreLayoutSafeArea_0100
     * @tc.desc   test NODE_IGNORE_LAYOUT_SAFE_AREA Edge value is ALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreLayoutSafeArea_0100', Level.LEVEL0, async (done: Function) => {
      console.info('IgnoreLayoutSafeArea_0100 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonEdge15'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('columIgnore');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[IgnoreLayoutSafeArea_0100] ignoreLayoutSafeAreaOpts: ' + obj1.$attrs.ignoreLayoutSafeAreaOpts);
      expect(obj1.$attrs.ignoreLayoutSafeAreaOpts)
        .assertEqual('IgnoreLayoutSafeAreaOpts: type:LAYOUT_SAFE_AREA_TYPE_SYSTEM, edges: LAYOUT_SAFE_AREA_EDGE_ALL');
      console.info('IgnoreLayoutSafeArea_0100 END');
      done();
    });

    /**
     * @tc.name   IgnoreLayoutSafeArea_0200
     * @tc.number IgnoreLayoutSafeArea_0200
     * @tc.desc   test NODE_IGNORE_LAYOUT_SAFE_AREA Edge value is TOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreLayoutSafeArea_0200', Level.LEVEL0, async (done: Function) => {
      console.info('IgnoreLayoutSafeArea_0200 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonEdge1'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('columIgnore');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[IgnoreLayoutSafeArea_0200] ignoreLayoutSafeAreaOpts: ' + obj1.$attrs.ignoreLayoutSafeAreaOpts);
      expect(obj1.$attrs.ignoreLayoutSafeAreaOpts)
        .assertEqual('IgnoreLayoutSafeAreaOpts: type:LAYOUT_SAFE_AREA_TYPE_SYSTEM, edges: LAYOUT_SAFE_AREA_EDGE_TOP');
      console.info('IgnoreLayoutSafeArea_0200 END');
      done();
    });

    /**
     * @tc.name   IgnoreLayoutSafeArea_0300
     * @tc.number IgnoreLayoutSafeArea_0300
     * @tc.desc   test NODE_IGNORE_LAYOUT_SAFE_AREA Edge value is BOTTOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreLayoutSafeArea_0300', Level.LEVEL0, async (done: Function) => {
      console.info('IgnoreLayoutSafeArea_0300 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonEdge2'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('columIgnore');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[IgnoreLayoutSafeArea_0300] ignoreLayoutSafeAreaOpts: ' + obj1.$attrs.ignoreLayoutSafeAreaOpts);
      expect(obj1.$attrs.ignoreLayoutSafeAreaOpts)
        .assertEqual('IgnoreLayoutSafeAreaOpts: type:LAYOUT_SAFE_AREA_TYPE_SYSTEM, edges: LAYOUT_SAFE_AREA_EDGE_BOTTOM');
      console.info('IgnoreLayoutSafeArea_0300 END');
      done();
    });

    /**
     * @tc.name   IgnoreLayoutSafeArea_0400
     * @tc.number IgnoreLayoutSafeArea_0400
     * @tc.desc   test NODE_IGNORE_LAYOUT_SAFE_AREA Edge value is START
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreLayoutSafeArea_0400', Level.LEVEL0, async (done: Function) => {
      console.info('IgnoreLayoutSafeArea_0400 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonEdge4'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('columIgnore');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[IgnoreLayoutSafeArea_0400] ignoreLayoutSafeAreaOpts: ' + obj1.$attrs.ignoreLayoutSafeAreaOpts);
      expect(obj1.$attrs.ignoreLayoutSafeAreaOpts)
        .assertEqual('IgnoreLayoutSafeAreaOpts: type:LAYOUT_SAFE_AREA_TYPE_SYSTEM, edges: LAYOUT_SAFE_AREA_EDGE_START');
      console.info('IgnoreLayoutSafeArea_0400 END');
      done();
    });

    /**
     * @tc.name   IgnoreLayoutSafeArea_0500
     * @tc.number IgnoreLayoutSafeArea_0500
     * @tc.desc   test NODE_IGNORE_LAYOUT_SAFE_AREA Edge value is END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreLayoutSafeArea_0500', Level.LEVEL0, async (done: Function) => {
      console.info('IgnoreLayoutSafeArea_0500 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonEdge8'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('columIgnore');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[IgnoreLayoutSafeArea_0500] ignoreLayoutSafeAreaOpts: ' + obj1.$attrs.ignoreLayoutSafeAreaOpts);
      expect(obj1.$attrs.ignoreLayoutSafeAreaOpts)
        .assertEqual('IgnoreLayoutSafeAreaOpts: type:LAYOUT_SAFE_AREA_TYPE_SYSTEM, edges: LAYOUT_SAFE_AREA_EDGE_END');
      console.info('IgnoreLayoutSafeArea_0500 END');
      done();
    });

    /**
     * @tc.name   IgnoreLayoutSafeArea_0600
     * @tc.number IgnoreLayoutSafeArea_0600
     * @tc.desc   test NODE_IGNORE_LAYOUT_SAFE_AREA Edge value is VERTICAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreLayoutSafeArea_0600', Level.LEVEL0, async (done: Function) => {
      console.info('IgnoreLayoutSafeArea_0600 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonEdge3'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('columIgnore');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[IgnoreLayoutSafeArea_0600] ignoreLayoutSafeAreaOpts: ' + obj1.$attrs.ignoreLayoutSafeAreaOpts);
      expect(obj1.$attrs.ignoreLayoutSafeAreaOpts)
        .assertEqual('IgnoreLayoutSafeAreaOpts: type:LAYOUT_SAFE_AREA_TYPE_SYSTEM, edges: LAYOUT_SAFE_AREA_EDGE_VERTICAL');
      console.info('IgnoreLayoutSafeArea_0600 END');
      done();
    });

    /**
     * @tc.name   IgnoreLayoutSafeArea_0700
     * @tc.number IgnoreLayoutSafeArea_0700
     * @tc.desc   test NODE_IGNORE_LAYOUT_SAFE_AREA Edge value is HORIZONTAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreLayoutSafeArea_0700', Level.LEVEL0, async (done: Function) => {
      console.info('IgnoreLayoutSafeArea_0700 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonEdge12'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('columIgnore');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[IgnoreLayoutSafeArea_0700] ignoreLayoutSafeAreaOpts: ' + obj1.$attrs.ignoreLayoutSafeAreaOpts);
      expect(obj1.$attrs.ignoreLayoutSafeAreaOpts)
        .assertEqual('IgnoreLayoutSafeAreaOpts: type:LAYOUT_SAFE_AREA_TYPE_SYSTEM, edges: LAYOUT_SAFE_AREA_EDGE_HORIZONTAL');
      console.info('IgnoreLayoutSafeArea_0700 END');
      done();
    });

    /**
     * @tc.name   IgnoreLayoutSafeArea_0800
     * @tc.number IgnoreLayoutSafeArea_0800
     * @tc.desc   test NODE_IGNORE_LAYOUT_SAFE_AREA Edge value is 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IgnoreLayoutSafeArea_0800', Level.LEVEL1, async (done: Function) => {
      console.info('IgnoreLayoutSafeArea_0800 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonEdge17'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('columIgnore');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[IgnoreLayoutSafeArea_0800] ignoreLayoutSafeAreaOpts: ' + obj1.$attrs.ignoreLayoutSafeAreaOpts);
      expect(obj1.$attrs.ignoreLayoutSafeAreaOpts)
        .assertEqual('IgnoreLayoutSafeAreaOpts: type:LAYOUT_SAFE_AREA_TYPE_SYSTEM, edges: LAYOUT_SAFE_AREA_EDGE_ALL');
      console.info('IgnoreLayoutSafeArea_0800 END');
      done();
    });

    /**
     * @tc.name   IgnoreLayoutSafeArea_0900
     * @tc.number IgnoreLayoutSafeArea_0900
     * @tc.desc   test NODE_IGNORE_LAYOUT_SAFE_AREA Type value is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IgnoreLayoutSafeArea_0900', Level.LEVEL1, async (done: Function) => {
      console.info('IgnoreLayoutSafeArea_0900 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('buttonType2'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('columIgnore');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[IgnoreLayoutSafeArea_0900] ignoreLayoutSafeAreaOpts: ' + obj1.$attrs.ignoreLayoutSafeAreaOpts);
      expect(obj1.$attrs.ignoreLayoutSafeAreaOpts)
        .assertEqual('IgnoreLayoutSafeAreaOpts: type:LAYOUT_SAFE_AREA_TYPE_SYSTEM, edges: LAYOUT_SAFE_AREA_EDGE_ALL');
      console.info('IgnoreLayoutSafeArea_0900 END');
      done();
    });
  })
}