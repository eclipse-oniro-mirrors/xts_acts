'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../../hypium/index"
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function CapsuleSegmentButtonAttributeTest() {
  describe('CapsuleSegmentButtonAttributeTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("CapsuleSegmentButtonAttributeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("themePageToggleTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/SegmentButtonAttribute/CapsuleSegmentButtonAttributeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get CapsuleSegmentButtonAttributeTest state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/SegmentButtonAttribute/CapsuleSegmentButtonAttributeTest" == pages.name)) {
          console.info("get themePageToggleTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push themePageToggleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CapsuleSegmentButtonAttributeTest page error:" + err);
      }
      console.info("CapsuleSegmentButtonAttributeTest beforeEach end");
    });

    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_0100
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_0100
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("CapsuleSegmentButtonAttributeTest_static_0100", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("CapsuleSegmentButtonAttributeTest_static_0100", JSON.stringify(tabSegmentButton.getElement('$attrs')))
        console.log("CapsuleSegmentButtonAttributeTest_static_0100", JSON.stringify(tabSegmentButton))
        console.log("CapsuleSegmentButtonAttributeTest_static_0100 itemMinFontScale ", tabSegmentButton.getElement('$attrs').getString('minFontScale'))
        console.log("CapsuleSegmentButtonAttributeTest_static_0100 itemMaxFontScale ", tabSegmentButton.getElement('$attrs').getString('maxFontScale'))
        console.log("CapsuleSegmentButtonAttributeTest_static_0100 itemSelectedFontSize ", tabSegmentButton.getElement('$attrs').getString('fontSize'))
        console.log("CapsuleSegmentButtonAttributeTest_static_0100 itemSelectedFontColor ", tabSegmentButton.getElement('$attrs').getString('fontColor'))
        console.log("CapsuleSegmentButtonAttributeTest_static_0100 itemSelectedFontWeight ", tabSegmentButton.getElement('$attrs').getString('fontWeight'))
        expect(tabSegmentButton.getElement('$attrs').getString('minFontScale')).assertEqual('0.000000');
        expect(tabSegmentButton.getElement('$attrs').getString('maxFontScale')).assertEqual('1.000000');
        expect(tabSegmentButton.getElement('$attrs').getString('fontSize')).assertEqual('18.00fp');
        expect(tabSegmentButton.getElement('$attrs').getString('fontColor')).assertEqual('#FF0000FF');
        expect(tabSegmentButton.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
        await CommonFunc.sleep(500);
        console.log("CapsuleSegmentButtonAttributeTest_static_0100", "END");
        done();
      });


    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_0200
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_0200
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("CapsuleSegmentButtonAttributeTest_static_0200", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("CapsuleSegmentButtonAttributeTest_static_0200", JSON.stringify(tabSegmentButton))
        console.log("CapsuleSegmentButtonAttributeTest_static_0200 space ", tabSegmentButton.getElement('$attrs').getString('space'))
        expect(tabSegmentButton.getElement('$attrs').getString('space')).assertEqual('2.00vp');
        await CommonFunc.sleep(500);
        console.log("CapsuleSegmentButtonAttributeTest_static_0200", "END");
        done();
      });

    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_0300
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_0300
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("CapsuleSegmentButtonAttributeTest_static_0300", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
          .getArray("$children")[0]
        console.log("CapsuleSegmentButtonAttributeTest_static_0300", JSON.stringify(tabSegmentButton))
        console.log("CapsuleSegmentButtonAttributeTest_static_0300 borderRadius ", tabSegmentButton.getElement('$attrs').getString('borderRadius'))
        expect(tabSegmentButton.getElement('$attrs').getString('borderRadius')).assertEqual('10.00px');
        await CommonFunc.sleep(500);
        console.log("CapsuleSegmentButtonAttributeTest_static_0300", "END");
        done();
      });

    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_0400
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_0400
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_0400
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("CapsuleSegmentButtonAttributeTest_static_0400", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[4]
        console.log("CapsuleSegmentButtonAttributeTest_static_0400", JSON.stringify(tabSegmentButton))
        console.log("CapsuleSegmentButtonAttributeTest_static_0400 backgroundColor ", tabSegmentButton.getElement('$attrs').getString('backgroundColor'))
        expect(tabSegmentButton.getElement('$attrs').getString('backgroundColor')).assertEqual('#330A59F7');
        await CommonFunc.sleep(500);
        console.log("CapsuleSegmentButtonAttributeTest_static_0400", "END");
        done();
      });


    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_0500
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_0500
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_0500
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("CapsuleSegmentButtonAttributeTest_static_0500", "START");
        let symbol = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[1]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("CapsuleSegmentButtonAttributeTest_static_0500 itemSymbolFontSize ", symbol.getElement('$attrs').getString('fontSize'))
        expect(symbol.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
        await CommonFunc.sleep(500);
        console.log("CapsuleSegmentButtonAttributeTest_static_0500", "END");
        done();
      });

    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_0600
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_0600
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_0600
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("CapsuleSegmentButtonAttributeTest_static_0600", "START");
      let imageSegment = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.log("CapsuleSegmentButtonAttributeTest_static_0600 itemIconSize ", imageSegment.getElement('$attrs').getElement('size').getString('width'))
      console.log("CapsuleSegmentButtonAttributeTest_static_0600 itemSelectedIconFillColor ", imageSegment.getElement('$attrs').getString('fillColor'))
      expect(imageSegment.getElement('$attrs').getElement('size').getString('width')).assertEqual('30.00vp');
      expect(imageSegment.getElement('$attrs').getString('fillColor')).assertEqual('#FF000000');
      await CommonFunc.sleep(500);
      console.log("CapsuleSegmentButtonAttributeTest_static_0600", "END");
      done();
    });


    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_0700
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_0700
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_0700
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("CapsuleSegmentButtonAttributeTest_static_0700", "START");
        let imageUnselected = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[2]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
          .getArray("$children")[1]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("CapsuleSegmentButtonAttributeTest_static_0700 itemIconFillColor ", imageUnselected.getElement('$attrs').getString('fillColor'))
        expect(imageUnselected.getElement('$attrs').getString('fillColor')).assertEqual('#99000000');
        console.log("CapsuleSegmentButtonAttributeTest_static_0700", "END");
        done();
      });


    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_0800
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_0800
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_0800
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("CapsuleSegmentButtonAttributeTest_static_0800", "START");
        let symbol = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[1]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("CapsuleSegmentButtonAttributeTest_static_0800 itemSymbolFontSize ", symbol.getElement('$attrs').getString('fontSize'))
        expect(symbol.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
        await CommonFunc.sleep(500);
        console.log("CapsuleSegmentButtonAttributeTest_static_0800", "END");
        done();
      });


    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_0900
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_0900
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_0900
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("CapsuleSegmentButtonAttributeTest_static_0900", "START");
        let itemMinHeight = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[2]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
          .getArray("$children")[0]
        console.log("CapsuleSegmentButtonAttributeTest_static_0900 itemMinHeight ", itemMinHeight.getElement('$attrs').getString('height'))
        expect(itemMinHeight.getElement('$attrs').getString('height')).assertEqual('80.00vp');
        await CommonFunc.sleep(500);
        console.log("CapsuleSegmentButtonAttributeTest_static_0900", "END");
        done();
      });


    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_1000
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_1000
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_1000
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("CapsuleSegmentButtonAttributeTest_static_1000", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("CapsuleSegmentButtonAttributeTest_static_1000", JSON.stringify(tabSegmentButton))
        console.log("CapsuleSegmentButtonAttributeTest_static_1000 itemSelectedFontSize ", tabSegmentButton.getElement('$attrs').getString('padding'))
        console.log("CapsuleSegmentButtonAttributeTest_static_1000 itemSelectedFontWeight ", tabSegmentButton.getElement('$attrs').getElement('shadow').getString('color'))
        expect(tabSegmentButton.getElement('$attrs').getString('padding')).assertEqual('30.00vp');
        expect(tabSegmentButton.getElement('$attrs').getElement('shadow').getString('color')).assertEqual('#FF000000');
        await CommonFunc.sleep(500);
        console.log("CapsuleSegmentButtonAttributeTest_static_1000", "END");
        done();
      });


    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_1100
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_1100
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_1100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("CapsuleSegmentButtonAttributeTest_static_1100", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("CapsuleSegmentButtonAttributeTest_static_1100", JSON.stringify(tabSegmentButton))
        console.log("CapsuleSegmentButtonAttributeTest_static_1100 buttonBackgroundColor ", tabSegmentButton.getElement('$attrs').getString('backgroundColor'))
        expect(tabSegmentButton.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00');
        await CommonFunc.sleep(500);
        console.log("CapsuleSegmentButtonAttributeTest_static_1100", "END");
        done();
      });


    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_1200
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_1200
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_1200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("CapsuleSegmentButtonAttributeTest_static_1200", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("CapsuleSegmentButtonAttributeTest_static_1200", JSON.stringify(tabSegmentButton))
        console.log("CapsuleSegmentButtonAttributeTest_static_1200 buttonBackgroundBlurStyle ",
          tabSegmentButton.getElement('$attrs').getElement('backgroundBlurStyle').getString('value'))
        console.log("CapsuleSegmentButtonAttributeTest_static_1200 buttonBackgroundBlurStyleOptions ",
          tabSegmentButton.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('colorMode'))
        expect(tabSegmentButton.getElement('$attrs').getElement('backgroundBlurStyle').getString('value')).assertEqual('BlurStyle.Thin');
        expect(tabSegmentButton.getElement('$attrs').getElement('backgroundBlurStyle').getElement("options").getString('colorMode')).assertEqual('ThemeColorMode.System');
        await CommonFunc.sleep(500);
        console.log("CapsuleSegmentButtonAttributeTest_static_1200", "END");
        done();
      });


    /**
     * @tc.number   CapsuleSegmentButtonAttributeTest_static_1300
     * @tc.name     CapsuleSegmentButtonAttributeTest_static_1300
     * @tc.desc     CapsuleSegmentButtonAttributeTest_static_1300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('CapsuleSegmentButtonAttributeTest_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("CapsuleSegmentButtonAttributeTest_static_1300", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
        console.log("CapsuleSegmentButtonAttributeTest_static_1300", JSON.stringify(tabSegmentButton))
        console.log("CapsuleSegmentButtonAttributeTest_static_1300 buttonPadding ", tabSegmentButton.getElement('$attrs').getString('padding'))
        expect(tabSegmentButton.getElement('$attrs').getString('padding')).assertEqual('20.00fp');
        await CommonFunc.sleep(500);
        console.log("CapsuleSegmentButtonAttributeTest_static_1300", "END");
        done();
      });
  })
}