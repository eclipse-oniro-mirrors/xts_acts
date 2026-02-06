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

export default function RelativeContainerTypeNodeTest() {
  describe('RelativeContainerTypeNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeContainerTypeNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RelativeContainer/RelativeContainerTypeNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeContainerTypeNode state pages:" + JSON.stringify(pages));
        if (!("RelativeContainerTypeNodePage" == pages.name)) {
          console.info("get RelativeContainerTypeNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push RelativeContainerTypeNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeContainerTypeNode page error:" + err);
      }
      console.info("RelativeContainerTypeNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("RelativeContainerTypeNode after each called");
    });

    /**
     * @tc.number    RelativeContainerTypeNodeTest_0100
     * @tc.name      RelativeContainerTypeNodeTest_0100
     * @tc.desc      Test RelativeContainerTypeNode
     * @tc.level     Level 1
     */
    it('RelativeContainerTypeNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[RelativeContainerTypeNodeTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      console.info("[RelativeContainerTypeNodeTest_0100] Initial RelativeContainer attributes.");

      let strJson = getInspectorByKey('RelativeContainerTypeNodePage_typeNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RelativeContainerTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[RelativeContainerTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[RelativeContainerTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('100.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');

      let button = await driver.findComponent(ON.id('RelativeContainerTypeNodePage_Btn'));
      await button.click();
      console.info("[RelativeContainerTypeNodeTest_0100] C modify RelativeContainer attributes.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('RelativeContainerTypeNodePage_typeNode');
      obj = JSON.parse(strJson);
      console.info("[RelativeContainerTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[RelativeContainerTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[RelativeContainerTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('150.00vp');
      expect(obj.$attrs.height).assertEqual('150.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFF00');

      console.info('[RelativeContainerTypeNodeTest_0100] END');

      done();
    });
    /**
     * @tc.number    RelativeContainerTypeNodeTest_0200
     * @tc.name      RelativeContainerTypeNodeTest_0200
     * @tc.desc      Test RelativeContainerTypeNodePage undefined.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('RelativeContainerTypeNodeTest_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeContainerTypeNodeTest_0200] START');
      let driver = Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('RelativeContainerTypeNodePage_undefined'));
      await btn.click();
      console.info("[RelativeContainerTypeNodeTest_0200] Click RelativeContainerTypeNodePage_undefined.");
      await Utils.sleep(1000);

      console.info("[RelativeContainerTypeNodeTest_0200] AppStorage.get('RelativeContainerTypeNodePage'): " + AppStorage.get('RelativeContainerTypeNodePage'));
      expect(AppStorage.get('RelativeContainerTypeNodePage')).assertEqual(undefined);
      AppStorage.delete('RelativeContainerTypeNodePage')

      console.info('[RelativeContainerTypeNodeTest_0200] END');
      done();
    });
  })
}