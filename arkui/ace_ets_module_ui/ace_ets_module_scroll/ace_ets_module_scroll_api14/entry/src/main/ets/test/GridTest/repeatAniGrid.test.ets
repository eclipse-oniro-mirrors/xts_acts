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

export default function repeatAniGrid() {
  describe('repeatAniGrid', () => {
    beforeEach(async (done: Function) => {
      console.info("repeatAniGrid beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/repeatAniGrid",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get repeatAniGrid state pages:" + JSON.stringify(pages));
        if (!("repeatAniGrid" == pages.name)) {
          console.info("get repeatAniGrid pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push repeatAniGrid page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push repeatAniGrid page error:" + err);
      }
      console.info("repeatAniGrid beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("repeatAniGrid after each called");
    });

    /**
     * @tc.number    repeatAniGrid_001
     * @tc.name      repeatAniGrid_0100
     * @tc.desc      Grid component is loaded using Repeat and set the animation parameter of ScrollPage to true.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('repeatAniGrid_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[repeatAniGrid_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('grid_repeat_animation_true'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('grid_repeat_true_onText');
      console.info("[repeatAniGrid_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[repeatAniGrid_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Grid: onReachStart-onScrollStart-onReachEnd-onDidScroll-onScrollStop');
      console.info('[repeatAniGrid_0100] END');
      done();
    });
  })
}
