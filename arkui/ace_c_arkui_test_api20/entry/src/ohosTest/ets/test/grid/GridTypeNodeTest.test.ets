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

export default function GridTypeNodeTest() {
  describe('GridTypeNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GridTypeNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid/GridTypeNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridTypeNode state pages:" + JSON.stringify(pages));
        if (!("GridTypeNodePage" == pages.name)) {
          console.info("get GridTypeNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push GridTypeNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridTypeNode page error:" + err);
      }
      console.info("GridTypeNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("GridTypeNode after each called");
    });

    /*
     * @tc.number    GridTypeNodeTest_0100
     * @tc.name      GridTypeNodeTest_0100
     * @tc.desc      Test GridTypeNode
     * @tc.level     Level 1
     */
    it('GridTypeNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[GridTypeNodeTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      console.info("[GridTypeNodeTest_0100] Initial Grid attributes.");

      let strJson = getInspectorByKey('GridCrossLanguage_typeNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[GridTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[GridTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('200.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFF0000');

      let button = await driver.findComponent(ON.id('GridTypeNodePage_Btn'));
      await button.click();
      console.info("[GridTypeNodeTest_0100] C modify Grid attributes.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('GridCrossLanguage_typeNode');
      obj = JSON.parse(strJson);
      console.info("[GridTypeNodeTest_0100] obj1.$attrs.width is: " + obj.$attrs.width);
      console.info("[GridTypeNodeTest_0100] obj1.$attrs.height is: " + obj.$attrs.height);
      console.info("[GridTypeNodeTest_0100] obj1.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('200.00vp');
      expect(obj.$attrs.height).assertEqual('120.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFA500');

      let strJson2 = getInspectorByKey('gridItemNode1');
      console.info("[GridTypeNodeTest_0100] obj2.$attrs.width is: " + JSON.parse(strJson2).$attrs.width);
      console.info("[GridTypeNodeTest_0100] obj2.$attrs.height is: " + JSON.parse(strJson2).$attrs.height);
      console.info("[GridTypeNodeTest_0100] obj2.$attrs.backgroundColor is: " + JSON.parse(strJson2).$attrs.backgroundColor);
      expect(JSON.parse(strJson2).$attrs.width).assertEqual('50.00vp');
      expect(JSON.parse(strJson2).$attrs.height).assertEqual('80.00vp');
      expect(JSON.parse(strJson2).$attrs.backgroundColor).assertEqual('#FFFF0000');

      console.info('[GridTypeNodeTest_0100] END');
      done();
    });
    /**
     * @tc.number    GridTypeNodeTest_0200
     * @tc.name      GridTypeNodeTest_0200
     * @tc.desc      Test GridTypeNodePage undefined.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('GridTypeNodeTest_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[GridTypeNodeTest_0200] START');
      await Utils.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('GridTypeNodePage_undefined'));
      await btn.click();
      console.info("[GridTypeNodeTest_0200] Click GridTypeNodePage_undefined.");
      await Utils.sleep(1500);
      console.info("[GridTypeNodeTest_0200] AppStorage.get('GridTypeNodeUn'): " + AppStorage.get('GridTypeNodeUn'));
      expect(AppStorage.get('GridTypeNodeUn')).assertEqual(undefined);

      console.info("[GridTypeNodeTest_0200] AppStorage.get('GridItemTypeNodeUn'): " + AppStorage.get('GridItemTypeNodeUn'));
      expect(AppStorage.get('GridItemTypeNodeUn')).assertEqual(undefined);

      AppStorage.delete('GridTypeNodeUn')
      AppStorage.delete('GridItemTypeNodeUn')

      console.info('[GridTypeNodeTest_0200] END');
      done();
    });
  })
}