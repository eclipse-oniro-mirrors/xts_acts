'use static'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, Component } from '@kit.TestKit';

function doPaste(driver: Driver, componentId: string){
  let text = await driver.findComponent(ON.id(componentId)) as Component;
  await text.longClick();
  await CommonFunc.sleep(500);
  let selectionMenu = await driver.findComponent(ON.text('粘贴')) as Component;
  await selectionMenu.click();
  await CommonFunc.sleep(500);
}


export default function TextInputOnPasteTest() {
  describe('TextInputOnPasteTest', () => {
    beforeAll(() => {
      console.info("TextInputOnPasteTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputOnPasteTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputOnPaste',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputOnPasteTest state pages: " + JSON.stringify(pages));
        if (!("TextInputOnPaste" == pages.name)) {
          console.info("get TextInputOnPasteTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputOnPasteTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextInputOnPasteTest_static_0010
         * @tc.name     TextInputOnPasteTest_static_0010
         * @tc.desc     TextInputOnPasteTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextInputOnPasteTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputOnPasteTest_static_0010] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      doPaste(driver, 'TextInput_OnPaste_Undefined0')
      let pasteValue1 = await driver.findComponent(ON.id('TextInput_OnPaste_Value0')) as Component;
      let text = await pasteValue1.getText();
      console.info('[TextInputOnPasteTest_static_0010] TextInputOnPasteUndefined: ' + text);
      expect(text).assertEqual('pasteValue: ');

      doPaste(driver, 'TextInput_OnPaste_Dynamic0')
      let pasteValue2 = await driver.findComponent(ON.id('TextInput_OnPaste_Value0')) as Component;
      text = await pasteValue2.getText();
      console.info('[TextInputOnPasteTest_static_0010] TextInputOnPasteDynamic: ' + text);
      expect(text).assertEqual('pasteValue: onPaste');

      let button = await driver.findComponent(ON.id('TextInput_OnPaste_Button0')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      doPaste(driver, 'TextInput_OnPaste_Dynamic0')
      let pasteValue3 = await driver.findComponent(ON.id('TextInput_OnPaste_Value0')) as Component;
      text = await pasteValue3.getText();
      console.info('[TextInputOnPasteTest_static_0010] TextInputOnPasteDynamic: ' + text);
      expect(text).assertEqual('pasteValue: onPaste');
      done();
    });

  })
}