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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';
export default function checkBoxGroupTest() {
  describe('checkBoxGroupTest', () => {

     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });
    
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/checkBoxGroup",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CheckBoxGroup state success " + JSON.stringify(pages));
        if (!("checkBoxGroup" == pages.name)) {
          console.info("get CheckBoxGroup state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push CheckBoxGroup page error " + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_static_1000
     * @tc.name     ArkUX_Stage_CheckboxGroup_static_1000
     * @tc.desc     ArkUX_Stage_CheckboxGroup_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_CheckboxGroup_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('ArkUX_Stage_CheckboxGroup_static_1000 START');
        let strJson = inspector.getInspectorByKey('checkboxNO');
        console.info('ArkUX_Stage_CheckboxGroup_static_1000 START  :' + JSON.stringify(strJson));
        expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mark')).getString('strokeWidth')).assertEqual("15.00vp");
        expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mark')).getString('size')).assertEqual("10.00vp");
        expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mark')).getString('strokeColor')).assertEqual('#FFFF00FF');
        console.info('ArkUX_Stage_CheckboxGroup_static_1000 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_CheckboxGroup_static_1000 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1001
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1001
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1001
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1001 START');
        let strJson = inspector.getInspectorByKey('checkboxNO');
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1001 START  :' + JSON.stringify(strJson));
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('unselectedColor')).assertEqual('#FF123456');
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1001 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_static_1001 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1002
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1002
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1002
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1002 START');
      let strJson = inspector.getInspectorByKey('checkboxNO');
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1002 START  :' + JSON.stringify(strJson));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectAll')).assertEqual('false');
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1002 END ');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003 START');
        let strJson = inspector.getInspectorByKey('checkboxNO');
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003 START  :' + JSON.stringify(strJson));
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor')).assertEqual('#FF321456');
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1004
     * @tc.name     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1004
     * @tc.desc     ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1004
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1004 START');
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('checkboxNO');
      console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1004 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('unselectedColor')).assertEqual('#FF121212');
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1004 END');
      done();
    });
  })
}
