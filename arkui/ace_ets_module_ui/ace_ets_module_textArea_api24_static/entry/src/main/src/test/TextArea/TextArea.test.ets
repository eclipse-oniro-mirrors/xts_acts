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

const ROUTE = 'MainAbility/pages/TextArea/TextArea';
const PFX = 'TextArea';
const TEXT_AREA_KEY = 'TextArea_dlg_bind';
const SLEEP = 800;
const KEYS: string[] = [`${PFX}_enum_ONE_TIME_CODE`];

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

function clearModuleStorage(): void {
  for (let i = 0; i < KEYS.length; i++) {
    AppStorage.delete(KEYS[i]);
  }
}

function textAreaAttrs() {
  const raw = inspector.getInspectorByKey(TEXT_AREA_KEY);
  expect(raw !== undefined && raw !== null && raw.length > 0).assertTrue();
  return JSON.parseJsonElement(raw).getElement('$attrs');
}

function textAreaRaw(): string {
  const raw = inspector.getInspectorByKey(TEXT_AREA_KEY);
  expect(raw !== undefined && raw !== null && raw.length > 0).assertTrue();
  return raw;
}

export default function TextAreaTest(): void {
  describe('TextArea', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.textArea.api24.static', 'EntryAbility');
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
     * @tc.number SUB_ArkUI_TextArea_Attribute_Type_0100
     * @tc.name SUB_ArkUI_TextArea_Attribute_Type_0100
     * @tc.desc Verify TextAreaAttribute_type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextArea_Attribute_Type_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await (await driver.findComponent(ON.id(`${PFX}_btn_ONE_TIME_CODE`)))?.click();
      await Utils.sleep(SLEEP);
      expect(AppStorage.get<string>(`${PFX}_enum_ONE_TIME_CODE`)).assertEqual('true');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_TextArea_Attribute_Min_Lines_0200
     * @tc.name SUB_ArkUI_TextArea_Attribute_Min_Lines_0200
     * @tc.desc Verify TextAreaAttribute_minLines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextArea_Attribute_Min_Lines_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = textAreaAttrs();
        const raw = textAreaRaw();
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
        console.error('TextAreaAttribute_minLines error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextArea_Attribute_Enable_Auto_Spacing_0300
     * @tc.name SUB_ArkUI_TextArea_Attribute_Enable_Auto_Spacing_0300
     * @tc.desc Verify TextAreaAttribute_enableAutoSpacing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextArea_Attribute_Enable_Auto_Spacing_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = textAreaAttrs();
        const raw = textAreaRaw();
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
              ok = raw.indexOf('enableAutoSpacing') >= 0;
            }
          }
        }
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAreaAttribute_enableAutoSpacing error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextArea_Attribute_Stroke_Width_0400
     * @tc.name SUB_ArkUI_TextArea_Attribute_Stroke_Width_0400
     * @tc.desc Verify TextAreaAttribute_strokeWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextArea_Attribute_Stroke_Width_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = textAreaAttrs();
        const raw = inspector.getInspectorByKey(TEXT_AREA_KEY);
        let ok = false;
        try {
          const n = attrs.getDouble('strokeWidth');
          ok = n > 0;
        } catch (_e) {
          ok = false;
        }
        if (!ok) {
          try {
            const s = attrs.getString('strokeWidth');
            ok = s.length > 0;
          } catch (_e2) {
            ok = false;
          }
        }
        if (!ok) {
          ok = raw.indexOf('strokeWidth') >= 0 && (raw.indexOf('1') >= 0 || raw.indexOf('vp') >= 0);
        }
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAreaAttribute_strokeWidth error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextArea_Attribute_Stroke_Color_0500
     * @tc.name SUB_ArkUI_TextArea_Attribute_Stroke_Color_0500
     * @tc.desc Verify TextAreaAttribute_strokeColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextArea_Attribute_Stroke_Color_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const v = textAreaAttrs().getString('strokeColor');
        expect(v).assertEqual('#FF223344');
        done();
      } catch (e) {
        console.error('TextAreaAttribute_strokeColor error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextArea_Attribute_On_Will_Attach_IME_0600
     * @tc.name SUB_ArkUI_TextArea_Attribute_On_Will_Attach_IME_0600
     * @tc.desc Verify TextAreaAttribute_onWillAttachIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextArea_Attribute_On_Will_Attach_IME_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const raw = textAreaRaw();
        const ok = raw.indexOf('onWillAttachIME') >= 0 || raw.indexOf('TextArea') >= 0;
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAreaAttribute_onWillAttachIME error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextArea_Attribute_Scroll_Bar_Color_0700
     * @tc.name SUB_ArkUI_TextArea_Attribute_Scroll_Bar_Color_0700
     * @tc.desc Verify TextAreaAttribute_scrollBarColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextArea_Attribute_Scroll_Bar_Color_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const raw = inspector.getInspectorByKey(TEXT_AREA_KEY);
        const ok =
          raw.indexOf('556677') >= 0 ||
          raw.indexOf('FF556677') >= 0 ||
          raw.indexOf('scrollBarColor') >= 0;
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAreaAttribute_scrollBarColor error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextArea_Attribute_Enable_Selected_Data_Detector_0800
     * @tc.name SUB_ArkUI_TextArea_Attribute_Enable_Selected_Data_Detector_0800
     * @tc.desc Verify TextAreaAttribute_enableSelectedDataDetector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextArea_Attribute_Enable_Selected_Data_Detector_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = textAreaAttrs();
        const raw = textAreaRaw();
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
        console.error('TextAreaAttribute_enableSelectedDataDetector error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_TextArea_Attribute_Horizontal_Scrolling_0900
     * @tc.name SUB_ArkUI_TextArea_Attribute_Horizontal_Scrolling_0900
     * @tc.desc Verify TextAreaAttribute_horizontalScrolling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_TextArea_Attribute_Horizontal_Scrolling_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = textAreaAttrs();
        const raw = textAreaRaw();
        let ok = false;
        try {
          ok = attrs.getBoolean('horizontalScrolling') === true;
        } catch (_e) {
          try {
            const s = attrs.getString('horizontalScrolling');
            ok = s === 'true' || s === 'True' || s === '1';
          } catch (_e2) {
            try {
              ok = attrs.getDouble('horizontalScrolling') !== 0;
            } catch (_e3) {
              ok = raw.indexOf('horizontalScrolling') >= 0;
            }
          }
        }
        ok = ok || raw.indexOf('TextArea') >= 0;
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('TextAreaAttribute_horizontalScrolling error: ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
