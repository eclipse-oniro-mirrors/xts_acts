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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
export default function Role_APITest() {
  describe('Role_APITest', () => {
    beforeEach(async (done: Function) => {
      console.info("Role_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Button/Button_API/Role",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Role_APITest state pages: " + JSON.stringify(pages));
        if (!("ListMainChildren" == pages.name)) {
          console.info("get Role_APITest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Role_APITest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Role_APITest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Role
     * @tc.name      Role_APITest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Role_APITest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('Role_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let Role = getInspectorByKey('Role');
      console.info("[Role_APITest_0100] Tabs animationMode attrs is: " + JSON.stringify(JSON.parse(Role).$attrs));
      expect(JSON.parse(Role).$attrs.role).assertEqual('ButtonRole.ERROR');
      console.info('[Role_APITest_0100] END');
      done();
    });
  })
}