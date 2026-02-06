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

import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, afterEach, TestType } from '../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';

import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
// import Utils from './Utils';


export default function selectOnSelectJsunit() {
  describe('selectOnSelectTest', () => {
    beforeAll(() => {
      console.info("selectOnSelectTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.select.api12.static", "EntryAbility")
      
    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/select",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SelectMenu state success " + JSON.stringify(pages));
        if (!("select" == pages.name)) {
          console.info("get SelectMenu state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error("push SelectMenu page error " + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("selectOnSelect after each called");
    });

    
    
    
    
    /**
     * @tc.number   testselectOnSelect_static_0001
     * @tc.name     testselectOnSelect_static_0001
     * @tc.desc     testselectOnSelect_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testselectOnSelect_static_0001', Level.LEVEL0, async () => {
      console.info('selectOnSelect testselectOnSelect_static_0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Select');
      console.info("[testselectOnSelect_static_0001] component width strJson:" + strJson);
      let obj= JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Select');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected')).assertEqual("2");
      console.info("[testselectOnSelect_static_0001] selected value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected'));

    });

    
    
    
    
    /**
     * @tc.number   testselectOnSelect_static_0002
     * @tc.name     testselectOnSelect_static_0002
     * @tc.desc     testselectOnSelect_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testselectOnSelect_static_0002', Level.LEVEL0, async () => {
      console.info('selectOnSelect testselectOnSelect_static_0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Select');
      console.info("[testselectOnSelect_static_0002] component height strJson:" + strJson);
      let obj= JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Select');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual("TTT");
      console.info("[testselectOnSelect_static_0002] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('value'));

    });
  })
}
