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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function arcSwiperShow() {
  describe('arcSwiperShow', () => {
    beforeEach(async (done: Function) => {
      console.info("arcSwiperShow beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ArcSwiper/arcSwiperShow",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get arcSwiperShow state pages:" + JSON.stringify(pages));
        if (!("arcSwiperShow" == pages.name)) {
          console.info("get arcSwiperShow pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push arcSwiperShow page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push arcSwiperShow page error:" + err);
      }
      console.info("arcSwiperShow beforeEach end");
      done();
    });

    /**
     * @tc.name   arcSwiperShow_0100
     * @tc.number arcSwiperShow_001
     * @tc.desc   ArcSwiper component page flipping.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperShow_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[arcSwiperShow_0100] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('arcSwiper_showNext'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      await driver.assertComponentExist(ON.text('2'));
      let strJson1 = getInspectorByKey('arcSwiper_show_onChange');
      console.info("[arcSwiperShow_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[arcSwiperShow_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onChange: 2');

      let strJson2 = getInspectorByKey('arcSwiper_show_finishAnimation');
      console.info("[arcSwiperShow_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('finishText: 1');

      let strJson3 = getInspectorByKey('arcSwiper_show_onAnimationStart');
      console.info("[arcSwiperShow_0100] content3: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('onAnimationStart: 1');

      let strJson4 = getInspectorByKey('arcSwiper_show_onAnimationEnd');
      console.info("[arcSwiperShow_0100] content4: " + JSON.stringify(JSON.parse(strJson4).$attrs.content));
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('onAnimationEnd: 2');
      await CommonFunc.sleep(1000);

      let btn2: Component = await driver.findComponent(ON.id('arcSwiper_showPrevious'));
      await btn2.click();
      await CommonFunc.sleep(1500);
      await driver.assertComponentExist(ON.text('1'));
      console.info('[arcSwiperShow_0100] END');
      done();
    });
  })
}
