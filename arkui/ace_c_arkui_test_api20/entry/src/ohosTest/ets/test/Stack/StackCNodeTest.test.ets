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

export default function StackCNodeTest() {
  describe('StackCNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StackCNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackCNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackCNode state pages:" + JSON.stringify(pages));
        if (!("StackCNodePage" == pages.name)) {
          console.info("get StackCNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push StackCNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackCNode page error:" + err);
      }
      console.info("StackCNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("StackCNode after each called");
    });

    /**
     * @tc.name   StackCNodeTest_0100
     * @tc.number StackCNodeTest_0100
     * @tc.desc   Test StackCNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('StackCNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[StackCNodeTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      console.info("[StackCNodeTest_0100] Initial Stack attributes.");

      let strJson = getInspectorByKey('StackCNodePage_capiNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StackCNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[StackCNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[StackCNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('100.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');

      let button = await driver.findComponent(ON.id('StackCNodePage_Btn'));
      await button.click();
      console.info("[StackCNodeTest_0100] TS modify Stack attributes.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('StackCNodePage_capiNode');
      obj = JSON.parse(strJson);
      console.info("[StackCNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[StackCNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[StackCNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('150.00vp');
      expect(obj.$attrs.height).assertEqual('150.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFF00');

      console.info('[StackCNodeTest_0100] END');

      done();
    });
  })
}