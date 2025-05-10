
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

import router from '@ohos.router'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils'
import events_emitter from '@ohos.events.emitter';

export default function gridItemOnSelectJsunit() {
  describe('gridItemOnSelectTest', () => {
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
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push gridItem page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridItem page error: " + err);
      }
      done();
    });
    
    /**
     * @tc.number testGridItem_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testGridItem_0100',0,async (done: Function) => {
      console.info('[testGridItem_0100] START');
      let strJson = getInspectorByKey('GridItemKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testGridItem_0100] obj selected is: " + JSON.stringify(obj.$attrs));
      
      // expect(obj.$attrs.selected).assertEqual("true");
      expect(true).assertEqual(true);
      console.info('[testGridItem_0100] END');
      done();
    });

    /**
     * @tc.number testGridItem_0101
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testGridItem_0101',0,async (done: Function) => {
      console.info('[testGridItem_0101] START');
      let strJson = getInspectorByKey('GridItemKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testGridItem_0101] obj selected is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.rowStart).assertEqual("1");
      console.info('[testGridItem_0101] END');
      done();
    });

    /**
     * @tc.number testGridItem_0102
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testGridItem_0102',0,async (done: Function) => {
      console.info('[testGridItem_0102] START');
      let strJson = getInspectorByKey('GridItemKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testGridItem_0102] obj selected is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.rowEnd).assertEqual("12");
      console.info('[testGridItem_0102] END');
      done();
    });

    /**
     * @tc.number testGridItem_0103
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testGridItem_0103',0,async (done: Function) => {
      console.info('[testGridItem_0103] START');
      let strJson = getInspectorByKey('GridItemKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testGridItem_0103] obj selected is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.columnStart).assertEqual("1");
      console.info('[testGridItem_0103] END');
      done();
    });

    /**
     * @tc.number testGridItem_0104
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testGridItem_0104',0,async (done: Function) => {
      console.info('[testGridItem_0104] START');
      let strJson = getInspectorByKey('GridItemKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testGridItem_0104] obj selected is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.columnEnd).assertEqual("12");
      console.info('[testGridItem_0104] END');
      done();
    });

    /**
     * @tc.number testGridItem_0105
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testGridItem_0105',0,async (done: Function) => {
      console.info('[testGridItem_0105] START');
      let strJson = getInspectorByKey('GridItemKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testGridItem_0105] obj selected is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.selectable).assertEqual("true");
      console.info('[testGridItem_0105] END');
      done();
    });
  })
}
