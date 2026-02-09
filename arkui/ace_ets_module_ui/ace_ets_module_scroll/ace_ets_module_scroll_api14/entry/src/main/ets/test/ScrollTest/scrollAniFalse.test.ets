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

export default function scrollAniFalse() {
  describe('scrollAniFalse', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollAniFalse beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/scrollAniFalse",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollAniFalse state pages:" + JSON.stringify(pages));
        if (!("scrollAniFalse" == pages.name)) {
          console.info("get scrollAniFalse pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollAniFalse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollAniFalse page error:" + err);
      }
      console.info("scrollAniFalse beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("scrollAniFalse after each called");
    });

    /**
     * @tc.name   scrollAniFalse_0100
     * @tc.number scrollAniFalse_001
     * @tc.desc   Set the animation parameter of ScrollPage to false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollAniFalse_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[scrollAniFalse_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('scroll_animation_false'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('scroll_false_onText');
      console.info("[scrollAniFalse_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[scrollAniFalse_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Scroll: onWillScroll-onDidScroll-');
      console.info('[scrollAniFalse_0100] END');
      done();
    });
  })
}
