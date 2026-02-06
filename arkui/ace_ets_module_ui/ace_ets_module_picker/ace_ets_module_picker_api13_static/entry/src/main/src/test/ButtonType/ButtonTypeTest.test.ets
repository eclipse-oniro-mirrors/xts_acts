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

import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, afterEach, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function ButtonTypeTest() {
  describe('ButtonTypeTest', () => {

    beforeAll(() => {
      console.info("TextPickerTextStyle beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("ButtonTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ButtonType/ButtonTypeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ButtonTypeTest state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get ButtonTypeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push ButtonTypeTest page error:" + err);
      }
      console.info("ButtonTypeTest beforeEach end");
    });
    
    afterEach(async () => {
    });

    
    
    
    
    /**
     * @tc.number   testButton_static_0100
     * @tc.name     testButton_static_0100
     * @tc.desc     testButton_static_0100
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('testButton_static_0100 START');
      await CommonFunc.sleep(1000);
      let btn = inspector.getInspectorByKey('btn');
      console.info("testButton_static_0100 component obj is: " + JSON.stringify(btn));
      console.info("[testButton_static_0100] title: " + JSON.stringify(JSON.parseJsonElement(btn).getElement('$attrs').getString('type')));
      expect(JSON.stringify(JSON.parseJsonElement(btn).getElement('$attrs').getString('type'))).assertEqual('"ButtonType.ROUNDED_RECTANGLE"');
      console.info('testButton_static_0100 END');
      done();
    });
  
  })
}