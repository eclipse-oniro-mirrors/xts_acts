/*
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

import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function FlexSpaceResourceTest() {
  describe('FlexSpaceResourceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FlexSpaceResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/FlexSpaceResourcePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FlexSpaceResourceTest state pages:" + JSON.stringify(pages));
        if (!("FlexSpaceResourcePage" == pages.name)) {
          console.info("get FlexSpaceResourceTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FlexSpaceResourceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexSpaceResourceTest page error:" + err);
      }
      console.info("FlexSpaceResourceTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number    FlexSpaceResourceTest_0010
     * @tc.name      FlexSpaceResourceTest_0010
     * @tc.desc      test Flex space: set main axle space is 10.9
     * @tc.level:    Level 1
     * @tc.type :    ColumnSpaceResource
     * @tc.size :
     */
    it('FlexSpaceResourceTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[FlexSpaceResourceTest_0010] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('FlexSpaceResource_Flex_1');
      let obj : ESObject = JSON.parse(strJson);
      console.info('[FlexSpaceResourceTest_0010] Flex space is: ' + obj.$attrs.space);
      // expect(obj.$attrs.space).assertEqual("10.90vp");

      let Flex1 = CommonFunc.getComponentRect('FlexSpaceResource_Flex_1');
      let Column1_1 = CommonFunc.getComponentRect('FlexSpaceResource_Column_1_1');
      let Column1_2 = CommonFunc.getComponentRect('FlexSpaceResource_Column_1_2');
      let Column1_3 = CommonFunc.getComponentRect('FlexSpaceResource_Column_1_3');
      
      console.info('[FlexSpaceResourceTest_0010] Flex1.top - Column1_1.top: ' + Math.abs(Flex1.top - Column1_1.top));
      console.info('[FlexSpaceResourceTest_0010] Column1_1.top - Column1_2.top: ' + Math.abs(Column1_1.top - Column1_2.top));
      console.info('[FlexSpaceResourceTest_0010] Flex1.left - Column1_1.left: ' + Math.abs(Flex1.left - Column1_1.left));
      console.info('[FlexSpaceResourceTest_0010] Column1_1.left - Column1_3.left: ' + Math.abs(Column1_1.left - Column1_3.left));
      console.info('[FlexSpaceResourceTest_0010] Column1_2.left - Column1_1.right - vp2px(10.9): ' + Math.abs(Column1_2.left - Column1_1.right - vp2px(10.9)));
      console.info('[FlexSpaceResourceTest_0010] Column1_3.top - Column1_1.bottom: ' + Math.abs(Column1_3.top - Column1_1.bottom));

      expect(Math.floor(Math.abs(Flex1.top - Column1_1.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_1.top - Column1_2.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Flex1.left - Column1_1.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_1.left - Column1_3.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_2.left - Column1_1.right - vp2px(10.9))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_3.top - Column1_1.bottom)) <= 1).assertTrue();

      console.info('[FlexSpaceResourceTest_0010] END');
      done();
    });

    /**
     * @tc.number    FlexSpaceResourceTest_0020
     * @tc.name      FlexSpaceResourceTest_0020
     * @tc.desc      test Flex space: cross axle space is 10
     * @tc.level:    Level 1
     * @tc.type :    ColumnSpaceResource
     * @tc.size :
     */
    it('FlexSpaceResourceTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[FlexSpaceResourceTest_0020] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('FlexSpaceResource_Flex_2');
      let obj : ESObject = JSON.parse(strJson);
      console.info('[FlexSpaceResourceTest_0020] Flex space is: ' + obj.$attrs.space);
      // expect(obj.$attrs.space).assertEqual("10.00vp");

      let Flex1 = CommonFunc.getComponentRect('FlexSpaceResource_Flex_2');
      let Column1_1 = CommonFunc.getComponentRect('FlexSpaceResource_Column_2_1');
      let Column1_2 = CommonFunc.getComponentRect('FlexSpaceResource_Column_2_2');
      let Column1_3 = CommonFunc.getComponentRect('FlexSpaceResource_Column_2_3');
      
      console.info('[FlexSpaceResourceTest_0020] Math.abs(Flex1.top - Column1_1.top): ' + Math.abs(Flex1.top - Column1_1.top));
      console.info('[FlexSpaceResourceTest_0020] Math.abs(Column1_1.top - Column1_2.top): ' + Math.abs(Column1_1.top - Column1_2.top));
      console.info('[FlexSpaceResourceTest_0020] Math.abs(Flex1.left - Column1_1.left): ' + Math.abs(Flex1.left - Column1_1.left));
      console.info('[FlexSpaceResourceTest_0020] Math.abs(Column1_1.left - Column1_3.left): ' + Math.abs(Column1_1.left - Column1_3.left));
      console.info('[FlexSpaceResourceTest_0020] Math.abs(Column1_2.left - Column1_1.right): ' + Math.abs(Column1_2.left - Column1_1.right));
      console.info('[FlexSpaceResourceTest_0020] Math.abs(Column1_3.top - Column1_1.bottom - vp2px(10)): ' + Math.abs(Column1_3.top - Column1_1.bottom - vp2px(10)));

      expect(Math.floor(Math.abs(Flex1.top - Column1_1.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_1.top - Column1_2.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Flex1.left - Column1_1.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_1.left - Column1_3.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_2.left - Column1_1.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_3.top - Column1_1.bottom - vp2px(10))) <= 1).assertTrue();

      console.info('[FlexSpaceResourceTest_0020] END');
      done();
    });

    /**
     * @tc.number    FlexSpaceResourceTest_0030
     * @tc.name      FlexSpaceResourceTest_0030
     * @tc.desc      test Flex space: set main axle space is 10vp, cross axle space is 10px
     * @tc.level:    Level 1
     * @tc.type :    ColumnSpaceResource
     * @tc.size :
     */
    it('FlexSpaceResourceTest_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[FlexSpaceResourceTest_0030] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('FlexSpaceResource_Flex_3');
      let obj : ESObject = JSON.parse(strJson);
      console.info('[FlexSpaceResourceTest_0030] Flex space is: ' + obj.$attrs.space);
      // expect(obj.$attrs.space).assertEqual("10.00vp");

      let Flex1 = CommonFunc.getComponentRect('FlexSpaceResource_Flex_3');
      let Column1_1 = CommonFunc.getComponentRect('FlexSpaceResource_Column_3_1');
      let Column1_2 = CommonFunc.getComponentRect('FlexSpaceResource_Column_3_2');
      let Column1_3 = CommonFunc.getComponentRect('FlexSpaceResource_Column_3_3');
      
      console.info('[FlexSpaceResourceTest_0030] Math.abs(Flex1.top - Column1_1.top): ' + Math.abs(Flex1.top - Column1_1.top));
      console.info('[FlexSpaceResourceTest_0030] Math.abs(Column1_1.top - Column1_2.top): ' + Math.abs(Column1_1.top - Column1_2.top));
      console.info('[FlexSpaceResourceTest_0030] Math.abs(Flex1.left - Column1_1.left): ' + Math.abs(Flex1.left - Column1_1.left));
      console.info('[FlexSpaceResourceTest_0030] Math.abs(Column1_1.left - Column1_3.left): ' + Math.abs(Column1_1.left - Column1_3.left));
      console.info('[FlexSpaceResourceTest_0030] Math.abs(Column1_2.left - Column1_1.right - vp2px(10)): ' + Math.abs(Column1_2.left - Column1_1.right - vp2px(10)));
      console.info('[FlexSpaceResourceTest_0030] Math.abs(Column1_3.top - Column1_1.bottom - 10): ' + Math.abs(Column1_3.top - Column1_1.bottom - 10));

      expect(Math.floor(Math.abs(Flex1.top - Column1_1.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_1.top - Column1_2.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Flex1.left - Column1_1.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_1.left - Column1_3.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_2.left - Column1_1.right - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_3.top - Column1_1.bottom - 10)) <= 1).assertTrue();

      console.info('[FlexSpaceResourceTest_0030] END');
      done();
    });

  })
}