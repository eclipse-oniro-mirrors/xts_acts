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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function SXSymbolGlyphSINGLE01Jsunit() {
  describe('SXSymbolGlyphSINGLE01Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("SXSymbolGlyphSINGLE01Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/SXSymbolGlyphSINGLE01',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SXSymbolGlyphSINGLE01Jsunit state pages:" + JSON.stringify(pages));
        if (!("SXSymbolGlyphSINGLE01" == pages.name)) {
          console.info("get SXSymbolGlyphSINGLE01Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push SXSymbolGlyphSINGLE01Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SXSymbolGlyphSINGLE01Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SXSymbolGlyphSINGLE01Jsunit_0100
     * @tc.number SXSymbolGlyphSINGLE01Jsunit_0100
     * @tc.desc   symbolEffect test of SymbolGlyph
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SXSymbolGlyphSINGLE01Jsunit_0100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 START');
      let strcontent = getInspectorByKey('SXSymbolGlyphSINGLE01Key');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 component obj is: ' + obj);
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 component obj.$attrs is: ' + obj.$attrs);
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 component obj.$attrs.textBackgroundStyle is: ' + obj.$attrs.renderingStrategy);
      expect(obj.$attrs.renderingStrategy).assertEqual('SymbolRenderingStrategy.SINGLE');
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 END')
      done();
    });

  })
}