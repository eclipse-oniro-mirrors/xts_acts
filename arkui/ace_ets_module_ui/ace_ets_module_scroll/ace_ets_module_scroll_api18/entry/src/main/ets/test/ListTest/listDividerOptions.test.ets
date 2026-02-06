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

export default function listDividerOptions() {
  describe('listDividerOptions', () => {
    beforeEach(async (done: Function) => {
      console.info("listDividerOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listDividerOptions",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listDividerOptions state pages:" + JSON.stringify(pages));
        if (!("listDividerOptions" == pages.name)) {
          console.info("get listDividerOptions pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listDividerOptions page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listDividerOptions page error:" + err);
      }
      console.info("listDividerOptions beforeEach end");
      done();
    });

    /**
     * @tc.number    listDividerOptions_001
     * @tc.name      listDividerOptions_0100
     * @tc.desc      Set ListItem Breakline Style.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('listDividerOptions_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[listDividerOptions_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btnEvent: Component = await driver.findComponent(ON.id('set_DividerOptions'));
      await btnEvent.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('list_DividerOptions');
      console.info("[listDividerOptions_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[listDividerOptions_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[listDividerOptions_0100] divider: " + JSON.stringify(JSON.parse(strJson).$attrs.divider));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual("List");
      expect(JSON.parse(strJson).$attrs.divider.strokeWidth).assertEqual("2.00vp");
      expect(JSON.parse(strJson).$attrs.divider.startMargin).assertEqual("10.00vp");
      expect(JSON.parse(strJson).$attrs.divider.endMargin).assertEqual("10.00vp");
      expect(JSON.parse(strJson).$attrs.divider.color).assertEqual("#FF0000FF");
      console.info('[listDividerOptions_0100] END');
      done();
    });
  })
}
