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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";

export default function CheckboxTest() {
  describe('CheckboxTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Checkbox/CheckboxTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get checkBox state pages:" + JSON.stringify(pages));
        if (!("CheckBox1" == pages.name)) {
          console.info("get checkBox pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push checkBox page error " + JSON.stringify(err));
      }
    });

    
        /**
     * @tc.number   ArkUX_CheckBox_Visual_0110
     * @tc.name     ArkUX_CheckBox_Visual_0110
     * @tc.desc     ArkUX_CheckBox_Visual_0110
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_CheckBox_Visual_0110', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_CheckBox_Visual_0110 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_CheckBox_Visual_0110');
          console.info('ArkUX_CheckBox_Visual_0110 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_CheckBox_Visual_0110 obj is: " + JSON.stringify(obj));
          let shape = obj.getElement('$attrs').getString('shape');
          expect(shape).assertEqual("0");
          console.info('ArkUX_CheckBox_Visual_0110 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_CheckBox_Visual_0110 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    
        /**
     * @tc.number   ArkUX_CheckBox_Visual_0120
     * @tc.name     ArkUX_CheckBox_Visual_0120
     * @tc.desc     ArkUX_CheckBox_Visual_0120
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_CheckBox_Visual_0120', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_CheckBox_Visual_0120 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_CheckBox_Visual_0120');
          console.info('ArkUX_CheckBox_Visual_0120 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_CheckBox_Visual_0120 obj is: " + JSON.stringify(obj));
          let shape = obj.getElement('$attrs').getString('shape');
          expect(shape).assertEqual("1");
          console.info('ArkUX_CheckBox_Visual_0120 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_CheckBox_Visual_0120 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    
        /**
     * @tc.number   ArkUX_CheckBox_Visual_0130
     * @tc.name     ArkUX_CheckBox_Visual_0130
     * @tc.desc     ArkUX_CheckBox_Visual_0130
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_CheckBox_Visual_0130', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_CheckBox_Visual_0130 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_CheckBox_Visual_0130');
          console.info('ArkUX_CheckBox_Visual_0130 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_CheckBox_Visual_0130 obj is: " + JSON.stringify(obj));
          let shape = obj.getElement('$attrs').getString('shape');
          expect(shape).assertEqual("0");
          console.info('ArkUX_CheckBox_Visual_0130 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_CheckBox_Visual_0130 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

  })
}