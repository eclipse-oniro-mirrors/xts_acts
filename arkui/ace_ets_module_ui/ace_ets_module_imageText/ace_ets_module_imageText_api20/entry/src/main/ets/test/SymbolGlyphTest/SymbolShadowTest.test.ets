/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function SymbolShadowTest() {
  describe('SymbolShadowTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SymbolShadowTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/SymbolShadowTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolShadowTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("SymbolShadowTest" == pages.name)) {
          console.info("get SymbolShadowTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push SymbolShadowTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolShadowTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("SymbolShadowTest after each called");
    });

    /**
     * @tc.name   SymbolShadowTest0001
     * @tc.number SUB_ACE_BASIC_SYMBOL_SHADOW_ETS_API_0001
     * @tc.desc   test SymbolGlyph set symbolShadow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SymbolShadowTest0001', Level.LEVEL1, async (done: Function) => {
      console.info('SymbolShadowTest0001 START');
      let symbolGlyph = getInspectorByKey('symbolGlyph1');
      let symbolGlyphObj: ESObject = JSON.parse(symbolGlyph);
      console.log('symbolGlyphObj:'+JSON.stringify(symbolGlyphObj.$attrs.symbolShadow))
      console.log('symbolGlyphObj--------color:'+symbolGlyphObj.$attrs.symbolShadow?.color)
      console.log('symbolGlyphObj--------radius:'+symbolGlyphObj.$attrs.symbolShadow?.radius)
      expect(''+symbolGlyphObj.$attrs.symbolShadow?.color).assertEqual('#FF0000FF');
      let rdValue = Number(symbolGlyphObj.$attrs.symbolShadow?.radius)-vp2px(30.0)
      expect(rdValue<=2).assertTrue();
      console.info("[SymbolShadowTest0001] end");
      done();
    });

    /**
     * @tc.name   SymbolShadowTest0002
     * @tc.number SUB_ACE_BASIC_SYMBOL_SHADOW_ETS_API_0002
     * @tc.desc   test SymbolGlyph set symbolShadow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SymbolShadowTest0002', Level.LEVEL3, async (done: Function) => {
      console.info('SymbolShadowTest0002 START');
      let symbolGlyph = getInspectorByKey('symbolGlyph2');
      let symbolGlyphObj: ESObject = JSON.parse(symbolGlyph);
      console.log('symbolGlyphObj:'+JSON.stringify(symbolGlyphObj.$attrs.symbolShadow))
      console.log('symbolGlyphObj--------color:'+symbolGlyphObj.$attrs.symbolShadow?.color)
      console.log('symbolGlyphObj--------radius:'+symbolGlyphObj.$attrs.symbolShadow?.radius)
      expect(''+symbolGlyphObj.$attrs.symbolShadow?.color).assertEqual('#FFFF0000');
      let rdValue = Number(symbolGlyphObj.$attrs.symbolShadow?.radius)-vp2px(0)
      expect(rdValue<=2).assertTrue();
      console.info("[SymbolShadowTest0002] end");
      done();
    });

    /**
     * @tc.name   SymbolShadowTest0003
     * @tc.number SUB_ACE_BASIC_SYMBOL_SHADOW_ETS_API_0003
     * @tc.desc   test SymbolGlyph set symbolShadow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SymbolShadowTest0003', Level.LEVEL3, async (done: Function) => {
      console.info('SymbolShadowTest0003 START');
      let symbolGlyph = getInspectorByKey('symbolGlyph3');
      let symbolGlyphObj: ESObject = JSON.parse(symbolGlyph);
      console.log('symbolGlyphObj:'+JSON.stringify(symbolGlyphObj.$attrs.symbolShadow))
      console.log('symbolGlyphObj--------color:'+symbolGlyphObj.$attrs.symbolShadow?.color)
      console.log('symbolGlyphObj--------radius:'+symbolGlyphObj.$attrs.symbolShadow?.radius)
      expect(''+symbolGlyphObj.$attrs.symbolShadow?.color).assertEqual('#FFF04B3D');
      let rdValue = Number(symbolGlyphObj.$attrs.symbolShadow?.radius)-vp2px(30.6)
      expect(rdValue<=2).assertTrue();
      console.info("[SymbolShadowTest0003] end");
      done();
    });

  })
}
