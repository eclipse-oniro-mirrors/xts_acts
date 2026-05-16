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

const ROUTE = 'MainAbility/pages/CommonPage/CommonPage';
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

function readShowCounterOptionColor(key: string, field: string): string {
  const raw = inspector.getInspectorByKey(key);
  expect(raw !== undefined && raw !== null && raw.length > 0).assertTrue();
  const attrs = JSON.parseJsonElement(raw).getElement('$attrs');
  try {
    return attrs.getElement('showCounter').getElement('options').getString(field);
  } catch (_err) {
    return attrs.getElement('showCounterApi22').getElement('options').getString(field);
  }
}

export default function CommonTest(): void {
  describe('Common', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.common.api24.static', 'EntryAbility');
    });

    beforeEach(() => {
      try {
        replaceUrlForTest(ROUTE);
      } catch (_err) {
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP);
    });

    /**
     * @tc.number SUB_ArkUI_CommonPage_Input_Counter_Options_Counter_Text_Color_0100
     * @tc.name SUB_ArkUI_CommonPage_Input_Counter_Options_Counter_Text_Color_0100
     * @tc.desc Verify InputCounterOptions counterTextColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_CommonPage_Input_Counter_Options_Counter_Text_Color_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const color = readShowCounterOptionColor('Common_textArea_counterTextColor', 'counterTextColor');
        console.info('CommonPageTest counterTextColor = ' + color);
        expect(color).assertEqual('#FF112233');
        done();
      } catch (e) {
        console.error('InputCounterOptions_counterTextColor error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_CommonPage_Input_Counter_Options_Counter_Text_Overflow_Color_0200
     * @tc.name SUB_ArkUI_CommonPage_Input_Counter_Options_Counter_Text_Overflow_Color_0200
     * @tc.desc Verify InputCounterOptions counterTextOverflowColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_CommonPage_Input_Counter_Options_Counter_Text_Overflow_Color_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const color = readShowCounterOptionColor('Common_textArea_counterTextOverflowColor', 'counterTextOverflowColor');
        console.info('CommonPageTest counterTextOverflowColor = ' + color);
        expect(color).assertEqual('#FF445566');
        done();
      } catch (e) {
        console.error('InputCounterOptions_counterTextOverflowColor error: ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
