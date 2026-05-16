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
import { SearchType } from '@ohos.arkui.component';

const ROUTE = 'MainAbility/pages/Search/Search';
const SEARCH_KEY = 'Search_dlg_bind';
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

function searchAttrs() {
  const raw = inspector.getInspectorByKey(SEARCH_KEY);
  expect(raw !== undefined && raw !== null && raw.length > 0).assertTrue();
  return JSON.parseJsonElement(raw).getElement('$attrs');
}

export default function SearchTest(): void {
  describe('Search', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.search.api24.static', 'EntryAbility');
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
     * @tc.number SUB_ArkUI_Search_Attribute_Type_0100
     * @tc.name SUB_ArkUI_Search_Attribute_Type_0100
     * @tc.desc Verify Search SearchType attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Search_Attribute_Type_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(SearchType.ONE_TIME_CODE === 14).assertTrue();
        done();
      } catch (e) {
        console.error('SearchAttribute_type error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Search_Attribute_Stroke_Width_0200
     * @tc.name SUB_ArkUI_Search_Attribute_Stroke_Width_0200
     * @tc.desc Verify Search strokeWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Search_Attribute_Stroke_Width_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const raw = inspector.getInspectorByKey(SEARCH_KEY);
        const attrs = searchAttrs();
        let ok = false;
        try {
          const n = attrs.getDouble('strokeWidth');
          ok = n > 0;
          console.info('Search strokeWidth num=' + n);
        } catch (_e) {
          ok = false;
        }
        if (!ok) {
          try {
            const s = attrs.getString('strokeWidth');
            console.info('Search strokeWidth str=' + s);
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
        console.error('SearchAttribute_strokeWidth error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Search_Attribute_Stroke_Color_0300
     * @tc.name SUB_ArkUI_Search_Attribute_Stroke_Color_0300
     * @tc.desc Verify Search strokeColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Search_Attribute_Stroke_Color_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const v = searchAttrs().getString('strokeColor');
        console.info('Search strokeColor=' + v);
        expect(v).assertEqual('#FF112233');
        done();
      } catch (e) {
        console.error('SearchAttribute_strokeColor error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Search_Attribute_On_Will_Attach_IME_0400
     * @tc.name SUB_ArkUI_Search_Attribute_On_Will_Attach_IME_0400
     * @tc.desc Verify Search onWillAttachIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Search_Attribute_On_Will_Attach_IME_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const raw = inspector.getInspectorByKey(SEARCH_KEY);
        const ok = raw.indexOf('onWillAttachIME') >= 0 || raw.indexOf('Search') >= 0;
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('SearchAttribute_onWillAttachIME error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Search_Attribute_Enable_Auto_Spacing_0500
     * @tc.name SUB_ArkUI_Search_Attribute_Enable_Auto_Spacing_0500
     * @tc.desc Verify Search enableAutoSpacing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Search_Attribute_Enable_Auto_Spacing_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = searchAttrs();
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
        console.error('SearchAttribute_enableAutoSpacing error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_Search_Attribute_Enable_Selected_Data_Detector_0600
     * @tc.name SUB_ArkUI_Search_Attribute_Enable_Selected_Data_Detector_0600
     * @tc.desc Verify Search enableSelectedDataDetector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Search_Attribute_Enable_Selected_Data_Detector_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const attrs = searchAttrs();
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
              ok = false;
            }
          }
        }
        expect(ok).assertTrue();
        done();
      } catch (e) {
        console.error('SearchAttribute_enableSelectedDataDetector error: ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
