'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function radioGroupJsunit() {
  describe('radioGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Radio/radioFirst',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get radio state pages:" + JSON.stringify(pages));
        if (!("radio" == pages.name)) {
          console.info("get radio pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push radio page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("radioGroup after each called");
    });



    
    
    /**
     * @tc.number   testradioGroup001_static
     * @tc.name     testradioGroup001_static
     * @tc.desc     testradioGroup001_static
     * @tc.level    Level.LEVEL1
     */
it('testradioGroup001_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('radioGroup testradioGroup001 START');
      await Utils.sleep(2000);
      try {
        console.info("testradioGroup_0011 click result is: " + JSON.stringify(inspector.sendEventByKey('RadioTwo', 10, "")));
        let strJson: string = inspector.getInspectorByKey('RadioOne');
        console.info("[testradioGroup001] component checked strJson:" + strJson);
        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Radio');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('checked')).assertEqual("true");
        console.info("[testradioGroup001] checked value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('checked'));
      } catch (err) {
        console.info("testradioGroup_0011 on click err : " + JSON.stringify(err));
      }
      console.info('testradioGroup001 END');
      done();
    });
  })
}
