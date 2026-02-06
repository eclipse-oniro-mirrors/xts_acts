'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest, startAbility } from '../Util.test'
import {UtilsTest} from '../Util.test';
import hilog from '@ohos.hilog';
let testAbilityContext:common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';


let selectorBundleName = '';
const TAG = '[Sample_MyApp]';
const DOMAIN = 0xF811;

export default function listItemGroupComponent() {
  describe('listItemGroupComponent', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("listItemGroupComponent beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/listItemGroup',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get listItemGroupComponent state pages:" + JSON.stringify(pages));
        if (!("listItemGroup" == pages.name)) {
          console.info("get listItemGroupComponent pages.name:" + '');


          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push listItemGroupComponent page error: " + err);
        expect().assertFail();
      }
    });



    
    /**
     * @tc.number   listItemGroupComponent_static_0100
     * @tc.name     listItemGroupComponent_static_0100
     * @tc.desc     listItemGroupComponent_static_0100
     * @tc.level    Level.LEVEL1
     */
it('listItemGroupComponent_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> =>{

      let driver = Driver.create();
      await driver.delayMs(2000);
      let com1 = (JSON.parseJsonElement(inspector.getInspectorByKey("buildTest1"))).getElement('$attrs').getString('content');
      expect(com1 === "message1").assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'listItemGroupComponent_0100');
      done();
    });



  
    /**
     * @tc.number   listItemGroupComponent_static_0101
     * @tc.name     listItemGroupComponent_static_0101
     * @tc.desc     listItemGroupComponent_static_0101
     * @tc.level    Level.LEVEL1
     */
it('listItemGroupComponent_static_0101', Level.LEVEL1, async (done: () => void): Promise<void> =>{

    let driver = Driver.create();
    await driver.delayMs(2000);
    let com2 = (JSON.parseJsonElement(inspector.getInspectorByKey("buildTest2"))).getElement('$attrs').getString('content');
    expect(com2 === "message2").assertTrue();
    hilog.info(DOMAIN, TAG, '%{public}s', 'listItemGroupComponent_0101');
    done();
  });
  })
}
