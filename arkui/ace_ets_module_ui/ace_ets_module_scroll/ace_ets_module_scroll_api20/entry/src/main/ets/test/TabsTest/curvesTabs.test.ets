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

export default function curvesTabs() {
  describe('curvesTabs', () => {
    beforeEach(async (done: Function) => {
      console.info("curvesTabs beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/curvesTabs",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get curvesTabs state pages:" + JSON.stringify(pages));
        if (!("curvesTabs" == pages.name)) {
          console.info("get curvesTabs pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push curvesTabs page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push curvesTabs page error:" + err);
      }
      console.info("curvesTabs beforeEach end");
      done();
    });

    /**
     * @tc.number    curvesTabs_001
     * @tc.name      curvesTabs_0100
     * @tc.desc      ListItem component drag and drop event callback.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('curvesTabs_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[curvesTabs_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tabs_bar_curve');
      console.info("[curvesTabs_0100] barHeight: " + JSON.stringify(JSON.parse(strJson).$attrs.barHeight));
      console.info("[curvesTabs_0100] animationCurve: " + JSON.stringify(JSON.parse(strJson).$attrs.animationCurve));
      expect(JSON.parse(strJson).$attrs.animationCurve).assertEqual("cubic-bezier(0.250000,0.100000,0.250000,1.000000)");

      let driver = Driver.create();
      let tabsComponent = await driver.findComponent(ON.text('Yellow'));
      await tabsComponent.click();
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('tabs_text1_curve');
      console.info("[curvesTabs_0100] content: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('index: 1');
      console.info('[curvesTabs_0100] END');
      done();
    });
  })
}
