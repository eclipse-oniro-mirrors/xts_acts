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
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function translationTest() {
  describe('translationTest', () => {
    beforeEach(async (done: Function) => {
      console.info("translationTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/translation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get translationTest state pages: " + JSON.stringify(pages));
        if (!("translation" == pages.name)) {
          console.info("get translationTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push translationTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push translationTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
     /**
     * @tc.number    SUB_ACE_translationTest_0100
     * @tc.name      translationTest_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('translationTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('translationTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('translation');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[translationTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[translationTest_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('X translation 30 Y translation 30');
      console.info('[translationTest_0100] END');
      done();
    });
  })
}

