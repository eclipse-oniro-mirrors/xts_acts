'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';

export default function MeasureJsunit() {
  describe('MeasureJsunit', () => {
    beforeAll(() => {
      console.info("MeasureJsunit beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("MeasureJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/MeasureSize/measureSize',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get MeasureJsunit state pages:" + JSON.stringify(pages));
        if (!("measureSize" == pages.name)) {
          console.info("get MeasureJsunit pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push MeasureJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MeasureJsunit page error:" + err);
      }
      console.info("MeasureJsunit beforeEach end");
    }); 

    
    
/**
     * @tc.number   ArkUI_Stage_Measure_static_0100
     * @tc.name     ArkUI_Stage_Measure_static_0100
     * @tc.desc     ArkUI_Stage_Measure_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Measure_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ArkUI_Stage_Measure_static_0100 START');
      await CommonFunc.sleep(2000);
      let strJsonMaxLine2 = inspector.getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = inspector.getInspectorByKey('textSizeMaxLine3');
      console.log('[ArkUI_Stage_Measure_static_0100] component strJsonMaxLine2 is: ' + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine2)));
      console.log('[ArkUI_Stage_Measure_static_0100] component strJsonMaxLine3 is: ' + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine3)));
      expect(JSON.parseJsonElement(strJsonMaxLine2).getElement('$attrs').getString('content')).assertEqual(JSON.parseJsonElement(strJsonMaxLine3).getElement('$attrs').getString('content'));
      done();
    });
    
    
/**
     * @tc.number   ArkUI_Stage_Measure_static_0200
     * @tc.name     ArkUI_Stage_Measure_static_0200
     * @tc.desc     ArkUI_Stage_Measure_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Measure_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ArkUI_Stage_Measure_static_0200 START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let testForTextIndentButton = await driver.findComponent(ON.id('testForTextIndent'));
      await CommonFunc.sleep(500);
      await (testForTextIndentButton?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJsonMaxLine2 = inspector.getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = inspector.getInspectorByKey('textSizeMaxLine3');
      console.log('[ArkUI_Stage_Measure_static_0200] component strJsonMaxLine2 is: ' + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine2)));
      console.log('[ArkUI_Stage_Measure_static_0200] component strJsonMaxLine3 is: ' + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine3)));
      expect(Number.parseInt(JSON.parseJsonElement(strJsonMaxLine3).getElement('$attrs').getString('content')))
        .assertLarger(Number.parseInt(JSON.parseJsonElement(strJsonMaxLine2).getElement('$attrs').getString('content')));
      done();
    });
    
    
/**
     * @tc.number   ArkUI_Stage_Measure_static_0300
     * @tc.name     ArkUI_Stage_Measure_static_0300
     * @tc.desc     ArkUI_Stage_Measure_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Measure_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ArkUI_Stage_Measure_static_0300 START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let resetButton = await driver.findComponent(ON.id('reset'));
      await CommonFunc.sleep(500);
      await (resetButton?.click() as Promise<void>);  // Error in APIcomponentSnapshotGetSync_static_0100, undefined cannot be cast to Promise<Component|null>
      await CommonFunc.sleep(2000);
      let strJsonMaxLine2 = inspector.getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = inspector.getInspectorByKey('textSizeMaxLine3');
      console.log('[ArkUI_Stage_Measure_static_0300] component strJsonMaxLine2 is: ' + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine2)));
      console.log('[ArkUI_Stage_Measure_static_0300] component strJsonMaxLine3 is: ' + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine3)));
      expect(JSON.parseJsonElement(strJsonMaxLine2).getElement('$attrs').getString('content')).assertEqual(JSON.parseJsonElement(strJsonMaxLine3).getElement('$attrs').getString('content'));
      let testForWordBreakButton = await driver.findComponent(ON.id('testForWordBreak'));
      await CommonFunc.sleep(500);
      (testForWordBreakButton?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      strJsonMaxLine2 = inspector.getInspectorByKey('textSizeMaxLine2');
      strJsonMaxLine3 = inspector.getInspectorByKey('textSizeMaxLine3');
      console.log('[ArkUI_Stage_Measure_static_0300] component strJsonMaxLine2 is: ' + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine2)));
      console.log('[ArkUI_Stage_Measure_static_0300] component strJsonMaxLine3 is: ' + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine3)));
      expect(Number.parseInt(JSON.parseJsonElement(strJsonMaxLine3).getElement('$attrs').getString('content'))).assertLarger(Number.parseInt(JSON.parseJsonElement(strJsonMaxLine2).getElement('$attrs').getString('content')));
      done();
    });
    
    
/**
     * @tc.number   ArkUI_Stage_Measure_static_0400
     * @tc.name     ArkUI_Stage_Measure_static_0400
     * @tc.desc     ArkUI_Stage_Measure_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Measure_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ArkUI_Stage_Measure_static_0400 START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let resetButton = await driver.findComponent(ON.id('resetInChinese'));
      await CommonFunc.sleep(500);
      await (resetButton?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJsonMaxLine2 = inspector.getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = inspector.getInspectorByKey('textSizeMaxLine3');
      console.log('[ArkUI_Stage_Measure_static_0400] component strJsonMaxLine2 is: ' + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine2)));
      console.log('[ArkUI_Stage_Measure_static_0400] component strJsonMaxLine3 is: ' + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine3)));
      expect(JSON.parseJsonElement(strJsonMaxLine2).getElement('$attrs').getString('content')).assertEqual(JSON.parseJsonElement(strJsonMaxLine3).getElement('$attrs').getString('content'));
      done();
    });
    
    
/**
     * @tc.number   ArkUI_Stage_Measure_static_0500
     * @tc.name     ArkUI_Stage_Measure_static_0500
     * @tc.desc     ArkUI_Stage_Measure_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Measure_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ArkUI_Stage_Measure_static_0500 START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let resetButton = await driver.findComponent(ON.id('resetInChinese'));
      await CommonFunc.sleep(500);
      await (resetButton?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let testForTextIndentButton = await driver.findComponent(ON.id('testForTextIndentInChinese'));
      await CommonFunc.sleep(500);
      await (testForTextIndentButton?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJsonMaxLine2 = inspector.getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = inspector.getInspectorByKey('textSizeMaxLine3');
      console.log('[ArkUI_Stage_Measure_static_0500] component strJsonMaxLine2 is: ' + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine2)));
      console.log('[ArkUI_Stage_Measure_static_0500] component strJsonMaxLine3 is: ' + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine3)));
      expect(Number.parseInt(JSON.parseJsonElement(strJsonMaxLine3).getElement('$attrs').getString('content')))
        .assertLarger(Number.parseInt(JSON.parseJsonElement(strJsonMaxLine2).getElement('$attrs').getString('content')));
      done();
    });
  })
}