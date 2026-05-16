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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function AutoHideComponentUniqueIdsTest() {

  describe('AutoHideComponentUniqueIdsTest', () => {

    let PAGE_TAG: string = 'AutoHideComponentUniqueIdsTest';
    let driver: Driver = Driver.create();

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`autoHideComponentUniqueIds/${PAGE_TAG}`, done);
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name    testDragEventAutoHideSingleNumber
     * @tc.number  SUB_ArkUI_DragDrop_AutoHideComponentUniqueIds_0100
     * @tc.desc    Test DragEvent.autoHideComponentUniqueIds with single number during drag.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testDragEventAutoHideSingleNumber', Level.LEVEL1, async (done: Function) => {
      console.info('[testDragEventAutoHideSingleNumber] START');
      
      let btn1 = await driver.findComponent(ON.id('btnTest1'));
      await btn1.click();
      await Utils.sleep(300);
      
      let dragSource = await driver.findComponent(ON.id('dragSource1'));
      let sourceRect = await dragSource.getBounds();
      
      let startX: number = sourceRect.left + Math.floor((sourceRect.right - sourceRect.left) / 2);
      let startY: number = sourceRect.bottom - Math.floor((sourceRect.bottom - sourceRect.top) * 0.1);
      let endX: number = startX;
      let endY: number = startY - Math.floor((sourceRect.bottom - sourceRect.top) * 3);
      
      console.info(`[testDragEventAutoHideSingleNumber] drag upward from (${startX}, ${startY}) to (${endX}, ${endY})`);
      
      await driver.drag(startX, startY, endX, endY);
      await Utils.sleep(500);
      
      let strJson = getInspectorByKey('dragSource2');
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[testDragEventAutoHideSingleNumber] dragSource2 visibility: ${obj.$attrs.visibility}`);
      expect(obj.$attrs.visibility).assertEqual('Visibility.None');
      
      console.info('[testDragEventAutoHideSingleNumber] END');
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
    it('testDragEventAutoHideNumberArray', Level.LEVEL1, async (done: Function) => {
      console.info('[testDragEventAutoHideNumberArray] START');
      
      let btn2 = await driver.findComponent(ON.id('btnTest2'));
      await btn2.click();
      await Utils.sleep(300);
      
      let dragSource = await driver.findComponent(ON.id('dragSource1'));
      let sourceRect = await dragSource.getBounds();
      
      let startX: number = sourceRect.left + Math.floor((sourceRect.right - sourceRect.left) / 2);
      let startY: number = sourceRect.bottom - Math.floor((sourceRect.bottom - sourceRect.top) * 0.1);
      let endX: number = startX;
      let endY: number = startY - Math.floor((sourceRect.bottom - sourceRect.top) * 3);
      
      console.info(`[testDragEventAutoHideNumberArray] drag upward from (${startX}, ${startY}) to (${endX}, ${endY})`);
      
      await driver.drag(startX, startY, endX, endY);
      await Utils.sleep(500);
      
      let strJson2 = getInspectorByKey('dragSource2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`[testDragEventAutoHideNumberArray] dragSource2 visibility: ${obj2.$attrs.visibility}`);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.None');
      
      let strJson3 = getInspectorByKey('dragSource3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info(`[testDragEventAutoHideNumberArray] dragSource3 visibility: ${obj3.$attrs.visibility}`);
      expect(obj3.$attrs.visibility).assertEqual('Visibility.None');
      
      console.info('[testDragEventAutoHideNumberArray] END');
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
    it('testDragEventAutoHideEmptyArray', Level.LEVEL1, async (done: Function) => {
      console.info('[testDragEventAutoHideEmptyArray] START');
      
      let btn3 = await driver.findComponent(ON.id('btnTest3'));
      await btn3.click();
      await Utils.sleep(300);
      
      let dragSource = await driver.findComponent(ON.id('dragSource1'));
      let sourceRect = await dragSource.getBounds();
      
      let startX: number = sourceRect.left + Math.floor((sourceRect.right - sourceRect.left) / 2);
      let startY: number = sourceRect.bottom - Math.floor((sourceRect.bottom - sourceRect.top) * 0.1);
      let endX: number = startX;
      let endY: number = startY - Math.floor((sourceRect.bottom - sourceRect.top) * 3);
      
      console.info(`[testDragEventAutoHideEmptyArray] drag upward from (${startX}, ${startY}) to (${endX}, ${endY})`);
      
      await driver.drag(startX, startY, endX, endY);
      await Utils.sleep(500);
      
      let strJson1 = getInspectorByKey('dragSource1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info(`[testDragEventAutoHideEmptyArray] dragSource1 visibility: ${obj1.$attrs.visibility}`);
      expect(obj1.$attrs.visibility).assertEqual('Visibility.Visible');
      
      let strJson2 = getInspectorByKey('dragSource2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`[testDragEventAutoHideEmptyArray] dragSource2 visibility: ${obj2.$attrs.visibility}`);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.Visible');
      
      let strJson3 = getInspectorByKey('dragSource3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info(`[testDragEventAutoHideEmptyArray] dragSource3 visibility: ${obj3.$attrs.visibility}`);
      expect(obj3.$attrs.visibility).assertEqual('Visibility.Visible');
      
      console.info('[testDragEventAutoHideEmptyArray] END');
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
    it('testDragEventAutoHideIncludeSelf', Level.LEVEL1, async (done: Function) => {
      console.info('[testDragEventAutoHideIncludeSelf] START');
      
      let btn4 = await driver.findComponent(ON.id('btnTest4'));
      await btn4.click();
      await Utils.sleep(300);
      
      let dragSource = await driver.findComponent(ON.id('dragSource1'));
      let sourceRect = await dragSource.getBounds();
      
      let startX: number = sourceRect.left + Math.floor((sourceRect.right - sourceRect.left) / 2);
      let startY: number = sourceRect.bottom - Math.floor((sourceRect.bottom - sourceRect.top) * 0.1);
      let endX: number = startX;
      let endY: number = startY - Math.floor((sourceRect.bottom - sourceRect.top) * 3);
      
      console.info(`[testDragEventAutoHideIncludeSelf] drag upward from (${startX}, ${startY}) to (${endX}, ${endY})`);
      
      await driver.drag(startX, startY, endX, endY);
      await Utils.sleep(500);
      
      let strJson1 = getInspectorByKey('dragSource1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info(`[testDragEventAutoHideIncludeSelf] dragSource1 visibility: ${obj1.$attrs.visibility}`);
      expect(obj1.$attrs.visibility).assertEqual('Visibility.None');
      
      let strJson2 = getInspectorByKey('dragSource2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`[testDragEventAutoHideIncludeSelf] dragSource2 visibility: ${obj2.$attrs.visibility}`);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.None');
      
      console.info('[testDragEventAutoHideIncludeSelf] END');
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
    it('testDragControllerAutoHideSingleNumber', Level.LEVEL1, async (done: Function) => {
      console.info('[testDragControllerAutoHideSingleNumber] START');
      
      let exBtn1 = await driver.findComponent(ON.id('btnExTest1'));
      await exBtn1.click();
      await Utils.sleep(300);
      
      let execBtn = await driver.findComponent(ON.id('btnExecuteDrag'));
      await execBtn.click();
      await Utils.sleep(1000);
      
      let strJson2 = getInspectorByKey('dragSource2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`[testDragControllerAutoHideSingleNumber] dragSource2 visibility: ${obj2.$attrs.visibility}`);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.None');
      
      console.info('[testDragControllerAutoHideSingleNumber] END');
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
    it('testDragControllerAutoHideNumberArray', Level.LEVEL1, async (done: Function) => {
      console.info('[testDragControllerAutoHideNumberArray] START');
      
      let exBtn2 = await driver.findComponent(ON.id('btnExTest2'));
      await exBtn2.click();
      await Utils.sleep(300);
      
      let execBtn = await driver.findComponent(ON.id('btnExecuteDrag'));
      await execBtn.click();
      await Utils.sleep(1000);
      
      let strJson2 = getInspectorByKey('dragSource2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`[testDragControllerAutoHideNumberArray] dragSource2 visibility: ${obj2.$attrs.visibility}`);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.None');
      
      let strJson3 = getInspectorByKey('dragSource3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info(`[testDragControllerAutoHideNumberArray] dragSource3 visibility: ${obj3.$attrs.visibility}`);
      expect(obj3.$attrs.visibility).assertEqual('Visibility.None');
      
      console.info('[testDragControllerAutoHideNumberArray] END');
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
    it('testDragControllerAutoHideEmptyArray', Level.LEVEL1, async (done: Function) => {
      console.info('[testDragControllerAutoHideEmptyArray] START');
      
      let exBtn3 = await driver.findComponent(ON.id('btnExTest3'));
      await exBtn3.click();
      await Utils.sleep(300);
      
      let execBtn = await driver.findComponent(ON.id('btnExecuteDrag'));
      await execBtn.click();
      await Utils.sleep(1000);
      
      let strJson1 = getInspectorByKey('dragSource1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info(`[testDragControllerAutoHideEmptyArray] dragSource1 visibility: ${obj1.$attrs.visibility}`);
      expect(obj1.$attrs.visibility).assertEqual('Visibility.Visible');
      
      let strJson2 = getInspectorByKey('dragSource2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`[testDragControllerAutoHideEmptyArray] dragSource2 visibility: ${obj2.$attrs.visibility}`);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.Visible');
      
      let strJson3 = getInspectorByKey('dragSource3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info(`[testDragControllerAutoHideEmptyArray] dragSource3 visibility: ${obj3.$attrs.visibility}`);
      expect(obj3.$attrs.visibility).assertEqual('Visibility.Visible');
      
      console.info('[testDragControllerAutoHideEmptyArray] END');
      done();
    });
  })
}