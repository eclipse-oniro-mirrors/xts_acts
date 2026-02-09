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

export default function monopolizeTest() {

  describe('monopolizeTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number    monopolizeTest_001
     * @tc.name      monopolizeTest_001
     * @tc.desc      test monopolize is false
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('monopolizeTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[monopolizeTest_001] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'MonopolizeTest';
      await Utils.pushPage(`monopolize/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('false'));
      await btn.click();
      await Utils.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('touchIt'));
      await btn1.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('father');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[monopolizeTest_001] monopolizeTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('FATHER_EVENT');

      let strJson2 = getInspectorByKey('child');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[monopolizeTest_001] monopolizeTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('CHILD_EVENT');

      let strJson3 = getInspectorByKey('errorCode');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[monopolizeTest_001] monopolizeTest: ' + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertEqual('0');
      console.info('[monopolizeTest_001] END');
      done();
    })

    /**
     * @tc.number    monopolizeTest_002
     * @tc.name      monopolizeTest_002
     * @tc.desc      test monopolize is true
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('monopolizeTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[monopolizeTest_002] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'MonopolizeTest';
      await Utils.pushPage(`monopolize/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await Utils.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('true'));
      await btn.click();
      await Utils.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('touchIt'));
      await btn1.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('father');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[monopolizeTest_002] monopolizeTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('null message');

      let strJson2 = getInspectorByKey('child');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[monopolizeTest_002] monopolizeTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('CHILD_EVENT');

      let strJson3 = getInspectorByKey('errorCode');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[monopolizeTest_002] monopolizeTest: ' + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertEqual('0');
      console.info('[monopolizeTest_002] END');
      done();
    })

    /**
     * @tc.number    monopolizeTest_003
     * @tc.name      monopolizeTest_003
     * @tc.desc      test monopolize is nullptr
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('monopolizeTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[monopolizeTest_003] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'MonopolizeTest';
      await Utils.pushPage(`monopolize/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await Utils.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('nullptr'));
      await btn.click();
      await Utils.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('touchIt'));
      await btn1.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('father');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[monopolizeTest_003] monopolizeTest: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('FATHER_EVENT');

      let strJson2 = getInspectorByKey('child');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[monopolizeTest_003] monopolizeTest: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('CHILD_EVENT');

      let strJson3 = getInspectorByKey('errorCode');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[monopolizeTest_003] monopolizeTest: ' + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertEqual('401');
      console.info('[monopolizeTest_003] END');
      done();
    })
  })
}