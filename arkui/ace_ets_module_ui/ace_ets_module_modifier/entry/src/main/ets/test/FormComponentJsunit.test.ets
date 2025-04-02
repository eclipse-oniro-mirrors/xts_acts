/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import bundle from '@ohos.bundle.bundleManager';

export default function formComponentJsunitJsunit() {
  describe('formComponentTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/formComponent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get formComponentJsunit state success " + JSON.stringify(pages));
        if (!("formComponent" == pages.name)) {
          console.info("get formComponentJsunit pages success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push formComponentJsunit page error: " + err);
      }
      done();
    });

    /**
     * @tc.number test_formComponentJsunit001
     * @tc.name Test the properties of components
     * @tc.desc Set allowUpdate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_formComponentJsunit001', 0, async (done: Function) => {
      console.info('[test_formComponentJsunit001] START');
      let strJson = getInspectorByKey('FormComponentKey1');

      console.info("[test_formComponentJsunit001] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.allowUpdate).assertEqual(undefined);
      done();
    });

    /**
     * @tc.number test_formComponentJsunit002
     * @tc.name Test the properties of components
     * @tc.desc Set dimension values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_formComponentJsunit002', 0, async (done: Function) => {
      console.info('[test_formComponentJsunit002] START');
      let strJson = getInspectorByKey('FormComponentKey1');

      console.info("[test_formComponentJsunit002] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.dimension).assertEqual(undefined);
      console.info('[test_formComponentJsunit002] END');
      done();
    });

    /**
     * @tc.number test_formComponentJsunit003
     * @tc.name Test the properties of components
     * @tc.desc Set moduleName values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_formComponentJsunit003', 0, async (done: Function) => {
      console.info('[test_formComponentJsunit003] START');
      let strJson = getInspectorByKey('FormComponentKey1');

      console.info("[test_formComponentJsunit003] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.moduleName).assertEqual(undefined);
      console.info('[test_formComponentJsunit003] END');
      done();
    });

    /**
     * @tc.number test_formComponentJsunit004
     * @tc.name Test the properties of components
     * @tc.desc Set size values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_formComponentJsunit004', 0, async (done: Function) => {
      console.info('[test_formComponentJsunit004] START');
      let strJson = getInspectorByKey('FormComponentKey1');

      console.info("[test_formComponentJsunit004] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.size?.width).assertEqual("200.00vp");
      expect(JSON.parse(strJson).$attrs.size?.height).assertEqual("300.00vp");
      console.info('[test_formComponentJsunit004] END');
      done();
    });

    /**
     * @tc.number test_formComponentJsunit005
     * @tc.name Test the properties of components
     * @tc.desc Set visibility values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_formComponentJsunit005', 0, async (done: Function) => {
      console.info('[test_formComponentJsunit005] START');
      let strJson = getInspectorByKey('FormComponentKey1');

      console.info("[test_formComponentJsunit005] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      let strJson1 = getInspectorByKey('FormComponentKey2');
      console.info("[test_formComponentJsunit005] JSON.parse(strJson)1 is: " + JSON.stringify(JSON.parse(strJson1)
        .$attrs));
      //得到json值与 设置不一致，与原生json返回做对比验证
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual(JSON.parse(strJson1).$attrs.visibility);
      console.info('[test_formComponentJsunit005] END');
      done();
    });

    /**
     * @tc.number test_formComponentJsunit006
     * @tc.name Test the properties of components
     * @tc.desc Change size values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_formComponentJsunit006', 0, async (done: Function) => {

      console.info('test_formComponentJsunit006 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('FormComponentKey1');
      console.info("test_formComponentJsunit006 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.size?.width).assertEqual("100.00vp");
      expect(JSON.parse(strJsonNew).$attrs.size?.height).assertEqual("200.00vp");
      console.info('test_formComponentJsunit006 END ');
      done();
    });

  })
}
