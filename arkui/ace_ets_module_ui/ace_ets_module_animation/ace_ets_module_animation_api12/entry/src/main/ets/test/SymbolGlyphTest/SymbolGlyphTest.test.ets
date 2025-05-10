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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from "@ohos.router";
import CommonFunc from '../../MainAbility/utils/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from "@ohos.UiTest";

export default function SymbolGlyphTest() {
  describe("SymbolGlyphTest", () => {
    beforeEach(async (done: Function) => {
      console.info("SymbolGlyphTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SymbolGlyph/SymbolGlyph",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolGlyphTest state pages:" + JSON.stringify(pages));
        if (!("SymbolGlyph" == pages.name)) {
          console.info("get SymbolGlyphTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SymbolGlyphTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolGlyphTest page error:" + err);
      }
      console.info("SymbolGlyphTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SymbolGlyphTest after each called");
    });

    /**
     * @tc.number SymbolGlyphTest
     * @tc.name testBack
     * @tc.desc Return specified page by index value
     * @tc.level Level 3
     * @tc.type
     * @tc.size
     */
    it("SymbolGlyphTest_001", 0, async (done: Function) => {
      console.info("[SymbolGlyphTest_001] START");
      await CommonFunc.sleep(1000);
      let AppearSymbolEffect = getInspectorByKey("AppearSymbolEffect");
      await CommonFunc.sleep(1000);
      console.info("AppearSymbolEffect-----" + JSON.parse(AppearSymbolEffect).$attrs.content);
      expect(JSON.parse(AppearSymbolEffect).$attrs.content).assertEqual("AppearSymbolEffect:true");
      console.info("[SymbolGlyphTest_001] END");
      done();
    });

    it("SymbolGlyphTest_002", 0, async (done: Function) => {
      console.info("[SymbolGlyphTest_002] START");
      await CommonFunc.sleep(1000);
      let DisappearSymbolEffect = getInspectorByKey("DisappearSymbolEffect");
      await CommonFunc.sleep(1000);
      console.info("DisappearSymbolEffect-----" + JSON.parse(DisappearSymbolEffect).$attrs.content);
      expect(JSON.parse(DisappearSymbolEffect).$attrs.content).assertEqual("DisappearSymbolEffect:true");
      console.info("[SymbolGlyphTest_002] END");
      done();
    });

    it("SymbolGlyphTest_003", 0, async (done: Function) => {
      console.info("[SymbolGlyphTest_003] START");
      await CommonFunc.sleep(1000);
      let ReplaceSymbolEffect = getInspectorByKey("ReplaceSymbolEffect");
      await CommonFunc.sleep(1000);
      console.info("ReplaceSymbolEffect-----" + JSON.parse(ReplaceSymbolEffect).$attrs.content);
      expect(JSON.parse(ReplaceSymbolEffect).$attrs.content).assertEqual("ReplaceSymbolEffect:true");
      console.info("[SymbolGlyphTest_003] END");
      done();
    });

    it("SymbolGlyphTest_004", 0, async (done: Function) => {
      console.info("[SymbolGlyphTest_004] START");
      await CommonFunc.sleep(1000);
      let BounceSymbolEffect = getInspectorByKey("BounceSymbolEffect");
      await CommonFunc.sleep(1000);
      console.info("BounceSymbolEffect-----" + JSON.parse(BounceSymbolEffect).$attrs.content);
      expect(JSON.parse(BounceSymbolEffect).$attrs.content).assertEqual("BounceSymbolEffect:true");
      console.info("[SymbolGlyphTest_004] END");
      done();
    });
  })
}
