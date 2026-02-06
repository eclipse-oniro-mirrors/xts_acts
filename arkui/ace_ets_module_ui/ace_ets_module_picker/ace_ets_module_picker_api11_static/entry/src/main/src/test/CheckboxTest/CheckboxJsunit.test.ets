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

export default function checkboxJsunit() {
  describe('checkboxTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Checkbox/checkbox',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get checkbox state pages:" + JSON.stringify(pages));
        if (!("checkbox" == pages.name)) {
          console.info("get checkbox pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push checkbox page error " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("checkbox after each called");
    });


    
    
    /**
     * @tc.number   testCheckbox_100_static
     * @tc.name     testCheckbox_100_static
     * @tc.desc     testCheckbox_100_static
     * @tc.level    Level.LEVEL1
     */
it('testCheckbox_100_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testCheckbox_100] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('Checkbox1');
      console.info("testCheckbox_100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('grayscale')).assertEqual(0);
      console.info('testCheckbox_100 END');
      done();
    });


    
    
    /**
     * @tc.number   testCheckbox_200_static
     * @tc.name     testCheckbox_200_static
     * @tc.desc     testCheckbox_200_static
     * @tc.level    Level.LEVEL1
     */
it('testCheckbox_200_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testCheckbox_200] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('Checkbox1');
      console.info("testCheckbox_200 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('opacity')).assertEqual(1);
      console.info('testCheckbox_200 END');
      done();
    });


    
    
    /**
     * @tc.number   testCheckbox_300_static
     * @tc.name     testCheckbox_300_static
     * @tc.desc     testCheckbox_300_static
     * @tc.level    Level.LEVEL1
     */
it('testCheckbox_300_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testCheckbox_300] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('Checkbox1');
      console.info("testCheckbox_300 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('borderRadius')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderRadius') instanceof Object).assertTrue();
      console.info('testCheckbox_300 END');
      done();
    });


    
    
    /**
     * @tc.number   testCheckbox_400_static
     * @tc.name     testCheckbox_400_static
     * @tc.desc     testCheckbox_400_static
     * @tc.level    Level.LEVEL1
     */
it('testCheckbox_400_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testCheckbox_400] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('Checkbox1');

      console.info("testCheckbox_400 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
      console.info('testCheckbox_400 END');
      done();
    });
  })
}