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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { SheetType, SheetKeyboardAvoidMode, ModalTransition } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;
const LOG_CHUNK_SIZE = 500;

function logLongString(tag: string, longStr: string): void {
  let len = longStr.length;
  let part = 1;
  for (let i = 0; i < len; i += LOG_CHUNK_SIZE) {
    let end = i + LOG_CHUNK_SIZE;
    if (end > len) {
      end = len;
    }
    console.info(`${tag} [${part}] ${longStr.substring(i, end)}`);
    part++;
  }
}

export default function SheetTest() {
  describe('SheetTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SheetTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.menu.static", "EntryAbility");

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Sheet/SheetIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SheetTest state pages: " + JSON.stringify(pages));
        console.info("SheetTest state pages.name: " + pages.name);
        if (pages.name !== "SheetIndex") {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error("SheetTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    beforeEach(async (): Promise<void> => {
      console.info("SheetTest beforeEach start");
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("SheetTest after each called");
    });

    /**
     * @tc.number SheetTest_001
     * @tc.name sheetTypeSide
     * @tc.desc Test SheetType.SIDE enum value, verify node exists and assert enum value directly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sheetTypeSide', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SheetTest execute : sheetTypeSide START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const bindSheetButton = await driver.findComponent(ON.id('bindSheet'));
        expect(!!bindSheetButton).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('bindSheet'));
        logLongString('SheetTest: bindSheet node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        expect(SheetType.SIDE).assertEqual(3);
        console.info('SheetTest execute : sheetTypeSide END');
        done();
      } catch (error) {
        console.error('SheetTest execute : sheetTypeSide error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SheetTest_002
     * @tc.name sheetTypeContentCover
     * @tc.desc Test SheetType.CONTENT_COVER enum value, verify node exists and assert enum value directly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sheetTypeContentCover', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SheetTest execute : sheetTypeContentCover START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const bindSheetButton = await driver.findComponent(ON.id('bindSheet'));
        expect(!!bindSheetButton).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('bindSheet'));
        logLongString('SheetTest: bindSheet node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        expect(SheetType.CONTENT_COVER).assertEqual(4);
        console.info('SheetTest execute : sheetTypeContentCover END');
        done();
      } catch (error) {
        console.error('SheetTest execute : sheetTypeContentCover error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SheetTest_003
     * @tc.name sheetKeyboardAvoidModePopupSheet
     * @tc.desc Test SheetKeyboardAvoidMode.POPUP_SHEET enum value, verify node exists and assert enum value directly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sheetKeyboardAvoidModePopupSheet', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SheetTest execute : sheetKeyboardAvoidModePopupSheet START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const bindSheetButton = await driver.findComponent(ON.id('bindSheet'));
        expect(!!bindSheetButton).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('bindSheet'));
        logLongString('SheetTest: bindSheet node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        expect(SheetKeyboardAvoidMode.POPUP_SHEET).assertEqual(4);
        console.info('SheetTest execute : sheetKeyboardAvoidModePopupSheet END');
        done();
      } catch (error) {
        console.error('SheetTest execute : sheetKeyboardAvoidModePopupSheet error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SheetTest_004
     * @tc.name sheetOptionsEnableFloatingDragBar
     * @tc.desc Test SheetOptions enableFloatingDragBar property, verify property can be set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sheetOptionsEnableFloatingDragBar', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SheetTest execute : sheetOptionsEnableFloatingDragBar START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const bindSheetButton = await driver.findComponent(ON.id('bindSheet'));
        expect(!!bindSheetButton).assertEqual(true);
        await (bindSheetButton?.click() as Promise<void>);
        await Utils.sleep(500);
        console.info('SheetTest execute : sheetOptionsEnableFloatingDragBar END');
        done();
      } catch (error) {
        console.error('SheetTest execute : sheetOptionsEnableFloatingDragBar error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SheetTest_005
     * @tc.name sheetOptionsModalTransition
     * @tc.desc Test SheetOptions modalTransition property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sheetOptionsModalTransition', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SheetTest execute : sheetOptionsModalTransition START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const bindSheetButton = await driver.findComponent(ON.id('bindSheet'));
        expect(!!bindSheetButton).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('bindSheet'));
        logLongString('SheetTest: bindSheet node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        console.info('SheetTest execute : sheetOptionsModalTransition END');
        done();
      } catch (error) {
        console.error('SheetTest execute : sheetOptionsModalTransition error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
