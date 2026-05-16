/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';

export default function SymbolGlyphTest() {
  describe('SymbolGlyphTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SymbolGlyphTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.symbolGlyph.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("SymbolGlyphTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/SymbolGlyphIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SymbolGlyphTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "SymbolGlyphIndex") {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("SymbolGlyphTest pushUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("SymbolGlyphTest after each called");
    });

    /**
     * @tc.number SymbolGlyphTest_001
     * @tc.name replaceSymbolEffectTypeSequential
     * @tc.desc new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.SEQUENTIAL).replaceType matches SEQUENTIAL
     */
    it('replaceSymbolEffectTypeSequential', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest: replaceSymbolEffectTypeSequential START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnTypeSeq'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnTypeSeq');
      console.info('[typeSeq] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('type_seq:match');
      console.info('SymbolGlyphTest: replaceSymbolEffectTypeSequential END');
      done();
    });

    /**
     * @tc.number SymbolGlyphTest_002
     * @tc.name replaceSymbolEffectTypeIterative
     * @tc.desc new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.ITERATIVE).replaceType matches ITERATIVE
     */
    it('replaceSymbolEffectTypeIterative', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest: replaceSymbolEffectTypeIterative START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnTypeIter'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnTypeIter');
      console.info('[typeIter] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('type_iter:match');
      console.info('SymbolGlyphTest: replaceSymbolEffectTypeIterative END');
      done();
    });

    /**
     * @tc.number SymbolGlyphTest_003
     * @tc.name replaceSymbolEffectTypeCrossFade
     * @tc.desc click UI and validate CROSS_FADE result label
     */
    it('replaceSymbolEffectTypeCrossFade', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest: replaceSymbolEffectTypeCrossFade START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnTypeCrossFade'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnTypeCrossFade');
      let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
      console.info('[typeCrossFade] label=' + label);
      expect(label == 'type_crossfade:match' || label == 'type_crossfade:fallback_seq').assertTrue();
      console.info('SymbolGlyphTest: replaceSymbolEffectTypeCrossFade END');
      done();
    });

    /**
     * @tc.number SymbolGlyphTest_004
     * @tc.name replaceSymbolEffectTypeSlashOverlay
     * @tc.desc click UI and validate SLASH_OVERLAY result label
     */
    it('replaceSymbolEffectTypeSlashOverlay', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest: replaceSymbolEffectTypeSlashOverlay START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnTypeSlash'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnTypeSlash');
      let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
      console.info('[typeSlash] label=' + label);
      expect(label == 'type_slash:match' || label == 'type_slash:fallback_seq').assertTrue();
      console.info('SymbolGlyphTest: replaceSymbolEffectTypeSlashOverlay END');
      done();
    });

    /**
     * @tc.number SymbolGlyphTest_005
     * @tc.name replaceSymbolEffectScopeWhole
     * @tc.desc new ReplaceSymbolEffect(EffectScope.WHOLE, ...).scope matches EffectScope.WHOLE
     */
    it('replaceSymbolEffectScopeWhole', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest: replaceSymbolEffectScopeWhole START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnScopeWhole'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnScopeWhole');
      console.info('[scopeWhole] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('scope_whole:match');
      console.info('SymbolGlyphTest: replaceSymbolEffectScopeWhole END');
      done();
    });

    /**
     * @tc.number SymbolGlyphTest_006
     * @tc.name replaceSymbolEffectScopeLayer
     * @tc.desc new ReplaceSymbolEffect(EffectScope.LAYER, ...).scope matches EffectScope.LAYER
     */
    it('replaceSymbolEffectScopeLayer', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest: replaceSymbolEffectScopeLayer START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnScopeLayer'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnScopeLayer');
      console.info('[scopeLayer] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('scope_layer:match');
      console.info('SymbolGlyphTest: replaceSymbolEffectScopeLayer END');
      done();
    });

  });
}
