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

export default function childrenSizeArcList() {
  describe('childrenSizeArcList', () => {
    beforeEach(async (done: Function) => {
      console.info("childrenSizeArcList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ArcList/childrenSizeArcList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("childrenSizeArcList" == pages.name)) {
          console.info("get childrenSizeArcList pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push childrenSizeArcList page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push childrenSizeArcList page error:" + err);
      }
      console.info("childrenSizeArcList beforeEach end");
      done();
    });

    /**
     * @tc.name   childrenSizeArcList_0100
     * @tc.number childrenSizeArcList_001
     * @tc.desc   The childenMainSize property of the ArcList component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('childrenSizeArcList_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[childrenSizeArcList_0100] START');
      let driver = await Driver.create()
      let listItem0_0 = CommonFunc.getComponentRectOnScreen('arcList_size_0');
      let listItem0_1 = CommonFunc.getComponentRectOnScreen('arcList_size_1');
      await CommonFunc.sleep(500);
      let size_0 = listItem0_1.top - listItem0_0.bottom
      console.info("[childrenSizeArcList_0100] size_0 is: " + size_0);

      let btn1: Component = await driver.findComponent(ON.id('arcList_splice'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let listItem1_0 = CommonFunc.getComponentRectOnScreen('arcList_size_0');
      let listItem1_1 = CommonFunc.getComponentRectOnScreen('arcList_size_1');
      await CommonFunc.sleep(500);
      let size_1 = listItem1_1.top - listItem1_0.bottom
      console.info("[childrenSizeArcList_0100] size_1 is: " + size_1);
      await CommonFunc.sleep(500);
      expect(Math.floor(size_1 - size_0) < 0).assertEqual(true);

      let btn2: Component = await driver.findComponent(ON.id('arcList_update'));
      await btn2.click();
      await CommonFunc.sleep(1500);
      let listItem2_0 = CommonFunc.getComponentRectOnScreen('arcList_size_0');
      let listItem2_1 = CommonFunc.getComponentRectOnScreen('arcList_size_1');
      await CommonFunc.sleep(500);
      let size_2 = listItem2_1.top - listItem2_0.bottom
      console.info("[childrenSizeArcList_0100] size_2 is: " + size_2);
      await CommonFunc.sleep(500);
      expect(Math.floor(size_2 - size_0) > 0).assertEqual(true);
      console.info('[childrenSizeArcList_0100] END');
      done();
    });
  })
}
