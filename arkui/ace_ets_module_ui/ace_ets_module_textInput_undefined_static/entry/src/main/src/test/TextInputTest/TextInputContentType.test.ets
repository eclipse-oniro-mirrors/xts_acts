'use static'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function textInputContentType() {
  describe('textInputContentType', () => {
    beforeAll(() => {
      console.info("textInputContentType beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textInputContentType beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputContentType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textInputContentType state pages:" + JSON.stringify(pages));
        if (!("textInputContentType" == pages.name)) {
          console.info("get textInputContentType pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputContentType page error:" + err);
      }
      console.info("textInputContentType beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textInputContentType after each called");
    })


    /**
     * @tc.number   textInputContentType_static_0100
     * @tc.name     textInputContentType_static_0100
     * @tc.desc     textInputContentType_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('textInputContentType_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'textInputContentType0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_contentType'))
      await CommonFunc.sleep(500);
      button?.click()
      await CommonFunc.sleep(500);
      let strJsonNew = inspector.getInspectorByKey('key_textInput_contentType_001');
      console.info('[' + tagName + '] Search contentType is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('contentType')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.UNSPECIFIED');

      let button1 = await driver.findComponent(ON.id('button_contentType'))
      await CommonFunc.sleep(500);
      button1?.click()
      await CommonFunc.sleep(500);
      let strJsonNew1 = inspector.getInspectorByKey('key_textInput_contentType_001');
      console.info('[' + tagName + '] Search contentType is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('contentType')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.EMAIL_ADDRESS');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
