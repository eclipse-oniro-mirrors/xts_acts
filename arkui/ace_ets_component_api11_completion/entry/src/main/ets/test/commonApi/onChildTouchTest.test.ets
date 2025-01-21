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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function onChildTouchTest() {
  describe('onChildTouchTest', function () {
    beforeEach(async function (done) {
      console.info("onChildTouchTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/commonApi/onChildTouch',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onChildTouchTest state pages: " + JSON.stringify(pages));
        if (!("onChildTouch" == pages.name)) {
          console.info("get onChildTouchTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onChildTouchTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onChildTouchTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    onChildTouch
     * @tc.name      onChildTouchTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onChildTouchTest_0100', 0, async function (done) {
      console.info('onChildTouchTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('onChild_list'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onChild_Button');
      let obj = JSON.parse(strJson);
      console.info("[onChildTouchTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[onChildTouchTest_0100] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[onChildTouchTest_0100] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('onChildTouch');
      console.info('[onChildTouchTest_0100] END');
      done();
    });
  })
}

