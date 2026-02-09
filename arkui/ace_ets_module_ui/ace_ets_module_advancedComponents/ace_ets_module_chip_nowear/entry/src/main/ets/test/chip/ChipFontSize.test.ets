/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ChipFontSize() {
  describe('ChipFontSize', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipFontSize beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/chip/ChipFontSize",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ChipFontSize" == pages.name)) {
          console.info("get ChipFontSize pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipFontSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipFontSize page error:" + err);
      }
      console.info("ChipFontSize beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ChipFontSize after each called");
    });

    /**
     * @tc.name   ChipFontSize_001
     * @tc.number ChipFontSize_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ChipFontSize_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ChipFontSize_001] START');
      await CommonFunc.sleep(1000);
      let result: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let test1:string  = result.$children[0].$children[0].$children[0].$children[0].$attrs.fontSize;
      let test2:string  = result.$children[0].$children[1].$children[0].$children[0].$attrs.fontSize;
      let test3:string  = result.$children[0].$children[2].$children[0].$children[0].$attrs.fontSize;
      let test4:string  = result.$children[0].$children[3].$children[0].$children[0].$attrs.fontSize;
      let test5:string  = result.$children[0].$children[4].$children[0].$children[0].$attrs.fontSize;
      await CommonFunc.sleep(2000);
      console.log("ChipFontSize_001 test1:", test1," test2: ", test2, " test3: ", test3, " test4: ", test4, " test5: ", test5 )
      expect(test1).assertEqual('10.00px');
      expect(test2).assertEqual(test4);
      expect(test3).assertEqual(test5);
      console.info('[ChipFontSize_001] END');
      done();
    });

  })
}