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


export default function buttonJsunit() {


  describe('buttonTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Button/Button',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Button state pages:" + JSON.stringify(pages));
        if (!("Button" == pages.name)) {
          console.info("get Button pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Button page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async (): Promise<void> => {
      await sleep(1);
      console.info("Button after each called");
    });



        /**
     * @tc.number   buttonGetInspectorByKey010_static
     * @tc.name     buttonGetInspectorByKey010_static
     * @tc.desc     buttonGetInspectorByKey010_static
     * @tc.level    Level.LEVEL1
     */
    it('buttonGetInspectorByKey010_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetInspectorByKey START');
      let strJson = inspector.getInspectorByKey('button');
      let obj = JSON.parseJsonElement(strJson);
      console.info("buttonGetInspectorByKey010 obj is: " + JSON.stringify(obj));
      console.info("buttonGetInspectorByKey010 obj is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("buttonGetInspectorByKey010 obj type is: " + JSON.stringify(obj.getElement('$type')));
      expect(obj.getElement('$type').asString()).assertEqual('Button');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.Circle');
      expect(obj.getElement('$attrs').getString('stateEffect')).assertEqual('true');
      expect(obj.getElement('$attrs').getString('label')).assertEqual('1.value');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('12.00px');
      console.info('cd buttonInspectorByKey END');
      done();
    });


        /**
     * @tc.number   ButtonGetInspectorByKey020_static
     * @tc.name     ButtonGetInspectorByKey020_static
     * @tc.desc     ButtonGetInspectorByKey020_static
     * @tc.level    Level.LEVEL1
     */
    it('ButtonGetInspectorByKey020_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('button1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd button1 component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.Capsule');
      expect(obj.getElement('$attrs').getString('stateEffect')).assertEqual('false');
      console.info('cd button1InspectorByKey END');
      done();
    });



        /**
     * @tc.number   ButtonGetInspectorByKey030_static
     * @tc.name     ButtonGetInspectorByKey030_static
     * @tc.desc     ButtonGetInspectorByKey030_static
     * @tc.level    Level.LEVEL1
     */
    it('ButtonGetInspectorByKey030_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('button2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd button2 component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.Normal');
      console.info('cd button2InspectorByKey END');
      done();
    });
  })
}
