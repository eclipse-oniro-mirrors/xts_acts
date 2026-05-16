'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Component } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function AutoHideComponentUniqueIdsTest() {
  describe('AutoHideComponentUniqueIdsTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api24.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/autoHideComponentUniqueIds/AutoHideComponentUniqueIdsPage',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AutoHideComponentUniqueIdsTest state pages: " + JSON.stringify(pages));
        if (!("AutoHideComponentUniqueIdsPage" == pages.name)) {
          console.info("get AutoHideComponentUniqueIdsTest pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AutoHideComponentUniqueIdsTest page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AutoHideComponentUniqueIdsTest after each called");
    });

    /**
     * @tc.name    testDragEventAutoHideSingleNumber
     * @tc.number  SUB_ArkUI_DragDrop_AutoHideComponentUniqueIds_0100
     * @tc.desc    Test DragEvent.autoHideComponentUniqueIds with single number during drag.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testDragEventAutoHideSingleNumber', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testDragEventAutoHideSingleNumber START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let btn1 = await driver.findComponent(ON.id('btnTest1'));
      await btn1?.click();
      await CommonFunc.sleep(300);
      
      let dragSource = await driver.findComponent(ON.id('dragSource1'));
      let targetLabel = await driver.findComponent(ON.id('testTypeLabel'));
      await (dragSource?.dragTo(targetLabel!) as Promise<void>);
      await CommonFunc.sleep(500);
      
      let strJson = inspector.getInspectorByKey('dragSource2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testDragEventAutoHideSingleNumber] dragSource2 visibility: " + obj.getElement('$attrs').getString('visibility'));
      expect(obj.getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      
      console.info('testDragEventAutoHideSingleNumber END');
      done();
    });

    /**
     * @tc.name    testDragEventAutoHideNumberArray
     * @tc.number  SUB_ArkUI_DragDrop_AutoHideComponentUniqueIds_0200
     * @tc.desc    Test DragEvent.autoHideComponentUniqueIds with number array during drag.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testDragEventAutoHideNumberArray', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testDragEventAutoHideNumberArray START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let btn2 = await driver.findComponent(ON.id('btnTest2'));
      await btn2?.click();
      await CommonFunc.sleep(300);
      
      let dragSource = await driver.findComponent(ON.id('dragSource1'));
      let targetLabel = await driver.findComponent(ON.id('testTypeLabel'));
      await (dragSource?.dragTo(targetLabel!) as Promise<void>);
      await CommonFunc.sleep(500);
      
      let strJson2 = inspector.getInspectorByKey('dragSource2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[testDragEventAutoHideNumberArray] dragSource2 visibility: " + obj2.getElement('$attrs').getString('visibility'));
      expect(obj2.getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      
      let strJson3 = inspector.getInspectorByKey('dragSource3');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[testDragEventAutoHideNumberArray] dragSource3 visibility: " + obj3.getElement('$attrs').getString('visibility'));
      expect(obj3.getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      
      console.info('testDragEventAutoHideNumberArray END');
      done();
    });

    /**
     * @tc.name    testDragEventAutoHideEmptyArray
     * @tc.number  SUB_ArkUI_DragDrop_AutoHideComponentUniqueIds_0300
     * @tc.desc    Test DragEvent.autoHideComponentUniqueIds with empty array during drag.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testDragEventAutoHideEmptyArray', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testDragEventAutoHideEmptyArray START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let btn3 = await driver.findComponent(ON.id('btnTest3'));
      await btn3?.click();
      await CommonFunc.sleep(300);
      
      let dragSource = await driver.findComponent(ON.id('dragSource1'));
      let targetLabel = await driver.findComponent(ON.id('testTypeLabel'));
      await (dragSource?.dragTo(targetLabel!) as Promise<void>);
      await CommonFunc.sleep(500);
      
      let strJson1 = inspector.getInspectorByKey('dragSource1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testDragEventAutoHideEmptyArray] dragSource1 visibility: " + obj1.getElement('$attrs').getString('visibility'));
      expect(obj1.getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      
      let strJson2 = inspector.getInspectorByKey('dragSource2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[testDragEventAutoHideEmptyArray] dragSource2 visibility: " + obj2.getElement('$attrs').getString('visibility'));
      expect(obj2.getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      
      let strJson3 = inspector.getInspectorByKey('dragSource3');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[testDragEventAutoHideEmptyArray] dragSource3 visibility: " + obj3.getElement('$attrs').getString('visibility'));
      expect(obj3.getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      
      console.info('testDragEventAutoHideEmptyArray END');
      done();
    });

    /**
     * @tc.name    testDragEventAutoHideIncludeSelf
     * @tc.number  SUB_ArkUI_DragDrop_AutoHideComponentUniqueIds_0400
     * @tc.desc    Test DragEvent.autoHideComponentUniqueIds including drag source itself.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testDragEventAutoHideIncludeSelf', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testDragEventAutoHideIncludeSelf START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let btn4 = await driver.findComponent(ON.id('btnTest4'));
      await btn4?.click();
      await CommonFunc.sleep(300);
      
      let dragSource = await driver.findComponent(ON.id('dragSource1'));
      let targetLabel = await driver.findComponent(ON.id('testTypeLabel'));
      await (dragSource?.dragTo(targetLabel!) as Promise<void>);
      await CommonFunc.sleep(500);
      
      let strJson1 = inspector.getInspectorByKey('dragSource1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testDragEventAutoHideIncludeSelf] dragSource1 visibility: " + obj1.getElement('$attrs').getString('visibility'));
      expect(obj1.getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      
      let strJson2 = inspector.getInspectorByKey('dragSource2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[testDragEventAutoHideIncludeSelf] dragSource2 visibility: " + obj2.getElement('$attrs').getString('visibility'));
      expect(obj2.getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      
      console.info('testDragEventAutoHideIncludeSelf END');
      done();
    });

    /**
     * @tc.name    testDragControllerAutoHideSingleNumber
     * @tc.number  SUB_ArkUI_DragDrop_AutoHideComponentUniqueIds_0500
     * @tc.desc    Test dragController.DragInfo.autoHideComponentUniqueIds with single number.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testDragControllerAutoHideSingleNumber', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testDragControllerAutoHideSingleNumber START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      
      let exBtn1 = await driver.findComponent(ON.id('btnExTest1'));
      await exBtn1?.click();
      await CommonFunc.sleep(300);
      
      let execBtn = await driver.findComponent(ON.id('btnExecuteDrag'));
      await execBtn?.click();
      await CommonFunc.sleep(1000);
      
      let strJson2 = inspector.getInspectorByKey('dragSource2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[testDragControllerAutoHideSingleNumber] dragSource2 visibility: " + obj2.getElement('$attrs').getString('visibility'));
      expect(obj2.getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      
      console.info('testDragControllerAutoHideSingleNumber END');
      done();
    });

    /**
     * @tc.name    testDragControllerAutoHideNumberArray
     * @tc.number  SUB_ArkUI_DragDrop_AutoHideComponentUniqueIds_0600
     * @tc.desc    Test dragController.DragInfo.autoHideComponentUniqueIds with number array.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testDragControllerAutoHideNumberArray', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testDragControllerAutoHideNumberArray START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      
      let exBtn2 = await driver.findComponent(ON.id('btnExTest2'));
      await exBtn2?.click();
      await CommonFunc.sleep(300);
      
      let execBtn = await driver.findComponent(ON.id('btnExecuteDrag'));
      await execBtn?.click();
      await CommonFunc.sleep(1000);
      
      let strJson2 = inspector.getInspectorByKey('dragSource2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[testDragControllerAutoHideNumberArray] dragSource2 visibility: " + obj2.getElement('$attrs').getString('visibility'));
      expect(obj2.getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      
      let strJson3 = inspector.getInspectorByKey('dragSource3');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[testDragControllerAutoHideNumberArray] dragSource3 visibility: " + obj3.getElement('$attrs').getString('visibility'));
      expect(obj3.getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      
      console.info('testDragControllerAutoHideNumberArray END');
      done();
    });

    /**
     * @tc.name    testDragControllerAutoHideEmptyArray
     * @tc.number  SUB_ArkUI_DragDrop_AutoHideComponentUniqueIds_0700
     * @tc.desc    Test dragController.DragInfo.autoHideComponentUniqueIds with empty array.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testDragControllerAutoHideEmptyArray', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testDragControllerAutoHideEmptyArray START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      
      let exBtn3 = await driver.findComponent(ON.id('btnExTest3'));
      await exBtn3?.click();
      await CommonFunc.sleep(300);
      
      let execBtn = await driver.findComponent(ON.id('btnExecuteDrag'));
      await execBtn?.click();
      await CommonFunc.sleep(1000);
      
      let strJson1 = inspector.getInspectorByKey('dragSource1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testDragControllerAutoHideEmptyArray] dragSource1 visibility: " + obj1.getElement('$attrs').getString('visibility'));
      expect(obj1.getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      
      let strJson2 = inspector.getInspectorByKey('dragSource2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[testDragControllerAutoHideEmptyArray] dragSource2 visibility: " + obj2.getElement('$attrs').getString('visibility'));
      expect(obj2.getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      
      let strJson3 = inspector.getInspectorByKey('dragSource3');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[testDragControllerAutoHideEmptyArray] dragSource3 visibility: " + obj3.getElement('$attrs').getString('visibility'));
      expect(obj3.getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      
      console.info('testDragControllerAutoHideEmptyArray END');
      done();
    });
  });
}