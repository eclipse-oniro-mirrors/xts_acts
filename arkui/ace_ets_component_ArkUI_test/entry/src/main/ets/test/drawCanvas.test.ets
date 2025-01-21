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
import drawing from "@ohos.graphics.drawing"


export default function drawCanvas() {
  describe('drawCanvas', function () {
    beforeEach(async function (done) {
      console.info("drawCanvas beforeEach start");
      let options = {
        uri: 'MainAbility/pages/drawCanvas',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get drawCanvas state pages: " + JSON.stringify(pages));
        if (!("transform" == pages.name)) {
          console.info("get drawCanvas state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push drawCanvas success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push drawCanvas page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
     /**
     * @tc.number    SUB_ACE_drawCanvas_0100
     * @tc.name      drawCanvas_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('drawCanvas_0100', 0, async function (done) {
      console.info('drawCanvas_0100 START');
      await CommonFunc.sleep(1000);
      try {
        let value: drawing.Canvas | undefined = AppStorage.get<drawing.Canvas | undefined>("canvas");
        expect(value).assertNotEqual(undefined)
      } catch(err) {
        console.error("push drawCanvas page error" + JSON.stringify(err));
      }

      console.info('[drawCanvas_0100] END');
      done();
    });
    

  })
}

