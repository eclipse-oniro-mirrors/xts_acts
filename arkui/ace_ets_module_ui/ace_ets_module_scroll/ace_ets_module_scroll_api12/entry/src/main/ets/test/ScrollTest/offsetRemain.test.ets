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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function offsetRemain() {
  describe('offsetRemain', () => {
    beforeEach(async (done: Function) => {
      console.info("offsetRemain beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/offsetRemain",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get offsetRemain state pages: " + JSON.stringify(pages));
        if (!("offsetRemain" == pages.name)) {
          console.info("get offsetRemain state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push offsetRemain success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push offsetRemain page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    offsetRemain_0100
     * @tc.name      offsetRemain_0100
     * @tc.desc      frameNode: offsetRemainToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('offsetRemain_0100', 0, async (done: Function) => {
      console.info('offsetRemain_0100 START');
      let driver = Driver.create();
      let size = await driver.getDisplaySize();
      let sizeX = size.x;
      let sizeY = size.y;
      console.info("[offsetRemain_0100] size is: " + JSON.stringify(size));
      console.info("[offsetRemain_0100] size x is: " + JSON.stringify(sizeX));
      console.info("[ScrollSource_0200] size Y is: " + JSON.stringify(sizeY));
      await CommonFunc.sleep(1000);

      await driver.swipe(sizeX * 1/2, sizeY * 1/2 , sizeX * 1/2, 0, 600);
      
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('offsetRemain');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[offsetRemain_0100] component obj is: " + JSON.stringify(obj));
      console.info("[offsetRemain_0100] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content > 0).assertEqual(true);  
      console.info('[offsetRemain_0100] END');
      done();
    });

  })
}

