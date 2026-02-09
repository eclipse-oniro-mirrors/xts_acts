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

function doCopy(driver: Driver, componentId: string){
  let text = await driver.findComponent(ON.id(componentId)) as Component;
  await text.longClick();
  await CommonFunc.sleep(500);
  let selectionMenu = await driver.findComponent(ON.text('复制')) as Component;
  await selectionMenu.click();
  await CommonFunc.sleep(500);
}


export default function TextInputOnCopyModifierTest() {
  describe('TextInputOnCopyModifierTest', () => {
    beforeAll(() => {
      console.info("TextInputOnCopyModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputOnCopyModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputOnCopyModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputOnCopyModifierTest state pages: " + JSON.stringify(pages));
        if (!("TextInputOnCopyModifier" == pages.name)) {
          console.info("get TextInputOnCopyModifierTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputOnCopyModifierTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextInputOnCopyModifierTest_static_0010
         * @tc.name     TextInputOnCopyModifierTest_static_0010
         * @tc.desc     TextInputOnCopyModifierTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextInputOnCopyModifierTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputOnCopyModifierTest_static_0010] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      doCopy(driver, 'TextInput_OnCopy_Modifier_Undefined0')
      let copyValue1 = await driver.findComponent(ON.id('TextInput_OnCopy_Modifier_Value0')) as Component;
      let text = await copyValue1.getText();
      console.info('[TextInputOnCopyModifierTest_static_0010] TextInputOnCopyModifierUndefined: ' + text);
      expect(text).assertEqual('copyValue: ');

      doCopy(driver, 'TextInput_OnCopy_Modifier_Dynamic0')
      let copyValue2 = await driver.findComponent(ON.id('TextInput_OnCopy_Modifier_Value0')) as Component;
      text = await copyValue2.getText();
      console.info('[TextInputOnCopyModifierTest_static_0010] TextInputOnCopyModifierDynamic: ' + text);
      expect(text).assertEqual('copyValue: onCopy');

      let button = await driver.findComponent(ON.id('TextInput_OnCopy_Modifier_Button0')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      doCopy(driver, 'TextInput_OnCopy_Modifier_Dynamic0')
      let copyValue3 = await driver.findComponent(ON.id('TextInput_OnCopy_Modifier_Value0')) as Component;
      text = await copyValue3.getText();
      console.info('[TextInputOnCopyModifierTest_static_0010] TextInputOnCopyModifierDynamic: ' + text);
      expect(text).assertEqual('copyValue: onCopy');
      done();
    });

  })
}