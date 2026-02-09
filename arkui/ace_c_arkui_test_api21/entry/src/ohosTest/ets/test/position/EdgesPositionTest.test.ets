/**
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

import { expect, describe, it, beforeEach, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';
import native from 'libnativerender.so'

export default function EdgesPositionTest() {
  describe('EdgesPositionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("EdgesPosition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/position/EdgesPositionPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EdgesPosition state pages:" + JSON.stringify(pages));
        if (!("EdgesPositionPage" == pages.name)) {
          console.info("get EdgesPosition pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push EdgesPosition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EdgesPosition page error:" + err);
      }
      console.info("EdgesPosition beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("EdgesPosition after each called");
    });

    /**
     * @tc.name   EdgesPositionTest_0100
     * @tc.number EdgesPositionTest_0100
     * @tc.desc   Test EdgesPosition: set single value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EdgesPositionTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      // set top
      let button = await driver.findComponent(ON.id('EdgesPositionPage_top_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0100] click EdgesPositionPage_top_Btn.");
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('EdgesPositionPage_testFlex');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0100] obj.$attrs.position is: " + JSON.stringify(obj.$attrs.position));
      let parentRect = Utils.getComponentRect("EdgesPositionPage_parentFlex");
      let rect = Utils.getComponentRect("EdgesPositionPage_testFlex");
      console.info("[EdgesPositionTest_0100] (rect.left - parentRect.left): " + (rect.left - parentRect.left));
      console.info("[EdgesPositionTest_0100] (rect.top - parentRect.top - vp2px(20)): " + (rect.top - parentRect.top - vp2px(20)));
      expect(Math.floor(Math.abs(rect.left - parentRect.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(rect.top - parentRect.top - vp2px(20))) <= 1).assertTrue();

      // get top
      button = await driver.findComponent(ON.id('EdgesPositionPage_GetPosition_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0100] click EdgesPositionPage_GetPosition_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_position_content');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0100] obj.$attrs.content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('top:20,left:NULL,bottom:NULL,right:NULL');

      // set left
      button = await driver.findComponent(ON.id('EdgesPositionPage_left_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0100] click EdgesPositionPage_left_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_testFlex');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0100] obj.$attrs.position is: " + JSON.stringify(obj.$attrs.position));
      parentRect = Utils.getComponentRect("EdgesPositionPage_parentFlex");
      rect = Utils.getComponentRect("EdgesPositionPage_testFlex");
      console.info("[EdgesPositionTest_0100] (rect.top - parentRect.top): " + (rect.top - parentRect.top));
      console.info("[EdgesPositionTest_0100] (rect.left - parentRect.left - vp2px(20)): " + (rect.left - parentRect.left - vp2px(20)));
      expect(Math.floor(Math.abs(rect.top - parentRect.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(rect.left - parentRect.left - vp2px(20))) <= 1).assertTrue();

      // get left
      button = await driver.findComponent(ON.id('EdgesPositionPage_GetPosition_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0100] click EdgesPositionPage_GetPosition_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_position_content');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0100] obj.$attrs.content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('top:NULL,left:20,bottom:NULL,right:NULL');

      // set bottom
      button = await driver.findComponent(ON.id('EdgesPositionPage_bottom_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0100] click EdgesPositionPage_bottom_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_testFlex');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0100] obj.$attrs.position is: " + JSON.stringify(obj.$attrs.position));
      parentRect = Utils.getComponentRect("EdgesPositionPage_parentFlex");
      rect = Utils.getComponentRect("EdgesPositionPage_testFlex");
      console.info("[EdgesPositionTest_0100] (rect.left - parentRect.left): " + (rect.left - parentRect.left));
      console.info("[EdgesPositionTest_0100] (parentRect.bottom - rect.bottom - vp2px(20)): " + (parentRect.bottom - rect.bottom - vp2px(20)));
      expect(Math.floor(Math.abs(rect.left - parentRect.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(parentRect.bottom - rect.bottom - vp2px(20))) <= 1).assertTrue();

      // get bottom
      button = await driver.findComponent(ON.id('EdgesPositionPage_GetPosition_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0100] click EdgesPositionPage_GetPosition_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_position_content');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0100] obj.$attrs.content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('top:NULL,left:NULL,bottom:20,right:NULL');

      // set right
      button = await driver.findComponent(ON.id('EdgesPositionPage_right_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0100] click EdgesPositionPage_right_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_testFlex');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0100] obj.$attrs.position is: " + JSON.stringify(obj.$attrs.position));
      parentRect = Utils.getComponentRect("EdgesPositionPage_parentFlex");
      rect = Utils.getComponentRect("EdgesPositionPage_testFlex");
      console.info("[EdgesPositionTest_0100] (rect.top - parentRect.top): " + (rect.top - parentRect.top));
      console.info("[EdgesPositionTest_0100] (parentRect.right - rect.right - vp2px(20)): " + (parentRect.right - rect.right - vp2px(20)));
      expect(Math.floor(Math.abs(rect.top - parentRect.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(parentRect.right - rect.right - vp2px(20))) <= 1).assertTrue();

      // get right
      button = await driver.findComponent(ON.id('EdgesPositionPage_GetPosition_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0100] click EdgesPositionPage_GetPosition_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_position_content');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0100] obj.$attrs.content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('top:NULL,left:NULL,bottom:NULL,right:20');

      console.info('[EdgesPositionTest_0100] END');
      done();
    });

    /**
     * @tc.name   EdgesPositionTest_0200
     * @tc.number EdgesPositionTest_0200
     * @tc.desc   Test EdgesPosition: set single value, the value is negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EdgesPositionTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_0200] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      // set top
      let button = await driver.findComponent(ON.id('EdgesPositionPage_top_negative_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0200] click EdgesPositionPage_top_negative_Btn.");
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('EdgesPositionPage_testFlex');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0200] obj.$attrs.position is: " + JSON.stringify(obj.$attrs.position));
      let parentRect = Utils.getComponentRect("EdgesPositionPage_parentFlex");
      let rect = Utils.getComponentRect("EdgesPositionPage_testFlex");
      console.info("[EdgesPositionTest_0200] (parentRect.left - rect.left): " + (parentRect.left - rect.left));
      console.info("[EdgesPositionTest_0200] (parentRect.top - rect.top - vp2px(20)): " + (parentRect.top - rect.top - vp2px(20)));
      expect(Math.floor(Math.abs(parentRect.left - rect.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(parentRect.top - rect.top - vp2px(20))) <= 1).assertTrue();

      // get top
      button = await driver.findComponent(ON.id('EdgesPositionPage_GetPosition_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0200] click EdgesPositionPage_GetPosition_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_position_content');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0200] obj.$attrs.content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('top:-20,left:NULL,bottom:NULL,right:NULL');

      // set left
      button = await driver.findComponent(ON.id('EdgesPositionPage_left_negative_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0200] click EdgesPositionPage_left_negative_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_testFlex');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0200] obj.$attrs.position is: " + JSON.stringify(obj.$attrs.position));
      parentRect = Utils.getComponentRect("EdgesPositionPage_parentFlex");
      rect = Utils.getComponentRect("EdgesPositionPage_testFlex");
      console.info("[EdgesPositionTest_0200] (parentRect.top - rect.top): " + (parentRect.top - rect.top));
      console.info("[EdgesPositionTest_0200] (parentRect.left - rect.left - vp2px(20)): " + (parentRect.left - rect.left - vp2px(20)));
      expect(Math.floor(Math.abs(parentRect.top - rect.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(parentRect.left - rect.left - vp2px(20))) <= 1).assertTrue();

      // get left
      button = await driver.findComponent(ON.id('EdgesPositionPage_GetPosition_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0200] click EdgesPositionPage_GetPosition_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_position_content');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0200] obj.$attrs.content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('top:NULL,left:-20,bottom:NULL,right:NULL');

      // set bottom
      button = await driver.findComponent(ON.id('EdgesPositionPage_bottom_negative_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0200] click EdgesPositionPage_bottom_negative_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_testFlex');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0200] obj.$attrs.position is: " + JSON.stringify(obj.$attrs.position));
      parentRect = Utils.getComponentRect("EdgesPositionPage_parentFlex");
      rect = Utils.getComponentRect("EdgesPositionPage_testFlex");
      console.info("[EdgesPositionTest_0200] (parentRect.left - rect.left): " + (parentRect.left - rect.left));
      console.info("[EdgesPositionTest_0200] (rect.bottom - parentRect.bottom - vp2px(20)): " + (rect.bottom - parentRect.bottom - vp2px(20)));
      expect(Math.floor(Math.abs(parentRect.left - rect.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(rect.bottom - parentRect.bottom - vp2px(20))) <= 1).assertTrue();

      // get bottom
      button = await driver.findComponent(ON.id('EdgesPositionPage_GetPosition_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0200] click EdgesPositionPage_GetPosition_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_position_content');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0200] obj.$attrs.content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('top:NULL,left:NULL,bottom:-20,right:NULL');

      // set right
      button = await driver.findComponent(ON.id('EdgesPositionPage_right_negative_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0200] click EdgesPositionPage_right_negative_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_testFlex');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0200] obj.$attrs.position is: " + JSON.stringify(obj.$attrs.position));
      parentRect = Utils.getComponentRect("EdgesPositionPage_parentFlex");
      rect = Utils.getComponentRect("EdgesPositionPage_testFlex");
      console.info("[EdgesPositionTest_0200] (parentRect.top - rect.top): " + (parentRect.top - rect.top));
      console.info("[EdgesPositionTest_0200] (rect.right - parentRect.right - vp2px(20)): " + (rect.right - parentRect.right - vp2px(20)));
      expect(Math.floor(Math.abs(parentRect.top - rect.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(rect.right - parentRect.right - vp2px(20))) <= 1).assertTrue();

      // get right
      button = await driver.findComponent(ON.id('EdgesPositionPage_GetPosition_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0200] click EdgesPositionPage_GetPosition_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_position_content');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0200] obj.$attrs.content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('top:NULL,left:NULL,bottom:NULL,right:-20');

      console.info('[EdgesPositionTest_0200] END');
      done();
    });

    /**
     * @tc.number     EdgesPositionTest_0300
     * @tc.name       EdgesPositionTest_0300
     * @tc.desc       Test OH_ArkUI_PositionEdges_GetTop ErrorCode: ARKUI_ERROR_CODE_NO_ERROR.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('EdgesPositionTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_0300] START');

      expect(native.TestPositionEdgesGetTopErrorCode_001()).assertEqual(0)

      console.info('[EdgesPositionTest_0300] END');
      done();
    });

    /**
     * @tc.number     EdgesPositionTest_0400
     * @tc.name       EdgesPositionTest_0400
     * @tc.desc       Test OH_ArkUI_PositionEdges_GetTop ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('EdgesPositionTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_0400] START');

      expect(native.TestPositionEdgesGetTopErrorCode_002()).assertEqual(0)

      console.info('[EdgesPositionTest_0400] END');
      done();
    });

    /**
     * @tc.number     EdgesPositionTest_0500
     * @tc.name       EdgesPositionTest_0500
     * @tc.desc       Test OH_ArkUI_PositionEdges_Left ErrorCode: ARKUI_ERROR_CODE_NO_ERROR.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('EdgesPositionTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_0500] START');

      expect(native.TestPositionEdgesGetLeftErrorCode_001()).assertEqual(0)

      console.info('[EdgesPositionTest_0500] END');
      done();
    });

    /**
     * @tc.number     EdgesPositionTest_0600
     * @tc.name       EdgesPositionTest_0600
     * @tc.desc       Test OH_ArkUI_PositionEdges_Left ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('EdgesPositionTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_0600] START');

      expect(native.TestPositionEdgesGetLeftErrorCode_002()).assertEqual(0)

      console.info('[EdgesPositionTest_0600] END');
      done();
    });

    /**
     * @tc.number     EdgesPositionTest_0700
     * @tc.name       EdgesPositionTest_0700
     * @tc.desc       Test OH_ArkUI_PositionEdges_Bottom ErrorCode: ARKUI_ERROR_CODE_NO_ERROR.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('EdgesPositionTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_0700] START');

      expect(native.TestPositionEdgesGetBottomErrorCode_001()).assertEqual(0)

      console.info('[EdgesPositionTest_0700] END');
      done();
    });

    /**
     * @tc.number     EdgesPositionTest_0800
     * @tc.name       EdgesPositionTest_0800
     * @tc.desc       Test OH_ArkUI_PositionEdges_Bottom ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('EdgesPositionTest_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_0800] START');

      expect(native.TestPositionEdgesGetBottomErrorCode_002()).assertEqual(0)

      console.info('[EdgesPositionTest_0800] END');
      done();
    });

    /**
     * @tc.number     EdgesPositionTest_0900
     * @tc.name       EdgesPositionTest_0900
     * @tc.desc       Test OH_ArkUI_PositionEdges_Right ErrorCode: ARKUI_ERROR_CODE_NO_ERROR.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('EdgesPositionTest_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_0900] START');

      expect(native.TestPositionEdgesGetRightErrorCode_001()).assertEqual(0)

      console.info('[EdgesPositionTest_0900] END');
      done();
    });

    /**
     * @tc.number     EdgesPositionTest_1000
     * @tc.name       EdgesPositionTest_1000
     * @tc.desc       Test OH_ArkUI_PositionEdges_Right ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('EdgesPositionTest_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_1000] START');

      expect(native.TestPositionEdgesGetRightErrorCode_002()).assertEqual(0)

      console.info('[EdgesPositionTest_1000] END');
      done();
    });

    /**
     * @tc.number     EdgesPositionTest_1100
     * @tc.name       EdgesPositionTest_1100
     * @tc.desc       Test OH_ArkUI_PositionEdges_Copy return nullptr.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('EdgesPositionTest_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_1100] START');

      expect(native.TestPositionEdgesCopyReturnNullptr()).assertEqual(0)

      console.info('[EdgesPositionTest_1100] END');
      done();
    });

    /**
     * @tc.number     EdgesPositionTest_1200
     * @tc.name       EdgesPositionTest_1200
     * @tc.desc       Test OH_ArkUI_PositionEdges_Create return Non-nullptr.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('EdgesPositionTest_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_1200] START');

      expect(native.TestPositionEdgesCreateReturnNoNullptr()).assertEqual(0)

      console.info('[EdgesPositionTest_1200] END');
      done();
    });

  })
}