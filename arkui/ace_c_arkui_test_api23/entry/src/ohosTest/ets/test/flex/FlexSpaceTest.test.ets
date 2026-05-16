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

export default function flexSpaceTest() {

  describe('FlexSpaceTest', () => {

    let PAGE_TAG = 'FlexSpaceTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`flex/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   FlexSpace_0100
     * @tc.number FlexSpace_0100
     * @tc.desc   test Flex NODE_FLEX_SPACE value is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FlexSpace_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('FlexSpace_0100 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('flexSpace1'));
      await button.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('flexSpaceText');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[FlexSpace_0100] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('10.00000010.000000');
      console.info('FlexSpace_0100 END');
      done();
    });

    /**
     * @tc.name   FlexSpace_0200
     * @tc.number FlexSpace_0200
     * @tc.desc   test Flex NODE_FLEX_SPACE value is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexSpace_0200',  Level.LEVEL1, async (done: Function) => {
      console.info('FlexSpace_0200 START');
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('flexSpace2'));
      await button1.click();
      await Utils.sleep(1000);

      let strJson2 = getInspectorByKey('flexSpaceText');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[FlexSpace_0200] content: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('0.0000000.000000');
      console.info('FlexSpace_0200 END');
      done();
    });

    /**
     * @tc.name   FlexSpace_0300
     * @tc.number FlexSpace_0300
     * @tc.desc   test Flex NODE_FLEX_SPACE value is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FlexSpace_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('FlexSpace_0300 START');
      let driver: Driver = Driver.create();
      let button2 = await driver.findComponent(ON.id('flexSpace3'));
      await button2.click();
      await Utils.sleep(1000);

      let strJson3 = getInspectorByKey('flexSpaceText');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[FlexSpace_0300] content: ' + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertEqual('0.0000000.000000');
      console.info('FlexSpace_0300 END');
      done();
    });
  })
}