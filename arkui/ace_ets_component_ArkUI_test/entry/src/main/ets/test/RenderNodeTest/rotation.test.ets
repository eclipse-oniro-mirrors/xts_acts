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
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function rotationTest() {
  describe('rotationTest', function () {
    beforeEach(async function (done) {
      console.info("rotationTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/RenderNode/rotation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get rotationTest state pages: " + JSON.stringify(pages));
        if (!("rotation" == pages.name)) {
          console.info("get rotationTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push rotationTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push rotationTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
     /**
     * @tc.number    SUB_ACE_rotationTest_0100
     * @tc.name      rotationTest_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('rotationTest_0100', 0, async function (done) {
      console.info('rotationTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('rotation');
      let obj = JSON.parse(strJson);
      console.info("[rotationTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[rotationTest_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('X rotation 10 Y rotation 45 Z rotation 0');
      console.info('[rotationTest_0100] END');
      done();
    });
    

  })
}

