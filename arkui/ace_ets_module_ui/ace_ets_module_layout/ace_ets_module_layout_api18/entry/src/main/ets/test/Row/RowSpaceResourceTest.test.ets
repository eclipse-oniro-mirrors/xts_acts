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

export default function RowSpaceResourceTest() {
  describe('RowSpaceResourceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RowSpaceResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/RowSpaceResourcePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RowSpaceResourceTest state pages:" + JSON.stringify(pages));
        if (!("RowSpaceResourcePage" == pages.name)) {
          console.info("get RowSpaceResourceTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RowSpaceResourceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowSpaceResourceTest page error:" + err);
      }
      console.info("RowSpaceResourceTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   RowSpaceResourceTest_0100
     * @tc.number RowSpaceResourceTest_0100
     * @tc.desc   test type of space is Resource (string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RowSpaceResourceTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[RowSpaceResourceTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('RowSpaceResource_Row1');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.space).assertEqual("10.00vp");

      let Row1 = CommonFunc.getComponentRect('RowSpaceResource_Row1');
      let Row1_01 = CommonFunc.getComponentRect('RowSpaceResource_Row1_01');
      let Row1_02 = CommonFunc.getComponentRect('RowSpaceResource_Row1_02');
      let Row1_03 = CommonFunc.getComponentRect('RowSpaceResource_Row1_03');
      
      console.info('[RowSpaceResourceTest_0100] Row1.left - Row1_01.left');
      console.info('[RowSpaceResourceTest_0100] Row1_02.left - Row1_01.right - vp2px(10)');
      console.info('[RowSpaceResourceTest_0100] Row1_03.left - Row1_02.right - vp2px(10)');
      expect(Math.floor(Math.abs(Row1.left - Row1_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Row1_02.left - Row1_01.right - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Row1_03.left - Row1_02.right - vp2px(10))) <= 1).assertTrue();

      console.info('[RowSpaceResourceTest_0100] END');
      done();
    });

    /**
     * @tc.name   RowSpaceResourceTest_0200
     * @tc.number RowSpaceResourceTest_0200
     * @tc.desc   test type of space is Resource (integer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RowSpaceResourceTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[RowSpaceResourceTest_0200] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('RowSpaceResource_Row2');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.space).assertEqual("10.00vp");

      let Row2 = CommonFunc.getComponentRect('RowSpaceResource_Row2');
      let Row2_01 = CommonFunc.getComponentRect('RowSpaceResource_Row2_01');
      let Row2_02 = CommonFunc.getComponentRect('RowSpaceResource_Row2_02');
      let Row2_03 = CommonFunc.getComponentRect('RowSpaceResource_Row2_03');
      
      console.info('[RowSpaceResourceTest_0200] Row2.left - Row2_01.left');
      console.info('[RowSpaceResourceTest_0200] Row2_02.left - Row2_01.right - vp2px(10)');
      console.info('[RowSpaceResourceTest_0200] Row2_03.left - Row2_02.right - vp2px(10)');
      expect(Math.floor(Math.abs(Row2.left - Row2_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Row2_02.left - Row2_01.right - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Row2_03.left - Row2_02.right - vp2px(10))) <= 1).assertTrue();

      console.info('[RowSpaceResourceTest_0200] END');
      done();
    });

    /**
     * @tc.name   RowSpaceResourceTest_0300
     * @tc.number RowSpaceResourceTest_0300
     * @tc.desc   test type of space is Resource (float)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RowSpaceResourceTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[RowSpaceResourceTest_0300] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('RowSpaceResource_Row3');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.space).assertEqual("10.90vp");

      let Row3 = CommonFunc.getComponentRect('RowSpaceResource_Row3');
      let Row3_01 = CommonFunc.getComponentRect('RowSpaceResource_Row3_01');
      let Row3_02 = CommonFunc.getComponentRect('RowSpaceResource_Row3_02');
      let Row3_03 = CommonFunc.getComponentRect('RowSpaceResource_Row3_03');
      
      console.info('[RowSpaceResourceTest_0300] Row3.left - Row3_01.left');
      console.info('[RowSpaceResourceTest_0300] Row3_02.left - Row3_01.right - vp2px(10.9)');
      console.info('[RowSpaceResourceTest_0300] Row3_03.left - Row3_02.right - vp2px(10.9)');
      expect(Math.floor(Math.abs(Row3.left - Row3_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Row3_02.left - Row3_01.right - vp2px(10.9))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Row3_03.left - Row3_02.right - vp2px(10.9))) <= 1).assertTrue();

      console.info('[RowSpaceResourceTest_0300] END');
      done();
    });
  })
}