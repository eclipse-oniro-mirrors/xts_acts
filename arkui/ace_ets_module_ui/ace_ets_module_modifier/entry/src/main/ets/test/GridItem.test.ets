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
import { beforeAll, describe, expect, it } from '@ohos/hypium';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function gridItemJsunit() {
  describe('gridItemTest', () => {
    beforeAll(async (done: Function) => {
      console.info("gridItem beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gridItem',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridItem state success " + JSON.stringify(pages));
        if (!("gridItem" == pages.name)) {
          console.info("get gridItem state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push gridItem page error: " + err);
      }
      done();
    });

    /**
     * @tc.number testGridItem_0100
     * @tc.name Test the properties of components
     * @tc.desc Set selected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGridItem_0100', 0, async (done: Function) => {
      console.info('[testGridItem_0100] START');
      let driver = Driver.create();
      let item = await driver.findComponent(ON.id('GridItemKey1'));
      let re = await item.isSelected();
      expect(re).assertEqual(true);
      console.info('[testGridItem_0100] END');
      done();
    });

    /**
     * @tc.number testGridItem_0101
     * @tc.name Test the properties of components
     * @tc.desc Set rowStart values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGridItem_0101', 0, async (done: Function) => {
      console.info('[testGridItem_0101] START');
      let strJson = getInspectorByKey('GridItemKey1');

      console.info("[testGridItem_0101] JSON.parse(strJson) selected is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.rowStart).assertEqual("1");
      console.info('[testGridItem_0101] END');
      done();
    });

    /**
     * @tc.number testGridItem_0102
     * @tc.name Test the properties of components
     * @tc.desc Set rowEnd values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGridItem_0102', 0, async (done: Function) => {
      console.info('[testGridItem_0102] START');
      let strJson = getInspectorByKey('GridItemKey1');

      console.info("[testGridItem_0102] JSON.parse(strJson) selected is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.rowEnd).assertEqual("12");
      console.info('[testGridItem_0102] END');
      done();
    });

    /**
     * @tc.number testGridItem_0103
     * @tc.name Test the properties of components
     * @tc.desc Set columnStart values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGridItem_0103', 0, async (done: Function) => {
      console.info('[testGridItem_0103] START');
      let strJson = getInspectorByKey('GridItemKey1');

      console.info("[testGridItem_0103] JSON.parse(strJson) selected is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.columnStart).assertEqual("1");
      console.info('[testGridItem_0103] END');
      done();
    });

    /**
     * @tc.number testGridItem_0104
     * @tc.name Test the properties of components
     * @tc.desc Set columnEnd values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGridItem_0104', 0, async (done: Function) => {
      console.info('[testGridItem_0104] START');
      let strJson = getInspectorByKey('GridItemKey1');

      console.info("[testGridItem_0104] JSON.parse(strJson) selected is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.columnEnd).assertEqual("12");
      console.info('[testGridItem_0104] END');
      done();
    });

    /**
     * @tc.number testGridItem_0105
     * @tc.name Test the properties of components
     * @tc.desc Set selectable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGridItem_0105', 0, async (done: Function) => {
      console.info('[testGridItem_0105] START');
      let strJson = getInspectorByKey('GridItemKey1');

      console.info("[testGridItem_0105] JSON.parse(strJson) selected is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));

      expect(JSON.parse(strJson).$attrs.selectable).assertEqual("true");
      console.info('[testGridItem_0105] END');
      done();
    });

    /**
     * @tc.number testGridItem_0106
     * @tc.name Test the properties of components
     * @tc.desc Change rowStart values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGridItem_0106', 0, async (done: Function) => {
      console.info('testGridItem_0106 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('GridItemKey1'); //测试组件的key名称
      console.info("testGridItem_0106 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.rowStart).assertEqual('2'); //
      console.info('testGridItem_0106 END');
      done();
    });
  })
}
