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
import { Driver, ON, Component } from '@kit.TestKit';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import Utils from '../../../../main/ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';

const ROUTE = 'MainAbility/pages/OhosArkuiObserver/OhosArkuiObserver';
const SLEEP = 500;
const TEXT_INPUT_ID = 'textInput';

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

function expectUniqueIdLine(uidLine: string): void {
  expect(uidLine.indexOf('uid:') === 0).assertTrue();
  const tail = uidLine.substring(4);
  expect(tail.length > 0).assertTrue();
}

async function globalOnAndInput(driver: Driver, text: string): Promise<void> {
  const globalObserverOpenButton: Component = (await driver.findComponent(
    ON.id('全局监听(开)')
  )) as Component;
  await globalObserverOpenButton.click();

  const textInput: Component = (await driver.findComponent(ON.id(TEXT_INPUT_ID))) as Component;
  await textInput.inputText(text);

  await Utils.sleep(SLEEP);
  await driver.triggerKey(2070);
  await Utils.sleep(SLEEP);
}

async function localOnAndInput(driver: Driver, text: string): Promise<void> {
  const localObserverOpenButton: Component = (await driver.findComponent(
    ON.id('局部textInput(开)')
  )) as Component;
  await localObserverOpenButton.click();

  const textInput: Component = (await driver.findComponent(ON.id(TEXT_INPUT_ID))) as Component;
  await textInput.inputText(text);

  await Utils.sleep(SLEEP);
  await driver.triggerKey(2070);
  await Utils.sleep(SLEEP);
}

export default function OhosArkuiObserverTest(): void {
  describe('OhosArkuiObserver', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.arkuiObserver.api24.static', 'EntryAbility');
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
     * @tc.number SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Id_0100
     * @tc.name SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Id_0100
     * @tc.desc Verify TextChangeEventInfo id global onTextChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Id_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver: Driver = Driver.create();
        await globalOnAndInput(driver, 'evt_id');
        const comp: Component = (await driver.findComponent(
          ON.id('observer_global_TextChangeEventInfo_id')
        )) as Component;
        expect((await comp.getText())).assertEqual(`id:${TEXT_INPUT_ID}`);
        done();
      } catch (e) {
        console.error('[TextChangeEventInfo_id] error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Unique_Id_0200
     * @tc.name SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Unique_Id_0200
     * @tc.desc Verify TextChangeEventInfo uniqueId global onTextChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Unique_Id_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver: Driver = Driver.create();
        await globalOnAndInput(driver, 'evt_uid');
        const comp: Component = (await driver.findComponent(
          ON.id('observer_global_TextChangeEventInfo_uniqueId')
        )) as Component;
        expectUniqueIdLine(await comp.getText());
        done();
      } catch (e) {
        console.error('[TextChangeEventInfo_uniqueId] error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Content_0300
     * @tc.name SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Content_0300
     * @tc.desc Verify TextChangeEventInfo content global onTextChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Content_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver: Driver = Driver.create();
        await globalOnAndInput(driver, 'evt_content_body');
        const comp: Component = (await driver.findComponent(ON.id('globalOutputTextInput'))) as Component;
        expect((await comp.getText())).assertEqual('global:evt_content_body');
        done();
      } catch (e) {
        console.error('[TextChangeEventInfo_content] error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Id_Local_0400
     * @tc.name SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Id_Local_0400
     * @tc.desc Verify TextChangeEventInfo id local onTextChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Id_Local_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver: Driver = Driver.create();
        await localOnAndInput(driver, 'lid_probe');
        const comp: Component = (await driver.findComponent(
          ON.id('observer_local_TextChangeEventInfo_id')
        )) as Component;
        expect((await comp.getText())).assertEqual(`id:${TEXT_INPUT_ID}`);
        done();
      } catch (e) {
        console.error('[TextChangeEventInfo_id_local] error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Unique_Id_Local_0500
     * @tc.name SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Unique_Id_Local_0500
     * @tc.desc Verify TextChangeEventInfo uniqueId local onTextChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Unique_Id_Local_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver: Driver = Driver.create();
        await localOnAndInput(driver, 'luid_probe');
        const comp: Component = (await driver.findComponent(
          ON.id('observer_local_TextChangeEventInfo_uniqueId')
        )) as Component;
        expectUniqueIdLine(await comp.getText());
        done();
      } catch (e) {
        console.error('[TextChangeEventInfo_uniqueId_local] error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Content_Local_0600
     * @tc.name SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Content_Local_0600
     * @tc.desc Verify TextChangeEventInfo content local onTextChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_OhosArkuiObserver_Text_Change_Event_Info_Content_Local_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver: Driver = Driver.create();
        await localOnAndInput(driver, 'evt_content_local');
        const comp: Component = (await driver.findComponent(ON.id('localOutputTextInput'))) as Component;
        expect((await comp.getText())).assertEqual('local:evt_content_local');
        done();
      } catch (e) {
        console.error('[TextChangeEventInfo_content_local] error: ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_OhosArkuiObserver_Text_Input_Observer_0700
     * @tc.name SUB_ArkUI_OhosArkuiObserver_Text_Input_Observer_0700
     * @tc.desc Verify global text observer on and off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_OhosArkuiObserver_Text_Input_Observer_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textInputObserverTest_0010] START');
      try {
        const driver: Driver = Driver.create();
        const globalObserverOpenButton: Component = (await driver.findComponent(
          ON.id('全局监听(开)')
        )) as Component;
        await globalObserverOpenButton.click();

        const textInput: Component = (await driver.findComponent(ON.id(TEXT_INPUT_ID))) as Component;
        await textInput.inputText('textInputObserverTest_0010');

        await Utils.sleep(SLEEP);
        await driver.triggerKey(2070);
        await Utils.sleep(SLEEP);

        const globalOutputTextInput1: Component = (await driver.findComponent(
          ON.id('globalOutputTextInput')
        )) as Component;
        const globalOutput1: string = await globalOutputTextInput1.getText();
        console.info('[textInputObserverTest_0010] textContent: ' + globalOutput1);
        expect(globalOutput1).assertEqual('global:textInputObserverTest_0010');

        const globalId1: Component = (await driver.findComponent(
          ON.id('observer_global_TextChangeEventInfo_id')
        )) as Component;
        expect((await globalId1.getText())).assertEqual(`id:${TEXT_INPUT_ID}`);
        const globalUid1: Component = (await driver.findComponent(
          ON.id('observer_global_TextChangeEventInfo_uniqueId')
        )) as Component;
        expectUniqueIdLine(await globalUid1.getText());

        const globalObserverCloseButton: Component = (await driver.findComponent(
          ON.id('全局监听(关)')
        )) as Component;
        await globalObserverCloseButton.click();

        await textInput.inputText('Add');
        await Utils.sleep(SLEEP);
        await driver.triggerKey(2070);
        await Utils.sleep(SLEEP);

        const globalOutputTextInput2: Component = (await driver.findComponent(
          ON.id('globalOutputTextInput')
        )) as Component;
        const globalOutput2: string = await globalOutputTextInput2.getText();
        console.info('[textInputObserverTest_0010] textContent: ' + globalOutput2);
        expect(globalOutput2).assertEqual('global:textInputObserverTest_0010');

        console.info('[textInputObserverTest_0010] END');
        done();
      } catch (e) {
        console.error('[textInputObserverTest_0010] error: ' + e);
        expect().assertFail();
        done();
      }
    });


  });
}
