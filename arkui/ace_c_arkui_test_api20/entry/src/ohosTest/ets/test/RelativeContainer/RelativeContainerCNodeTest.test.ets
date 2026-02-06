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

export default function RelativeContainerCNodeTest() {
  describe('RelativeContainerCNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeContainerCNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RelativeContainer/RelativeContainerCNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeContainerCNode state pages:" + JSON.stringify(pages));
        if (!("RelativeContainerCNodePage" == pages.name)) {
          console.info("get RelativeContainerCNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push RelativeContainerCNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeContainerCNode page error:" + err);
      }
      console.info("RelativeContainerCNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("RelativeContainerCNode after each called");
    });

    /**
     * @tc.number    RelativeContainerCNodeTest_0100
     * @tc.name      RelativeContainerCNodeTest_0100
     * @tc.desc      Test RelativeContainerCNode
     * @tc.level     Level 1
     */
    it('RelativeContainerCNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[RelativeContainerCNodeTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      console.info("[RelativeContainerCNodeTest_0100] Initial RelativeContainer attributes.");

      let strJson = getInspectorByKey('RelativeContainerCNodePage_capiNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RelativeContainerCNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[RelativeContainerCNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[RelativeContainerCNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('100.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');

      let button = await driver.findComponent(ON.id('RelativeContainerCNodePage_Btn'));
      await button.click();
      console.info("[RelativeContainerCNodeTest_0100] TS modify RelativeContainer attributes.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('RelativeContainerCNodePage_capiNode');
      obj = JSON.parse(strJson);
      console.info("[RelativeContainerCNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[RelativeContainerCNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[RelativeContainerCNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('150.00vp');
      expect(obj.$attrs.height).assertEqual('150.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFF00');

      console.info('[RelativeContainerCNodeTest_0100] END');

      done();
    });
  })
}