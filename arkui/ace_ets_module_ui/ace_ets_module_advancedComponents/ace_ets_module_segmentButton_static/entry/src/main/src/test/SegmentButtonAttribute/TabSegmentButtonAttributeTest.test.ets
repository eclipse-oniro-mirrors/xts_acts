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
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function TabSegmentButtonAttributeTest() {
  describe('TabSegmentButtonAttributeTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("SegmentButtonV2Test beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TabSegmentButtonAttributeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SegmentButtonAttribute/TabSegmentButtonAttributeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TabSegmentButtonAttributeTest state pages:" + JSON.stringify(pages));
        if (!("TabSegmentButtonAttributeTest" == pages.name)) {
          console.info("get TabSegmentButtonAttributeTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TabSegmentButtonAttributeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabSegmentButtonAttributeTest page error:" + err);
      }
      console.info("TabSegmentButtonAttributeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('TabSegmentButtonAttributeTest after each called');
    });


    /**
     * @tc.number    TabSegmentButtonAttributeTest_static_0100
     * @tc.name      TabSegmentButtonAttributeTest_static_0100
     * @tc.desc      TabSegmentButtonAttributeTest_static_0100
     * @tc.level     2
     */
    it('TabSegmentButtonAttributeTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonAttributeTest_static_0100", "START");
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
        console.log("TabSegmentButtonAttributeTest_static_0100", JSON.stringify(tabSegmentButton.getElement('$attrs')))
        console.log("TabSegmentButtonAttributeTest_static_0100 itemSelectedFontWeight ", tabSegmentButton.getElement('$attrs').getString('fontWeight'))
        expect(tabSegmentButton.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonAttributeTest_static_0100", "END");
        done();
      });

    /**
     * @tc.number    TabSegmentButtonAttributeTest_static_0200
     * @tc.name      TabSegmentButtonAttributeTest_static_0200
     * @tc.desc      TabSegmentButtonAttributeTest_static_0200
     * @tc.level     2
     */
    it('TabSegmentButtonAttributeTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonAttributeTest_static_0200", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("TabSegmentButtonAttributeTest_static_0200", JSON.stringify(tabSegmentButton.getElement('$attrs')))
        console.log("TabSegmentButtonAttributeTest_static_0200 backgroundColor ", tabSegmentButton.getElement('$attrs').getString('backgroundColor'))
        expect(tabSegmentButton.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonAttributeTest_static_0200", "END");
        done();
      });


    /**
     * @tc.number    TabSegmentButtonAttributeTest_static_0300
     * @tc.name      TabSegmentButtonAttributeTest_static_0300
     * @tc.desc      TabSegmentButtonAttributeTest_static_0300
     * @tc.level     2
     */
    it('TabSegmentButtonAttributeTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonAttributeTest_static_0300", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("TabSegmentButtonAttributeTest_static_0300", JSON.stringify(tabSegmentButton.getElement('$attrs')))
        console.log("TabSegmentButtonAttributeTest_static_0300 backgroundBlurStyle ", tabSegmentButton.getElement('$attrs').getElement('backgroundBlurStyle').getString('value'))
        expect(tabSegmentButton.getElement('$attrs').getElement('backgroundBlurStyle').getString('value')).assertEqual('BlurStyle.Thin');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonAttributeTest_static_0300", "END");
        done();
      });

    /**
     * @tc.number    TabSegmentButtonAttributeTest_static_0400
     * @tc.name      TabSegmentButtonAttributeTest_static_0400
     * @tc.desc      TabSegmentButtonAttributeTest_static_0400
     * @tc.level     2
     */
    it('TabSegmentButtonAttributeTest_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonAttributeTest_static_0400", "START");
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
        console.log("TabSegmentButtonAttributeTest_static_0400", JSON.stringify(tabSegmentButton.getElement('$attrs')))
        console.log("TabSegmentButtonAttributeTest_static_0400 direction ", tabSegmentButton.getElement('$attrs').getString('direction'))
        expect(tabSegmentButton.getElement('$attrs').getString('direction')).assertEqual('Direction.Ltr');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonAttributeTest_static_0400", "END");
        done();
      });


    /**
     * @tc.number    TabSegmentButtonAttributeTest_static_0500
     * @tc.name      TabSegmentButtonAttributeTest_static_0500
     * @tc.desc      TabSegmentButtonAttributeTest_static_0500
     * @tc.level     2
     */
    it('TabSegmentButtonAttributeTest_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonAttributeTest_static_0500", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
        console.log("TabSegmentButtonAttributeTest_static_0500", JSON.stringify(tabSegmentButton.getElement('$attrs')))
        console.log("TabSegmentButtonAttributeTest_static_0500 buttonPadding ", tabSegmentButton.getElement('$attrs').getString('padding'))
        expect(tabSegmentButton.getElement('$attrs').getString('padding')).assertEqual('25.00vp');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonAttributeTest_static_0500", "END");
        done();
      });

    /**
     * @tc.number    TabSegmentButtonAttributeTest_static_0600
     * @tc.name      TabSegmentButtonAttributeTest_static_0600
     * @tc.desc      TabSegmentButtonAttributeTest_static_0600
     * @tc.level     2
     */
    it('TabSegmentButtonAttributeTest_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonAttributeTest_static_0600", "START");
        let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("TabSegmentButtonAttributeTest_static_0600", JSON.stringify(tabSegmentButton.getElement('$attrs')))
        console.log("TabSegmentButtonAttributeTest_static_0600 borderRadius ", tabSegmentButton.getElement('$attrs').getString('borderRadius'))
        expect(tabSegmentButton.getElement('$attrs').getString('borderRadius')).assertEqual('5.00px');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonAttributeTest_static_0600", "END");
        done();
      });

    /**
     * @tc.number   TabSegmentButtonAttributeTest_static_0700
     * @tc.name     TabSegmentButtonAttributeTest_static_0700
     * @tc.desc     TabSegmentButtonAttributeTest_static_0700
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('TabSegmentButtonAttributeTest_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonAttributeTest_static_0700", "START");
        let itemMinHeight = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[1]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[1]
        console.log("TabSegmentButtonAttributeTest_static_0700 itemMinHeight ", itemMinHeight.getElement('$attrs').getString('height'))
        expect(itemMinHeight.getElement('$attrs').getString('height')).assertEqual('80.00vp');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonAttributeTest_static_0700", "END");
        done();
      });


    /**
     * @tc.number    TabSegmentButtonAttributeTest_static_0800
     * @tc.name      TabSegmentButtonAttributeTest_static_0800
     * @tc.desc      TabSegmentButtonAttributeTest_static_0800
     * @tc.level     2
     */
    it('TabSegmentButtonAttributeTest_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonAttributeTest_static_0800", "START");
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
        console.log("TabSegmentButtonAttributeTest_static_0800", JSON.stringify(tabSegmentButton.getElement('$attrs')))
        console.log("TabSegmentButtonAttributeTest_static_0800 itemSelectedFontWeight ", tabSegmentButton.getElement('$attrs').getString('fontWeight'))
        expect(tabSegmentButton.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonAttributeTest_static_0800", "END");
        done();
      });

    /**
     * @tc.number    TabSegmentButtonAttributeTest_static_0900
     * @tc.name      TabSegmentButtonAttributeTest_static_0900
     * @tc.desc      TabSegmentButtonAttributeTest_static_0900
     * @tc.level     2
     */
    it('TabSegmentButtonAttributeTest_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonAttributeTest_static_0900", "START");
        let itemSpace = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
          .getArray("$children")[0]
          .getArray("$children")[0]
        await CommonFunc.sleep(500);
        let itemUnselected = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[5]
          .getArray("$children")[1]
          .getArray("$children")[0]
          .getArray("$children")[0]
        console.log("TabSegmentButtonAttributeTest_static_0900 itemSpace ", itemSpace.getElement('$attrs').getString('space'))
        console.log("TabSegmentButtonAttributeTest_static_0900 itemFontSize ", itemUnselected.getElement('$attrs').getString('fontSize'))
        console.log("TabSegmentButtonAttributeTest_static_0900 itemFontColor ", itemUnselected.getElement('$attrs').getString('fontColor'))
        console.log("TabSegmentButtonAttributeTest_static_0900 itemFontWeight ", itemUnselected.getElement('$attrs').getString('fontWeight'))
        expect(itemSpace.getElement('$attrs').getString('space')).assertEqual('2.00vp');
        expect(itemUnselected.getElement('$attrs').getString('fontSize')).assertEqual('15.00fp');
        expect(itemUnselected.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFC0CB');
        expect(itemUnselected.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonAttributeTest_static_0900", "END");
        done();
      });


    /**
     * @tc.number    TabSegmentButtonAttributeTest_static_1000
     * @tc.name      TabSegmentButtonAttributeTest_static_1000
     * @tc.desc      TabSegmentButtonAttributeTest_static_1000
     * @tc.level     2
     */
    it('TabSegmentButtonAttributeTest_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonAttributeTest_static_1000", "START");
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
        console.log("TabSegmentButtonAttributeTest_static_1000 itemSymbolFontSize ", symbol.getElement('$attrs').getString('fontSize'))
        expect(symbol.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonAttributeTest_static_1000", "END");
        done();
      });

    /**
     * @tc.number    TabSegmentButtonAttributeTest_static_1100
     * @tc.name      TabSegmentButtonAttributeTest_static_1100
     * @tc.desc      TabSegmentButtonAttributeTest_static_1100
     * @tc.level     2
     */
    it('TabSegmentButtonAttributeTest_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonAttributeTest_static_1100", "START");
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
        console.log("TabSegmentButtonAttributeTest_static_1100 itemIconFillColor ", imageUnselected.getElement('$attrs').getString('fillColor'))
        expect(imageUnselected.getElement('$attrs').getString('fillColor')).assertEqual('#99000000');
        console.log("TabSegmentButtonAttributeTest_static_1100", "END");
        done();
      });
  })
}