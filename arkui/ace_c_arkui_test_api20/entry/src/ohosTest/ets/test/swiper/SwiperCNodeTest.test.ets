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

export default function SwiperCNodeTest() {
  describe('SwiperCNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperCNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper/SwiperCNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperCNode state pages:" + JSON.stringify(pages));
        if (!("SwiperCNodePage" == pages.name)) {
          console.info("get SwiperCNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push SwiperCNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperCNode page error:" + err);
      }
      console.info("SwiperCNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("SwiperCNode after each called");
    });

    /**
     * @tc.name   SwiperCNodeTest_0100
     * @tc.number SwiperCNodeTest_0100
     * @tc.desc   Test SwiperCNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperCNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SwiperCNodeTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      console.info("[SwiperCNodeTest_0100] Initial Swiper attributes.");

      let strJson = getInspectorByKey('SwiperCrossLanguage_capiNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SwiperCNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[SwiperCNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[SwiperCNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('200.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFF0000');

      let button = await driver.findComponent(ON.id('SwiperCNodePage_Btn'));
      await button.click();
      console.info("[SwiperCNodeTest_0100] TS modify Swiper attributes.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('SwiperCrossLanguage_capiNode');
      obj = JSON.parse(strJson);
      console.info("[SwiperCNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[SwiperCNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[SwiperCNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('120.00vp');
      expect(obj.$attrs.height).assertEqual('120.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFF00');

      console.info('[SwiperCNodeTest_0100] END');
      done();
    });
  })
}