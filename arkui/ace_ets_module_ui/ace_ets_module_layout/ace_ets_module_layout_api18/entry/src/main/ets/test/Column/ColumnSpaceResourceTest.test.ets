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

export default function ColumnSpaceResourceTest() {
  describe('ColumnSpaceResourceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ColumnSpaceResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnSpaceResourcePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnSpaceResourceTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get ColumnSpaceResourceTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ColumnSpaceResourceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSpaceResourceTest page error:" + err);
      }
      console.info("ColumnSpaceResourceTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number    ColumnSpaceResourceTest_0100
     * @tc.name      ColumnSpaceResourceTest_0100
     * @tc.desc      test type of space is Resource (string)
     * @tc.level:    Level 1
     * @tc.type :    ColumnSpaceResource
     * @tc.size :
     */
    it('ColumnSpaceResourceTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ColumnSpaceResourceTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ColumnSpaceResource_Column1');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.space).assertEqual("10.00vp");

      let Column1 = CommonFunc.getComponentRect('ColumnSpaceResource_Column1');
      let Column1_01 = CommonFunc.getComponentRect('ColumnSpaceResource_Column1_01');
      let Column1_02 = CommonFunc.getComponentRect('ColumnSpaceResource_Column1_02');
      let Column1_03 = CommonFunc.getComponentRect('ColumnSpaceResource_Column1_03');
      
      console.info('[ColumnSpaceResourceTest_0100] Column1.top - Column1_01.top');
      console.info('[ColumnSpaceResourceTest_0100] Column1_02.top - Column1_01.bottom - vp2px(10)');
      console.info('[ColumnSpaceResourceTest_0100] Column1_03.top - Column1_02.bottom - vp2px(10)');
      expect(Math.floor(Math.abs(Column1.top - Column1_01.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_02.top - Column1_01.bottom - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_03.top - Column1_02.bottom - vp2px(10))) <= 1).assertTrue();

      console.info('[ColumnSpaceResourceTest_0100] END');
      done();
    });

    /**
     * @tc.number    ColumnSpaceResourceTest_0200
     * @tc.name      ColumnSpaceResourceTest_0200
     * @tc.desc      test type of space is Resource (integer)
     * @tc.level:    Level 1
     * @tc.type :    ColumnSpaceResource
     * @tc.size :
     */
    it('ColumnSpaceResourceTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ColumnSpaceResourceTest_0200] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ColumnSpaceResource_Column2');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.space).assertEqual("10.00vp");

      let Column2 = CommonFunc.getComponentRect('ColumnSpaceResource_Column2');
      let Column2_01 = CommonFunc.getComponentRect('ColumnSpaceResource_Column2_01');
      let Column2_02 = CommonFunc.getComponentRect('ColumnSpaceResource_Column2_02');
      let Column2_03 = CommonFunc.getComponentRect('ColumnSpaceResource_Column2_03');
      
      console.info('[ColumnSpaceResourceTest_0200] Column2.top - Column2_01.top');
      console.info('[ColumnSpaceResourceTest_0200] Column2_02.top - Column2_01.bottom - vp2px(10)');
      console.info('[ColumnSpaceResourceTest_0200] Column2_03.top - Column2_02.bottom - vp2px(10)');
      expect(Math.floor(Math.abs(Column2.top - Column2_01.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column2_02.top - Column2_01.bottom - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column2_03.top - Column2_02.bottom - vp2px(10))) <= 1).assertTrue();

      console.info('[ColumnSpaceResourceTest_0200] END');
      done();
    });

    /**
     * @tc.number    ColumnSpaceResourceTest_0300
     * @tc.name      ColumnSpaceResourceTest_0300
     * @tc.desc      test type of space is Resource (float)
     * @tc.level:    Level 1
     * @tc.type :    ColumnSpaceResource
     * @tc.size :
     */
    it('ColumnSpaceResourceTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ColumnSpaceResourceTest_0300] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ColumnSpaceResource_Column3');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.space).assertEqual("10.90vp");

      let Column3 = CommonFunc.getComponentRect('ColumnSpaceResource_Column3');
      let Column3_01 = CommonFunc.getComponentRect('ColumnSpaceResource_Column3_01');
      let Column3_02 = CommonFunc.getComponentRect('ColumnSpaceResource_Column3_02');
      let Column3_03 = CommonFunc.getComponentRect('ColumnSpaceResource_Column3_03');
      
      console.info('[ColumnSpaceResourceTest_0300] Column3.top - Column3_01.top');
      console.info('[ColumnSpaceResourceTest_0300] Column3_02.top - Column3_01.bottom - vp2px(10.9)');
      console.info('[ColumnSpaceResourceTest_0300] Column3_03.top - Column3_02.bottom - vp2px(10.9)');
      expect(Math.floor(Math.abs(Column3.top - Column3_01.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column3_02.top - Column3_01.bottom - vp2px(10.9))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column3_03.top - Column3_02.bottom - vp2px(10.9))) <= 1).assertTrue();

      console.info('[ColumnSpaceResourceTest_0300] END');
      done();
    });

  })
}