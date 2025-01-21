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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function symbolGlyphApi3() {
  describe('symbolGlyphApi3', function () {
    beforeEach(async function (done) {
      console.info("symbolGlyphApi3 beforeEach start");
      let options = {
        url: 'MainAbility/pages/symbolGlyphApi/symbolGlyphApi3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get symbolGlyphApi3 state pages:" + JSON.stringify(pages));
        if (!("symbolGlyphApi3" == pages.name)) {
          console.info("get symbolGlyphApi3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push symbolGlyphApi3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push symbolGlyphApi3 page error:" + err);
      }
      console.info("symbolGlyphApi3 beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("symbolGlyphApi3 after each called");
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_symbolGlyphApi3_0100
     * @tc.name      testSymbolGlyph
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('symbolGlyphApi3_0100', 0, async function (done) {
      console.info('[symbolGlyphApi3_0100] START');
      await CommonFunc.sleep(2000);

      // let driver = Driver.create();
      // await CommonFunc.sleep(300);

      let symbolGlyphApi3 = getInspectorByKey('symbolGlyphApi3');
      let Obj1 = JSON.parse(symbolGlyphApi3);
      expect(Obj1.$attrs.renderingStrategy).assertEqual('SymbolRenderingStrategy.MULTIPLE_OPACITY');
      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
