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
import CommonFunc from '../../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function tabs_onContentDidScrollTest() {
  describe('tabs_onContentDidScroll', () => {
    beforeEach(async (done: Function) => {
      console.info("tabs_onContentDidScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_onContentDidScroll/tabs_onContentDidScroll",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabs_onContentDidScroll state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentDidScroll" == pages.name)) {
          console.info("get tabs_onContentDidScroll pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabs_onContentDidScroll page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabs_onContentDidScroll page error:" + err);
      }
      console.info("tabs_onContentDidScroll beforeEach end");
      done();
    });

    /**
     * @tc.name   tabs_onContentDidScroll_0010
     * @tc.number tabs_onContentDidScroll_0010
     * @tc.desc   The Tabs page scrolling triggers the onContentDidScroll callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('tabs_onContentDidScroll_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[tabs_onContentDidScroll_0100] START');
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('onClick01'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('Text01');
      console.info('[tabs_onContentDidScroll_0100] component obj is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[tabs_onContentDidScroll_0100] content:  '+ JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('ContentDidScroll');
      console.info('[tabs_onContentDidScroll_0100] END');
      done();
    });
  })
}
