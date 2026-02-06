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

export default function radioGroupJsunit() {
  describe('radioTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/radio',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get radio state success " + JSON.stringify(pages));
        if (!("radio" == pages.name)) {
          console.info("get radio state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push radio page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testRadioGroupStatic001
     * @tc.name     testRadioGroupStatic001
     * @tc.desc     testRadioGroupStatic001
     * @tc.level    Level.LEVEL0
     */
    it('testRadioGroupStatic001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[testRadioGroupStatic001] START");
      let strJson = inspector.getInspectorByKey('RadioOne');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testRadioGroupStatic001] obj  is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle')).getString('checkedBackgroundColor')).assertEqual('#FF147258');
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle')).getString('indicatorColor')).assertEqual('#FF123456');
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('radioStyle')).getString('uncheckedBorderColor')).assertEqual('#FF963852');

      console.info("[testRadioGroupStatic001] END");
      done();
    });

    
    
    /**
     * @tc.number   testRadioGroupStatic002
     * @tc.name     testRadioGroupStatic002
     * @tc.desc     testRadioGroupStatic002
     * @tc.level    Level.LEVEL0
     */
it('testRadioGroupStatic002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[testRadioGroupStatic002] START");
      let strJson = inspector.getInspectorByKey('RadioOne');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testRadioGroupStatic002] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('checked')).assertEqual('true');
      console.info("[testRadioGroupStatic002] END");
      done();
    });

    
    
    /**
     * @tc.number   testRadioGroupStatic003
     * @tc.name     testRadioGroupStatic003
     * @tc.desc     testRadioGroupStatic003
     * @tc.level    Level.LEVEL0
     */
it('testRadioGroupStatic003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testRadioGroupStatic003 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('RadioOne'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("testRadioGroupStatic003 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('checked')).assertEqual('false'); //
      console.info('testRadioGroupStatic003 END');
      done();
    });

  })
}
