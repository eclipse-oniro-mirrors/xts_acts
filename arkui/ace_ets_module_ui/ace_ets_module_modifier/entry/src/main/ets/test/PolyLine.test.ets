/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import Utils from './Utils'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest';

export default function polyLineJsunit() {
  describe('polyLineTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/polyLine',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get polyLine state success " + JSON.stringify(pages));
        if (!("polyLine" == pages.name)) {
          console.info("get polyLine state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push polyLine page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   testpolyLine
     * @tc.number testpolyLine
     * @tc.desc   Set points values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpolyLine', Level.LEVEL0, async (done: Function) => {
      console.info('[testpolyLine] START');
      let strJson = getInspectorByKey('polyLine');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testpolyLine] obj is : " + JSON.stringify(obj.$attrs));

      //原生数据
      let strJson1 = getInspectorByKey('polyLine1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[testpolyLine] obj is : " + JSON.stringify(obj1.$attrs));

      //与原生做对比
      expect(obj.$attrs.points).assertEqual(obj1.$attrs.points);

      console.info('[testpolyLine] END');
      done();
    });

    /**
     * @tc.name   testpolyLine_001
     * @tc.number testpolyLine_001
     * @tc.desc   Change points values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpolyLine_001', Level.LEVEL0, async (done: Function) => {
      console.info('testpolyLine_001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('polyLine'); //测试组件的key名称
      let objNew: ESObject = JSON.parse(strJsonNew);

      let strJsonNew2 = getInspectorByKey('polyLine2'); //测试组件的key名称
      let objNew2: ESObject = JSON.parse(strJsonNew2);

      console.info("testpolyLine_001 objNew component  is: " + JSON.stringify(objNew.$attrs));
      console.info("testpolyLine_001 objNew2 component  is: " + JSON.stringify(objNew2.$attrs));
      expect(objNew.$attrs.points).assertEqual(objNew2.$attrs.points); //
      console.info('testpolyLine_001 END');
      done();
    });
  })
}
