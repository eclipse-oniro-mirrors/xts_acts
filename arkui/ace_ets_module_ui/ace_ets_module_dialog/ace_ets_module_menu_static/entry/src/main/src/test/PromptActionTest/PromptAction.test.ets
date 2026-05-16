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
import { promptAction } from '@kit.ArkUI';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;
const DIALOG_ANIMATION_TIME = 3000;

export default function PromptActionTest() {
  describe('PromptActionTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("PromptActionTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.menu.static", "EntryAbility");

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/promptAction',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("PromptActionTest state pages: " + JSON.stringify(pages));
        console.info("PromptActionTest state pages.name: " + pages.name);
        if (pages.name !== "promptAction") {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error("PromptActionTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    beforeEach(async (): Promise<void> => {
      console.info("PromptActionTest beforeEach start");
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("PromptActionTest after each called");
    });

    /**
     * @tc.number PromptActionTest_001
     * @tc.name dialogStateUninitialized
     * @tc.desc Test dialog state UNINITIALIZED, verify state=0 when directly reading dialog state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dialogStateUninitialized', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionTest execute : dialogStateUninitialized START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const getStateButton = await driver.findComponent(ON.id('btnGetState'));
        expect(!!getStateButton).assertEqual(true);
        await (getStateButton?.click() as Promise<void>);
        await Utils.sleep(100);
        const stateInfoNode = JSON.parseJsonElement(inspector.getInspectorByKey('stateInfo'));
        const stateValue = parseInt(stateInfoNode.getElement('$attrs').getString('content'));
        console.info('PromptActionTest execute : dialog state = ' + stateValue);
        expect(stateValue).assertEqual(0);
        console.info('PromptActionTest execute : dialogStateUninitialized END');
        done();
      } catch (error) {
        console.error('PromptActionTest execute : dialogStateUninitialized error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PromptActionTest_002
     * @tc.name dialogStateEnumAssertion
     * @tc.desc Test CommonState enum values, verify enum values directly without reading component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dialogStateEnumAssertion', Level.LEVEL1, (done: () => void) => {
      console.info('PromptActionTest execute : dialogStateEnumAssertion START');
      expect(promptAction.CommonState.UNINITIALIZED).assertEqual(0);
      expect(promptAction.CommonState.INITIALIZED).assertEqual(1);
      expect(promptAction.CommonState.APPEARING).assertEqual(2);
      expect(promptAction.CommonState.APPEARED).assertEqual(3);
      expect(promptAction.CommonState.DISAPPEARING).assertEqual(4);
      expect(promptAction.CommonState.DISAPPEARED).assertEqual(5);
      console.info('PromptActionTest execute : dialogStateEnumAssertion END');
      done();
    });

    /**
     * @tc.number PromptActionTest_003
     * @tc.name dialogStateAppearing
     * @tc.desc Test dialog state APPEARING, verify state=2 when clicking button to get state after opening dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dialogStateAppearing', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionTest execute : dialogStateAppearing START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnOpenDialog'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(100);
        const getStateButton = await driver.findComponent(ON.id('btnGetStateOpen'));
        expect(!!getStateButton).assertEqual(true);
        await (getStateButton?.click() as Promise<void>);
        await Utils.sleep(500);
        const stateInfoNode = JSON.parseJsonElement(inspector.getInspectorByKey('stateText'));
        const stateValue = parseInt(stateInfoNode.getElement('$attrs').getString('content'));
        console.info('PromptActionTest execute : dialog state after opening = ' + stateValue);
        expect(stateValue).assertEqual(2);
        const closeDialogButton = await driver.findComponent(ON.id('btnCloseDialog'));
        expect(!!closeDialogButton).assertEqual(true);
        await (closeDialogButton?.click() as Promise<void>);
        console.info('PromptActionTest execute : dialogStateAppearing END');
        done();
      } catch (error) {
        console.error('PromptActionTest execute : dialogStateAppearing error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PromptActionTest_004
     * @tc.name dialogStateAppeared
     * @tc.desc Test dialog state APPEARED, verify state=3 when reading dialog state 3 seconds after opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dialogStateAppeared', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionTest execute : dialogStateAppeared START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnOpenDialog'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await CommonFunc.sleep(DIALOG_ANIMATION_TIME + 500);
        const getStateButton = await driver.findComponent(ON.id('btnGetStateOpen'));
        expect(!!getStateButton).assertEqual(true);
        await (getStateButton?.click() as Promise<void>);
        await Utils.sleep(100);
        const stateInfoNode = JSON.parseJsonElement(inspector.getInspectorByKey('stateText'));
        const stateValue = parseInt(stateInfoNode.getElement('$attrs').getString('content'));
        console.info('PromptActionTest execute : dialog state after 3 seconds = ' + stateValue);
        expect(stateValue).assertEqual(3);
        const closeDialogButton = await driver.findComponent(ON.id('btnCloseDialog'));
        expect(!!closeDialogButton).assertEqual(true);
        await (closeDialogButton?.click() as Promise<void>);
        console.info('PromptActionTest execute : dialogStateAppeared END');
        done();
      } catch (error) {
        console.error('PromptActionTest execute : dialogStateAppeared error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PromptActionTest_005
     * @tc.name dialogStateDisappearing
     * @tc.desc Test dialog state DISAPPEARING, verify state=4 when clicking button to get state after closing dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dialogStateDisappearing', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionTest execute : dialogStateDisappearing START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnOpenDialog'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await CommonFunc.sleep(DIALOG_ANIMATION_TIME + 500);
        const closeDialogButton = await driver.findComponent(ON.id('btnCloseDialog'));
        expect(!!closeDialogButton).assertEqual(true);
        await (closeDialogButton?.click() as Promise<void>);
        await Utils.sleep(100);
        const getStateButton = await driver.findComponent(ON.id('btnGetState'));
        expect(!!getStateButton).assertEqual(true);
        await (getStateButton?.click() as Promise<void>);
        await Utils.sleep(100);
        const stateInfoNode = JSON.parseJsonElement(inspector.getInspectorByKey('stateInfo'));
        const stateValue = parseInt(stateInfoNode.getElement('$attrs').getString('content'));
        console.info('PromptActionTest execute : dialog state after closing = ' + stateValue);
        expect(stateValue).assertEqual(4);
        console.info('PromptActionTest execute : dialogStateDisappearing END');
        done();
      } catch (error) {
        console.error('PromptActionTest execute : dialogStateDisappearing error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PromptActionTest_006
     * @tc.name dialogStateDisappeared
     * @tc.desc Test dialog state DISAPPEARED, verify state=5 when reading dialog state 3 seconds after closing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dialogStateDisappeared', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionTest execute : dialogStateDisappeared START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnOpenDialog'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await CommonFunc.sleep(DIALOG_ANIMATION_TIME + 500);
        const closeDialogButton = await driver.findComponent(ON.id('btnCloseDialog'));
        expect(!!closeDialogButton).assertEqual(true);
        await (closeDialogButton?.click() as Promise<void>);
        await CommonFunc.sleep(DIALOG_ANIMATION_TIME + 500);
        const getStateButton = await driver.findComponent(ON.id('btnGetState'));
        expect(!!getStateButton).assertEqual(true);
        await (getStateButton?.click() as Promise<void>);
        await Utils.sleep(100);
        const stateInfoNode = JSON.parseJsonElement(inspector.getInspectorByKey('stateInfo'));
        const stateValue = parseInt(stateInfoNode.getElement('$attrs').getString('content'));
        console.info('PromptActionTest execute : dialog state after 3 seconds of closing = ' + stateValue);
        expect(stateValue).assertEqual(5);
        console.info('PromptActionTest execute : dialogStateDisappeared END');
        done();
      } catch (error) {
        console.error('PromptActionTest execute : dialogStateDisappeared error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PromptActionTest_007
     * @tc.name dialogControllerAppStorage
     * @tc.desc Test dialog controller via AppStorage, verify getState() returns correct value after reading from AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dialogControllerAppStorage', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionTest execute : dialogControllerAppStorage START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const dialogController = AppStorage.get<promptAction.DialogController>('dialogController') as promptAction.DialogController;
        expect(dialogController != null).assertTrue();
        const state = dialogController.getState();
        console.info('PromptActionTest execute : dialog state from AppStorage = ' + state);
        expect(state).assertEqual(promptAction.CommonState.DISAPPEARED);
        console.info('PromptActionTest execute : dialogControllerAppStorage END');
        done();
      } catch (error) {
        console.error('PromptActionTest execute : dialogControllerAppStorage error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PromptActionTest_008
     * @tc.name actionMenuOnWillAppear
     * @tc.desc Test ActionMenuOptions onWillAppear callback, verify callback is called when menu appears
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('actionMenuOnWillAppear', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionTest execute : actionMenuOnWillAppear START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const showMenuButton = await driver.findComponent(ON.id('btnShowActionMenu'));
        expect(!!showMenuButton).assertEqual(true);
        await (showMenuButton?.click() as Promise<void>);
        await Utils.sleep(500);
        const onWillAppearNode = JSON.parseJsonElement(inspector.getInspectorByKey('onWillAppearResult'));
        const onWillAppearValue = onWillAppearNode.getElement('$attrs').getString('content');
        console.info('PromptActionTest execute : onWillAppear result = ' + onWillAppearValue);
        expect(onWillAppearValue).assertEqual('onWillAppear_called');
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('PromptActionTest execute : actionMenuOnWillAppear END');
        done();
      } catch (error) {
        console.error('PromptActionTest execute : actionMenuOnWillAppear error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PromptActionTest_009
     * @tc.name actionMenuOnDidAppear
     * @tc.desc Test ActionMenuOptions onDidAppear callback, verify callback is called after menu appears
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('actionMenuOnDidAppear', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionTest execute : actionMenuOnDidAppear START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const showMenuButton = await driver.findComponent(ON.id('btnShowActionMenu'));
        expect(!!showMenuButton).assertEqual(true);
        await (showMenuButton?.click() as Promise<void>);
        await Utils.sleep(500);
        const onDidAppearNode = JSON.parseJsonElement(inspector.getInspectorByKey('onDidAppearResult'));
        const onDidAppearValue = onDidAppearNode.getElement('$attrs').getString('content');
        console.info('PromptActionTest execute : onDidAppear result = ' + onDidAppearValue);
        expect(onDidAppearValue).assertEqual('onDidAppear_called');
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('PromptActionTest execute : actionMenuOnDidAppear END');
        done();
      } catch (error) {
        console.error('PromptActionTest execute : actionMenuOnDidAppear error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PromptActionTest_010
     * @tc.name actionMenuOnWillDisappear
     * @tc.desc Test ActionMenuOptions onWillDisappear callback, verify callback is called when menu disappears
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('actionMenuOnWillDisappear', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionTest execute : actionMenuOnWillDisappear START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const showMenuButton = await driver.findComponent(ON.id('btnShowActionMenu'));
        expect(!!showMenuButton).assertEqual(true);
        await (showMenuButton?.click() as Promise<void>);
        await Utils.sleep(500);
        await driver.pressBack();
        await Utils.sleep(200);
        const onWillDisappearNode = JSON.parseJsonElement(inspector.getInspectorByKey('onWillDisappearResult'));
        const onWillDisappearValue = onWillDisappearNode.getElement('$attrs').getString('content');
        console.info('PromptActionTest execute : onWillDisappear result = ' + onWillDisappearValue);
        expect(onWillDisappearValue).assertEqual('onWillDisappear_called');
        console.info('PromptActionTest execute : actionMenuOnWillDisappear END');
        done();
      } catch (error) {
        console.error('PromptActionTest execute : actionMenuOnWillDisappear error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PromptActionTest_011
     * @tc.name actionMenuOnDidDisappear
     * @tc.desc Test ActionMenuOptions onDidDisappear callback, verify callback is called after menu disappears
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('actionMenuOnDidDisappear', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionTest execute : actionMenuOnDidDisappear START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const showMenuButton = await driver.findComponent(ON.id('btnShowActionMenu'));
        expect(!!showMenuButton).assertEqual(true);
        await (showMenuButton?.click() as Promise<void>);
        await Utils.sleep(500);
        await driver.pressBack();
        await Utils.sleep(200);
        const onDidDisappearNode = JSON.parseJsonElement(inspector.getInspectorByKey('onDidDisappearResult'));
        const onDidDisappearValue = onDidDisappearNode.getElement('$attrs').getString('content');
        console.info('PromptActionTest execute : onDidDisappear result = ' + onDidDisappearValue);
        expect(onDidDisappearValue).assertEqual('onDidDisappear_called');
        console.info('PromptActionTest execute : actionMenuOnDidDisappear END');
        done();
      } catch (error) {
        console.error('PromptActionTest execute : actionMenuOnDidDisappear error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
