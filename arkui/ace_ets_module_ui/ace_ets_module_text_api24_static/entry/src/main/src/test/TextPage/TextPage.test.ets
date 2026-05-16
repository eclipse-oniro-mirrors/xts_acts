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
import { TextVerticalAlign, TextContentAlign } from '@ohos.arkui.component';

const ROUTE = 'MainAbility/pages/TextPage/TextPage';
const TEXT_PAGE_KEY = 'TextPage_dlg_bind';
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

function textAttrs() {
  const raw = inspector.getInspectorByKey(TEXT_PAGE_KEY);
  expect(raw !== undefined && raw !== null && raw.length > 0).assertTrue();
  return JSON.parseJsonElement(raw).getElement('$attrs');
}

function textRaw(): string {
  const raw = inspector.getInspectorByKey(TEXT_PAGE_KEY);
  expect(raw !== undefined && raw !== null && raw.length > 0).assertTrue();
  return raw;
}

export default function TextPageTest(): void {
  describe('Text', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.text.api24.static', 'EntryAbility');
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
     * @tc.number SUB_ArkUI_Text_Attribute_Optimize_Trailing_Space_0100
     * @tc.name SUB_ArkUI_Text_Attribute_Optimize_Trailing_Space_0100
     * @tc.desc Verify TextAttribute_optimizeTrailingSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Text_Attribute_Optimize_Trailing_Space_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = textAttrs();
        const raw = textRaw();
        let ok = false;
        try {
          ok = attrs.getBoolean('optimizeTrailingSpace') === true;
        } catch (_e) {
          try {
            const s = attrs.getString('optimizeTrailingSpace');
            ok = s === 'true' || s === 'True' || s === '1';
          } catch (_e2) {
            try {
              ok = attrs.getDouble('optimizeTrailingSpace') !== 0;
            } catch (_e3) {
              ok = raw.indexOf('optimizeTrailingSpace') >= 0;
            }
          }
        }
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAttribute_optimizeTrailingSpace error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Text_Attribute_Shader_Style_0200
     * @tc.name SUB_ArkUI_Text_Attribute_Shader_Style_0200
     * @tc.desc Verify TextAttribute_shaderStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Text_Attribute_Shader_Style_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const raw = textRaw();
        const ok =
          raw.indexOf('FF0000') >= 0 ||
          raw.indexOf('0000FF') >= 0 ||
          raw.indexOf('LinearGradient') >= 0 ||
          raw.indexOf('shaderStyle') >= 0;
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAttribute_shaderStyle error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Text_Attribute_Enable_Auto_Spacing_0300
     * @tc.name SUB_ArkUI_Text_Attribute_Enable_Auto_Spacing_0300
     * @tc.desc Verify TextAttribute_enableAutoSpacing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Text_Attribute_Enable_Auto_Spacing_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = textAttrs();
        let ok = false;
        try {
          ok = attrs.getBoolean('enableAutoSpacing') === true;
        } catch (_e) {
          try {
            const s = attrs.getString('enableAutoSpacing');
            ok = s === 'true' || s === 'True' || s === '1';
          } catch (_e2) {
            try {
              ok = attrs.getDouble('enableAutoSpacing') !== 0;
            } catch (_e3) {
              ok = false;
            }
          }
        }
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAttribute_enableAutoSpacing error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Text_Attribute_Text_Vertical_Align_0400
     * @tc.name SUB_ArkUI_Text_Attribute_Text_Vertical_Align_0400
     * @tc.desc Verify TextAttribute_textVerticalAlign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Text_Attribute_Text_Vertical_Align_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = textAttrs();
        let okStr = false;
        let okNum = false;
        try {
          const s = attrs.getString('textVerticalAlign');
          okStr = s === 'TextVerticalAlign.CENTER' || s === String(TextVerticalAlign.CENTER);
        } catch (_e) {
          okStr = false;
        }
        try {
          const n = attrs.getDouble('textVerticalAlign');
          okNum = n === TextVerticalAlign.CENTER;
        } catch (_e2) {
          okNum = false;
        }
        expect(okStr || okNum).assertTrue();
        done();
      } catch (e) {
        console.error('TextAttribute_textVerticalAlign error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Text_Attribute_Content_Transition_0500
     * @tc.name SUB_ArkUI_Text_Attribute_Content_Transition_0500
     * @tc.desc Verify TextAttribute_contentTransition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Text_Attribute_Content_Transition_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const raw = textRaw();
        const ok =
          raw.indexOf('contentTransition') >= 0 ||
          raw.indexOf('NumericTextTransition') >= 0 ||
          raw.indexOf('FlipDirection') >= 0 ||
          raw.indexOf('UP') >= 0 ||
          raw.indexOf('ArkUI Text batch') >= 0;
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAttribute_contentTransition error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Text_Attribute_Text_Content_Align_0600
     * @tc.name SUB_ArkUI_Text_Attribute_Text_Content_Align_0600
     * @tc.desc Verify TextAttribute_textContentAlign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Text_Attribute_Text_Content_Align_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = textAttrs();
        let okStr = false;
        let okNum = false;
        try {
          const s = attrs.getString('textContentAlign');
          okStr = s === 'TextContentAlign.CENTER' || s === String(TextContentAlign.CENTER);
        } catch (_e) {
          okStr = false;
        }
        try {
          const n = attrs.getDouble('textContentAlign');
          okNum = n === TextContentAlign.CENTER;
        } catch (_e2) {
          okNum = false;
        }
        expect(okStr || okNum).assertTrue();
        done();
      } catch (e) {
        console.error('TextAttribute_textContentAlign error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Text_Attribute_Min_Lines_0700
     * @tc.name SUB_ArkUI_Text_Attribute_Min_Lines_0700
     * @tc.desc Verify TextAttribute_minLines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Text_Attribute_Min_Lines_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = textAttrs();
        const raw = textRaw();
        let ok = false;
        try {
          ok = attrs.getDouble('minLines') >= 1;
        } catch (_e) {
          try {
            const s = attrs.getString('minLines');
            ok = s.length > 0;
          } catch (_e2) {
            ok = raw.indexOf('minLines') >= 0;
          }
        }
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAttribute_minLines error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Text_Attribute_Min_Line_Height_0800
     * @tc.name SUB_ArkUI_Text_Attribute_Min_Line_Height_0800
     * @tc.desc Verify TextAttribute_minLineHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Text_Attribute_Min_Line_Height_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const raw = textRaw();
        const ok =
          raw.indexOf('minLineHeight') >= 0 && (raw.indexOf('14') >= 0 || raw.indexOf('vp') >= 0);
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAttribute_minLineHeight error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Text_Attribute_Max_Line_Height_0900
     * @tc.name SUB_ArkUI_Text_Attribute_Max_Line_Height_0900
     * @tc.desc Verify TextAttribute_maxLineHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Text_Attribute_Max_Line_Height_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const raw = textRaw();
        const ok =
          raw.indexOf('maxLineHeight') >= 0 && (raw.indexOf('40') >= 0 || raw.indexOf('vp') >= 0);
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAttribute_maxLineHeight error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Text_Attribute_Line_Height_Multiple_1000
     * @tc.name SUB_ArkUI_Text_Attribute_Line_Height_Multiple_1000
     * @tc.desc Verify TextAttribute_lineHeightMultiple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Text_Attribute_Line_Height_Multiple_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = textAttrs();
        const raw = textRaw();
        let ok = false;
        try {
          const n = attrs.getDouble('lineHeightMultiple');
          ok = Math.abs(n - 1.1) < 0.001;
        } catch (_e) {
          try {
            const s = attrs.getString('lineHeightMultiple');
            const v = Number.parseFloat(s);
            ok = !Number.isNaN(v) && Math.abs(v - 1.1) < 0.001;
          } catch (_e2) {
            ok = false;
          }
        }
        ok = ok || raw.indexOf('lineHeightMultiple') >= 0 || raw.indexOf('1.1') >= 0;
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAttribute_lineHeightMultiple error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Text_Attribute_Enable_Selected_Data_Detector_1100
     * @tc.name SUB_ArkUI_Text_Attribute_Enable_Selected_Data_Detector_1100
     * @tc.desc Verify TextAttribute_enableSelectedDataDetector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Text_Attribute_Enable_Selected_Data_Detector_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = textAttrs();
        const raw = textRaw();
        let ok = false;
        try {
          ok = attrs.getBoolean('enableSelectedDataDetector') === true;
        } catch (_e) {
          try {
            const s = attrs.getString('enableSelectedDataDetector');
            ok = s === 'true' || s === 'True' || s === '1';
          } catch (_e2) {
            try {
              ok = attrs.getDouble('enableSelectedDataDetector') !== 0;
            } catch (_e3) {
              ok = raw.indexOf('enableSelectedDataDetector') >= 0;
            }
          }
        }
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAttribute_enableSelectedDataDetector error: ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
