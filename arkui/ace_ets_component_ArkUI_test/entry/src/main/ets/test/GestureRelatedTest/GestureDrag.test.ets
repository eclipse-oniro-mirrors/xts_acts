/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function GestureDrag() {
  describe('GestureDrag', function () {
    beforeEach(async function (done) {
      console.info("GestureDrag beforeEach start");
      let options = {
        uri: 'MainAbility/pages/GestureRelated/GestureDrag',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GestureDrag state pages: " + JSON.stringify(pages));
        if (!("GestureDrag" == pages.name)) {
          console.info("get GestureDrag state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GestureDrag success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GestureDrag page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    GestureDrag_0100
     * @tc.name      GestureDrag_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('GestureDrag_0100', 0, async function (done) {
      console.info('GestureDrag_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('GestureDrag'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('GestureDrag');
      let obj = JSON.parse(strJson);
      console.info("[GestureDrag_0100] component obj is: " + JSON.stringify(obj));
      console.info("[GestureDrag_0100] title: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('Gesture is DRAG');
      console.info('[GestureDrag_0100] END');
      done();
    });


  })
}

