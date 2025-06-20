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

export default function scrollAniTrue() {
  describe('scrollAniTrue', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollAniTrue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/scrollAniTrue",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollAniTrue state pages:" + JSON.stringify(pages));
        if (!("scrollAniTrue" == pages.name)) {
          console.info("get scrollAniTrue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollAniTrue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollAniTrue page error:" + err);
      }
      console.info("scrollAniTrue beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("scrollAniTrue after each called");
    });

    /**
     * @tc.number    scrollAniTrue_001
     * @tc.name      scrollAniTrue_0100
     * @tc.desc      Set the animation parameter of ScrollPage to true.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('scrollAniTrue_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[scrollAniTrue_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('scroll_animation_true'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('scroll_true_onText');
      console.info("[scrollAniTrue_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[scrollAniTrue_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Scroll: onReachStart-onScrollStart-onReachEnd-onDidScroll-onScrollStop');
      console.info('[scrollAniTrue_0100] END');
      done();
    });
  })
}
