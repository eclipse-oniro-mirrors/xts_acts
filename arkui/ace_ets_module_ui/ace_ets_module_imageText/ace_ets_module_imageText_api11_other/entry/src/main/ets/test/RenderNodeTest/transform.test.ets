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


export default function transformTest() {
  describe('transformTest', () => {
    beforeEach(async (done: Function) => {
      console.info("transformTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/transform',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get transformTest state pages: " + JSON.stringify(pages));
        if (!("transform" == pages.name)) {
          console.info("get transformTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push transformTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push transformTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
     /**
     * @tc.number    SUB_ACE_transformTest_0100
     * @tc.name      transformTest_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('transformTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('transformTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('transform');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[transformTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[transformTest_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('transform is 1,0,45,0,0,1,0,0,0,0,1,0,0,0,0,1');
      console.info('[transformTest_0100] END');
      done();
    });
  })
}

