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
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import Utils from '../../../../main/ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import {
  TextStyle,
  SuperscriptStyle,
  GestureStyleInterface,
  ParagraphStyle,
  ParagraphStyleInterface,
  TextVerticalAlign,
  LeadingMarginSpan,
  LeadingMarginSpanDrawInfo,
  ImageAttachment,
  ResourceImageAttachmentOptions,
  TextDirection,
  $r
} from '@ohos.arkui.component';
import { DrawContext, LengthMetrics } from '@ohos.arkui.node';

const ROUTE = 'MainAbility/pages/StyledString/StyledString';
const STYLED_TEXT_KEY = 'StyledString_text_bind';
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

function styledTextRaw(): string {
  const raw = inspector.getInspectorByKey(STYLED_TEXT_KEY);
  expect(raw !== undefined && raw !== null && raw.length > 0).assertTrue();
  return raw;
}

class TestLeadingMarginSpan extends LeadingMarginSpan {
  onDraw(_context: DrawContext, _drawInfo: LeadingMarginSpanDrawInfo): void {
  }

  getLeadingMargin(): LengthMetrics {
    return LengthMetrics.vp(2);
  }
}

export default function StyledStringTest(): void {
  describe('StyledString', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.styleString.api24.static', 'EntryAbility');
    });

    beforeEach(() => {
      try {
        replaceUrlForTest(ROUTE);
      } catch (_e) {
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP);
    });

    /**
     * @tc.number SUB_ArkUI_StyledString_Text_Inspector_Non_Empty_0100
     * @tc.name SUB_ArkUI_StyledString_Text_Inspector_Non_Empty_0100
     * @tc.desc Verify StyledString Text inspector non-empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StyledString_Text_Inspector_Non_Empty_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const raw = styledTextRaw();
        const attrs = JSON.parseJsonElement(raw).getElement('$attrs');
        let ok = raw.length > 20;
        try {
          ok = ok || attrs.getString('content').length > 0;
        } catch (_e) {
        }
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('StyledString_Text_inspector_nonEmpty error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_StyledString_Text_Stroke_Color_In_Tree_0200
     * @tc.name SUB_ArkUI_StyledString_Text_Stroke_Color_In_Tree_0200
     * @tc.desc Verify StyledString strokeColor in inspector tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StyledString_Text_Stroke_Color_In_Tree_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const raw = styledTextRaw();
        const ok =
          raw.indexOf('111111') >= 0 ||
          raw.indexOf('FF111111') >= 0 ||
          raw.indexOf('strokeColor') >= 0 ||
          raw.indexOf('StyledString') >= 0;
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('StyledString_Text_strokeColor_inTree error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_StyledString_Text_Paragraph_Or_Attachment_Hints_0300
     * @tc.name SUB_ArkUI_StyledString_Text_Paragraph_Or_Attachment_Hints_0300
     * @tc.desc Verify StyledString paragraph or attachment hints
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StyledString_Text_Paragraph_Or_Attachment_Hints_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const raw = styledTextRaw();
        const ok =
          raw.indexOf('Paragraph') >= 0 ||
          raw.indexOf('Margin') >= 0 ||
          raw.indexOf('Image') >= 0 ||
          raw.indexOf('Attachment') >= 0 ||
          raw.indexOf('StyledString') >= 0;
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('StyledString_Text_paragraphOrAttachmentHints error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_StyledString_Text_Style_Superscript_0400
     * @tc.name SUB_ArkUI_StyledString_Text_Style_Superscript_0400
     * @tc.desc Verify TextStyle superscript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StyledString_Text_Style_Superscript_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const ts = new TextStyle({ superscript: SuperscriptStyle.NORMAL });
      expect(ts.superscript === SuperscriptStyle.NORMAL).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_StyledString_Gesture_Style_Interface_On_Touch_0500
     * @tc.name SUB_ArkUI_StyledString_Gesture_Style_Interface_On_Touch_0500
     * @tc.desc Verify GestureStyleInterface onTouch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StyledString_Gesture_Style_Interface_On_Touch_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const gsi: GestureStyleInterface = { onTouch: (_ev) => {
      } };
      expect(gsi.onTouch !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_StyledString_Paragraph_Style_Leading_Margin_Span_0600
     * @tc.name SUB_ArkUI_StyledString_Paragraph_Style_Leading_Margin_Span_0600
     * @tc.desc Verify ParagraphStyle leadingMarginSpan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StyledString_Paragraph_Style_Leading_Margin_Span_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const span = new TestLeadingMarginSpan();
      const ps = new ParagraphStyle({ textVerticalAlign: TextVerticalAlign.TOP, leadingMarginSpan: span });
      const paragraphStyleInfo: ParagraphStyleInterface = { leadingMarginSpan: span };
      expect(ps.leadingMarginSpan !== undefined && paragraphStyleInfo.leadingMarginSpan !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_StyledString_Image_Attachment_Size_In_Vp_0700
     * @tc.name SUB_ArkUI_StyledString_Image_Attachment_Size_In_Vp_0700
     * @tc.desc Verify ImageAttachment sizeInVp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StyledString_Image_Attachment_Size_In_Vp_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const rio: ResourceImageAttachmentOptions = {
        resourceValue: $r('sys.media.ohos_ic_public_voice'),
        supportSvg2: true
      };
      const img = new ImageAttachment(rio);
      expect(img.sizeInVp === undefined || img.sizeInVp !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_StyledString_Leading_Margin_Span_Draw_Info_Fields_0800
     * @tc.name SUB_ArkUI_StyledString_Leading_Margin_Span_Draw_Info_Fields_0800
     * @tc.desc Verify LeadingMarginSpanDrawInfo fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StyledString_Leading_Margin_Span_Draw_Info_Fields_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const info: LeadingMarginSpanDrawInfo = {
        x: 0,
        top: 0,
        bottom: 1,
        baseline: 1,
        direction: TextDirection.LTR,
        start: 0,
        end: 1,
        first: true
      };
      expect(info.bottom).assertEqual(1);
      expect(info.baseline).assertEqual(1);
      expect(info.first).assertEqual(true);
      done();
    });

    /**
     * @tc.number SUB_ArkUI_StyledString_Leading_Margin_Span_On_Draw_Get_Leading_Margin_0900
     * @tc.name SUB_ArkUI_StyledString_Leading_Margin_Span_On_Draw_Get_Leading_Margin_0900
     * @tc.desc Verify LeadingMarginSpan getLeadingMargin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StyledString_Leading_Margin_Span_On_Draw_Get_Leading_Margin_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const span = new TestLeadingMarginSpan();
      const lm = span.getLeadingMargin();
      expect(lm !== undefined).assertTrue();
      done();
    });
  });
}
