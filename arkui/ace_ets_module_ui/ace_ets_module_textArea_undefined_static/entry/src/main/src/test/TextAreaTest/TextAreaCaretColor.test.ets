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

export default function TextAreaCaretColorTest() {
  describe('TextAreaCaretColorTest', () => {
    beforeAll(() => {
      console.info("TextAreaCaretColorTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextAreaCaretColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaCaretColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaCaretColorTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaCaretColor" == pages.name)) {
          console.info("get TextAreaCaretColorTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaCaretColorTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
     * @tc.number   TextAreaCaretColorTest_static_0010
     * @tc.name     TextAreaCaretColorTest_static_0010
     * @tc.desc     TextAreaCaretColorTest_static_0010
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaCaretColorTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaCaretColorTest_static_0010] START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextAreaCaretColorTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaCaretColorTest_static_0010] TextAreaCaretColor: ' + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FFFFA500');
      console.info('[TextAreaCaretColorTest_static_0010] END');
      done();
    });

    /**
     * @tc.number   TextAreaCaretColorTest_static_0020
     * @tc.name     TextAreaCaretColorTest_static_0020
     * @tc.desc     TextAreaCaretColorTest_static_0020
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaCaretColorTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaCaretColorTest_static_0020] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setCaretColor1')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextAreaCaretColorTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaCaretColorTest_static_0020] TextAreaCaretColor: ' + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FF007DFF');
      console.info('[TextAreaCaretColorTest_static_0020] END');
      done();
    });


    /**
     * @tc.number   TextAreaCaretColorTest_static_0030
     * @tc.name     TextAreaCaretColorTest_static_0030
     * @tc.desc     TextAreaCaretColorTest_static_0030
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaCaretColorTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaCaretColorTest_static_0030] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setCaretColor2')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextAreaCaretColorTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaCaretColorTest_static_0030] TextAreaCaretColor: ' + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FFF04B3D');
      console.info('[TextAreaCaretColorTest_static_0030] END');
      done();
    });




    /**
     * @tc.number   TextAreaCaretColorTest_static_0040
     * @tc.name     TextAreaCaretColorTest_static_0040
     * @tc.desc     TextAreaCaretColorTest_static_0040
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaCaretColorTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaCaretColorTest_static_0040] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setCaretColor3')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextAreaCaretColorTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaCaretColorTest_static_0040] TextAreaCaretColor: ' + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#078014A8');
      console.info('[TextAreaCaretColorTest_static_0040] END');
      done();
    });




    /**
     * @tc.number   TextAreaCaretColorTest_static_0050
     * @tc.name     TextAreaCaretColorTest_static_0050
     * @tc.desc     TextAreaCaretColorTest_static_0050
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaCaretColorTest_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaCaretColorTest_static_0050] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setCaretColor4')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextAreaCaretColorTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaCaretColorTest_static_0050] TextAreaCaretColor: ' + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FF00F5FF');
      console.info('[TextAreaCaretColorTest_static_0050] END');
      done();
    });
  })
}