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

export default function gridAniTrue() {
  describe('gridAniTrue', () => {
    beforeEach(async (done: Function) => {
      console.info("gridAniTrue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/gridAniTrue",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridAniTrue state pages:" + JSON.stringify(pages));
        if (!("gridAniTrue" == pages.name)) {
          console.info("get gridAniTrue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gridAniTrue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridAniTrue page error:" + err);
      }
      console.info("gridAniTrue beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("gridAniTrue after each called");
    });

    /**
     * @tc.name   gridAniTrue_0100
     * @tc.number gridAniTrue_001
     * @tc.desc   Set the animation parameter of ScrollPage to true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridAniTrue_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[gridAniTrue_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('grid_next_animation_true'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('grid_true_onText');
      console.info("[gridAniTrue_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[gridAniTrue_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Grid: onReachStart-onScrollStart-onReachEnd-onDidScroll-onScrollStop');
      console.info('[gridAniTrue_0100] END');
      done();
    });
  })
}
