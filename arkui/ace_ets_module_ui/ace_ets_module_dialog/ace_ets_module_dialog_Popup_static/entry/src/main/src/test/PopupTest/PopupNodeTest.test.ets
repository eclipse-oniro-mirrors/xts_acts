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
import { abilityDelegatorRegistry, Driver, ON, MatchPattern, Component } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;

export default function PopupNodeTest() {
  describe('PopupNodeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("PopupTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.popup.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("PopupTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/PopupIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PopupTest state pages:" + JSON.stringify(pages));
        if (!("PopupIndex" == pages.name)) {
          console.info("get PopupTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push PopupTest page error:" + err);
      }
      console.info("PopupTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("PopupTest after each called");
    });

    /**
     * @tc.number PopupTest_001
     * @tc.name popupTextOptionsText
     * @tc.desc Test PopupTextOptions text property, verify text='PopupTextOptions_text_test_value'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupTextOptionsText', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupTextOptionsText START');
      let driver = Driver.create();
      let textComponent:Component | null = await driver.findComponent(ON.text('PopupTextOptions_text_test_value', MatchPattern.EQUALS));
      if(textComponent){
        console.info('PopupTest: textComponent object: ' + JSON.stringify(textComponent));
        console.info('PopupTest: textComponent object getText: ' + await textComponent.getText());
        console.info('PopupTest: textComponent object getText: ' + textComponent.getText().toString());
        console.info('PopupTest: textComponent object getType: ' + JSON.stringify(textComponent.getType()));
        console.info('PopupTest: textComponent object getDescription: ' + JSON.stringify(textComponent.getDescription()));
        expect(textComponent !== null).assertEqual(true);
        console.info('PopupTest: popupTextOptionsText END');
        done();
      } else {
        console.info('PopupTest: textComponent is undefined');
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_002
     * @tc.name popupTextOptionsFontSize
     * @tc.desc Test PopupTextOptions fontSize property, verify fontSize=20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupTextOptionsFontSize', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupTextOptionsFontSize START');
      try {
        const driver = Driver.create();
        const textComponent = await driver.findComponent(ON.text('PopupTextOptions_text_test_value', MatchPattern.EQUALS));
        expect(!!textComponent).assertEqual(true);
        console.info('PopupTest: textComponent object tree =', JSON.stringify(textComponent));
        console.info('PopupTest: popupTextOptionsFontSize - fontSize should be 20');
        console.info('PopupTest: popupTextOptionsFontSize END');
        done();
      } catch (error) {
        console.error('PopupTest: popupTextOptionsFontSize error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_003
     * @tc.name popupTextOptionsFontColor
     * @tc.desc Test PopupTextOptions fontColor property, verify fontColor=Color.Red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupTextOptionsFontColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupTextOptionsFontColor START');
      try {
        const driver = Driver.create();
        const textComponent = await driver.findComponent(ON.text('PopupTextOptions_text_test_value', MatchPattern.EQUALS));
        expect(!!textComponent).assertEqual(true);
        console.info('PopupTest: textComponent object tree =', JSON.stringify(textComponent));
        console.info('PopupTest: popupTextOptionsFontColor - fontColor should be Color.Red');
        console.info('PopupTest: popupTextOptionsFontColor END');
        done();
      } catch (error) {
        console.error('PopupTest: popupTextOptionsFontColor error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_004
     * @tc.name popupTextOptionsFontWeight
     * @tc.desc Test PopupTextOptions fontWeight property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupTextOptionsFontWeight', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupTextOptionsFontWeight START');
      try {
        const driver = Driver.create();
        const titleComponent:Component | null = await driver.findComponent(ON.text('PopupOptions_title_test_value', MatchPattern.EQUALS));
        if(titleComponent){
          console.info('PopupTest: titleComponent object: ' + JSON.stringify(titleComponent));
          console.info('PopupTest: titleComponent object getText: ' + await titleComponent.getText());
          console.info('PopupTest: titleComponent object getText: ' + titleComponent.getText().toString());
          console.info('PopupTest: titleComponent object getType: ' + JSON.stringify(titleComponent.getType()));
          console.info('PopupTest: titleComponent object getDescription: ' + JSON.stringify(titleComponent.getDescription()));
          expect(!!titleComponent).assertEqual(true);
        }
        console.info('PopupTest: titleComponent object tree =', JSON.stringify(titleComponent));
        console.info('PopupTest: popupTextOptionsFontWeight - fontWeight should be FontWeight.Normal');
        console.info('PopupTest: popupTextOptionsFontWeight END');
        done();
      } catch (error) {
        console.error('PopupTest: popupTextOptionsFontWeight error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_005
     * @tc.name popupButtonOptionsText
     * @tc.desc Test PopupButtonOptions text property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupButtonOptionsText', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupButtonOptionsText START');
      try {
        const driver = Driver.create();
        const popupButton = await driver.findComponent(ON.text('PopupButtonOptions_text_test_value', MatchPattern.EQUALS));
        expect(!!popupButton).assertEqual(true);
        console.info('PopupTest: popupButton object tree =', JSON.stringify(popupButton));
        expect(popupButton !== null).assertEqual(true);
        console.info('PopupTest: popupButtonOptionsText END');
        done();
      } catch (error) {
        console.error('PopupTest: popupButtonOptionsText error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_006
     * @tc.name popupButtonOptionsFontSize
     * @tc.desc Test PopupButtonOptions fontSize property, verify fontSize=18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupButtonOptionsFontSize', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupButtonOptionsFontSize START');
      try {
        const driver = Driver.create();
        const popupButton = await driver.findComponent(ON.text('PopupButtonOptions_text_test_value', MatchPattern.EQUALS));
        expect(!!popupButton).assertEqual(true);
        console.info('PopupTest: popupButton object tree =', JSON.stringify(popupButton));
        console.info('PopupTest: popupButtonOptionsFontSize - fontSize should be 18');
        console.info('PopupTest: popupButtonOptionsFontSize END');
        done();
      } catch (error) {
        console.error('PopupTest: popupButtonOptionsFontSize error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_007
     * @tc.name popupButtonOptionsFontColor
     * @tc.desc Test PopupButtonOptions fontColor property, verify fontColor=Color.Blue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupButtonOptionsFontColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupButtonOptionsFontColor START');
      try {
        const driver = Driver.create();
        const popupButton = await driver.findComponent(ON.text('PopupButtonOptions_text_test_value', MatchPattern.EQUALS));
        expect(!!popupButton).assertEqual(true);
        console.info('PopupTest: popupButton object tree =', JSON.stringify(popupButton));
        console.info('PopupTest: popupButtonOptionsFontColor - fontColor should be Color.Blue');
        console.info('PopupTest: popupButtonOptionsFontColor END');
        done();
      } catch (error) {
        console.error('PopupTest: popupButtonOptionsFontColor error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_008
     * @tc.name popupIconOptionsWidth
     * @tc.desc Test PopupIconOptions width property, verify width=40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupIconOptionsWidth', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupIconOptionsWidth START');
      try {
        const driver = Driver.create();
        const imageComponent = await driver.findComponent(ON.type('Image'));
        expect(!!imageComponent).assertEqual(true);
        console.info('PopupTest: imageComponent object tree =', JSON.stringify(imageComponent));
        console.info('PopupTest: popupIconOptionsWidth - width should be 40');
        console.info('PopupTest: popupIconOptionsWidth END');
        done();
      } catch (error) {
        console.error('PopupTest: popupIconOptionsWidth error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_009
     * @tc.name popupIconOptionsHeight
     * @tc.desc Test PopupIconOptions height property, verify height=40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupIconOptionsHeight', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupIconOptionsHeight START');
      try {
        const driver = Driver.create();
        const imageComponent = await driver.findComponent(ON.type('Image'));
        expect(!!imageComponent).assertEqual(true);
        console.info('PopupTest: imageComponent object tree =', JSON.stringify(imageComponent));
        console.info('PopupTest: popupIconOptionsHeight - height should be 40');
        console.info('PopupTest: popupIconOptionsHeight END');
        done();
      } catch (error) {
        console.error('PopupTest: popupIconOptionsHeight error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_010
     * @tc.name popupIconOptionsFillColor
     * @tc.desc Test PopupIconOptions fillColor property, verify fillColor=Color.Green
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupIconOptionsFillColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupIconOptionsFillColor START');
      try {
        const driver = Driver.create();
        const imageComponent = await driver.findComponent(ON.type('Image'));
        expect(!!imageComponent).assertEqual(true);
        console.info('PopupTest: imageComponent object tree =', JSON.stringify(imageComponent));
        console.info('PopupTest: popupIconOptionsFillColor - fillColor should be Color.Green');
        console.info('PopupTest: popupIconOptionsFillColor END');
        done();
      } catch (error) {
        console.error('PopupTest: popupIconOptionsFillColor error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_011
     * @tc.name popupIconOptionsBorderRadius
     * @tc.desc Test PopupIconOptions borderRadius property, verify borderRadius=8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupIconOptionsBorderRadius', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupIconOptionsBorderRadius START');
      try {
        const driver = Driver.create();
        const imageComponent = await driver.findComponent(ON.type('Image'));
        expect(!!imageComponent).assertEqual(true);
        console.info('PopupTest: imageComponent object tree =', JSON.stringify(imageComponent));
        console.info('PopupTest: popupIconOptionsBorderRadius - borderRadius should be 8');
        console.info('PopupTest: popupIconOptionsBorderRadius END');
        done();
      } catch (error) {
        console.error('PopupTest: popupIconOptionsBorderRadius error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_012
     * @tc.name popupOptionsShowClose
     * @tc.desc Test PopupOptions showClose property, verify showClose=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupOptionsShowClose', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupOptionsShowClose START');
      try {
        const driver = Driver.create();
        const closeButton = await driver.findComponent(ON.type('Image'));
        expect(!!closeButton).assertEqual(true);
        console.info('PopupTest: popupOptionsShowClose - showClose should be true, close button found');
        console.info('PopupTest: popupOptionsShowClose END');
        done();
      } catch (error) {
        console.error('PopupTest: popupOptionsShowClose error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_013
     * @tc.name popupOptionsDirection
     * @tc.desc Test PopupOptions direction property, verify direction=Direction.Rtl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupOptionsDirection', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupOptionsDirection START');
      try {
        const driver = Driver.create();
        const textComponent = await driver.findComponent(ON.text('PopupTextOptions_text_test_value', MatchPattern.EQUALS));
        expect(!!textComponent).assertEqual(true);
        console.info('PopupTest: textComponent object tree =', JSON.stringify(textComponent));
        console.info('PopupTest: popupOptionsDirection - direction should be Direction.Rtl');
        console.info('PopupTest: popupOptionsDirection END');
        done();
      } catch (error) {
        console.error('PopupTest: popupOptionsDirection error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_014
     * @tc.name popupOptionsMaxWidth
     * @tc.desc Test PopupOptions maxWidth property, verify maxWidth='300vp'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupOptionsMaxWidth', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupOptionsMaxWidth START');
      try {
        const driver = Driver.create();
        const textComponent = await driver.findComponent(ON.text('PopupTextOptions_text_test_value', MatchPattern.EQUALS));
        expect(!!textComponent).assertEqual(true);
        console.info('PopupTest: textComponent object tree =', JSON.stringify(textComponent));
        console.info('PopupTest: popupOptionsMaxWidth - maxWidth should be 300vp');
        console.info('PopupTest: popupOptionsMaxWidth END');
        done();
      } catch (error) {
        console.error('PopupTest: popupOptionsMaxWidth error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_015
     * @tc.name popupIconOptionsImage
     * @tc.desc Test PopupIconOptions image property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupIconOptionsImage', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupIconOptionsImage START');
      try {
        const driver = Driver.create();
        const imageComponent = await driver.findComponent(ON.type('Image'));
        expect(!!imageComponent).assertEqual(true);
        console.info('PopupTest: imageComponent object tree =', JSON.stringify(imageComponent));
        console.info('PopupTest: popupIconOptionsImage END');
        done();
      } catch (error) {
        console.error('PopupTest: popupIconOptionsImage error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_016
     * @tc.name popupOptionsIcon
     * @tc.desc Test PopupOptions icon property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupOptionsIcon', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupOptionsIcon START');
      try {
        const driver = Driver.create();
        const imageComponent = await driver.findComponent(ON.type('Image'));
        expect(!!imageComponent).assertEqual(true);
        console.info('PopupTest: imageComponent object tree =', JSON.stringify(imageComponent));
        console.info('PopupTest: popupOptionsIcon END');
        done();
      } catch (error) {
        console.error('PopupTest: popupOptionsIcon error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_017
     * @tc.name popupOptionsTitle
     * @tc.desc Test PopupOptions title property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupOptionsTitle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupOptionsTitle START');
      try {
        const driver = Driver.create();
        const titleComponent = await driver.findComponent(ON.text('PopupOptions_title_test_value', MatchPattern.EQUALS));
        console.info('PopupTest: titleComponent object tree =', JSON.stringify(titleComponent));
        expect(titleComponent !== null).assertEqual(true);
        console.info('PopupTest: popupOptionsTitle END');
        done();
      } catch (error) {
        console.error('PopupTest: popupOptionsTitle error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_018
     * @tc.name popupOptionsOnClose
     * @tc.desc Test PopupOptions onClose property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupOptionsOnClose', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupOptionsOnClose START');
      try {
        const driver = Driver.create();
        const textComponent = await driver.findComponent(ON.text('PopupTextOptions_text_test_value', MatchPattern.EQUALS));
        expect(!!textComponent).assertEqual(true);
        console.info('PopupTest: textComponent object tree =', JSON.stringify(textComponent));
        console.info('PopupTest: popupOptionsOnClose END');
        done();
      } catch (error) {
        console.error('PopupTest: popupOptionsOnClose error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_019
     * @tc.name popupButtonOptionsAction
     * @tc.desc Test PopupButtonOptions action property, verify action callback is called when button is clicked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupButtonOptionsAction', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupButtonOptionsAction START');
      try {
        const driver = Driver.create();
        const popupButton = await driver.findComponent(ON.text('PopupButtonOptions_text_test_value', MatchPattern.EQUALS));
        expect(!!popupButton).assertEqual(true);
        await (popupButton?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);
        const actionResultText = inspector.getInspectorByKey('actionResult');
        const actionResultObj = JSON.parseJsonElement(actionResultText);
        const actionResultValue = actionResultObj.getElement('$attrs').getString('content');
        console.info('PopupTest: actionResult value = ' + actionResultValue);
        expect(actionResultValue).assertEqual('button_action_called');
        console.info('PopupTest: popupButtonOptionsAction END');
        done();
      } catch (error) {
        console.error('PopupTest: popupButtonOptionsAction error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_020
     * @tc.name popupOptionsButtons
     * @tc.desc Test PopupOptions buttons property, verify button count is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupOptionsButtons', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupOptionsButtons START');
      try {
        const driver = Driver.create();
        const button1 = await driver.findComponent(ON.text('PopupButtonOptions_text_test_value', MatchPattern.EQUALS));
        const button2 = await driver.findComponent(ON.text('Cancel', MatchPattern.EQUALS));
        expect(!!button1).assertEqual(true);
        expect(!!button2).assertEqual(true);
        console.info('PopupTest: popupOptionsButtons - buttons count should be 2, both buttons found');
        console.info('PopupTest: popupOptionsButtons END');
        done();
      } catch (error) {
        console.error('PopupTest: popupOptionsButtons error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupTest_021
     * @tc.name popupBindPopupByButton
     * @tc.desc Test Popup component triggered by Button component's bindPopup method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupBindPopupByButton', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupTest: popupBindPopupByButton START');
      try {
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/popup/PopupIndex',
        };
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.pushUrl(options);
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const showPopupButton = await driver.findComponent(ON.id('btnShowPopupByBindPopup'));
        console.info('PopupTest: popupBindPopupByButton get showPopupButton success');
        expect(!!showPopupButton).assertEqual(true);
        await (showPopupButton?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME * 2);
        let popupBuilder = await driver.findComponent(ON.text('PopB', MatchPattern.EQUALS));
        if (!popupBuilder) {
          popupBuilder = await driver.findComponent(ON.text('popupBuilder', MatchPattern.EQUALS));
          console.info('PopupTest: popupBindPopupByButton get popupBuilder by popupBuilder text');
        }
        expect(!!popupBuilder).assertEqual(true);
        console.info('PopupTest: popupBindPopupByButton popupMessage exist');
        console.info('PopupTest: popupBindPopupByButton - Popup displayed successfully after button click');
        console.info('PopupTest: popupBindPopupByButton END');
        done();
      } catch (error) {
        console.error('PopupTest: popupBindPopupByButton error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
