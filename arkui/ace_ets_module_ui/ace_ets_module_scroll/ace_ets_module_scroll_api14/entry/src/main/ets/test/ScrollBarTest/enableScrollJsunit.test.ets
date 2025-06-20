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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
export default function enableScrollJsunit() {
  describe('enableScrollJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("enableScrollJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ScrollBar/enableScroll",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get enableScrollJsunit state pages:" + JSON.stringify(pages));
        if (!("enableScroll" == pages.name)) {
          console.info("get enableScrollJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push enableScrollJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push enableScrollJsunit page error:" + err);
      }
      console.info("enableScrollJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("enableScrollJsunit after each called");
    });

    /**
     * @tc.number    enableScrollJsunit_001
     * @tc.name      enableScrollJsunit_001
     * @tc.desc      The ScrollBar component supports nested scrolling.
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('enableScrollJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[enableScrollJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sBar_enable');
      console.info("[enableScrollJsunit_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[enableScrollJsunit_0100] enableNestedScroll: " + JSON.stringify(JSON.parse(strJson).$attrs.enableNestedScroll));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual('ScrollBar');
      expect(JSON.parse(strJson).$attrs.enableNestedScroll).assertEqual('true');
      console.info('[enableScrollJsunit_0100] END');
      done();
    });
  })
}
