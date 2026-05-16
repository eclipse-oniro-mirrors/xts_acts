/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function scrollSourceDrag() {
  describe('scrollSourceDrag', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollSourceDrag beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ScrollSource/scrollSourceDrag",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollSourceDrag state pages:" + JSON.stringify(pages));
        if (!("scrollSourceDrag" == pages.name)) {
          console.info("get scrollSourceDrag pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollSourceDrag page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollSourceDrag page error:" + err);
      }
      console.info("scrollSourceDrag beforeEach end");
      done();
    });

    /**
     * @tc.name   scrollSourceDrag_0100
     * @tc.number scrollSourceDrag_001
     * @tc.desc   ScrollSource.DRAG: Drag event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scrollSourceDrag_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[scrollSourceDrag_0100] START');
      let swiperDrag = CommonFunc.getComponentRectOnScreen('scrollSource_drag');
      let top = swiperDrag.top;
      let right = swiperDrag.right;
      let left = swiperDrag.left;
      let bottom = swiperDrag.bottom;
      console.info("scrollSourceDrag_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await driver.drag(Math.round(left + width/2),Math.round(top + height*0.2),Math.round(left + width/2),Math.round(top + height*0.6));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('scroller_DRAG');
      console.info("[scrollSourceDrag_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[scrollSourceDrag_0100] label: " + JSON.stringify(JSON.parse(strJson).$attrs.label));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('drag');
      console.info('[scrollSourceDrag_0100] END');
      done();
    });
  })
}
