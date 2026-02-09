'use static';
/*
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
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils'


export default function columnWidthsTest() {
  describe('columnWidthsTest', () => {
    beforeAll(() => {
      console.info("columnWidthsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
    });

      beforeEach(async () => {
      console.info('columnWidthTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/columnWidths',
      }
      console.info('columnWidchTest beforeEach End');
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get columnWidthTest state success " + JSON.stringify(pages));
        if (!("columnWidths" == pages.name)) {
          console.info("get columnWidthTest pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        } 
      } catch (err) {
        console.error("push columnWidthTest page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
      afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('columnWidthTest after each called');
    })
    
    
/**
     * @tc.number   columnWidthsText_static_0100
     * @tc.name     columnWidthsText_static_0100
     * @tc.desc     columnWidthsText_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3
     */
it('columnWidthsText_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        console.info('columnWidthsText_static_0100 START');
        await Utils.sleep(1000); 
        let strJson = inspector.getInspectorByKey('columnWidths_001');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[columnWidthsText_static_0100]:" + JSON.stringify(obj.getElement('$attrs').getString('columnWidths')));
        expect(obj.getElement('$attrs').getString('columnWidths')).assertEqual(UIContext.resolveUIContext()!.vp2px(100).toFixed(2).toString() + 'px');
        await Utils.sleep(1000);
        console.info('columnWidthsText_static_0100 END');
        done();
      });
  
      
      
/**
     * @tc.number   columnWidthsText_static_0101
     * @tc.name     columnWidthsText_static_0101
     * @tc.desc     columnWidthsText_static_0101
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3
     */
it('columnWidthsText_static_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        console.info("columnWidthsText_static_0101 start");
        await Utils.sleep(1000);
        let strJson = inspector.getInspectorByKey('columnWidths_002');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[Testsjh_0101]:" + JSON.stringify(obj.getElement('$attrs')));
        console.info("[columnWitchTest_static_0101]:" + JSON.stringify(obj.getElement('$attrs').getString('columnWidths')));
        let str = UIContext.resolveUIContext()!.vp2px(20).toFixed(2).toString() + 'px,' + UIContext.resolveUIContext()!.vp2px(40).toFixed(2).toString() + 'px,'
        + UIContext.resolveUIContext()!.vp2px(60).toFixed(2).toString() + 'px';
        expect(obj.getElement('$attrs').getString('columnWidths')).assertEqual(str);
        await Utils.sleep(1000);
        console.info('columnWidthsText_static_0101 END');
        done();
      })
  
      
      
/**
     * @tc.number   columnWidthsText_static_0102
     * @tc.name     columnWidthsText_static_0102
     * @tc.desc     columnWidthsText_static_0102
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3
     */
it('columnWidthsText_static_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        console.info("columnWidthsText_static_0102 start");
        await Utils.sleep(1000);
        let strJson = inspector.getInspectorByKey('columnWidths_003');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[Testsjh_0102]:" + JSON.stringify(obj.getElement('$attrs')));
        console.info("[columnWitchTest_static_0102]:" + JSON.stringify(obj.getElement('$attrs').getString('columnWidths')));
        let str = UIContext.resolveUIContext()!.vp2px(112).toFixed(2).toString() + 'px,' + UIContext.resolveUIContext()!.vp2px(112).toFixed(2).toString() + 'px,'
        + UIContext.resolveUIContext()!.vp2px(112).toFixed(2).toString() + 'px';
        expect(obj.getElement('$attrs').getString('columnWidths')).assertEqual(str);
        await Utils.sleep(1000);
        console.info('columnWidthsText_static_0102 END');
        done();
      })
  
      
      
/**
     * @tc.number   columnWidthsText_static_0103
     * @tc.name     columnWidthsText_static_0103
     * @tc.desc     columnWidthsText_static_0103
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3
     */
it('columnWidthsText_static_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        console.info("columnWidthsText_static_0103 start");
        await Utils.sleep(1000);
        let strJson = inspector.getInspectorByKey('columnWidths_004');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[columnWitchTest_static_0103]:" + JSON.stringify(obj.getElement('$attrs').getString('columnWidths')));
        let str = UIContext.resolveUIContext()!.vp2px(112).toFixed(2).toString() + 'px,' + UIContext.resolveUIContext()!.vp2px(112).toFixed(2).toString() + 'px,'
        + UIContext.resolveUIContext()!.vp2px(112).toFixed(2).toString() + 'px';
        expect(obj.getElement('$attrs').getString('columnWidths')).assertEqual(str);
        await Utils.sleep(1000);
        console.info('columnWidthsText_static_0103 END');
        done();
      })
  })
}