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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function TextDecorationStyle() {
  describe('TextDecorationStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("TextDecorationStyle beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextDecorationStyle",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextDecorationStyle state pages: " + JSON.stringify(pages));
        if (!("TextDecorationStyle" == pages.name)) {
          console.info("get ListTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextDecorationStyle success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextDecorationStyle page error: " + err);
        expect().assertFail();




      }
      done();
    });

    /**
     * @tc.name   TextDecorationStyleTest_0100
     * @tc.number TextDecorationStyleTest_0100
     * @tc.desc   TypedFrameNode: TextDecorationStyleTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextDecorationStyleTest_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('TextDecorationStyleTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TypeNode_TextDecorationStyleTest');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[ypeNodeTextDecorationStyleTest_0100] component obj is: " , JSON.stringify(obj.$attrs.decoration));
      let c: string = JSON.parse(obj.$attrs.decoration).style
      console.info("[ypeNodeTextDecorationStyleTest_0100] component obj22222 is: " , c);
      expect(c).assertEqual('TextDecorationStyle.DOUBLE');
      console.info('[ypeNodeTextDecorationStyleTest_0100] END');
      done();
    });
  })
}

