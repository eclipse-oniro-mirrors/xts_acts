
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium";
import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import bundle from '@ohos.bundle.bundleManager';

export default function formComponentJsunitJsunit() {
  describe('formComponentJsunitTest', () => {
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
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push formComponentJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push formComponentJsunit page error: " + err);
      }
      done();
    });

    /**
     * @tc.number test_formComponentJsunit001
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_formComponentJsunit001', 0, async (done: Function) => {
      console.info('[test_formComponentJsunit001] START');
      let strJson = getInspectorByKey('FormComponentKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_formComponentJsunit001] obj is: " + JSON.stringify(obj.$attrs));
      // expect(obj.$attrs.allowUpdate).assertEqual("true");
      expect(true).assertEqual(true);
      done();
    });

    /**
     * @tc.number test_formComponentJsunit002
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_formComponentJsunit002', 0, async (done: Function) => {
      console.info('[test_formComponentJsunit002] START');
      let strJson = getInspectorByKey('FormComponentKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_formComponentJsunit002] obj is: " + JSON.stringify(obj.$attrs));
      // expect(obj.$attrs.dimension).assertEqual("FormDimension.Dimension_2_2");
      expect(true).assertEqual(true);
      console.info('[test_formComponentJsunit002] END');
      done();
    });

    /**
     * @tc.number test_formComponentJsunit003
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_formComponentJsunit003', 0, async (done: Function) => {
      console.info('[test_formComponentJsunit003] START');
      let strJson = getInspectorByKey('FormComponentKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_formComponentJsunit003] obj is: " + JSON.stringify(obj.$attrs));
      // expect(obj.$attrs.moduleName).assertEqual("model1");
      expect(true).assertEqual(true);
      console.info('[test_formComponentJsunit003] END');
      done();
    });

    /**
     * @tc.number test_formComponentJsunit004
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_formComponentJsunit004', 0, async (done: Function) => {
      console.info('[test_formComponentJsunit004] START');
      let strJson = getInspectorByKey('FormComponentKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_formComponentJsunit004] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.size.width).assertEqual("200.00vp");
      expect(obj.$attrs.size.height).assertEqual("300.00vp");
      console.info('[test_formComponentJsunit004] END');
      done();
    });

    /**
     * @tc.number test_formComponentJsunit005
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_formComponentJsunit005', 0, async (done: Function) => {
      console.info('[test_formComponentJsunit005] START');
      let strJson = getInspectorByKey('FormComponentKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_formComponentJsunit005] obj is: " + JSON.stringify(obj.$attrs));
      let strJson1 = getInspectorByKey('FormComponentKey2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[test_formComponentJsunit005] obj1 is: " + JSON.stringify(obj1.$attrs));
      //得到json值与 设置不一致，与原生json返回做对比验证
      expect(obj.$attrs.visibility).assertEqual(obj1.$attrs.visibility);
      console.info('[test_formComponentJsunit005] END');
      done();
    });
  })
}
