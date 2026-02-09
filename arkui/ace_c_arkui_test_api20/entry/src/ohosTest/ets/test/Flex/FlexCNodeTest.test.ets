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

export default function FlexCNodeTest() {
  describe('FlexCNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FlexCNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/FlexCNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FlexCNode state pages:" + JSON.stringify(pages));
        if (!("FlexCNodePage" == pages.name)) {
          console.info("get FlexCNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push FlexCNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexCNode page error:" + err);
      }
      console.info("FlexCNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("FlexCNode after each called");
    });

    /**
     * @tc.name   FlexCNodeTest_0100
     * @tc.number FlexCNodeTest_0100
     * @tc.desc   Test FlexCNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexCNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[FlexCNodeTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      console.info("[FlexCNodeTest_0100] Initial Flex attributes.");

      let strJson = getInspectorByKey('FlexCNodePage_capiNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[FlexCNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[FlexCNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[FlexCNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('100.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');

      let button = await driver.findComponent(ON.id('FlexCNodePage_Btn'));
      await button.click();
      console.info("[FlexCNodeTest_0100] TS modify Flex attributes.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('FlexCNodePage_capiNode');
      obj = JSON.parse(strJson);
      console.info("[FlexCNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[FlexCNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[FlexCNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('150.00vp');
      expect(obj.$attrs.height).assertEqual('150.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFF00');

      console.info('[FlexCNodeTest_0100] END');

      done();
    });
  })
}