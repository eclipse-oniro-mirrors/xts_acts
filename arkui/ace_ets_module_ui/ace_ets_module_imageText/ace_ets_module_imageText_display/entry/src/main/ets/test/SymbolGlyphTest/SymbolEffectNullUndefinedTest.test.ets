/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SymbolEffectNullUndefinedTest() {
  describe('SymbolEffectNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SymbolEffectNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SymbolGlyph/SymbolEffectNullUndefinedTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolEffectNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("SymbolEffectNullUndefinedTest" == pages.name)) {
          console.info("get SymbolEffectNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SymbolEffectNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolEffectNullUndefinedTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SymbolGlyphSymbolEffect_null_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLEFFECT_NULL_0100
     * @tc.desc   Test Symbolglyph symbolEffect property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SymbolGlyphSymbolEffect_null_0100', Level.LEVEL2, async () => {
      console.info('[SymbolGlyphSymbolEffect_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_symbolEffect_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_symbolEffect_null1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[SymbolGlyphSymbolEffect_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[SymbolGlyphSymbolEffect_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[SymbolGlyphSymbolEffect_null_0100] default symbolEffect is: " + objCompare.$attrs.symbolEffect);
      console.info("[SymbolGlyphSymbolEffect_null_0100] null symbolEffect is: " + obj.$attrs.symbolEffect);

      // null 应该恢复为默认值
      expect(obj.$attrs.symbolEffect).assertEqual(objCompare.$attrs.symbolEffect);
      console.info('[SymbolGlyphSymbolEffect_null_0100] END');
    })

    /**
     * @tc.name   SymbolGlyphSymbolEffect_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLEFFECT_UNDEFINED_0100
     * @tc.desc   Test Symbolglyph symbolEffect property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SymbolGlyphSymbolEffect_undefined_0100', Level.LEVEL2, async () => {
      console.info('[SymbolGlyphSymbolEffect_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_symbolEffect_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_symbolEffect_undefined1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[SymbolGlyphSymbolEffect_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[SymbolGlyphSymbolEffect_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[SymbolGlyphSymbolEffect_undefined_0100] default symbolEffect is: " + objCompare.$attrs.symbolEffect);
      console.info("[SymbolGlyphSymbolEffect_undefined_0100] undefined symbolEffect is: " + obj.$attrs.symbolEffect);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.symbolEffect).assertEqual(objCompare.$attrs.symbolEffect);
      console.info('[SymbolGlyphSymbolEffect_undefined_0100] END');
    })

    /**
     * @tc.name   SymbolGlyphSymbolEffect_null_0200
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLEFFECT_NULL_0200
     * @tc.desc   Test Symbolglyph symbolEffect property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SymbolGlyphSymbolEffect_null_0200', Level.LEVEL2, async () => {
      console.info('[SymbolGlyphSymbolEffect_null_0200] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_symbolEffect_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_symbolEffect_null2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[SymbolGlyphSymbolEffect_null_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[SymbolGlyphSymbolEffect_null_0200] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[SymbolGlyphSymbolEffect_null_0200] default symbolEffect is: " + objCompare.$attrs.symbolEffect);
      console.info("[SymbolGlyphSymbolEffect_null_0200] null symbolEffect is: " + obj.$attrs.symbolEffect);

      // null 应该恢复为默认值
      expect(obj.$attrs.symbolEffect).assertEqual(objCompare.$attrs.symbolEffect);
      console.info('[SymbolGlyphSymbolEffect_null_0200] END');
    })

    /**
     * @tc.name   SymbolGlyphSymbolEffect_undefined_0200
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLEFFECT_UNDEFINED_0200
     * @tc.desc   Test Symbolglyph symbolEffect property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SymbolGlyphSymbolEffect_undefined_0200', Level.LEVEL2, async () => {
      console.info('[SymbolGlyphSymbolEffect_undefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_symbolEffect_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_symbolEffect_undefined2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[SymbolGlyphSymbolEffect_undefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[SymbolGlyphSymbolEffect_undefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[SymbolGlyphSymbolEffect_undefined_0200] default symbolEffect is: " + objCompare.$attrs.symbolEffect);
      console.info("[SymbolGlyphSymbolEffect_undefined_0200] undefined symbolEffect is: " + obj.$attrs.symbolEffect);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.symbolEffect).assertEqual(objCompare.$attrs.symbolEffect);
      console.info('[SymbolGlyphSymbolEffect_undefined_0200] END');
    })
  })
}
