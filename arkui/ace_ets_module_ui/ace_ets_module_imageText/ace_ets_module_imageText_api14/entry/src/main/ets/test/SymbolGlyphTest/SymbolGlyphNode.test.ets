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


export default function SymbolGlyphNodeTest() {
  describe('SymbolGlyphNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SymbolGlyphNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/SymbolGlyphNode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolGlyphNodeTest state pages: " + JSON.stringify(pages));
        if (!("SymbolGlyphNode" == pages.name)) {
          console.info("get SymbolGlyphNodeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SymbolGlyphNodeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolGlyphNodeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.number    SUB_ACE_SymbolGlyphNodeTest_0010
     * @tc.name      SymbolGlyphNodeTest_0010
     * @tc.desc      set api FrameNode: SymbolGlyph
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('SymbolGlyphNodeTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('SymbolGlyphNodeTest_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_Node_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SymbolGlyphNodeTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('SymbolGlyph');
      console.info('[SymbolGlyphNodeTest_0010] END');
      done();
    });
  })
}

