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

export default function ListTypeNodeTest() {
  describe('ListTypeNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ListTypeNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/list/ListTypeNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListTypeNode state pages:" + JSON.stringify(pages));
        if (!("ListTypeNodePage" == pages.name)) {
          console.info("get ListTypeNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ListTypeNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListTypeNode page error:" + err);
      }
      console.info("ListTypeNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ListTypeNode after each called");
    });

    /*
     * @tc.number    ListTypeNodeTest_0100
     * @tc.name      ListTypeNodeTest_0100
     * @tc.desc      Test ListTypeNode
     * @tc.level     Level 1
     */
    it('ListTypeNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ListTypeNodeTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      console.info("[ListTypeNodeTest_0100] Initial List attributes.");

      let strJson = getInspectorByKey('ListCrossLanguage_typeNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ListTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[ListTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[ListTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('200.00vp');
      expect(obj.$attrs.height).assertEqual('150.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');

      let button = await driver.findComponent(ON.id('ListTypeNodePage_Btn'));
      await button.click();
      console.info("[ListTypeNodeTest_0100] C modify List attributes.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('ListCrossLanguage_typeNode');
      obj = JSON.parse(strJson);
      console.info("[ListTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[ListTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[ListTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('200.00vp');
      expect(obj.$attrs.height).assertEqual('130.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFF00');

      let strJson2 = getInspectorByKey('listItemGroupNode1');
      console.info("[ListTypeNodeTest_0100] obj2.$attrs.width is: " + JSON.parse(strJson2).$attrs.width);
      console.info("[ListTypeNodeTest_0100] obj2.$attrs.height is: " + JSON.parse(strJson2).$attrs.height);
      console.info("[ListTypeNodeTest_0100] obj2.$attrs.backgroundColor is: " + JSON.parse(strJson2).$attrs.backgroundColor);
      expect(JSON.parse(strJson2).$attrs.width).assertEqual('150.00vp');
      expect(JSON.parse(strJson2).$attrs.height).assertEqual('120.00vp');
      expect(JSON.parse(strJson2).$attrs.backgroundColor).assertEqual('#FFFFA500');

      let strJson3 = getInspectorByKey('listItemNode1');
      console.info("[ListTypeNodeTest_0100] obj3.$attrs.width is: " + JSON.parse(strJson3).$attrs.width);
      console.info("[ListTypeNodeTest_0100] obj3.$attrs.height is: " + JSON.parse(strJson3).$attrs.height);
      console.info("[ListTypeNodeTest_0100] obj3.$attrs.backgroundColor is: " + JSON.parse(strJson3).$attrs.backgroundColor);
      expect(JSON.parse(strJson3).$attrs.width).assertEqual('150.00vp');
      expect(JSON.parse(strJson3).$attrs.height).assertEqual('100.00vp');
      expect(JSON.parse(strJson3).$attrs.backgroundColor).assertEqual('#FFFF0000');

      console.info('[ListTypeNodeTest_0100] END');
      done();
    });
    /**
     * @tc.number    ListTypeNodeTest_0200
     * @tc.name      ListTypeNodeTest_0200
     * @tc.desc      Test ListTypeNodePage undefined.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('ListTypeNodeTest_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[ListTypeNodeTest_0200] START');
      await Utils.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ListTypeNodePage_undefined'));
      await btn.click();
      console.info("[ListTypeNodeTest_0200] Click ListTypeNodePage_undefined.");
      await Utils.sleep(1500);
      console.info("[ListTypeNodeTest_0200] AppStorage.get('ListTypeNodeUn'): " + AppStorage.get('ListTypeNodeUn'));
      expect(AppStorage.get('ListTypeNodeUn')).assertEqual(undefined);

      console.info("[ListTypeNodeTest_0200] ListItemGroupTypeNodeUn: " + AppStorage.get('ListItemGroupTypeNodeUn'));
      expect(AppStorage.get('ListItemGroupTypeNodeUn')).assertEqual(undefined);

      console.info("[ListTypeNodeTest_0200] AppStorage.get('ListItemTypeNodeUn'): " + AppStorage.get('ListItemTypeNodeUn'));
      expect(AppStorage.get('ListItemTypeNodeUn')).assertEqual(undefined);

      AppStorage.delete('ListTypeNodeUn')
      AppStorage.delete('ListItemGroupTypeNodeUn')
      AppStorage.delete('ListItemTypeNodeUn')

      console.info('[ListTypeNodeTest_0200] END');
      done();
    });
  })
}