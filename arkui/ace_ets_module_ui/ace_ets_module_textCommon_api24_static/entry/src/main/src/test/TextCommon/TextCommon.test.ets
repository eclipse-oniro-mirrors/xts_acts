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

import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON, Component } from '@kit.TestKit';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import Utils from '../../../../main/ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';

const ROUTE = 'MainAbility/pages/TextCommon/TextCommon';
const PFX = 'TextCommon';
/** 与 TextCommon.ets 根 Scroll.id（`${PFX}_page_scroll`）一致，用于 Driver.findComponent + Component.scrollSearch */
const PAGE_SCROLL_ID = `${PFX}_page_scroll`;
const SLEEP = 800;
/** 页面含 Scroll + IME 附着较慢时的等待（非枚举用例） */
const IME_ATTACH_WAIT_MS = 2800;
const DRIVER_KEYS: string[] = [
  `${PFX}_m_getCharacterPositionAtCoordinate`,
  `${PFX}_m_getGlyphRangeForCharacterRange`,
  `${PFX}_m_getCharacterRangeForGlyphRange`,
  `${PFX}_m_setExtraConfig`,
  `${PFX}_ime_cfg_ok`,
  `${PFX}_ime_nodeId`,
  `${PFX}_enablePreviewMenu_ok`,
  `${PFX}_onPrepareMenu_ok`,
  `${PFX}_decoration_thicknessScale`,
  `${PFX}_linear_gradient_options_ok`,
  `${PFX}_radial_gradient_options_ok`,
  `${PFX}_numeric_transition_options_ok`,
  `${PFX}_nto_flip_ok`,
  `${PFX}_nto_blur_ok`,
  `${PFX}_nt_inst_flip_ok`,
  `${PFX}_nt_inst_blur_ok`,
  // CASE9 ColorShaderStyle 页面已禁用，键暂不清理（对整体测试无影响）
  // `${PFX}_color_shader_color_ok`,
  `${PFX}_text_layout_options_ok`,
  `${PFX}_enum_TEXT_CONTENT_ALIGN_TOP`,
  `${PFX}_enum_TEXT_CONTENT_ALIGN_CENTER`,
  `${PFX}_enum_TEXT_CONTENT_ALIGN_BOTTOM`,
  `${PFX}_enum_FLIP_DIRECTION_DOWN`,
  `${PFX}_enum_FLIP_DIRECTION_UP`,
  `${PFX}_enum_SUPERSCRIPT_STYLE_NORMAL`,
  `${PFX}_enum_SUPERSCRIPT_STYLE_SUPERSCRIPT`,
  `${PFX}_enum_SUPERSCRIPT_STYLE_SUBSCRIPT`,
  `${PFX}_enum_TEXT_VERTICAL_ALIGN_BASELINE`,
  `${PFX}_enum_TEXT_VERTICAL_ALIGN_BOTTOM`,
  `${PFX}_enum_TEXT_VERTICAL_ALIGN_CENTER`,
  `${PFX}_enum_TEXT_VERTICAL_ALIGN_TOP`
];

function logNav(msg: string): void {
  console.error('[TestNav] ' + msg);
}

function replaceUrlForTest(pageUrl: string): void {
  logNav('replaceUrlForTest START url=' + pageUrl);
  const ui = AppStorage.get<UIContext>('uiContent');
  let ri: Router | undefined = undefined;
  let routerSource: string = '';
  if (ui !== undefined && ui !== null) {
    try {
      ri = ui.getRouter();
      routerSource = 'UIContext.getRouter';
      AppStorage.setOrCreate<Router>('router', ri);
    } catch (e) {
      logNav('getRouter threw: ' + String(e));
      throw e;
    }
  } else {
    logNav('AppStorage uiContent is undefined/null');
  }
  if (ri === undefined || ri === null) {
    ri = AppStorage.get<Router>('router');
    if (ri !== undefined && ri !== null) {
      routerSource = (routerSource.length > 0) ? (routerSource + '+AppStorage.router') : 'AppStorage.router only';
    }
  }
  if (ri === undefined || ri === null) {
    logNav('FAIL Router unavailable (no UIContext router and no AppStorage.router)');
    throw new Error('replaceUrlForTest: Router unavailable');
  }
  logNav('router source=' + routerSource);
  const navRouter: Router = ri as Router;
  const options: router.RouterOptions = { url: pageUrl };
  try {
    logNav('calling clear()');
    navRouter.clear();
  } catch (e) {
    logNav('clear() threw, continue with navigation: ' + String(e));
  }
  try {
    logNav('calling replaceUrl');
    navRouter.replaceUrl(options);
    logNav('replaceUrlForTest OK by replaceUrl');
    return;
  } catch (e) {
    logNav('replaceUrl threw, fallback pushUrl: ' + String(e));
  }
  try {
    navRouter.pushUrl(options);
    logNav('replaceUrlForTest OK by pushUrl');
  } catch (e2) {
    logNav('pushUrl threw: ' + String(e2));
    throw e2;
  }
}

function clearDriverStorage(): void {
  for (let i = 0; i < DRIVER_KEYS.length; i++) {
    AppStorage.delete(DRIVER_KEYS[i]);
  }
}

/**
 * 在可滚动容器上调用 UiTest 提供的 Component.scrollSearch(On) 边滑边查，再 click。
 * API 见 OpenHarmony《应用测试套件》文档中 UiTest / Component 的 scrollSearch。
 */
async function findAndClickById(driver: Driver, compId: string): Promise<void> {
  const scrollHost = await driver.findComponent(ON.id(PAGE_SCROLL_ID));
  let target: Component | null = await (scrollHost?.scrollSearch(
    ON.id(compId)
  ) as Promise<Component | null>);
  if (target == null) {
    target = (await driver.findComponent(ON.id(compId))) as Component | null;
  }
  if (target == null) {
    throw new Error(`TextCommon: component not found, id=${compId}`);
  }
  await target.click();
}

export default function TextCommonTest(): void {
  describe('TextCommon', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.textCommon.api24.static', 'EntryAbility');
    });

    beforeEach(() => {
      try {
        replaceUrlForTest(ROUTE);
      } catch (_e) {
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      clearDriverStorage();
      await Utils.sleep(SLEEP);
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Text_Content_Align_TOP_0100
     * @tc.name SUB_ArkUI_TextCommon_Text_Content_Align_TOP_0100
     * @tc.desc Verify TextCommon_textContentAlign_TOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Text_Content_Align_TOP_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enum_TEXT_CONTENT_ALIGN_TOP`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enum_TEXT_CONTENT_ALIGN_TOP`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_textContentAlign_TOP error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Text_Content_Align_CENTER_0200
     * @tc.name SUB_ArkUI_TextCommon_Text_Content_Align_CENTER_0200
     * @tc.desc Verify TextCommon_textContentAlign_CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Text_Content_Align_CENTER_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enum_TEXT_CONTENT_ALIGN_CENTER`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enum_TEXT_CONTENT_ALIGN_CENTER`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_textContentAlign_CENTER error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Text_Content_Align_BOTTOM_0300
     * @tc.name SUB_ArkUI_TextCommon_Text_Content_Align_BOTTOM_0300
     * @tc.desc Verify TextCommon_textContentAlign_BOTTOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Text_Content_Align_BOTTOM_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enum_TEXT_CONTENT_ALIGN_BOTTOM`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enum_TEXT_CONTENT_ALIGN_BOTTOM`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_textContentAlign_BOTTOM error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Flip_Direction_DOWN_0400
     * @tc.name SUB_ArkUI_TextCommon_Flip_Direction_DOWN_0400
     * @tc.desc Verify TextCommon_FlipDirection_DOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Flip_Direction_DOWN_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enum_FLIP_DIRECTION_DOWN`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enum_FLIP_DIRECTION_DOWN`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_FlipDirection_DOWN error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Flip_Direction_UP_0500
     * @tc.name SUB_ArkUI_TextCommon_Flip_Direction_UP_0500
     * @tc.desc Verify TextCommon_FlipDirection_UP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Flip_Direction_UP_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enum_FLIP_DIRECTION_UP`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enum_FLIP_DIRECTION_UP`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_FlipDirection_UP error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Superscript_Style_NORMAL_0600
     * @tc.name SUB_ArkUI_TextCommon_Superscript_Style_NORMAL_0600
     * @tc.desc Verify TextCommon_SuperscriptStyle_NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Superscript_Style_NORMAL_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enum_SUPERSCRIPT_STYLE_NORMAL`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enum_SUPERSCRIPT_STYLE_NORMAL`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_SuperscriptStyle_NORMAL error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Superscript_Style_SUPERSCRIPT_0700
     * @tc.name SUB_ArkUI_TextCommon_Superscript_Style_SUPERSCRIPT_0700
     * @tc.desc Verify TextCommon_SuperscriptStyle_SUPERSCRIPT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Superscript_Style_SUPERSCRIPT_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enum_SUPERSCRIPT_STYLE_SUPERSCRIPT`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enum_SUPERSCRIPT_STYLE_SUPERSCRIPT`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_SuperscriptStyle_SUPERSCRIPT error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Superscript_Style_SUBSCRIPT_0800
     * @tc.name SUB_ArkUI_TextCommon_Superscript_Style_SUBSCRIPT_0800
     * @tc.desc Verify TextCommon_SuperscriptStyle_SUBSCRIPT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Superscript_Style_SUBSCRIPT_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enum_SUPERSCRIPT_STYLE_SUBSCRIPT`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enum_SUPERSCRIPT_STYLE_SUBSCRIPT`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_SuperscriptStyle_SUBSCRIPT error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Text_Vertical_Align_BASELINE_0900
     * @tc.name SUB_ArkUI_TextCommon_Text_Vertical_Align_BASELINE_0900
     * @tc.desc Verify TextCommon_TextVerticalAlign_BASELINE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Text_Vertical_Align_BASELINE_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enum_TEXT_VERTICAL_ALIGN_BASELINE`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enum_TEXT_VERTICAL_ALIGN_BASELINE`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_TextVerticalAlign_BASELINE error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Text_Vertical_Align_BOTTOM_1000
     * @tc.name SUB_ArkUI_TextCommon_Text_Vertical_Align_BOTTOM_1000
     * @tc.desc Verify TextCommon_TextVerticalAlign_BOTTOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Text_Vertical_Align_BOTTOM_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enum_TEXT_VERTICAL_ALIGN_BOTTOM`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enum_TEXT_VERTICAL_ALIGN_BOTTOM`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_TextVerticalAlign_BOTTOM error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Text_Vertical_Align_CENTER_1100
     * @tc.name SUB_ArkUI_TextCommon_Text_Vertical_Align_CENTER_1100
     * @tc.desc Verify TextCommon_TextVerticalAlign_CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Text_Vertical_Align_CENTER_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enum_TEXT_VERTICAL_ALIGN_CENTER`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enum_TEXT_VERTICAL_ALIGN_CENTER`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_TextVerticalAlign_CENTER error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Text_Vertical_Align_TOP_1200
     * @tc.name SUB_ArkUI_TextCommon_Text_Vertical_Align_TOP_1200
     * @tc.desc Verify TextCommon_TextVerticalAlign_TOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Text_Vertical_Align_TOP_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enum_TEXT_VERTICAL_ALIGN_TOP`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enum_TEXT_VERTICAL_ALIGN_TOP`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_TextVerticalAlign_TOP error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Text_Data_Detector_Config_Enable_Preview_Menu_1300
     * @tc.name SUB_ArkUI_TextCommon_Text_Data_Detector_Config_Enable_Preview_Menu_1300
     * @tc.desc Verify TextDataDetectorConfig.enablePreviewMenu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Text_Data_Detector_Config_Enable_Preview_Menu_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_enablePreviewMenu`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_enablePreviewMenu_ok`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_TextDataDetectorConfig_enablePreviewMenu error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Layout_Manager_Get_Character_Position_At_Coordinate_1400
     * @tc.name SUB_ArkUI_TextCommon_Layout_Manager_Get_Character_Position_At_Coordinate_1400
     * @tc.desc Verify LayoutManager.getCharacterPositionAtCoordinate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Layout_Manager_Get_Character_Position_At_Coordinate_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_m_getCharacterPositionAtCoordinate`);
        await Utils.sleep(SLEEP);
        await Utils.sleep(SLEEP);
        const v = AppStorage.get<string>(`${PFX}_m_getCharacterPositionAtCoordinate`);
        expect(v !== undefined && v !== 'undefined').assertTrue();
        done();
      } catch (e) {
        console.error('TextCommon_LayoutManager_getCharacterPositionAtCoordinate error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Layout_Manager_Get_Glyph_Range_For_Character_Range_1500
     * @tc.name SUB_ArkUI_TextCommon_Layout_Manager_Get_Glyph_Range_For_Character_Range_1500
     * @tc.desc Verify LayoutManager.getGlyphRangeForCharacterRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Layout_Manager_Get_Glyph_Range_For_Character_Range_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_m_getGlyphRangeForCharacterRange`);
        await Utils.sleep(SLEEP);
        await Utils.sleep(SLEEP);
        const v = AppStorage.get<string>(`${PFX}_m_getGlyphRangeForCharacterRange`);
        expect(v !== undefined && v !== 'undefined').assertTrue();
        done();
      } catch (e) {
        console.error('TextCommon_LayoutManager_getGlyphRangeForCharacterRange error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Layout_Manager_Get_Character_Range_For_Glyph_Range_1600
     * @tc.name SUB_ArkUI_TextCommon_Layout_Manager_Get_Character_Range_For_Glyph_Range_1600
     * @tc.desc Verify LayoutManager.getCharacterRangeForGlyphRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Layout_Manager_Get_Character_Range_For_Glyph_Range_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_m_getCharacterRangeForGlyphRange`);
        await Utils.sleep(SLEEP);
        await Utils.sleep(SLEEP);
        const v = AppStorage.get<string>(`${PFX}_m_getCharacterRangeForGlyphRange`);
        expect(v !== undefined && v !== 'undefined').assertTrue();
        done();
      } catch (e) {
        console.error('TextCommon_LayoutManager_getCharacterRangeForGlyphRange error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Edit_Menu_Options_On_Prepare_Menu_1700
     * @tc.name SUB_ArkUI_TextCommon_Edit_Menu_Options_On_Prepare_Menu_1700
     * @tc.desc Verify EditMenuOptions.onPrepareMenu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Edit_Menu_Options_On_Prepare_Menu_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_onPrepareMenu_invoke`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_onPrepareMenu_ok`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_EditMenuOptions_onPrepareMenu error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Decoration_Style_Result_Thickness_Scale_1800
     * @tc.name SUB_ArkUI_TextCommon_Decoration_Style_Result_Thickness_Scale_1800
     * @tc.desc Verify DecorationStyleResult.thicknessScale from RichEditor span
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Decoration_Style_Result_Thickness_Scale_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_decoration_thicknessScale`);
        await Utils.sleep(SLEEP);
        const v = AppStorage.get<string>(`${PFX}_decoration_thicknessScale`);
        expect(v !== undefined && v !== 'no_spans').assertTrue();
        done();
      } catch (e) {
        console.error('TextCommon_DecorationStyleResult_thicknessScale error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Linear_Gradient_Options_Colors_1900
     * @tc.name SUB_ArkUI_TextCommon_Linear_Gradient_Options_Colors_1900
     * @tc.desc Verify LinearGradientOptions bound via Text.linearGradient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Linear_Gradient_Options_Colors_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_linear_gradient_options`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_linear_gradient_options_ok`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_LinearGradientOptions_colors error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Radial_Gradient_Options_Radius_2000
     * @tc.name SUB_ArkUI_TextCommon_Radial_Gradient_Options_Radius_2000
     * @tc.desc Verify RadialGradientOptions bound via Text.radialGradient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Radial_Gradient_Options_Radius_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_radial_gradient_options`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_radial_gradient_options_ok`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_RadialGradientOptions_radius error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Numeric_Text_Transition_Options_Flip_And_Blur_2100
     * @tc.name SUB_ArkUI_TextCommon_Numeric_Text_Transition_Options_Flip_And_Blur_2100
     * @tc.desc Verify NumericTextTransition with NumericTextTransitionOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Numeric_Text_Transition_Options_Flip_And_Blur_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_numeric_transition_options`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_numeric_transition_options_ok`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_NumericTextTransitionOptions_flip_and_blur error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Numeric_Text_Transition_Options_Flip_Direction_2200
     * @tc.name SUB_ArkUI_TextCommon_Numeric_Text_Transition_Options_Flip_Direction_2200
     * @tc.desc Verify NumericTextTransitionOptions.flipDirection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Numeric_Text_Transition_Options_Flip_Direction_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_nto_flip`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_nto_flip_ok`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_NumericTextTransitionOptions_flipDirection error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Numeric_Text_Transition_Options_Enable_Blur_2300
     * @tc.name SUB_ArkUI_TextCommon_Numeric_Text_Transition_Options_Enable_Blur_2300
     * @tc.desc Verify NumericTextTransitionOptions.enableBlur
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Numeric_Text_Transition_Options_Enable_Blur_2300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_nto_blur`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_nto_blur_ok`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_NumericTextTransitionOptions_enableBlur error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Numeric_Text_Transition_Flip_Direction_2400
     * @tc.name SUB_ArkUI_TextCommon_Numeric_Text_Transition_Flip_Direction_2400
     * @tc.desc Verify NumericTextTransition.flipDirection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Numeric_Text_Transition_Flip_Direction_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_nt_inst_flip`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_nt_inst_flip_ok`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_NumericTextTransition_flipDirection error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_Numeric_Text_Transition_Enable_Blur_2500
     * @tc.name SUB_ArkUI_TextCommon_Numeric_Text_Transition_Enable_Blur_2500
     * @tc.desc Verify NumericTextTransition.enableBlur
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Numeric_Text_Transition_Enable_Blur_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_nt_inst_blur`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_nt_inst_blur_ok`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_NumericTextTransition_enableBlur error: ' + e);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.number SUB_ArkUI_TextCommon_Text_Layout_Options_Constraint_Width_2600
     * @tc.name SUB_ArkUI_TextCommon_Text_Layout_Options_Constraint_Width_2600
     * @tc.desc Verify TextLayoutOptions.constraintWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_Text_Layout_Options_Constraint_Width_2600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_text_layout_options`);
        await Utils.sleep(SLEEP);
        expect(AppStorage.get<string>(`${PFX}_text_layout_options_ok`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_TextLayoutOptions_constraintWidth error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_IME_Client_Node_Id_2700
     * @tc.name SUB_ArkUI_TextCommon_IME_Client_Node_Id_2700
     * @tc.desc Verify IMEClient.nodeId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_IME_Client_Node_Id_2700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_textinput_ime`);
        await Utils.sleep(IME_ATTACH_WAIT_MS);
        const nodeId = AppStorage.get<string>(`${PFX}_ime_nodeId`);
        let idOk = false;
        if (nodeId !== undefined && nodeId !== null && nodeId.length > 0) {
          idOk = true;
        }
        expect(idOk).assertTrue();
        done();
      } catch (e) {
        console.error('TextCommon_IMEClient_nodeId error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_IME_Client_Set_Extra_Config_2800
     * @tc.name SUB_ArkUI_TextCommon_IME_Client_Set_Extra_Config_2800
     * @tc.desc Verify IMEClient.setExtraConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_IME_Client_Set_Extra_Config_2800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_textinput_ime`);
        await Utils.sleep(IME_ATTACH_WAIT_MS);
        expect(AppStorage.get<string>(`${PFX}_ime_cfg_ok`)).assertEqual('true');
        expect(AppStorage.get<string>(`${PFX}_m_setExtraConfig`)).assertEqual('true');
        done();
      } catch (e) {
        console.error('TextCommon_IMEClient_setExtraConfig error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextCommon_ColorSHaderStyle_Color_2900
     * @tc.name SUB_ArkUI_TextCommon_ColorSHaderStyle_Color_2900
     * @tc.desc Verify ColorShaderStyle.color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextCommon_ColorSHaderStyle_Color_2900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        await findAndClickById(d, `${PFX}_btn_color_shader_color`);
        await Utils.sleep(SLEEP);
        const v = AppStorage.get<string>(`${PFX}_color_shader_color_ok`);
        let colorOk = false;
        if (v !== undefined && v !== null && v.length > 0) {
          colorOk = true;
        }
        expect(colorOk).assertTrue();
        done();
      } catch (e) {
        console.error('SUB_ArkUI_TextCommon_ColorSHaderStyle_Color_2900 error: ' + e);
        expect().assertFail();
        done();
      }
    });

  });
}
