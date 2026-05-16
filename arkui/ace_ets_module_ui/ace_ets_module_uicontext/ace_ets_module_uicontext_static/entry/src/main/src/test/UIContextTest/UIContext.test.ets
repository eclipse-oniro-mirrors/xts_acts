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
import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/UIContext/UIContextIndex';
const PAGE_NAME = 'UIContextIndex';
const OPEN_BIND_SHEET_KEY = 'uiContextOpenBindSheetStatus';
const UPDATE_BIND_SHEET_KEY = 'uiContextUpdateBindSheetStatus';
const CLOSE_BIND_SHEET_KEY = 'uiContextCloseBindSheetStatus';

function getContentByKey(key: string): string {
  const text = inspector.getInspectorByKey(key);
  const obj = JSON.parseJsonElement(text);
  return obj.getElement('$attrs').getString('content');
}

async function ensurePageReady(): Promise<void> {
  const options: router.RouterOptions = { url: PAGE_URL };
  AppStorage.setOrCreate<string>(OPEN_BIND_SHEET_KEY, 'init');
  AppStorage.setOrCreate<string>(UPDATE_BIND_SHEET_KEY, 'init');
  AppStorage.setOrCreate<string>(CLOSE_BIND_SHEET_KEY, 'init');
  AppStorage.set<string>(OPEN_BIND_SHEET_KEY, 'init');
  AppStorage.set<string>(UPDATE_BIND_SHEET_KEY, 'init');
  AppStorage.set<string>(CLOSE_BIND_SHEET_KEY, 'init');
  const uiRouter = AppStorage.get<Router>('router');
  if (uiRouter !== undefined) {
    try {
      uiRouter.clear();
    } catch (error) {
      console.error('tc.name=beforeEach clear error: ' + error);
    }
    uiRouter.replaceUrl(options);
    await CommonFunc.sleep(SLEEP_TIME);
  }
}

async function clickById(id: string): Promise<void> {
  const driver = Driver.create();
  const comp = await driver.findComponent(ON.id(id));
  expect(comp !== null).assertTrue();
  await (comp?.click() as Promise<void>);
  await CommonFunc.sleep(400);
}

function getAppStorageStatus(key: string): string {
  const value = AppStorage.get<string>(key);
  return value !== undefined ? value : 'init';
}

async function waitStatusByAppStorage(key: string, expected: string, timeoutMs: number = 5000): Promise<void> {
  const intervalMs = 200;
  const maxRetry = Math.floor(timeoutMs / intervalMs);
  for (let index = 0; index < maxRetry; index++) {
    if (getAppStorageStatus(key) === expected) {
      return;
    }
    await CommonFunc.sleep(intervalMs);
  }
  expect(getAppStorageStatus(key)).assertEqual(expected);
}

export default function UIContextTest() {
  describe('UIContextTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.uicontext.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      await ensurePageReady();
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number UIContextTest_001
     * @tc.name resolveUIContext
     * @tc.desc Verify UIContext.resolveUIContext method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('resolveUIContext', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await clickById('uiContextResolveUIContextBtn');
        expect(getContentByKey('uiContextResolveUIContextStatus')).assertEqual('resolveUIContext_ok');
      } catch (error) {
        console.error('tc.name=resolveUIContext error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number UIContextTest_002
     * @tc.name getMagnifier
     * @tc.desc Verify UIContext.getMagnifier method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getMagnifier', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await clickById('uiContextGetMagnifierBtn');
        expect(getContentByKey('uiContextGetMagnifierStatus')).assertEqual('getMagnifier_ok');
      } catch (error) {
        console.error('tc.name=getMagnifier error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number UIContextTest_003
     * @tc.name getMeasureUtils
     * @tc.desc Verify UIContext.getMeasureUtils method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getMeasureUtils', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await clickById('uiContextGetMeasureUtilsBtn');
        expect(getContentByKey('uiContextGetMeasureUtilsStatus')).assertEqual('getMeasureUtils_ok');
      } catch (error) {
        console.error('tc.name=getMeasureUtils error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number UIContextTest_004
     * @tc.name animateToImmediately
     * @tc.desc Verify UIContext.animateToImmediately method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('animateToImmediately', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await clickById('uiContextAnimateToImmediatelyBtn');
        expect(getContentByKey('uiContextAnimateToImmediatelyStatus')).assertEqual('animateToImmediately_ok');
      } catch (error) {
        console.error('tc.name=animateToImmediately error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number UIContextTest_006
     * @tc.name vp2px
     * @tc.desc Verify UIContext.vp2px method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('vp2px', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await clickById('uiContextVp2pxBtn');
        expect(getContentByKey('uiContextVp2pxStatus')).assertEqual('vp2px_ok');
      } catch (error) {
        console.error('tc.name=vp2px error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number UIContextTest_008
     * @tc.name openBindSheet
     * @tc.desc Verify UIContext.openBindSheet method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('openBindSheet', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await clickById('uiContextOpenBindSheetBtn');
        await waitStatusByAppStorage(OPEN_BIND_SHEET_KEY, 'openBindSheet_ok', 6000);
      } catch (error) {
        console.error('tc.name=openBindSheet error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number UIContextTest_009
     * @tc.name updateBindSheet
     * @tc.desc Verify UIContext.updateBindSheet method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('updateBindSheet', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await clickById('uiContextUpdateBindSheetBtn');
        await waitStatusByAppStorage(UPDATE_BIND_SHEET_KEY, 'updateBindSheet_ok', 6000);
      } catch (error) {
        console.error('tc.name=updateBindSheet error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number UIContextTest_010
     * @tc.name closeBindSheet
     * @tc.desc Verify UIContext.closeBindSheet method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('closeBindSheet', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await clickById('uiContextCloseBindSheetBtn');
        await waitStatusByAppStorage(CLOSE_BIND_SHEET_KEY, 'closeBindSheet_ok', 6000);
      } catch (error) {
        console.error('tc.name=closeBindSheet error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number UIContextTest_011
     * @tc.name setCustomKeyboardContinueFeature
     * @tc.desc Verify UIContext.setCustomKeyboardContinueFeature method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('setCustomKeyboardContinueFeature', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await clickById('uiContextSetCustomKeyboardContinueFeatureBtn');
        expect(getContentByKey('uiContextSetCustomKeyboardContinueFeatureStatus')).assertEqual('setCustomKeyboardContinueFeature_ok');
      } catch (error) {
        console.error('tc.name=setCustomKeyboardContinueFeature error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
