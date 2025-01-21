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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
export default function Component3D1Test() {
  describe('Component3D1Test', function () {
    beforeEach(async function (done) {
      console.info("Component3D1Test beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Component3D1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Component3D1Test state pages: " + JSON.stringify(pages));
        if (!("Component3D1" == pages.name)) {
          console.info("get Component3D1Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(5000);
          console.info("push Component3D1Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Component3D1Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Component3D1
     * @tc.name      Component3D1Test_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Component3D1Test_0100', 0, async function (done) {
      console.info('Component3D1Test_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Component3D1_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.modelType).assertEqual('ModelType.TEXTURE');
      console.info('[Component3D1Test_0100] END');
      done();
    });
  })
}

