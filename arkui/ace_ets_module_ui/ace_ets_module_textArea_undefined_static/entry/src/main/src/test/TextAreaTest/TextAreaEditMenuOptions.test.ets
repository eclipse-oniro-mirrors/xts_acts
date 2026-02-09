'use static'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function SearchEitMenuOptionsTest() {
  describe('TextAreaEditMenuOptionsTest', () : void => {
    beforeAll(() => {
      console.info("TextAreaEditMenuOptionsTest beforeEach start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaEditMenuOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaEditMenuOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaEditMenuOptionsTest state pages:" + "");
        if (!("TextAreaEditMenuOptions" == pages.name)) {
          console.info("get TextAreaEditMenuOptionsTest pages.name:" + "");


          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push TextAreaEditMenuOptionsTest page error:" + err);
      }
      console.info("TextAreaEditMenuOptionsTest beforeEach end");
    });

    /**
     * @tc.number   TextAreaEditMenuOptionsTest_static_0001
     * @tc.name     TextAreaEditMenuOptionsTest_static_0001
     * @tc.desc     TextAreaEditMenuOptionsTest_static_0001
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaEditMenuOptionsTest_static_0001', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('TextAreaEditMenuOptionsTest TextAreaEditMenuOptionsTest0002 START');
      await CommonFunc.sleep(500);
      let search = await driver.findComponent(ON.id('textArea')) as Component;
      await CommonFunc.sleep(500);
      await search.longClick();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.text('111111')) as Component;
      await CommonFunc.sleep(500);
      await button.click();
      let search2 = await driver.findComponent(ON.id('search2')) as Component;
      await CommonFunc.sleep(500);
      await search2.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('textAreaLabelInfo');
      let obj = JSON.parseJsonElement(strJson);
      console.log('TextAreaEditMenuOptionsTest0002---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('TextAreaEditMenuOptionsTest0002---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual('');
      console.info("[TextAreaEditMenuOptionsTest0002] end");
      done();
    });

    /**
     * @tc.number   TextAreaEditMenuOptionsTest_static_0002
     * @tc.name     TextAreaEditMenuOptionsTest_static_0002
     * @tc.desc     TextAreaEditMenuOptionsTest_static_0002
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaEditMenuOptionsTest_static_0002', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('TextAreaEditMenuOptionsTest TextAreaEditMenuOptionsTest0002 START');
      let change = await driver.findComponent(ON.id('button_ChangeValue')) as Component;
      await CommonFunc.sleep(500);
      change.click();
      await CommonFunc.sleep(500);
      let search = await driver.findComponent(ON.id('textArea')) as Component;
      await CommonFunc.sleep(500);
      await search.longClick();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.text('全选')) as Component;
      await CommonFunc.sleep(500);
      button.click();
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('textArea')) as Component;
      await CommonFunc.sleep(500);
      await text.inputText('undefined');
      await CommonFunc.sleep(500);

      let search2 = await driver.findComponent(ON.id('search2')) as Component;
      await CommonFunc.sleep(500);
      await search2.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('textArea');
      let obj = JSON.parseJsonElement(strJson);
      console.log('TextAreaEditMenuOptionsTest0002---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('TextAreaEditMenuOptionsTest0002---obj.$attrs.content---' + obj.getElement('$attrs').getString('text'));
      expect('' + obj.getElement('$attrs').getString('text')).assertEqual('undefined');
      console.info("[TextAreaEditMenuOptionsTest0002] end");
      done();
    });
    /**
     * @tc.number   TextAreaEditMenuOptionsTest_static_0003
     * @tc.name     TextAreaEditMenuOptionsTest_static_0003
     * @tc.desc     TextAreaEditMenuOptionsTest_static_0003
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaEditMenuOptionsTest_static_0003', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('TextAreaEditMenuOptionsTest TextAreaEditMenuOptionsTest0002 START');
      let change = await driver.findComponent(ON.id('button_ChangeValue')) as Component;
      await CommonFunc.sleep(500);
      change.click();
      await CommonFunc.sleep(500);
      let search = await driver.findComponent(ON.id('textArea')) as Component;
      await CommonFunc.sleep(500);
      await search.longClick();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.text('111111')) as Component;
      await CommonFunc.sleep(500);
      await button.click();
      let search2 = await driver.findComponent(ON.id('search2')) as Component;
      await CommonFunc.sleep(500);
      await search2.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('textAreaLabelInfo');
      let obj = JSON.parseJsonElement(strJson);
      console.log('TextAreaEditMenuOptionsTest_static_0003---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('TextAreaEditMenuOptionsTest_static_0003---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual('');
      console.info("[TextAreaEditMenuOptionsTest_static_0003] end");
      done();
    });
  })
}
