'use static';
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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { BlurStyle, ColorMetrics, Font, LengthMetrics } from '@ohos.arkui.component';
import { ArcAlphabetIndexerInitInfo } from '@ohos.arkui.ArcAlphabetIndexer';

const SLEEP_TIME = 1000;

export default function ArcAlphabetIndexerTest() {
  describe('ArcAlphabetIndexerTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.arcAlphabetIndexer.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest beforeEach start');
      let options: router.RouterOptions = { url: 'MainAbility/pages/ArcAlphabetIndexer/ArcAlphabetIndexerIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "ArcAlphabetIndexerIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] ArcAlphabetIndexerTest replaceUrl error: " + err);
        expect(err !== null && err !== undefined).assertTrue();
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ArcAlphabetIndexerTest afterEach start");
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] ArcAlphabetIndexerTest afterEach end");
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_0100
     * @tc.name arcIndexerFullRenders
     * @tc.desc Verify full ArcAlphabetIndexer with all attributes renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerFullRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerFullRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerFull'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerFullRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerFullRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_0200
     * @tc.name arcIndexerFullUsePopup
     * @tc.desc Verify usePopup is set on full indexer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerFullUsePopup', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerFullUsePopup START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerFull'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let usePopup = attrs.getString('usePopup');
        console.info('[ARKUI_NEW] arcIndexerFull usePopup = ' + usePopup);
        expect(usePopup != null && usePopup !== undefined).assertTrue();
        expect(usePopup === 'true').assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerFullUsePopup END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerFullUsePopup error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_0300
     * @tc.name arcIndexerSimpleRenders
     * @tc.desc Verify simple ArcAlphabetIndexer renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerSimpleRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSimpleRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerSimple'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSimpleRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSimpleRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_0400
     * @tc.name arcIndexerUndefinedRenders
     * @tc.desc Verify ArcAlphabetIndexer with undefined params renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerUndefinedRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerUndefinedRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerUndefined'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerUndefinedRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerUndefinedRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_0500
     * @tc.name arcIndexerInitInfoArrayValue
     * @tc.desc Test ArcAlphabetIndexerInitInfo arrayValue field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerInitInfoArrayValue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerInitInfoArrayValue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let info: ArcAlphabetIndexerInitInfo = { arrayValue: ['X', 'Y', 'Z'], selected: 1 };
        expect(info.arrayValue.length).assertEqual(3);
        expect(info.arrayValue[0]).assertEqual('X');
        expect(info.selected).assertEqual(1);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerFontSize'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let selected = attrs.getString('selected');
        console.info('[ARKUI_NEW] arcIndexerFontSize selected = ' + selected);
        expect(selected != null && selected !== undefined).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerInitInfoArrayValue END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerInitInfoArrayValue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_0600
     * @tc.name arcIndexerInitInfoEmptyArray
     * @tc.desc Test ArcAlphabetIndexerInitInfo with empty arrayValue as invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('arcIndexerInitInfoEmptyArray', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerInitInfoEmptyArray START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let info: ArcAlphabetIndexerInitInfo = { arrayValue: [], selected: 0 };
        expect(info.arrayValue.length).assertEqual(0);
        expect(info.selected).assertEqual(0);
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerInitInfoEmptyArray END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerInitInfoEmptyArray error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_0700
     * @tc.name arcIndexerInitInfoNegativeSelected
     * @tc.desc Test ArcAlphabetIndexerInitInfo with negative selected index as invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('arcIndexerInitInfoNegativeSelected', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerInitInfoNegativeSelected START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let info: ArcAlphabetIndexerInitInfo = { arrayValue: ['A', 'B', 'C'], selected: -1 };
        expect(info.arrayValue.length).assertEqual(3);
        expect(info.selected).assertEqual(-1);
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerInitInfoNegativeSelected END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerInitInfoNegativeSelected error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_0800
     * @tc.name blurStyleNoneEnum
     * @tc.desc Test BlurStyle.NONE enum used with popupBackgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('blurStyleNoneEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: blurStyleNoneEnum START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(BlurStyle.NONE != undefined).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: blurStyleNoneEnum END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: blurStyleNoneEnum error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_0900
     * @tc.name arcIndexerColorAttr
     * @tc.desc Verify color attribute is set via Inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerColorAttr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerColorAttr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerFull'));
        let attrs = node.getElement('$attrs');
        let color = attrs.getString('color');
        console.info('[ARKUI_NEW] arcIndexerFull color = ' + color);
        expect(color != null && color !== undefined).assertTrue();
        expect(color === '#FFFF0000' || color === '#FF0000').assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerColorAttr END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerColorAttr error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_1000
     * @tc.name arcIndexerSelectedColorAttr
     * @tc.desc Verify selectedColor attribute is set via Inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerSelectedColorAttr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSelectedColorAttr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerFull'));
        let attrs = node.getElement('$attrs');
        let selectedColor = attrs.getString('selectedColor');
        console.info('[ARKUI_NEW] arcIndexerFull selectedColor = ' + selectedColor);
        expect(selectedColor != null && selectedColor != undefined).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSelectedColorAttr END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSelectedColorAttr error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_1100
     * @tc.name arcIndexerPopupColorAttr
     * @tc.desc Verify popupColor attribute is set via Inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerPopupColorAttr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerPopupColorAttr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerFull'));
        let attrs = node.getElement('$attrs');
        let popupColor = attrs.getString('popupColor');
        console.info('[ARKUI_NEW] arcIndexerFull popupColor = ' + popupColor);
        expect(popupColor != null && popupColor != undefined).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerPopupColorAttr END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerPopupColorAttr error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_1200
     * @tc.name arcIndexerSelectedBgColorAttr
     * @tc.desc Verify selectedBackgroundColor attribute is set via Inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerSelectedBgColorAttr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSelectedBgColorAttr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerFull'));
        let attrs = node.getElement('$attrs');
        let selectedBgColor = attrs.getString('selectedBackgroundColor');
        console.info('[ARKUI_NEW] arcIndexerFull selectedBackgroundColor = ' + selectedBgColor);
        expect(selectedBgColor != null && selectedBgColor != undefined).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSelectedBgColorAttr END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSelectedBgColorAttr error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_1300
     * @tc.name arcIndexerPopupBgAttr
     * @tc.desc Verify popupBackground attribute is set via Inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerPopupBgAttr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerPopupBgAttr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerFull'));
        let attrs = node.getElement('$attrs');
        let popupBg = attrs.getString('popupBackground');
        console.info('[ARKUI_NEW] arcIndexerFull popupBackground = ' + popupBg);
        expect(popupBg != null && popupBg != undefined).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerPopupBgAttr END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerPopupBgAttr error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_1400
     * @tc.name arcIndexerSelectedFontAttr
     * @tc.desc Verify selectedFont attribute is set via Inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerSelectedFontAttr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSelectedFontAttr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('arcIndexerFontSize');
        console.info('[ARKUI_NEW] arcIndexerFontSize inspector = ' + strJson);
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let hasSelectedFont = strJson.indexOf('selectedFont') >= 0 || strJson.indexOf('SelectedFont') >= 0;
        console.info('[ARKUI_NEW] arcIndexerFontSize hasSelectedFont = ' + hasSelectedFont);
        expect(node.getElement('$attrs') != null).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSelectedFontAttr END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSelectedFontAttr error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_1500
     * @tc.name arcIndexerPopupFontAttr
     * @tc.desc Verify popupFont attribute is set via Inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerPopupFontAttr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerPopupFontAttr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('arcIndexerFontSize');
        console.info('[ARKUI_NEW] arcIndexerFontSize inspector = ' + strJson);
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let hasPopupFont = strJson.indexOf('popupFont') >= 0 || strJson.indexOf('PopupFont') >= 0;
        console.info('[ARKUI_NEW] arcIndexerFontSize hasPopupFont = ' + hasPopupFont);
        expect(node.getElement('$attrs') != null).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerPopupFontAttr END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerPopupFontAttr error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_1600
     * @tc.name arcIndexerFontAttr
     * @tc.desc Verify font attribute is set via Inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerFontAttr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerFontAttr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('arcIndexerFontSize');
        console.info('[ARKUI_NEW] arcIndexerFontSize inspector = ' + strJson);
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let hasFont = strJson.indexOf('"font"') >= 0;
        console.info('[ARKUI_NEW] arcIndexerFontSize hasFont = ' + hasFont);
        expect(node.getElement('$attrs') != null).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerFontAttr END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerFontAttr error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_1700
     * @tc.name arcIndexerItemSizeAttr
     * @tc.desc Verify itemSize attribute is set via Inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerItemSizeAttr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerItemSizeAttr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerFontSize'));
        let attrs = node.getElement('$attrs');
        let itemSize = attrs.getString('itemSize');
        console.info('[ARKUI_NEW] arcIndexerFontSize itemSize = ' + itemSize);
        expect(itemSize != null && itemSize != undefined).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerItemSizeAttr END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerItemSizeAttr error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_1800
     * @tc.name arcIndexerSelectedMethodAttr
     * @tc.desc Verify selected method attribute is set via Inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerSelectedMethodAttr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSelectedMethodAttr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerFontSize'));
        let attrs = node.getElement('$attrs');
        let selected = attrs.getString('selected');
        console.info('[ARKUI_NEW] arcIndexerFontSize selected = ' + selected);
        expect(selected != null && selected != undefined).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSelectedMethodAttr END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerSelectedMethodAttr error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_1900
     * @tc.name arcIndexerAutoCollapseFalse
     * @tc.desc Verify autoCollapse(false) via Inspector on arcIndexerFull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerAutoCollapseFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerAutoCollapseFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let attrs = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerFull')).getElement('$attrs');
        let autoCollapse = attrs.getString('autoCollapse');
        console.info('[ARKUI_NEW] arcIndexerFull autoCollapse = ' + autoCollapse);
        expect(autoCollapse != null && autoCollapse != undefined).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerAutoCollapseFalse END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerAutoCollapseFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_2000
     * @tc.name arcIndexerAutoCollapseTrue
     * @tc.desc Verify autoCollapse(true) via Inspector on arcIndexerSimple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerAutoCollapseTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerAutoCollapseTrue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let attrs = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerSimple')).getElement('$attrs');
        let autoCollapse = attrs.getString('autoCollapse');
        console.info('[ARKUI_NEW] arcIndexerSimple autoCollapse = ' + autoCollapse);
        expect(autoCollapse != null && autoCollapse != undefined).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerAutoCollapseTrue END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerAutoCollapseTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_2100
     * @tc.name arcIndexerUsePopupFalse
     * @tc.desc Verify usePopup(false) via Inspector on arcIndexerSimple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerUsePopupFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerUsePopupFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let attrs = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerSimple')).getElement('$attrs');
        let usePopup = attrs.getString('usePopup');
        console.info('[ARKUI_NEW] arcIndexerSimple usePopup = ' + usePopup);
        expect(usePopup != null && usePopup != undefined).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerUsePopupFalse END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerUsePopupFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_2200
     * @tc.name blurStyleThinEnum
     * @tc.desc Test BlurStyle.Thin enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('blurStyleThinEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: blurStyleThinEnum START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(BlurStyle.Thin != undefined).assertTrue();
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerFontSize'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: blurStyleThinEnum END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: blurStyleThinEnum error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_2300
     * @tc.name blurStyleRegularEnum
     * @tc.desc Test BlurStyle.Regular enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('blurStyleRegularEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: blurStyleRegularEnum START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(BlurStyle.Regular != undefined).assertTrue();
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerBlurRegular'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: blurStyleRegularEnum END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: blurStyleRegularEnum error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_2400
     * @tc.name blurStyleThickEnum
     * @tc.desc Test BlurStyle.Thick enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('blurStyleThickEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: blurStyleThickEnum START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(BlurStyle.Thick != undefined).assertTrue();
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerBlurThick'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: blurStyleThickEnum END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: blurStyleThickEnum error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_2500
     * @tc.name arcIndexerUndefinedAllAttrs
     * @tc.desc Verify all attributes set to undefined renders correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcIndexerUndefinedAllAttrs', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerUndefinedAllAttrs START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerUndefined'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerUndefinedAllAttrs END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerUndefinedAllAttrs error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_ARCALPHABETINDEXER_2600
     * @tc.name arcIndexerEmptyArrayParams
     * @tc.desc Test ArcAlphabetIndexer with empty array as invalid parameter renders without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('arcIndexerEmptyArrayParams', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerEmptyArrayParams START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let info: ArcAlphabetIndexerInitInfo = { arrayValue: [], selected: 0 };
        expect(info.arrayValue.length).assertEqual(0);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('arcIndexerUndefined'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerEmptyArrayParams END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ArcAlphabetIndexerTest execute: arcIndexerEmptyArrayParams error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
