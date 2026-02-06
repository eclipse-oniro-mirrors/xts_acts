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
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}


export default function toggleJsunit() {


  describe('toggleTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    /**
     * run before testcase
     */
    beforeEach(async (): Promise<void> => {
      console.info('[toggleTest] before each called');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/Toggle',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        let pages:router.RouterState = routerInstance.getState();
        console.info("[toggleTest] current page is: " + JSON.stringify(pages.name));
        if (!('Toggle' == pages.name)) {
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.info("push toggle page page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    
    
    /**
     * @tc.number   testToggle010_static
     * @tc.name     testToggle010_static
     * @tc.desc     testToggle010_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle010_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testToggle010 START');
      let strJson = inspector.getInspectorByKey('toggle1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[toggle1] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('Toggle');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ToggleType.Switch');
      expect(obj.getElement('$attrs').getString('isOn')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getString('switchPointColor')).assertEqual('#FF808080');
      console.info('testToggle010 End');
      done();
    });



    
    
    /**
     * @tc.number   testToggle020_static
     * @tc.name     testToggle020_static
     * @tc.desc     testToggle020_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle020_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testToggle020 START');
      let strJson = inspector.getInspectorByKey('toggle2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[toggle2] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('Toggle');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ToggleType.Switch');
      expect(obj.getElement('$attrs').getString('isOn')).assertEqual('true');
      console.info('testToggle020 End');
      done();
    });



    
    
    /**
     * @tc.number   testToggle030_static
     * @tc.name     testToggle030_static
     * @tc.desc     testToggle030_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle030_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testToggle030 START');
      let strJson = inspector.getInspectorByKey('toggle3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[toggle3] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('Toggle');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ToggleType.Checkbox');
      expect(obj.getElement('$attrs').getString('isOn')).assertEqual('false');
      console.info('testToggle030 End');
      done();
    });



    
    
    /**
     * @tc.number   testToggle040_static
     * @tc.name     testToggle040_static
     * @tc.desc     testToggle040_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle040_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testToggle040 START');
      let strJson = inspector.getInspectorByKey('toggle4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[toggle4] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('Toggle');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ToggleType.Checkbox');
      expect(obj.getElement('$attrs').getString('isOn')).assertEqual('true');
      console.info('testToggle040 End');
      done();
    });



    
    
    /**
     * @tc.number   testToggle050_static
     * @tc.name     testToggle050_static
     * @tc.desc     testToggle050_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle050_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testToggle050 START');
      let strJson = inspector.getInspectorByKey('toggle5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[toggle5] get inspector value is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getString('$type')).assertEqual('Toggle');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ToggleType.Button');
      expect(obj.getElement('$attrs').getString('isOn')).assertEqual('false');
      console.info('testToggle050 End');
      done();
    });



    
    
    /**
     * @tc.number   testToggle060_static
     * @tc.name     testToggle060_static
     * @tc.desc     testToggle060_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle060_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testToggle060 START');
      let strJson = inspector.getInspectorByKey('toggle6');
      console.info('sendEventByKey result is ' + inspector.sendEventByKey('toggle6', 10, ''))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[toggle6] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('Toggle');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ToggleType.Button');
      expect(obj.getElement('$attrs').getString('isOn')).assertEqual('true');
      console.info('testToggle060 End');
      done();
    });
  })
}
