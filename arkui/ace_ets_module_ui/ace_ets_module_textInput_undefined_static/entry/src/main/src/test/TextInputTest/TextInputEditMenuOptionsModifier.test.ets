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


export default function TextInputEditMenuOptionsModifier() {
  describe('TextInputEditMenuOptionsModifier', () => {
    beforeAll(() => {
      console.info("TextInputEditMenuOptionsModifier beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputEditMenuOptionsModifier beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputEditMenuOptionsModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputEditMenuOptionsModifier state pages: " + JSON.stringify(pages));
        if (!("TextInputEditMenuOptionsModifier" == pages.name)) {
          console.info("get TextInputEditMenuOptionsModifier state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputEditMenuOptionsModifier page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextInputEditMenuOptionsModifier_static_0010
         * @tc.name     TextInputEditMenuOptionsModifier_static_0010
         * @tc.desc     TextInputEditMenuOptionsModifier_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextInputEditMenuOptionsModifier_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEditMenuOptionsModifier_static_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let textInput = await driver.findComponent(ON.id('TextInput')) as Component;
      await CommonFunc.sleep(1000);
      await textInput.longClick();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('Text');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      await CommonFunc.sleep(1000);
      let search = await driver.findComponent(ON.id('Search')) as Component;
      await CommonFunc.sleep(1000);
      await search.click();
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('button_editMenuOptions')) as Component;
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      await textInput.longClick();
      await CommonFunc.sleep(1000);

      let text = await driver.findComponent(ON.text('111111')) as Component;
      await CommonFunc.sleep(1000);
      await text.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Text');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('111111');

      await CommonFunc.sleep(1000);
      await search.click();
      await CommonFunc.sleep(1000);

      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);

      await CommonFunc.sleep(1000);
      await textInput.longClick();
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Text');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');
      done();
    });
  })
}