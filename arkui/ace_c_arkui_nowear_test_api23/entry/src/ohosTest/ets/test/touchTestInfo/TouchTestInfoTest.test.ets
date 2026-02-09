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

export default function touchTestInfoTest() {

  describe('touchTestInfoTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number    touchTestInfoTest_001
     * @tc.name      touchTestInfoTest_001
     * @tc.desc      test touchTestInfo DEFAULT
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('touchTestInfoTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[touchTestInfoTest_001] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'TouchTestInfoTest';
      await Utils.pushPage(`touchTestInfo/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('c1'));
      await btn1.click();
      await Utils.sleep(1500);
      let btn2: Component = await driver.findComponent(ON.id('ButtonTest'));
      await btn2.click();
      await Utils.sleep(1500);
      let strJson1 = getInspectorByKey('text');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[touchTestInfoTest_001] touchTestInfoTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('touchButton');

      let strJson2 = getInspectorByKey('text1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[touchTestInfoTest_001] touchTestInfoTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('null message');

      console.info('[touchTestInfoTest_001] END');
      done();
    })

    /**
     * @tc.number    touchTestInfoTest_002
     * @tc.name      touchTestInfoTest_002
     * @tc.desc      test touchTestInfo FORWARD_COMPETITION
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('touchTestInfoTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[touchTestInfoTest_002] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'TouchTestInfoTest';
      await Utils.pushPage(`touchTestInfo/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('clear'));
      await btn.click();
      await Utils.sleep(1500);
      let btn1: Component = await driver.findComponent(ON.id('c2'));
      await btn1.click();
      await Utils.sleep(1500);
      let btn2: Component = await driver.findComponent(ON.id('ButtonTest'));
      await btn2.click();
      await Utils.sleep(1500);
      let strJson1 = getInspectorByKey('text');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[touchTestInfoTest_002] touchTestInfoTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('touchButton');

      let strJson2 = getInspectorByKey('text1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[touchTestInfoTest_002] touchTestInfoTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('touchColumn');

      console.info('[touchTestInfoTest_002] END');
      done();
    })

    /**
     * @tc.number    touchTestInfoTest_003
     * @tc.name      touchTestInfoTest_003
     * @tc.desc      test touchTestInfo FORWARD
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('touchTestInfoTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[touchTestInfoTest_003] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'TouchTestInfoTest';
      await Utils.pushPage(`touchTestInfo/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('clear'));
      await btn.click();
      await Utils.sleep(1500);
      let btn1: Component = await driver.findComponent(ON.id('c3'));
      await btn1.click();
      await Utils.sleep(1500);
      let btn2: Component = await driver.findComponent(ON.id('ButtonTest'));
      await btn2.click();
      await Utils.sleep(1500);
      let strJson1 = getInspectorByKey('text');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[touchTestInfoTest_003] touchTestInfoTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('null message');

      let strJson2 = getInspectorByKey('text1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[touchTestInfoTest_003] touchTestInfoTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('touchColumn');

      console.info('[touchTestInfoTest_003] END');
      done();
    })

    /**
     * @tc.number    touchTestInfoTest_004
     * @tc.name      touchTestInfoTest_004
     * @tc.desc      test touchTestInfo nullptr
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('touchTestInfoTest_004', Level.LEVEL1, async (done: Function) => {
      console.info('[touchTestInfoTest_004] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'TouchTestInfoTest';
      await Utils.pushPage(`touchTestInfo/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('clear'));
      await btn.click();
      await Utils.sleep(1500);
      let btn1: Component = await driver.findComponent(ON.id('nullptr'));
      await btn1.click();
      await Utils.sleep(1500);
      let btn2: Component = await driver.findComponent(ON.id('ButtonTest'));
      await btn2.click();
      await Utils.sleep(1500);
      let strJson1 = getInspectorByKey('text');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[touchTestInfoTest_004] touchTestInfoTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('touchButton');

      let strJson2 = getInspectorByKey('text1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[touchTestInfoTest_004] touchTestInfoTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('null message');

      console.info('[touchTestInfoTest_004] END');
      done();
    })
  })
}