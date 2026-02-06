'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index'
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';


export default function TextPickerTextStyleTest() {
  describe('TextPickerTextStyleTest', () => {
    beforeAll(() => {
      console.info("TextPickerTextStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.textPicker.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextPickerTextStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/TextPickertextStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextPickerTextStyleTest state pages:" + JSON.stringify(pages));
        if (!("TextPickertextStyle" == pages.name)) {
          console.info("get TextPickerTextStyleTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push TextPickerTextStyleTest page error:" + err);
      }
      console.info("TextPickerTextStyleTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("TextPickerTextStyleTest after each called");
    });

    /**
     * @tc.name   textPickerDialogTextStyleTest_0001
     * @tc.number textPickerDialogTextStyleTest_0001
     * @tc.desc   To test the textStyle minFontSize:18 maxFontSize:28 TextOverflow.Clip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerDialogTextStyleTest_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textPickerDialogTextStyleTest_0001 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btn1'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('minFontSize')).assertEqual('18.00fp');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('maxFontSize')).assertEqual('28.00fp');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('overflow')).assertEqual('TextOverflow.Clip');
            
      expect(obj.getElement('$attrs').getElement('textStyle').getString('minFontSize')).assertEqual('18.00fp');
      expect(obj.getElement('$attrs').getElement('textStyle').getString('maxFontSize')).assertEqual('28.00fp');
      expect(obj.getElement('$attrs').getElement('textStyle').getString('overflow')).assertEqual('TextOverflow.Clip');

      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('minFontSize')).assertEqual('18.00fp');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('maxFontSize')).assertEqual('28.00fp');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('overflow')).assertEqual('TextOverflow.Clip');
      done();
    });

    /**
     * @tc.name   textPickerDialogTextStyleTest_0002
     * @tc.number textPickerDialogTextStyleTest_0002
     * @tc.desc   To test the textStyle minFontSize:40 maxFontSize:40 TextOverflow.Ellipsis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerDialogTextStyleTest_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textPickerDialogTextStyleTest_0002 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btn2'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('minFontSize')).assertEqual('40.00vp');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('maxFontSize')).assertEqual('40.00vp');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
            
      expect(obj.getElement('$attrs').getElement('textStyle').getString('minFontSize')).assertEqual('40.00vp');
      expect(obj.getElement('$attrs').getElement('textStyle').getString('maxFontSize')).assertEqual('40.00vp');
      expect(obj.getElement('$attrs').getElement('textStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');

      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('minFontSize')).assertEqual('40.00vp');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('maxFontSize')).assertEqual('40.00vp');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
      console.info('[textPickerDialogTextStyleTest_0002] END');
      done();
    });

    /**
     * @tc.name   textPickerDialogTextStyleTest_0003
     * @tc.number textPickerDialogTextStyleTest_0003
     * @tc.desc   To test the textStyle minFontSize:0 maxFontSize:0 TextOverflow.MARQUEE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerDialogTextStyleTest_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textPickerDialogTextStyleTest_0003 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btn3'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('minFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('maxFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('overflow')).assertEqual('TextOverflow.Marquee');
            
      expect(obj.getElement('$attrs').getElement('textStyle').getString('minFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('textStyle').getString('maxFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('textStyle').getString('overflow')).assertEqual('TextOverflow.Marquee');

      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('minFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('maxFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('overflow')).assertEqual('TextOverflow.Marquee');
      console.info('[textPickerDialogTextStyleTest_0003] END');
      done();
    });

    /**
     * @tc.name   textPickerDialogTextStyleTest_0004
     * @tc.number textPickerDialogTextStyleTest_0004
     * @tc.desc   To test the textStyle minFontSize:undefined maxFontSize:undefined TextOverflow.Clip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerDialogTextStyleTest_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textPickerDialogTextStyleTest_0004 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btn4'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('minFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('maxFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('overflow')).assertEqual('TextOverflow.Clip');
      
      expect(obj.getElement('$attrs').getElement('textStyle').getString('minFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('textStyle').getString('maxFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('textStyle').getString('overflow')).assertEqual('TextOverflow.Clip');

      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('minFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('maxFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('overflow')).assertEqual('TextOverflow.Clip');
      console.info('[textPickerDialogTextStyleTest_0004] END');
      done();
    });

    /**
     * @tc.name   textPickerDialogTextStyleTest_0005
     * @tc.number textPickerDialogTextStyleTest_0005
     * @tc.desc   To test the textStyle minFontSize:18 maxFontSize:28 TextOverflow.None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerDialogTextStyleTest_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textPickerDialogTextStyleTest_0005 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btn5'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('minFontSize')).assertEqual('18.00fp');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('maxFontSize')).assertEqual('28.00fp');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('overflow')).assertEqual('TextOverflow.None');
      
      expect(obj.getElement('$attrs').getElement('textStyle').getString('minFontSize')).assertEqual('18.00fp');
      expect(obj.getElement('$attrs').getElement('textStyle').getString('maxFontSize')).assertEqual('28.00fp');
      expect(obj.getElement('$attrs').getElement('textStyle').getString('overflow')).assertEqual('TextOverflow.None');

      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('minFontSize')).assertEqual('18.00fp');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('maxFontSize')).assertEqual('28.00fp');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('overflow')).assertEqual('TextOverflow.None');
      console.info('[textPickerDialogTextStyleTest_0005] END');
      done();
    });
  })
}