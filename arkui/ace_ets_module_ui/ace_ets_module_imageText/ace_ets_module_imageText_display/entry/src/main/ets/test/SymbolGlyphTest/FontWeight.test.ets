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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function SymbolGlyphFontWeightTest() {
  describe('SymbolGlyphFontWeightTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SymbolGlyphFontWeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/FontWeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolGlyphFontWeightTest state pages: " + JSON.stringify(pages));
        if (!("FontWeight" == pages.name)) {
          console.info("get SymbolGlyphFontWeightTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SymbolGlyphFontWeightTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolGlyphFontWeightTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SymbolGlyphFontWeightTest_0010
     * @tc.number SUB_ACE_SymbolGlyphFontWeightTest_0010
     * @tc.desc   test SymbolGlyph fontWeight: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SymbolGlyphFontWeightTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('SymbolGlyphFontWeightTest_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_FontWeight_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SymbolGlyphFontWeightTest_0010] fontWeight: " + JSON.stringify(obj.$attrs.fontWeight));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[SymbolGlyphFontWeightTest_0010] END');
      done();
    });

    /**
     * @tc.name   SymbolGlyphFontWeightTest_0020
     * @tc.number SUB_ACE_SymbolGlyphFontWeightTest_0020
     * @tc.desc   test SymbolGlyph fontWeight: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SymbolGlyphFontWeightTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('SymbolGlyphFontWeightTest_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_FontWeight_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SymbolGlyphFontWeightTest_0020] fontWeight: " + JSON.stringify(obj.$attrs.fontWeight));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[SymbolGlyphFontWeightTest_0020] END');
      done();
    });

    /**
     * @tc.name   SymbolGlyphFontWeightTest_0030
     * @tc.number SUB_ACE_SymbolGlyphFontWeightTest_0030
     * @tc.desc   test SymbolGlyph fontWeight: 500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SymbolGlyphFontWeightTest_0030', Level.LEVEL1, async (done: Function) => {
      console.info('SymbolGlyphFontWeightTest_0030 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_FontWeight_500');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SymbolGlyphFontWeightTest_0030] fontWeight: " + JSON.stringify(obj.$attrs.fontWeight));
      expect(obj.$attrs.fontWeight).assertEqual('500');
      console.info('[SymbolGlyphFontWeightTest_0030] END');
      done();
    });

    /**
     * @tc.name   SymbolGlyphFontWeightTest_0040
     * @tc.number SUB_ACE_SymbolGlyphFontWeightTest_0040
     * @tc.desc   test SymbolGlyph fontWeight: Lighter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SymbolGlyphFontWeightTest_0040', Level.LEVEL1, async (done: Function) => {
      console.info('SymbolGlyphFontWeightTest_0040 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_FontWeight_Lighter');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SymbolGlyphFontWeightTest_0040] fontWeight: " + JSON.stringify(obj.$attrs.fontWeight));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Lighter');
      console.info('[SymbolGlyphFontWeightTest_0040] END');
      done();
    });

    /**
     * @tc.name   SymbolGlyphFontWeightTest_0050
     * @tc.number SUB_ACE_SymbolGlyphFontWeightTest_0050
     * @tc.desc   test SymbolGlyph fontWeight: Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SymbolGlyphFontWeightTest_0050', Level.LEVEL1, async (done: Function) => {
      console.info('SymbolGlyphFontWeightTest_0050 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_FontWeight_Normal');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SymbolGlyphFontWeightTest_0050] fontWeight: " + JSON.stringify(obj.$attrs.fontWeight));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[SymbolGlyphFontWeightTest_0050] END');
      done();
    });

    /**
     * @tc.name   SymbolGlyphFontWeightTest_0060
     * @tc.number SUB_ACE_SymbolGlyphFontWeightTest_0060
     * @tc.desc   test SymbolGlyph fontWeight: Regular
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SymbolGlyphFontWeightTest_0060', Level.LEVEL1, async (done: Function) => {
      console.info('SymbolGlyphFontWeightTest_0060 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_FontWeight_Regular');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SymbolGlyphFontWeightTest_0060] fontWeight: " + JSON.stringify(obj.$attrs.fontWeight));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Regular');
      console.info('[SymbolGlyphFontWeightTest_0060] END');
      done();
    });

    /**
     * @tc.name   SymbolGlyphFontWeightTest_0070
     * @tc.number SUB_ACE_SymbolGlyphFontWeightTest_0070
     * @tc.desc   test SymbolGlyph fontWeight: Medium
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SymbolGlyphFontWeightTest_0070', Level.LEVEL1, async (done: Function) => {
      console.info('SymbolGlyphFontWeightTest_0070 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_FontWeight_Medium');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SymbolGlyphFontWeightTest_0070] fontWeight: " + JSON.stringify(obj.$attrs.fontWeight));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Medium');
      console.info('[SymbolGlyphFontWeightTest_0070] END');
      done();
    });

    /**
     * @tc.name   SymbolGlyphFontWeightTest_0080
     * @tc.number SUB_ACE_SymbolGlyphFontWeightTest_0080
     * @tc.desc   test SymbolGlyph fontWeight: Bold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SymbolGlyphFontWeightTest_0080', Level.LEVEL1, async (done: Function) => {
      console.info('SymbolGlyphFontWeightTest_0080 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_FontWeight_Bold');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SymbolGlyphFontWeightTest_0080] fontWeight: " + JSON.stringify(obj.$attrs.fontWeight));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold');
      console.info('[SymbolGlyphFontWeightTest_0080] END');
      done();
    });

    /**
     * @tc.name   SymbolGlyphFontWeightTest_0090
     * @tc.number SUB_ACE_SymbolGlyphFontWeightTest_0090
     * @tc.desc   test SymbolGlyph fontWeight: Bolder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SymbolGlyphFontWeightTest_0090', Level.LEVEL1, async (done: Function) => {
      console.info('SymbolGlyphFontWeightTest_0090 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_FontWeight_Bolder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SymbolGlyphFontWeightTest_0090] fontWeight: " + JSON.stringify(obj.$attrs.fontWeight));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bolder');
      console.info('[SymbolGlyphFontWeightTest_0090] END');
      done();
    });

    /**
     * @tc.name   SymbolGlyphFontWeightTest_0100
     * @tc.number SUB_ACE_SymbolGlyphFontWeightTest_0100
     * @tc.desc   test SymbolGlyph fontWeight: '30'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SymbolGlyphFontWeightTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('SymbolGlyphFontWeightTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_FontWeight_30');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SymbolGlyphFontWeightTest_0100] fontWeight: " + JSON.stringify(obj.$attrs.fontWeight));
      expect(obj.$attrs.fontWeight).assertEqual('900');
      console.info('[SymbolGlyphFontWeightTest_0100] END');
      done();
    });
  })
}
