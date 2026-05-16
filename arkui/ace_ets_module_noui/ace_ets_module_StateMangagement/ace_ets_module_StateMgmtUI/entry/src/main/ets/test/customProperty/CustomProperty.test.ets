/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
export default function CustomPropertyTest() {
  describe('CustomPropertyTest', () => {

    beforeEach(async (done: Function) => {
      console.info("CustomProperty beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/customProperty/CustomProperty",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("CustomProperty" == pages.name)) {
          console.info("get CustomProperty pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomProperty page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomProperty page error:" + err);
      }
      console.info("CustomProperty beforeEach end");
      done();
    });

    afterEach(() => {
      hilog.info(0x0000, 'CustomPropertyTest', 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(0x0000, 'CustomPropertyTest', 'afterAll: all tests finished');
    });

    /**
     * @tc.name   customProperty_0100
     * @tc.number SUB_ARKUI_CUSTOMPROPERTY_PARAM_0100
     * @tc.desc   Test customProperty with object type containing multiple data types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('customProperty_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'CustomPropertyTest', 'customProperty_0100 START');

      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('button_verify1'));
      await button.click();
      await CommonFunc.sleep(500);

      let textComponent: Component = await driver.findComponent(ON.id('text_result1'));
      let result: string = await textComponent.getText();
      hilog.info(0x0000, 'CustomPropertyTest', 'customProperty_0100 result: ' + result);

      let expectedObject: Record<string, ESObject> = {
        'number': 10,
        'string': 'this is a string',
        'bool': true,
        'object': {
          'name': 'name',
          'value': 100
        }
      };
      let expectedJson: string = JSON.stringify(expectedObject);

      expect(result).assertEqual('Result1: ' + expectedJson);
      hilog.info(0x0000, 'CustomPropertyTest', 'customProperty_0100 END');
    });

    /**
     * @tc.name   customProperty_0200
     * @tc.number SUB_ARKUI_CUSTOMPROPERTY_PARAM_0200
     * @tc.desc   Test customProperty with undefined value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('customProperty_0200', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'CustomPropertyTest', 'customProperty_0200 START');

      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('button_verify2'));
      await button.click();
      await CommonFunc.sleep(500);

      let textComponent: Component = await driver.findComponent(ON.id('text_result2'));
      let result: string = await textComponent.getText();
      hilog.info(0x0000, 'CustomPropertyTest', 'customProperty_0200 result: ' + result);

      expect(result).assertEqual('Result2: undefined');
      hilog.info(0x0000, 'CustomPropertyTest', 'customProperty_0200 END');
    });

    /**
     * @tc.name   customProperty_0300
     * @tc.number SUB_ARKUI_CUSTOMPROPERTY_PARAM_0300
     * @tc.desc   Test customProperty with multiple custom properties on same component
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('customProperty_0300', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'CustomPropertyTest', 'customProperty_0300 START');

      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('button_verify3'));
      await button.click();
      await CommonFunc.sleep(500);

      let textComponent: Component = await driver.findComponent(ON.id('text_result3'));
      let result: string = await textComponent.getText();
      hilog.info(0x0000, 'CustomPropertyTest', 'customProperty_0300 result: ' + result);

      let expectedObject: Record<string, ESObject> = {
        'width': 100,
        'height': 200
      };
      let expectedJson: string = JSON.stringify(expectedObject);

      expect(result).assertEqual('Result3: ' + expectedJson);
      hilog.info(0x0000, 'CustomPropertyTest', 'customProperty_0300 END');
    });
  });
}