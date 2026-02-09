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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function SegmentButtonV2Test() {
  describe('SegmentButtonV2Test', () => {
    beforeAll(() => {
      console.info("SegmentButtonV2Test beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.component.nowear.api18.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("SegmentButtonV2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/capsuleSegmentButtonV2/SegmentButtonV2Test',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SegmentButtonV2Test state pages:" + JSON.stringify(pages));
        if (!("PopupDirection" == pages.name)) {
          console.info("get SegmentButtonV2Test pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SegmentButtonV2Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonV2Test page error:" + err);
        expect().assertFail();
      }
      console.info("SegmentButtonV2Test beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SegmentButtonV2Test after each called');
    });


    /**
     * @tc.number   SegmentButtonV2Test_static_0100
     * @tc.name     SegmentButtonV2Test_static_0100
     * @tc.desc     SegmentButtonV2Test_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('SegmentButtonV2Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("SegmentButtonV2Test_static_0100", "START");
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
        console.log("SegmentButtonV2Test_static_0100", JSON.stringify(tabSegmentButton))
        console.log("SegmentButtonV2Test_static_0100 itemSelectedFontSize ", tabSegmentButton.getElement('$attrs').getString('fontSize'))
        console.log("SegmentButtonV2Test_static_0100 itemSelectedFontWeight ", tabSegmentButton.getElement('$attrs').getString('fontWeight'))
        expect(tabSegmentButton.getElement('$attrs').getString('fontSize')).assertEqual('18.00fp');
        expect(tabSegmentButton.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonV2Test_static_0100", "END");
        done();
      });


    /**
     * @tc.number   SegmentButtonV2Test_static_0200
     * @tc.name     SegmentButtonV2Test_static_0200
     * @tc.desc     SegmentButtonV2Test_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('SegmentButtonV2Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("SegmentButtonV2Test_static_0200", "START");
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
        console.log("SegmentButtonV2Test_static_0200 itemSymbolFontSize ", symbol.getElement('$attrs').getString('fontSize'))
        expect(symbol.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_static_0200", "END");
        done();
      });

    
    
    
    /**
     * @tc.number   SegmentButtonV2Test_static_0300
     * @tc.name     SegmentButtonV2Test_static_0300
     * @tc.desc     SegmentButtonV2Test_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('SegmentButtonV2Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.log("SegmentButtonV2Test_static_0300", "START");
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
        console.log("SegmentButtonV2Test_static_0300 itemIconSize ", imageSegment.getElement('$attrs').getElement('size').getString('width'))
        console.log("SegmentButtonV2Test_static_0300 itemSelectedIconFillColor ", imageSegment.getElement('$attrs').getString('fillColor'))
        expect(imageSegment.getElement('$attrs').getElement('size').getString('width')).assertEqual('30.00vp');
        expect(imageSegment.getElement('$attrs').getString('fillColor')).assertEqual('#FF000000');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_static_0300", "END");
        done();
      });


    /**
     * @tc.number   SegmentButtonV2Test_static_0400
     * @tc.name     SegmentButtonV2Test_static_0400
     * @tc.desc     SegmentButtonV2Test_static_0400
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('SegmentButtonV2Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("SegmentButtonV2Test_static_0400", "START");
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
        console.log("SegmentButtonV2Test_static_0400 itemIconFillColor ", imageUnselected.getElement('$attrs').getString('fillColor'))
        expect(imageUnselected.getElement('$attrs').getString('fillColor')).assertEqual('#99000000');
        console.log("SegmentButtonV2Test_static_0400", "END");
        done();
      });


    /**
     * @tc.number   SegmentButtonV2Test_static_0500
     * @tc.name     SegmentButtonV2Test_static_0500
     * @tc.desc     SegmentButtonV2Test_static_0500
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('SegmentButtonV2Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("SegmentButtonV2Test_static_0500", "START");
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
        console.log("SegmentButtonV2Test_static_0500 itemSymbolFontSize ", symbol.getElement('$attrs').getString('fontSize'))
        expect(symbol.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_static_0500", "END");
        done();
      });


    /**
     * @tc.number   SegmentButtonV2Test_static_0600
     * @tc.name     SegmentButtonV2Test_static_0600
     * @tc.desc     SegmentButtonV2Test_static_0600
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('SegmentButtonV2Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("SegmentButtonV2Test_static_0600", "START");
        let itemMinHeight = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[2]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
          .getArray("$children")[0]
        console.log("SegmentButtonV2Test_static_0600 itemMinHeight ", itemMinHeight.getElement('$attrs').getString('height'))
        expect(itemMinHeight.getElement('$attrs').getString('height')).assertEqual('80.00vp');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_static_0600", "END");
        done();
      });


    /**
     * @tc.number   SegmentButtonV2Test_static_0700
     * @tc.name     SegmentButtonV2Test_static_0700
     * @tc.desc     SegmentButtonV2Test_static_0700
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('SegmentButtonV2Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("SegmentButtonV2Test_static_0700", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("SegmentButtonV2Test_static_0700", JSON.stringify(tabSegmentButton))
        console.log("SegmentButtonV2Test_static_0700 itemSelectedFontSize ", tabSegmentButton.getElement('$attrs').getString('padding'))
        console.log("SegmentButtonV2Test_static_0700 itemSelectedFontWeight ", tabSegmentButton.getElement('$attrs').getElement('shadow').getString('color'))
        expect(tabSegmentButton.getElement('$attrs').getString('padding')).assertEqual('30.00vp');
        expect(tabSegmentButton.getElement('$attrs').getElement('shadow').getString('color')).assertEqual('#FF000000');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonV2Test_static_0100", "END");
        done();
      });


    /**
     * @tc.number   SegmentButtonV2Test_static_0800
     * @tc.name     SegmentButtonV2Test_static_0800
     * @tc.desc     SegmentButtonV2Test_static_0800
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('SegmentButtonV2Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("SegmentButtonV2Test_static_0800", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("SegmentButtonV2Test_static_0800", JSON.stringify(tabSegmentButton))
        console.log("SegmentButtonV2Test_static_0800 buttonBackgroundColor ", tabSegmentButton.getElement('$attrs').getString('backgroundColor'))
        expect(tabSegmentButton.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_static_0800", "END");
        done();
      });


    /**
     * @tc.number   SegmentButtonV2Test_static_0900
     * @tc.name     SegmentButtonV2Test_static_0900
     * @tc.desc     SegmentButtonV2Test_static_0900
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('SegmentButtonV2Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("SegmentButtonV2Test_static_0700", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("SegmentButtonV2Test_static_0900", JSON.stringify(tabSegmentButton))
        console.log("SegmentButtonV2Test_static_0900 buttonBackgroundBlurStyle ",
          tabSegmentButton.getElement('$attrs').getElement('backgroundBlurStyle').getString('value'))
        console.log("SegmentButtonV2Test_static_0900 buttonBackgroundBlurStyleOptions ",
          tabSegmentButton.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('colorMode'))
        expect(tabSegmentButton.getElement('$attrs').getElement('backgroundBlurStyle').getString('value')).assertEqual('BlurStyle.Thin');
        expect(tabSegmentButton.getElement('$attrs').getElement('backgroundBlurStyle').getElement("options").getString('colorMode')).assertEqual('ThemeColorMode.System');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_static_0900", "END");
        done();
      });


    /**
     * @tc.number   SegmentButtonV2Test_static_0110
     * @tc.name     SegmentButtonV2Test_static_0110
     * @tc.desc     SegmentButtonV2Test_static_0110
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('SegmentButtonV2Test_static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("SegmentButtonV2Test_static_0110", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
        console.log("SegmentButtonV2Test_static_0110", JSON.stringify(tabSegmentButton))
        console.log("SegmentButtonV2Test_static_0110 buttonPadding ", tabSegmentButton.getElement('$attrs').getString('padding'))
        expect(tabSegmentButton.getElement('$attrs').getString('padding')).assertEqual('20.00fp');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_static_0110", "END");
        done();
      });

  })
}