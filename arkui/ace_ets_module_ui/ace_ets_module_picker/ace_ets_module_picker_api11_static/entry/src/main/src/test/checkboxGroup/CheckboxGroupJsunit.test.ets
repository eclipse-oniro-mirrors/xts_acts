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

export default function checkboxGroupJsunit() {
  describe('checkboxGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkboxGroup/checkboxGroup',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get checkboxGroup state pages:" + JSON.stringify(pages));
        if (!("checkboxGroup" == pages.name)) {
          console.info("get checkboxGroup pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push checkboxGroup page error " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("checkboxGroup after each called");
    });


    
    
    /**
     * @tc.number   testCheckboxGroup_static_100
     * @tc.name     testCheckboxGroup_static_100
     * @tc.desc     testCheckboxGroup_static_100
     * @tc.level    Level.LEVEL1
     */
it('testCheckboxGroup_static_100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testCheckboxGroup_100] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('CheckboxGroup');
      console.info("testCheckboxGroup_100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('opacity')).assertEqual(1);
      console.info('testCheckboxGroup_100 END');
      done();
    });


    
    
    /**
     * @tc.number   testCheckboxGroup_static_200
     * @tc.name     testCheckboxGroup_static_200
     * @tc.desc     testCheckboxGroup_static_200
     * @tc.level    Level.LEVEL1
     */
it('testCheckboxGroup_static_200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testCheckboxGroup_200] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('CheckboxGroup');
      console.info("testCheckboxGroup_200 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignSelf')).assertEqual("ItemAlign.Auto");
      console.info('testCheckboxGroup_200 END');
      done();
    });


    
    
    /**
     * @tc.number   testCheckboxGroup_static_300
     * @tc.name     testCheckboxGroup_static_300
     * @tc.desc     testCheckboxGroup_static_300
     * @tc.level    Level.LEVEL1
     */
it('testCheckboxGroup_static_300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testCheckboxGroup_300] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('CheckboxGroup');
      console.info("testCheckboxGroup_300 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(false);
      console.info('testCheckboxGroup_300 END');
      done();
    });


    
    
    /**
     * @tc.number   testCheckboxGroup_static_400
     * @tc.name     testCheckboxGroup_static_400
     * @tc.desc     testCheckboxGroup_static_400
     * @tc.level    Level.LEVEL1
     */
it('testCheckboxGroup_static_400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testCheckboxGroup_400] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('CheckboxGroup');
      console.info("testCheckboxGroup_400 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderRadius') instanceof Object).assertTrue();
      console.info('testCheckboxGroup_400 END');
      done();
    });


    
    
    /**
     * @tc.number   testCheckboxGroup_static_500
     * @tc.name     testCheckboxGroup_static_500
     * @tc.desc     testCheckboxGroup_static_500
     * @tc.level    Level.LEVEL1
     */
it('testCheckboxGroup_static_500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testCheckboxGroup_500] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('CheckboxGroup');
      console.info("testCheckboxGroup_500 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('flexBasis')).assertEqual("auto");
      console.info('testCheckboxGroup_500 END');
      done();
    });


    
    
    /**
     * @tc.number   testCheckboxGroup_static_600
     * @tc.name     testCheckboxGroup_static_600
     * @tc.desc     testCheckboxGroup_static_600
     * @tc.level    Level.LEVEL1
     */
it('testCheckboxGroup_static_600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testCheckboxGroup_600] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('CheckboxGroup');
      console.info("testCheckboxGroup_600 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderStyle')).assertEqual("BorderStyle.Solid");
      console.info('testCheckboxGroup_600 END');
      done();
    });
  })
}