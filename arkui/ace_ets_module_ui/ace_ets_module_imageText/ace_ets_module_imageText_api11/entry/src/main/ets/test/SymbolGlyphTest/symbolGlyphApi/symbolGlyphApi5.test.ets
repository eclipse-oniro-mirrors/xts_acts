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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from "../../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function symbolGlyphApi5() {
  describe('symbolGlyphApi5', () => {
    beforeEach(async (done: Function) => {
      console.info("symbolGlyphApi5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/symbolGlyphApi/symbolGlyphApi5',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get symbolGlyphApi5 state pages:" + JSON.stringify(pages));
        if (!("symbolGlyphApi5" == pages.name)) {
          console.info("get symbolGlyphApi5 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push symbolGlyphApi5 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push symbolGlyphApi5 page error:" + err);
      }
      console.info("symbolGlyphApi5 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("symbolGlyphApi5 after each called");
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_symbolGlyphApi5_0100
     * @tc.name      testSymbolGlyph
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('symbolGlyphApi5_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[symbolGlyphApi5_0100] START');
      await CommonFunc.sleep(2000);

      // let driver = Driver.create();
      // await CommonFunc.sleep(300);

      let symbolGlyphApi5 = getInspectorByKey('symbolGlyphApi5');
      let Obj1: ESObject = JSON.parse(symbolGlyphApi5);
      expect(Obj1.$attrs.effectStrategy).assertEqual('SymbolEffectStrategy.HIERARCHICAL');
      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
