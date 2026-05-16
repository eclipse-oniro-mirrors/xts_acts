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

export default function rowReverseTest() {

  describe('RowReverseTest', () => {

    let PAGE_TAG = 'RowReverseTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`row/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   RowReverse_0100
     * @tc.number RowReverse_0100
     * @tc.desc   test Row NODE_LINEAR_LAYOUT_REVERSE value is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RowReverse_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('RowReverse_0100 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('RowReverse1'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('RowReverse');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[RowReverse_0100] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('1');
      console.info('RowReverse_0100 END');
      done();
    });

    /**
     * @tc.name   RowReverse_0200
     * @tc.number RowReverse_0200
     * @tc.desc   test Row NODE_LINEAR_LAYOUT_REVERSE value is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RowReverse_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('RowReverse_0200 START');
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('RowReverse2'));
      await button1.click();
      await Utils.sleep(1000);

      let strJson2 = getInspectorByKey('RowReverse');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[RowReverse_0200] content: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('RowReverse_0200 END');
      done();
    });

    /**
     * @tc.name   RowReverse_0300
     * @tc.number RowReverse_0300
     * @tc.desc   test Row NODE_LINEAR_LAYOUT_REVERSE value is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RowReverse_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('RowReverse_0300 START');
      let driver: Driver = Driver.create();
      let button2 = await driver.findComponent(ON.id('RowReverse3'));
      await button2.click();
      await Utils.sleep(1000);

      let strJson3 = getInspectorByKey('RowReverse');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[RowReverse_0300] content: ' + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertEqual('0');
      console.info('RowReverse_0300 END');
      done();
    });

    /**
     * @tc.name   RowReverse_0400
     * @tc.number RowReverse_0400
     * @tc.desc   test Row NODE_LINEAR_LAYOUT_REVERSE value is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RowReverse_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('RowReverse_0400 START');
      let driver: Driver = Driver.create();
      let button2 = await driver.findComponent(ON.id('RowReverse4'));
      await button2.click();
      await Utils.sleep(1000);

      let strJson3 = getInspectorByKey('RowReverse');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[RowReverse_0400] content: ' + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertEqual('1');
      console.info('RowReverse_0400 END');
      done();
    });

    /**
     * @tc.name   RowReverse_0500
     * @tc.number RowReverse_0500
     * @tc.desc   test Row NODE_LINEAR_LAYOUT_REVERSE value is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RowReverse_0500',  Level.LEVEL1, async (done: Function) => {
      console.info('RowReverse_0500 START');
      let driver: Driver = Driver.create();
      let button2 = await driver.findComponent(ON.id('RowReverse5'));
      await button2.click();
      await Utils.sleep(1000);

      let strJson3 = getInspectorByKey('RowReverse');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[RowReverse_0500] content: ' + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertEqual('1');
      console.info('RowReverse_0500 END');
      done();
    });
  })
}