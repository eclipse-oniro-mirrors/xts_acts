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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import events_emitter from '@ohos.events.emitter'

export default function DragActionJsunit() {
  describe('DragActionJsunit', function () {
    beforeEach(async function (done) {
      console.info("DragActionJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/DragAction',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DragActionJsunit state pages: " + JSON.stringify(pages));
        if (!("DragAction" == pages.name)) {
          console.info("get DragActionJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DragActionJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DragActionJsunit page error:" + err);
      }
      done()
    });

    /**
     * @tc.number	 SUB_ACE_TS_COMPONENT_DragAction_01
     * @tc.name 	 DragActionJsunit_0100
     * @tc.desc 	 Confirm if there is a callback
	 * @tc.level     Level 2
     * @tc.type :
     * @tc.size :
     */

    it('DragActionJsunit_0100', 0, async function (done) {
      console.info('[DragActionJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_value');
      let obj = JSON.parse(strJson);
      console.info("[DragActionJsunit_0100] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='DragAction').assertTrue();
      console.info('[DragActionJsunit_0100] END');
      done();
    });
  })
}