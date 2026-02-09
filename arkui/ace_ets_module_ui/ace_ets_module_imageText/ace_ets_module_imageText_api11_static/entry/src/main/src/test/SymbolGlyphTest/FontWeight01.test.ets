'use static';
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

import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function SymbolGlyphFontWeightTest() {
  describe('SymbolGlyphFontWeightTest', () => {
    beforeAll(() => {
      console.info("SymbolGlyphFontWeightTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("SymbolGlyphFontWeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/fontWeight',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get SymbolGlyphFontWeightTest state pages: " + JSON.stringify(pages));
        if (!("fontWeight" == pages.name)) {
          console.info("get SymbolGlyphFontWeightTest state pages.name: " + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SymbolGlyphFontWeightTest success: " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push SymbolGlyphFontWeightTest page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SymbolGlyphFontWeightTest_static_0010
     * @tc.name     SymbolGlyphFontWeightTest_static_0010
     * @tc.desc     SymbolGlyphFontWeightTest_static_0010
     * @tc.level    Level.LEVEL1
     */
    it('SymbolGlyphFontWeightTest_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphFontWeightTest_static_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyph_FontWeight_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphFontWeightTest_static_0010] fontWeight: " +
      obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('[SymbolGlyphFontWeightTest_static_0010] END');
      done();
    });

    
    /**
     * @tc.number   SymbolGlyphFontWeightTest_static_0020
     * @tc.name     SymbolGlyphFontWeightTest_static_0020
     * @tc.desc     SymbolGlyphFontWeightTest_static_0020
     * @tc.level    Level.LEVEL1
     */
    it('SymbolGlyphFontWeightTest_static_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphFontWeightTest_static_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyph_FontWeight_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphFontWeightTest_static_0020] fontWeight: " +
      obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('[SymbolGlyphFontWeightTest_static_0020] END');
      done();
    });

    
    /**
     * @tc.number   SymbolGlyphFontWeightTest_static_0030
     * @tc.name     SymbolGlyphFontWeightTest_static_0030
     * @tc.desc     SymbolGlyphFontWeightTest_static_0030
     * @tc.level    Level.LEVEL1
     */
    it('SymbolGlyphFontWeightTest_static_0030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphFontWeightTest_static_0030 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyph_FontWeight_500');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphFontWeightTest_static_0030] fontWeight: " +
      obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('500');
      console.info('[SymbolGlyphFontWeightTest_static_0030] END');
      done();
    });

    
    /**
     * @tc.number   SymbolGlyphFontWeightTest_static_0040
     * @tc.name     SymbolGlyphFontWeightTest_static_0040
     * @tc.desc     SymbolGlyphFontWeightTest_static_0040
     * @tc.level    Level.LEVEL1
     */
    it('SymbolGlyphFontWeightTest_static_0040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphFontWeightTest_static_0040 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyph_FontWeight_Lighter');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphFontWeightTest_static_0040] fontWeight: " +
      obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      console.info('[SymbolGlyphFontWeightTest_static_0040] END');
      done();
    });

    
    /**
     * @tc.number   SymbolGlyphFontWeightTest_static_0050
     * @tc.name     SymbolGlyphFontWeightTest_static_0050
     * @tc.desc     SymbolGlyphFontWeightTest_static_0050
     * @tc.level    Level.LEVEL1
     */
    it('SymbolGlyphFontWeightTest_static_0050', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphFontWeightTest_static_0050 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyph_FontWeight_Normal');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphFontWeightTest_static_0050] fontWeight: " +
      obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('[SymbolGlyphFontWeightTest_static_0050] END');
      done();
    });

    
    /**
     * @tc.number   SymbolGlyphFontWeightTest_static_0060
     * @tc.name     SymbolGlyphFontWeightTest_static_0060
     * @tc.desc     SymbolGlyphFontWeightTest_static_0060
     * @tc.level    Level.LEVEL1
     */
    it('SymbolGlyphFontWeightTest_static_0060', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphFontWeightTest_static_0060 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyph_FontWeight_Regular');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphFontWeightTest_static_0060] fontWeight: " +
      obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Regular');
      console.info('[SymbolGlyphFontWeightTest_static_0060] END');
      done();
    });

    
    /**
     * @tc.number   SymbolGlyphFontWeightTest_static_0070
     * @tc.name     SymbolGlyphFontWeightTest_static_0070
     * @tc.desc     SymbolGlyphFontWeightTest_static_0070
     * @tc.level    Level.LEVEL1
     */
    it('SymbolGlyphFontWeightTest_static_0070', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphFontWeightTest_static_0070 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyph_FontWeight_Medium');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphFontWeightTest_static_0070] fontWeight: " +
      obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
      console.info('[SymbolGlyphFontWeightTest_static_0070] END');
      done();
    });

    
    /**
     * @tc.number   SymbolGlyphFontWeightTest_static_0080
     * @tc.name     SymbolGlyphFontWeightTest_static_0080
     * @tc.desc     SymbolGlyphFontWeightTest_static_0080
     * @tc.level    Level.LEVEL1
     */
    it('SymbolGlyphFontWeightTest_static_0080', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphFontWeightTest_static_0080 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyph_FontWeight_Bold');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphFontWeightTest_static_0080] fontWeight: " +
      obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bold');
      console.info('[SymbolGlyphFontWeightTest_static_0080] END');
      done();
    });

    
    /**
     * @tc.number   SymbolGlyphFontWeightTest_static_0090
     * @tc.name     SymbolGlyphFontWeightTest_static_0090
     * @tc.desc     SymbolGlyphFontWeightTest_static_0090
     * @tc.level    Level.LEVEL1
     */
    it('SymbolGlyphFontWeightTest_static_0090', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphFontWeightTest_static_0090 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyph_FontWeight_Bolder');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphFontWeightTest_static_0090] fontWeight: " +
      obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bolder');
      console.info('[SymbolGlyphFontWeightTest_static_0090] END');
      done();
    });

    
    /**
     * @tc.number   SymbolGlyphFontWeightTest_static_0100
     * @tc.name     SymbolGlyphFontWeightTest_static_0100
     * @tc.desc     SymbolGlyphFontWeightTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('SymbolGlyphFontWeightTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphFontWeightTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyph_FontWeight_30');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphFontWeightTest_static_0100] fontWeight: " +
      obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('900');
      console.info('[SymbolGlyphFontWeightTest_static_0100] END');
      done();
    });
  })
}