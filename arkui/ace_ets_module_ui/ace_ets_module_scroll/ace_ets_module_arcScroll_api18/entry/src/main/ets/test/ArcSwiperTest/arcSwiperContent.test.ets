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

export default function arcSwiperContent() {
  describe('arcSwiperContent', () => {
    beforeEach(async (done: Function) => {
      console.info("arcSwiperContent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ArcSwiper/arcSwiperContent",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get arcSwiperContent state pages:" + JSON.stringify(pages));
        if (!("arcSwiperContent" == pages.name)) {
          console.info("get arcSwiperContent pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push arcSwiperContent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push arcSwiperContent page error:" + err);
      }
      console.info("arcSwiperContent beforeEach end");
      done();
    });

    /**
     * @tc.name   arcSwiperContent_0100
     * @tc.number arcSwiperContent_001
     * @tc.desc   ArcSwiper custom switching animation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperContent_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[arcSwiperContent_0100] START');
      let swipeTabs = CommonFunc.getComponentRectOnScreen('arcs_customContent');
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      console.info("arcSwiperContent value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await driver.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('1'));
      let strJson = getInspectorByKey('onAnimationStart_arcs_content');
      console.info("[arcSwiperContent_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[arcSwiperContent_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onAnimationStartIndex: 0');
      let strJson1 = getInspectorByKey('index1_arcs_content');
      console.info("[arcSwiperContent_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[arcSwiperContent_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('index: 1');
      console.info('[arcSwiperContent_0100] END');
      done();
    });
  })
}
