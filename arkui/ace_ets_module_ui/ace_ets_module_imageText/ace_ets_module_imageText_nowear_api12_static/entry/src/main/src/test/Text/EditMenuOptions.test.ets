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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function editMeunOptionsTest() {
  describe('editMeunOptionsTest', () : void => {
    beforeAll(() => {
      console.info("editMeunOptionsTest beforeAll start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("editMeunOptionsTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        console.info("editMeunOptionsTest beforeEach 47 line[dyx]");
        routerInstance.clear();
        console.info("editMeunOptionsTest beforeEach 49 line[dyx]");
        let pages = routerInstance.getState();
        console.info("editMeunOptionsTest beforeEach 51 line[dyx]");
        console.info("get editMeunOptionsTest state pages:" + "");
        if (!("editMeunOptionsTest" == pages.name)) {
          console.info("get  Context pages.name:" + '');
          console.info("editMeunOptionsTest beforeEach 55 line[dyx]");
          routerInstance.pushUrl({
            url: "MainAbility/pages/Text/editMeunOptions"
          })
          console.info("editMeunOptionsTest beforeEach 59 line[dyx]");
          await CommonFunc.sleep(2000);
          console.info("editMeunOptionsTest beforeEach 61 line[dyx]");
          //console.info("push editMeunOptionsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push editMeunOptionsTest page error:" + err);
      }
      console.info("editMeunOptionsTest foreEach end");
    });
    
    
    
/**
     * @tc.number   editMeunOptionsTest_static_0100
     * @tc.name     editMeunOptionsTest_static_0100
     * @tc.desc     editMeunOptionsTest_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('editMeunOptionsTest_static_0100', Level.LEVEL2, async (done :()=> void) => {
      console.info('editMeunOptionsTest_0100 START');
      try {
        let driver =  Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('TextEditMenuOptions'));
        await (button?.longClick() as Promise<void>);
        await CommonFunc.sleep(2000);
        await driver.assertComponentExist(ON.text('Custom 2'));
      }catch(error) {
        expect().assertFail();
      }
      console.info('editMeunOptionsTest_0100 END');

      done();
    });

    
    
/**
     * @tc.number   editMeunOptionsTest_static_0200
     * @tc.name     editMeunOptionsTest_static_0200
     * @tc.desc     editMeunOptionsTest_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('editMeunOptionsTest_static_0200', Level.LEVEL2, async (done: ()=>void) => {
      console.info('editMeunOptionsTest_0200 START');
      try {
        let driver =  Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('TextAreaEditMenuOptions'));
        await (button?.longClick() as Promise<void>);
        await CommonFunc.sleep(2000);
        await driver.assertComponentExist(ON.text('Custom 2'));
      }catch(error) {
        expect().assertFail();
      }

      console.info('editMeunOptionsTest_0200 END');
      done();
    });

    
    
/**
     * @tc.number   editMeunOptionsTest_static_0300
     * @tc.name     editMeunOptionsTest_static_0300
     * @tc.desc     editMeunOptionsTest_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('editMeunOptionsTest_static_0300', Level.LEVEL2, async (done: ()=>void) => {
      console.info('editMeunOptionsTest_0300 START');

      try {
        let driver =  Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('TextInputEditMenuOptions'));
        await (button?.longClick() as Promise<void>);
        await CommonFunc.sleep(2000);
        await driver.assertComponentExist(ON.text('Custom 2'));
      }catch(error) {
        expect().assertFail();
      }
      console.info('editMeunOptionsTest_0300 END');
      done();
    });

  })
}