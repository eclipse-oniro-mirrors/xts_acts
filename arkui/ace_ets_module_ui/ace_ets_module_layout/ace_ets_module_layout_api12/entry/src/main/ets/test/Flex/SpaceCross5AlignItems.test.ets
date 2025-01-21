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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function SpaceCross5AlignItemsJsunit() {
  describe('SpaceCross5AlignItemsJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("SpaceCross5AlignItems beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Flex/SpaceCross5AlignItems",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SpaceCross5AlignItems state pages: " + JSON.stringify(pages));
        if (!("SpaceCross5AlignItems" == pages.name)) {
          console.info("get SpaceCross5AlignItems state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SpaceCross5AlignItems success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SpaceCross5AlignItems page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SpaceCross5AlignItemsTest_0010
     * @tc.name      SpaceCross5AlignItemsTest_0010
     * @tc.desc      Flex space cross=5: wrap: FlexWrap.NoWrap
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceCross5AlignItemsTest_0010', 0, async (done: Function) => {
      console.info('SpaceCross5AlignItemsTest_0010 START');
      let strJson = getInspectorByKey('SpaceCross5AlignItems_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceCross5AlignItemsTest_0010] component obj is: " + JSON.stringify(obj.$attrs.space.cross));
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Column");
      expect(obj.$attrs.constructor.wrap).assertEqual("FlexWrap.NoWrap");
      expect(obj.$attrs.space).assertEqual("0.00px");
      console.info('[SpaceCross5AlignItemsTest_0010] END');
      done();
    });

    /**
     * @tc.number    SpaceCross5AlignItemsTest_0020
     * @tc.name      SpaceCross5AlignItemsTest_0020
     * @tc.desc      Flex space cross=5: alignItems: ItemAlign.Start
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceCross5AlignItemsTest_0020', 0, async (done: Function) => {
      console.info('SpaceCross5AlignItemsTest_0020 START');
      let strJson = getInspectorByKey('SpaceCross5AlignItems_Start');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceCross5AlignItemsTest_0020] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.ColumnReverse");
      expect(obj.$attrs.constructor.alignItems).assertEqual("ItemAlign.Start");
      expect(obj.$attrs.space).assertEqual("0.00px");
      console.info('[SpaceCross5AlignItemsTest_0020] END');
      done();
    }); 

    /**
     * @tc.number    SpaceCross5AlignItemsTest_0030
     * @tc.name      SpaceCross5AlignItemsTest_0030
     * @tc.desc      Flex space cross=5: alignItems: ItemAlign.Center
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceCross5AlignItemsTest_0030', 0, async (done: Function) => {
      console.info('SpaceCross5AlignItemsTest_0030 START');
      let strJson = getInspectorByKey('SpaceCross5AlignItems_Center');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceCross5AlignItemsTest_0030] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.alignItems).assertEqual("ItemAlign.Center");
      expect(obj.$attrs.space).assertEqual("0.00px");
      console.info('[SpaceCross5AlignItemsTest_0030] END');
      done();
    }); 

    /**
     * @tc.number    SpaceCross5AlignItemsTest_0040
     * @tc.name      SpaceCross5AlignItemsTest_0040
     * @tc.desc      Flex space cross=5: alignItems: ItemAlign.End
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceCross5AlignItemsTest_0040', 0, async (done: Function) => {
      console.info('SpaceCross5AlignItemsTest_0040 START');
      let strJson = getInspectorByKey('SpaceCross5AlignItems_End');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceCross5AlignItemsTest_0040] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.alignItems).assertEqual("ItemAlign.End");
      expect(obj.$attrs.space).assertEqual("0.00px");
      console.info('[SpaceCross5AlignItemsTest_0040] END');
      done();
    });

    /**
     * @tc.number    SpaceCross5AlignItemsTest_0050
     * @tc.name      SpaceCross5AlignItemsTest_0050
     * @tc.desc      Flex space cross=5: alignItems: ItemAlign.Stretch
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceCross5AlignItemsTest_0050', 0, async (done: Function) => {
      console.info('SpaceCross5AlignItemsTest_0050 START');
      let strJson = getInspectorByKey('SpaceCross5AlignItems_Stretch');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceCross5AlignItemsTest_0050] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.alignItems).assertEqual("ItemAlign.Stretch");
      expect(obj.$attrs.space).assertEqual("0.00px");
      console.info('[SpaceCross5AlignItemsTest_0050] END');
      done();
    });

    /**
     * @tc.number    SpaceCross5AlignItemsTest_0060
     * @tc.name      SpaceCross5AlignItemsTest_0060
     * @tc.desc      Flex space cross=5: alignItems: ItemAlign.Baseline
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceCross5AlignItemsTest_0060', 0, async (done: Function) => {
      console.info('SpaceCross5AlignItemsTest_0060 START');
      let strJson = getInspectorByKey('SpaceCross5AlignItems_Baseline');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceCross5AlignItemsTest_0060] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.alignItems).assertEqual("ItemAlign.Baseline");
      expect(obj.$attrs.space).assertEqual("0.00px");
      console.info('[SpaceCross5AlignItemsTest_0060] END');
      done();
    });

    /**
     * @tc.number    SpaceCross5AlignItemsTest_0070
     * @tc.name      SpaceCross5AlignItemsTest_0070
     * @tc.desc      Flex space cross=5: alignItems: ItemAlign.Baseline
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceCross5AlignItemsTest_0070', 0, async (done: Function) => {
      console.info('SpaceCross5AlignItemsTest_0070 START');
      let strJson = getInspectorByKey('SpaceCross5AlignItems_main5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceCross5AlignItemsTest_0070] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      expect(obj.$attrs.space).assertEqual("5.00vp");
      console.info('[SpaceCross5AlignItemsTest_0070] END');
      done();
    }); 

  })
}

