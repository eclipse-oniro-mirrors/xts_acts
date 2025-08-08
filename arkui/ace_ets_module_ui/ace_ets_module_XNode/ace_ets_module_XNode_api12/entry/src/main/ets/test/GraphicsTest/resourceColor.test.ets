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
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function resourceColor() {
  describe('resourceColor', () => {
    beforeEach(async (done: Function) => {
      console.info("resourceColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Graphics/resourceColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get resourceColor state pages: " + JSON.stringify(pages));
        if (!("resourceColor" == pages.name)) {
          console.info("get resourceColor state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push resourceColor success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push resourceColor page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
     /**
     * @tc.number    SUB_ACE_resourceColor_0100
     * @tc.name      resourceColor_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('resourceColor_0100', 0, async (done: Function) => {
      console.info('resourceColor_0100 START');
      let strJson: string = getInspectorByKey('resourceColor');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[resourceColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[resourceColor_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual("#FFFFA500");
      console.info('[resourceColor_0100] END');
      done();
    });
    

  })
}

