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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';

export default function hoverEffectTest() {

  describe('hoverEffectTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number    hoverEffectTest_001
     * @tc.name      hoverEffectTest_001
     * @tc.desc      test hoverEffect is 0
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('hoverEffectTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[hoverEffectTest_001] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'HoverEffectTest';
      await Utils.pushPage(`hoverEffect/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('0'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('hover0');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[hoverEffectTest_001] hoverEffectTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('0');

      let strJson2 = getInspectorByKey('hover1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[hoverEffectTest_001] hoverEffectTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('[hoverEffectTest_001] END');
      done();
    })

    /**
     * @tc.number    hoverEffectTest_002
     * @tc.name      hoverEffectTest_002
     * @tc.desc      test hoverEffect is 1
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('hoverEffectTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[hoverEffectTest_002] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'HoverEffectTest';
      await Utils.pushPage(`hoverEffect/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('1'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('hover0');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[hoverEffectTest_002] hoverEffectTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('1');

      let strJson2 = getInspectorByKey('hover1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[hoverEffectTest_002] hoverEffectTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('[hoverEffectTest_002] END');
      done();
    })

    /**
     * @tc.number    hoverEffectTest_003
     * @tc.name      hoverEffectTest_003
     * @tc.desc      test hoverEffect is 2
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('hoverEffectTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[hoverEffectTest_003] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'HoverEffectTest';
      await Utils.pushPage(`hoverEffect/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('2'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('hover0');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[hoverEffectTest_003] hoverEffectTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('2');

      let strJson2 = getInspectorByKey('hover1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[hoverEffectTest_003] hoverEffectTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('[hoverEffectTest_003] END');
      done();
    })

    /**
     * @tc.number    hoverEffectTest_004
     * @tc.name      hoverEffectTest_004
     * @tc.desc      test hoverEffect is 3
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('hoverEffectTest_004', Level.LEVEL1, async (done: Function) => {
      console.info('[hoverEffectTest_004] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'HoverEffectTest';
      await Utils.pushPage(`hoverEffect/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('3'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('hover0');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[hoverEffectTest_004] hoverEffectTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('3');

      let strJson2 = getInspectorByKey('hover1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[hoverEffectTest_004] hoverEffectTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('[hoverEffectTest_004] END');
      done();
    })

    /**
     * @tc.number    hoverEffectTest_005
     * @tc.name      hoverEffectTest_005
     * @tc.desc      test hoverEffect is nullptr
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('hoverEffectTest_005', Level.LEVEL1, async (done: Function) => {
      console.info('[hoverEffectTest_005] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'HoverEffectTest';
      await Utils.pushPage(`hoverEffect/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('nullptr'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('hover0');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[hoverEffectTest_005] hoverEffectTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('0');

      let strJson2 = getInspectorByKey('hover1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[hoverEffectTest_005] hoverEffectTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('401');
      console.info('[hoverEffectTest_005] END');
      done();
    })
  })
}