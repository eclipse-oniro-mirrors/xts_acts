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

export default function uiTabUpdate() {
  describe('uiTabUpdate', () => {
    beforeEach(async (done: Function) => {
      console.info("uiTabUpdate beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/uiTabUpdate",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("uiTabUpdate" == pages.name)) {
          console.info("get uiTabUpdate pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push uiTabUpdate page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push uiTabUpdate page error:" + err);
      }
      console.info("uiTabUpdate beforeEach end");
      done();
    });

    /**
     * @tc.name   uiTabUpdate_0100
     * @tc.number uiTabUpdate_001
     * @tc.desc   Monitor the switching events of TabContent pages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('uiTabUpdate_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[uiTabUpdate_0100] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('change_index_ui'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('text_index_ui');
      console.info("[uiTabUpdate_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[uiTabUpdate_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('index: 1');
      console.info('[uiTabUpdate_0100] END');
      done();
    });
  })
}
