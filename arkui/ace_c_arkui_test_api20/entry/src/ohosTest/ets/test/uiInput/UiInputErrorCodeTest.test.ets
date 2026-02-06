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
import { Driver, ON } from '@ohos.UiTest';

export default function uiInputErrorCodeTest() {

  describe('UiInputErrorCodeTest', () => {

    let PAGE_TAG = 'UiInputErrorCodeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`uiInput/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   errorCode_001
     * @tc.number errorCode_001
     * @tc.desc   test OH_ArkUI_AddSupportedUIStates return 180006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCode_001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id('ErrorCodeButton'));
      await Utils.sleep(2000);
      await component.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('ErrorCodetextStates');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("errorCode_001 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('180006');
      done();
    })

    /**
     * @tc.name   errorCode_002
     * @tc.number errorCode_002
     * @tc.desc   test OH_ArkUI_AddSupportedUIStates return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCode_002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id('ErrorCodeButton'));
      await Utils.sleep(2000);
      await component.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('ErrorCodetextStates1');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("errorCode_002 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('0');
      done();
    })

    /**
     * @tc.name   errorCode_003
     * @tc.number errorCode_003
     * @tc.desc   test OH_ArkUI_AddSupportedUIStates return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCode_003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id('ErrorCodeButton'));
      await Utils.sleep(2000);
      await component.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('ErrorCodetextStates2');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("errorCode_003 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('401');
      done();
    })

    /**
     * @tc.name   errorCode_004
     * @tc.number errorCode_004
     * @tc.desc   test OH_ArkUI_AddSupportedUIStates return 180006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCode_004', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id('ErrorCodeButton'));
      await Utils.sleep(2000);
      await component.click();
      await Utils.sleep(2000);
      let strJson3 = getInspectorByKey('ErrorCodetextStates3');
      await Utils.sleep(1000);
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("errorCode_004 content is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('0');
      let strJson4 = getInspectorByKey('ErrorCodetextStates4');
      await Utils.sleep(1000);
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("errorCode_004 content is: " + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual('0');
      let strJson5 = getInspectorByKey('ErrorCodetextStates5');
      await Utils.sleep(1000);
      let obj5: ESObject = JSON.parse(strJson5);
      console.info("errorCode_004 content is: " + JSON.stringify(obj5.$attrs.content));
      expect(obj5.$attrs.content).assertEqual('180006');
      let strJson6 = getInspectorByKey('ErrorCodetextStates6');
      await Utils.sleep(1000);
      let obj6: ESObject = JSON.parse(strJson6);
      console.info("errorCode_004 content is: " + JSON.stringify(obj6.$attrs.content));
      expect(obj6.$attrs.content).assertEqual('180006');
      let strJson7 = getInspectorByKey('ErrorCodetextStates7');
      await Utils.sleep(1000);
      let obj7: ESObject = JSON.parse(strJson7);
      console.info("errorCode_004 content is: " + JSON.stringify(obj7.$attrs.content));
      expect(obj7.$attrs.content).assertEqual('180006');
      let strJson8 = getInspectorByKey('ErrorCodetextStates8');
      await Utils.sleep(1000);
      let obj8: ESObject = JSON.parse(strJson8);
      console.info("errorCode_004 content is: " + JSON.stringify(obj8.$attrs.content));
      expect(obj8.$attrs.content).assertEqual('180006');
      done();
    })
  })
}