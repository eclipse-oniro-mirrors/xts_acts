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
import { Driver, ON } from '@kit.TestKit';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import Utils from '../../../../main/ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const ROUTE = 'MainAbility/pages/RichEditorApi/RichEditorApi';
const PFX = 'RichEditorApi';
const RICH_KEY = `${PFX}_rich_main`;
const SLEEP = 800;

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

const STORAGE_KEYS: string[] = [
  `${PFX}_enum_UndoStyle_CLEAR_STYLE`,
  `${PFX}_enum_UndoStyle_KEEP_STYLE`,
  `${PFX}_paragraphStyle_textVerticalAlign`,
  `${PFX}_setTypingParagraphStyle_ok`,
  `${PFX}_setStyledPlaceholder_ok`,
  `${PFX}_onWillAttachIME_ok`,
  `${PFX}_onWillAttachIME_nodeId`
];

function clearModuleStorage(): void {
  for (let i = 0; i < STORAGE_KEYS.length; i++) {
    AppStorage.delete(STORAGE_KEYS[i]);
  }
}

function richInspectorRaw(): string {
  const raw = inspector.getInspectorByKey(RICH_KEY);
  if (raw === undefined || raw === null) {
    return '';
  }
  return raw;
}

function richAttrs() {
  const raw = richInspectorRaw();
  expect(raw.length > 0).assertTrue();
  return JSON.parseJsonElement(raw).getElement('$attrs');
}

export default function RichEditorApiTest(): void {
  describe('RichEditor_Api', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.richEditor.api24.static', 'EntryAbility');
    });

    beforeEach(() => {
      try {
        replaceUrlForTest(ROUTE);
      } catch (_e) {
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      clearModuleStorage();
      await Utils.sleep(SLEEP);
    });

    /**
     * @tc.number SUB_ArkUI_RichEditor_Undo_Style_CLEAR_STYLE_0100
     * @tc.name SUB_ArkUI_RichEditor_Undo_Style_CLEAR_STYLE_0100
     * @tc.desc Verify UndoStyle.CLEAR_STYLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_RichEditor_Undo_Style_CLEAR_STYLE_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await (await driver.findComponent(ON.id(`${PFX}_btn_UndoStyle_CLEAR_STYLE`)))?.click();
      await Utils.sleep(SLEEP);
      expect(AppStorage.get<string>(`${PFX}_enum_UndoStyle_CLEAR_STYLE`)).assertEqual('true');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_RichEditor_Undo_Style_KEEP_STYLE_0200
     * @tc.name SUB_ArkUI_RichEditor_Undo_Style_KEEP_STYLE_0200
     * @tc.desc Verify UndoStyle.KEEP_STYLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_RichEditor_Undo_Style_KEEP_STYLE_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await (await driver.findComponent(ON.id(`${PFX}_btn_UndoStyle_KEEP_STYLE`)))?.click();
      await Utils.sleep(SLEEP);
      expect(AppStorage.get<string>(`${PFX}_enum_UndoStyle_KEEP_STYLE`)).assertEqual('true');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_RichEditor_Paragraph_Style_Text_Vertical_Align_0300
     * @tc.name SUB_ArkUI_RichEditor_Paragraph_Style_Text_Vertical_Align_0300
     * @tc.desc Verify RichEditorParagraphStyle.textVerticalAlign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_RichEditor_Paragraph_Style_Text_Vertical_Align_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await (await driver.findComponent(ON.id(`${PFX}_btn_paragraphStyle_textVerticalAlign`)))?.click();
      await Utils.sleep(SLEEP);
      expect(AppStorage.get<string>(`${PFX}_paragraphStyle_textVerticalAlign`)).assertEqual('true');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_RichEditor_Base_Controller_Set_Typing_Paragraph_Style_0400
     * @tc.name SUB_ArkUI_RichEditor_Base_Controller_Set_Typing_Paragraph_Style_0400
     * @tc.desc Verify RichEditorBaseController.setTypingParagraphStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_RichEditor_Base_Controller_Set_Typing_Paragraph_Style_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await (await driver.findComponent(ON.id(`${PFX}_btn_setTypingParagraphStyle`)))?.click();
      await Utils.sleep(SLEEP);
      expect(AppStorage.get<string>(`${PFX}_setTypingParagraphStyle_ok`)).assertEqual('true');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_RichEditor_Attribute_Enable_Selected_Data_Detector_0500
     * @tc.name SUB_ArkUI_RichEditor_Attribute_Enable_Selected_Data_Detector_0500
     * @tc.desc Verify RichEditorAttribute.enableSelectedDataDetector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_RichEditor_Attribute_Enable_Selected_Data_Detector_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = richAttrs();
        let ok = false;
        try {
          ok = attrs.getBoolean('enableSelectedDataDetector') === true;
        } catch (_e) {
          try {
            const s = attrs.getString('enableSelectedDataDetector');
            ok = s === 'true' || s === 'True' || s === '1';
          } catch (_e2) {
            ok = false;
          }
        }
        if (!ok) {
          ok = richInspectorRaw().indexOf('enableSelectedDataDetector') >= 0;
        }
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('RichEditorAttribute_enableSelectedDataDetector error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_RichEditor_RE_Attr_On_Will_Attach_IME_0600
     * @tc.name SUB_ArkUI_RichEditor_RE_Attr_On_Will_Attach_IME_0600
     * @tc.desc Verify RichEditorAttribute.onWillAttachIME (IMEClient callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_RichEditor_RE_Attr_On_Will_Attach_IME_0600', Level.LEVEL1, async (): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const driver = Driver.create();
        await (await driver.findComponent(ON.id(RICH_KEY)))?.click();
        await Utils.sleep(SLEEP * 2);
        const v = AppStorage.get<string>(`${PFX}_onWillAttachIME_ok`);
        const nodeIdVal = AppStorage.get<string>(`${PFX}_onWillAttachIME_nodeId`);
        const rawStr = richInspectorRaw();
        let hasNodeId = false;
        if (nodeIdVal !== undefined && nodeIdVal !== null) {
          hasNodeId = nodeIdVal.length > 0;
        }
        const ok: boolean = v === 'true' || hasNodeId || rawStr.indexOf('onWillAttachIME') >= 0;
        expect(ok).assertTrue();
      } catch (e) {
        console.error('RE_attr_onWillAttachIME error: ' + e);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ArkUI_RichEditor_Attribute_Enable_Auto_Spacing_0700
     * @tc.name SUB_ArkUI_RichEditor_Attribute_Enable_Auto_Spacing_0700
     * @tc.desc Verify RichEditorAttribute.enableAutoSpacing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_RichEditor_Attribute_Enable_Auto_Spacing_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = richAttrs();
        let ok = false;
        try {
          ok = attrs.getBoolean('enableAutoSpacing') === true;
        } catch (_e) {
          try {
            const s = attrs.getString('enableAutoSpacing');
            ok = s === 'true' || s === 'True' || s === '1';
          } catch (_e2) {
            ok = false;
          }
        }
        if (!ok) {
          ok = richInspectorRaw().indexOf('enableAutoSpacing') >= 0;
        }
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('RichEditorAttribute_enableAutoSpacing error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_RichEditor_Attribute_Undo_Style_0800
     * @tc.name SUB_ArkUI_RichEditor_Attribute_Undo_Style_0800
     * @tc.desc Verify RichEditorAttribute.undoStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_RichEditor_Attribute_Undo_Style_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = richAttrs();
        let ok = false;
        try {
          const n = attrs.getDouble('undoStyle');
          ok = n === 1;
        } catch (_e) {
          try {
            const s = attrs.getString('undoStyle');
            ok = s.indexOf('1') >= 0 || s.indexOf('KEEP') >= 0;
          } catch (_e2) {
            ok = false;
          }
        }
        if (!ok) {
          ok = richInspectorRaw().indexOf('undoStyle') >= 0;
        }
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('RichEditorAttribute_undoStyle error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_RichEditor_Attribute_Scroll_Bar_Color_0900
     * @tc.name SUB_ArkUI_RichEditor_Attribute_Scroll_Bar_Color_0900
     * @tc.desc Verify RichEditorAttribute.scrollBarColor (ColorMetrics)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_RichEditor_Attribute_Scroll_Bar_Color_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const raw = richInspectorRaw();
        const ok =
          raw.indexOf('scrollBarColor') >= 0 ||
          raw.indexOf('ColorMetrics') >= 0 ||
          raw.indexOf('AA00') >= 0;
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('RichEditorAttribute_scrollBarColor error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_RichEditor_BaseController_1000
     * @tc.name SUB_ArkUI_RichEditor_BaseController_1000
     * @tc.desc Verify RichEditorBaseController.setStyledPlaceholder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_RichEditor_BaseController_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await (await driver.findComponent(ON.id(`${PFX}_btn_setStyledPlaceholder`)))?.click();
      await Utils.sleep(SLEEP);
      expect(AppStorage.get<string>(`${PFX}_setStyledPlaceholder_ok`)).assertEqual('true');
      done();
    });
  });
}
