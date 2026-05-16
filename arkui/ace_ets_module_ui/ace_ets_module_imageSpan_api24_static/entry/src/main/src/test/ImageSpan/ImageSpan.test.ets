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

const ROUTE = 'MainAbility/pages/ImageSpan/ImageSpan';
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

function readSupportSvg2(key: string): string {
  const raw = inspector.getInspectorByKey(key);
  expect(raw !== undefined && raw !== null && raw.length > 0).assertTrue();
  return JSON.parseJsonElement(raw).getElement('$attrs').getString('supportSvg2');
}

export default function ImageSpanTest(): void {
  describe('ImageSpan', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.imageSpan.api24.static', 'EntryAbility');
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
     * @tc.number SUB_ArkUI_ImageSpan_Support_SvgTwo_0100
     * @tc.name SUB_ArkUI_ImageSpan_Support_SvgTwo_0100
     * @tc.desc Verify ImageSpan supportSvg2 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ArkUI_ImageSpan_Support_SvgTwo_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const v = readSupportSvg2('SupportSvg2_imageSpan1');
        console.info('ImageSpanSupportSvg2Test001 supportSvg2 = ' + v);
        expect(v).assertEqual('true');
        done();
      } catch (e) {
        console.error('ImageSpanSupportSvg2Test001 error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_ImageSpan_Support_SvgTwo_0200
     * @tc.name SUB_ArkUI_ImageSpan_Support_SvgTwo_0200
     * @tc.desc Verify ImageSpan supportSvg2 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ArkUI_ImageSpan_Support_SvgTwo_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const v = readSupportSvg2('SupportSvg2_imageSpan2');
        console.info('ImageSpanSupportSvg2Test002 supportSvg2 = ' + v);
        expect(v).assertEqual('false');
        done();
      } catch (e) {
        console.error('ImageSpanSupportSvg2Test002 error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_ImageSpan_Support_SvgTwo_0300
     * @tc.name SUB_ArkUI_ImageSpan_Support_SvgTwo_0300
     * @tc.desc Verify ImageSpan supportSvg2 default when unset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ArkUI_ImageSpan_Support_SvgTwo_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const v = readSupportSvg2('SupportSvg2_imageSpan3');
        console.info('ImageSpanSupportSvg2Test003 supportSvg2 = ' + v);
        expect(v).assertEqual('false');
        done();
      } catch (e) {
        console.error('ImageSpanSupportSvg2Test003 error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_ImageSpan_Support_SvgTwo_0400
     * @tc.name SUB_ArkUI_ImageSpan_Support_SvgTwo_0400
     * @tc.desc Verify ImageSpan supportSvg2 undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ArkUI_ImageSpan_Support_SvgTwo_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const v = readSupportSvg2('SupportSvg2_imageSpan4');
        console.info('ImageSpanSupportSvg2Test004 supportSvg2 = ' + v);
        expect(v).assertEqual('false');
        done();
      } catch (e) {
        console.error('ImageSpanSupportSvg2Test004 error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_ImageSpan_Support_SvgTwo_0500
     * @tc.name SUB_ArkUI_ImageSpan_Support_SvgTwo_0500
     * @tc.desc Verify ImageSpan supportSvg2 default variant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ArkUI_ImageSpan_Support_SvgTwo_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(SLEEP);
        const v = readSupportSvg2('SupportSvg2_imageSpan5');
        console.info('ImageSpanSupportSvg2Test005 supportSvg2 = ' + v);
        expect(v).assertEqual('false');
        done();
      } catch (e) {
        console.error('ImageSpanSupportSvg2Test005 error: ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
