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

export default function ContextMenuOptionsTest() {
  describe('ContextMenuOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ContextMenuOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.menu.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("ContextMenuOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindContextMenu/ContextMenuOptions',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("ContextMenuOptionsTest state pages: " + JSON.stringify(pages));
        console.info("ContextMenuOptionsTest state pages.name: " + pages.name);
        if (pages.name !== "ContextMenuOptionsIndex") {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error("ContextMenuOptionsTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("ContextMenuOptionsTest after each called");
    });

    /**
     * @tc.number ContextMenuOptionsTest_001
     * @tc.name contextMenuOptionsMask
     * @tc.desc Test ContextMenuOptions mask property, read button node and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contextMenuOptionsMask', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContextMenuOptionsTest execute: contextMenuOptionsMask START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnContextMenuMask'));
        expect(!!button).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuMask'));
        logLongString('ContextMenuOptionsTest: btnContextMenuMask node =', JSON.stringifyJsonElement(buttonNode));
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        const menuItem = await driver.findComponent(ON.id('Menu1'));
        if (menuItem !== undefined) {
          let menuNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuMask'));
          logLongString('ContextMenuOptionsTest: menu node =', JSON.stringifyJsonElement(menuNode));
        }
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('ContextMenuOptionsTest execute: contextMenuOptionsMask END');
        done();
      } catch (error) {
        console.error('ContextMenuOptionsTest execute: contextMenuOptionsMask error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ContextMenuOptionsTest_002
     * @tc.name contextMenuOptionsModalMode
     * @tc.desc Test ContextMenuOptions modalMode property, read button node and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contextMenuOptionsModalMode', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContextMenuOptionsTest execute: contextMenuOptionsModalMode START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnContextMenuModalMode'));
        expect(!!button).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuModalMode'));
        logLongString('ContextMenuOptionsTest: btnContextMenuModalMode node =', JSON.stringifyJsonElement(buttonNode));
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        const menuItem = await driver.findComponent(ON.id('Menu1'));
        if (menuItem !== undefined) {
          let menuNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuMask'));
          logLongString('ContextMenuOptionsTest: menu node =', JSON.stringifyJsonElement(menuNode));
        }
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('ContextMenuOptionsTest execute: contextMenuOptionsModalMode END');
        done();
      } catch (error) {
        console.error('ContextMenuOptionsTest execute: contextMenuOptionsModalMode error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ContextMenuOptionsTest_003
     * @tc.name contextMenuOptionsPreviewScaleMode
     * @tc.desc Test ContextMenuOptions previewScaleMode property, read button node and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contextMenuOptionsPreviewScaleMode', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContextMenuOptionsTest execute: contextMenuOptionsPreviewScaleMode START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnContextMenuPreviewScaleMode'));
        expect(!!button).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuPreviewScaleMode'));
        logLongString('ContextMenuOptionsTest: btnContextMenuPreviewScaleMode node =', JSON.stringifyJsonElement(buttonNode));
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        const menuItem = await driver.findComponent(ON.id('Menu1'));
        if (menuItem !== undefined) {
          let menuNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuMask'));
          logLongString('ContextMenuOptionsTest: menu node =', JSON.stringifyJsonElement(menuNode));
        }
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('ContextMenuOptionsTest execute: contextMenuOptionsPreviewScaleMode END');
        done();
      } catch (error) {
        console.error('ContextMenuOptionsTest execute: contextMenuOptionsPreviewScaleMode error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ContextMenuOptionsTest_004
     * @tc.name contextMenuOptionsAvailableLayoutArea
     * @tc.desc Test ContextMenuOptions availableLayoutArea property, read button node and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contextMenuOptionsAvailableLayoutArea', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContextMenuOptionsTest execute: contextMenuOptionsAvailableLayoutArea START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnContextMenuAvailableLayoutArea'));
        expect(!!button).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuAvailableLayoutArea'));
        logLongString('ContextMenuOptionsTest: btnContextMenuAvailableLayoutArea node =', JSON.stringifyJsonElement(buttonNode));
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        const menuItem = await driver.findComponent(ON.id('Menu1'));
        if (menuItem !== undefined) {
          let menuNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuMask'));
          logLongString('ContextMenuOptionsTest: menu node =', JSON.stringifyJsonElement(menuNode));
        }
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('ContextMenuOptionsTest execute: contextMenuOptionsAvailableLayoutArea END');
        done();
      } catch (error) {
        console.error('ContextMenuOptionsTest execute: contextMenuOptionsAvailableLayoutArea error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ContextMenuOptionsTest_005
     * @tc.name contextMenuOptionsAnchorPosition
     * @tc.desc Test ContextMenuOptions anchorPosition property, read button node and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contextMenuOptionsAnchorPosition', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContextMenuOptionsTest execute: contextMenuOptionsAnchorPosition START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnContextMenuAnchorPosition'));
        expect(!!button).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuAnchorPosition'));
        logLongString('ContextMenuOptionsTest: btnContextMenuAnchorPosition node =', JSON.stringifyJsonElement(buttonNode));
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        const menuItem = await driver.findComponent(ON.id('Menu1'));
        if (menuItem !== undefined) {
          let menuNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuMask'));
          logLongString('ContextMenuOptionsTest: menu node =', JSON.stringifyJsonElement(menuNode));
        }
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('ContextMenuOptionsTest execute: contextMenuOptionsAnchorPosition END');
        done();
      } catch (error) {
        console.error('ContextMenuOptionsTest execute: contextMenuOptionsAnchorPosition error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ContextMenuOptionsTest_006
     * @tc.name contextMenuOptionsKeyboardAvoidMode
     * @tc.desc Test ContextMenuOptions keyboardAvoidMode property, read button node and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contextMenuOptionsKeyboardAvoidMode', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContextMenuOptionsTest execute: contextMenuOptionsKeyboardAvoidMode START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnContextMenuKeyboardAvoidMode'));
        expect(!!button).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuKeyboardAvoidMode'));
        logLongString('ContextMenuOptionsTest: btnContextMenuKeyboardAvoidMode node =', JSON.stringifyJsonElement(buttonNode));
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        const menuItem = await driver.findComponent(ON.id('Menu1'));
        if (menuItem !== undefined) {
          let menuNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuMask'));
          logLongString('ContextMenuOptionsTest: menu node =', JSON.stringifyJsonElement(menuNode));
        }
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('ContextMenuOptionsTest execute: contextMenuOptionsKeyboardAvoidMode END');
        done();
      } catch (error) {
        console.error('ContextMenuOptionsTest execute: contextMenuOptionsKeyboardAvoidMode error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ContextMenuOptionsTest_007
     * @tc.name contextMenuOptionsMinKeyboardAvoidDistance
     * @tc.desc Test ContextMenuOptions minKeyboardAvoidDistance property, read button node and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contextMenuOptionsMinKeyboardAvoidDistance', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContextMenuOptionsTest execute: contextMenuOptionsMinKeyboardAvoidDistance START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnContextMenuMinKeyboardAvoidDistance'));
        expect(!!button).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuMinKeyboardAvoidDistance'));
        logLongString('ContextMenuOptionsTest: btnContextMenuMinKeyboardAvoidDistance node =', JSON.stringifyJsonElement(buttonNode));
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        const menuItem = await driver.findComponent(ON.id('Menu1'));
        if (menuItem !== undefined) {
          let menuNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnContextMenuMask'));
          logLongString('ContextMenuOptionsTest: menu node =', JSON.stringifyJsonElement(menuNode));
        }
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('ContextMenuOptionsTest execute: contextMenuOptionsMinKeyboardAvoidDistance END');
        done();
      } catch (error) {
        console.error('ContextMenuOptionsTest execute: contextMenuOptionsMinKeyboardAvoidDistance error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ContextMenuOptionsTest_008
     * @tc.name contextMenuOptionsOnWillAppear
     * @tc.desc Test ContextMenuOptions onWillAppear callback, verify callback is called when menu appears
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contextMenuOptionsOnWillAppear', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContextMenuOptionsTest execute: contextMenuOptionsOnWillAppear START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnContextMenuLifecycle'));
        expect(!!button).assertEqual(true);
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        const onWillAppearNode = JSON.parseJsonElement(inspector.getInspectorByKey('onWillAppearResultContextMenu'));
        const onWillAppearValue = onWillAppearNode.getElement('$attrs').getString('content');
        console.info('ContextMenuOptionsTest execute: onWillAppear result = ' + onWillAppearValue);
        expect(onWillAppearValue).assertEqual('onWillAppear_called');
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('ContextMenuOptionsTest execute: contextMenuOptionsOnWillAppear END');
        done();
      } catch (error) {
        console.error('ContextMenuOptionsTest execute: contextMenuOptionsOnWillAppear error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ContextMenuOptionsTest_009
     * @tc.name contextMenuOptionsOnDidAppear
     * @tc.desc Test ContextMenuOptions onDidAppear callback, verify callback is called after menu appears
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contextMenuOptionsOnDidAppear', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContextMenuOptionsTest execute: contextMenuOptionsOnDidAppear START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnContextMenuLifecycle'));
        expect(!!button).assertEqual(true);
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        const onDidAppearNode = JSON.parseJsonElement(inspector.getInspectorByKey('onDidAppearResultContextMenu'));
        const onDidAppearValue = onDidAppearNode.getElement('$attrs').getString('content');
        console.info('ContextMenuOptionsTest execute: onDidAppear result = ' + onDidAppearValue);
        expect(onDidAppearValue).assertEqual('onDidAppear_called');
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('ContextMenuOptionsTest execute: contextMenuOptionsOnDidAppear END');
        done();
      } catch (error) {
        console.error('ContextMenuOptionsTest execute: contextMenuOptionsOnDidAppear error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ContextMenuOptionsTest_010
     * @tc.name contextMenuOptionsOnWillDisappear
     * @tc.desc Test ContextMenuOptions onWillDisappear callback, verify callback is called when menu disappears
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contextMenuOptionsOnWillDisappear', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContextMenuOptionsTest execute: contextMenuOptionsOnWillDisappear START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnContextMenuLifecycle'));
        expect(!!button).assertEqual(true);
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        await driver.pressBack();
        await Utils.sleep(500);
        const onWillDisappearNode = JSON.parseJsonElement(inspector.getInspectorByKey('onWillDisappearResultContextMenu'));
        const onWillDisappearValue = onWillDisappearNode.getElement('$attrs').getString('content');
        console.info('ContextMenuOptionsTest execute: onWillDisappear result = ' + onWillDisappearValue);
        expect(onWillDisappearValue).assertEqual('onWillDisappear_called');
        console.info('ContextMenuOptionsTest execute: contextMenuOptionsOnWillDisappear END');
        done();
      } catch (error) {
        console.error('ContextMenuOptionsTest execute: contextMenuOptionsOnWillDisappear error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ContextMenuOptionsTest_011
     * @tc.name contextMenuOptionsOnDidDisappear
     * @tc.desc Test ContextMenuOptions onDidDisappear callback, verify callback is called after menu disappears
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contextMenuOptionsOnDidDisappear', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContextMenuOptionsTest execute: contextMenuOptionsOnDidDisappear START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnContextMenuLifecycle'));
        expect(!!button).assertEqual(true);
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        await driver.pressBack();
        await Utils.sleep(500);
        const onDidDisappearNode = JSON.parseJsonElement(inspector.getInspectorByKey('onDidDisappearResultContextMenu'));
        const onDidDisappearValue = onDidDisappearNode.getElement('$attrs').getString('content');
        console.info('ContextMenuOptionsTest execute: onDidDisappear result = ' + onDidDisappearValue);
        expect(onDidDisappearValue).assertEqual('onDidDisappear_called');
        console.info('ContextMenuOptionsTest execute: contextMenuOptionsOnDidDisappear END');
        done();
      } catch (error) {
        console.error('ContextMenuOptionsTest execute: contextMenuOptionsOnDidDisappear error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
