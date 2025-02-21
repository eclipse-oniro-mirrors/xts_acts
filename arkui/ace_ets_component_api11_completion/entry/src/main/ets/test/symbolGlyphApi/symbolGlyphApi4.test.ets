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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from "../../MainAbility/common/Common";
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
} from '@ohos.UiTest';

export default function symbolGlyphApi4() {
  describe('symbolGlyphApi4', () => {
    beforeEach(async (done: Function) => {
      console.info("symbolGlyphApi4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/symbolGlyphApi/symbolGlyphApi4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get symbolGlyphApi4 state pages:" + JSON.stringify(pages));
        if (!("symbolGlyphApi4" == pages.name)) {
          console.info("get symbolGlyphApi4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push symbolGlyphApi4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push symbolGlyphApi4 page error:" + err);
      }
      console.info("symbolGlyphApi4 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("symbolGlyphApi4 after each called");
    });
    /**
     * @tc.number SUB_ACE_RICHEDITOR_symbolGlyphApi4_0100
     * @tc.name testSymbolGlyph
     * @tc.desc set api
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('symbolGlyphApi4_0100', 0, async (done: Function) => {
      console.info('[symbolGlyphApi4_0100] START');
      await CommonFunc.sleep(2000);

      // let driver = Driver.create();
      // await CommonFunc.sleep(300);

      let symbolGlyphApi4 = getInspectorByKey('symbolGlyphApi4');
      expect(JSON.parse(symbolGlyphApi4).$attrs.effectStrategy).assertEqual('SymbolEffectStrategy.SCALE');
      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
