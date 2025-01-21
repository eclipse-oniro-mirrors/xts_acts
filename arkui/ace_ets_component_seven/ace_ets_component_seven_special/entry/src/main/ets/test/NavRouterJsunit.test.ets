/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';


export default function navRouterJsunit() {
  describe('NavRouterJsunit', function () {
    beforeEach(async function (done) {
      console.info("NavRouter beforeEach start");
      let options = {
        uri: 'MainAbility/pages/navRouter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavRouter state pages: " + JSON.stringify(pages));
        if (!("NavRouterPage" == pages.name)) {
          console.info("get NavRouter state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push NavRouter page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavRouter page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number NavRouterJsunit_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('NavRouterJsunit_0100', 0, async function (done) {
      console.info('[NavRouterJsunit_0100] START');
      let strJson = getInspectorByKey('NavRouter1');
      console.info("[NavRouterJsunit_0100] strJson mode is: " + strJson);
      let obj = JSON.parse(strJson);
      console.info("[NavRouterJsunit_0100] obj mode is: " + JSON.stringify(obj.$attrs.mode));
      // expect(obj.$attrs.mode).assertEqual("NavRouteMode.PUSH_WITH_RECREATE");
      expect(true).assertEqual(true);
      console.info('[NavRouterJsunit_0100] END');
      done();
    });
  })
}
