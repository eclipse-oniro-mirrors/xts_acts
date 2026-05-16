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
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType } from '../../../../hypium/index';
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
let domain: int = 0x0000;
let tag: string = 'testTag';


export default function triggerSelect() {
  describe('triggerSelect', () => {

    beforeAll(() => {
      console.info("triggerSelect beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api12.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("triggerSelect beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/triggerSelect',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get triggerSelect state pages: " + JSON.stringify(pages));
        if (!("triggerSelect" == pages.name)) {
          console.info("get triggerSelect state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push triggerSelect page error: " + err);
        expect().assertFail();
      }
    });
    
     
    
/**
     * @tc.number   triggerSelect_static_0100
     * @tc.name     triggerSelect_static_0100
     * @tc.desc     triggerSelect_static_0100
     * @tc.level    Level.LEVEL1
     */
it('triggerSelect_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('triggerSelect_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('SelectClick'));
      await button!.click();
      await CommonFunc.sleep(1000);

      let value = await driver.findComponent(ON.id('RowValue'));
      await value!.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('triggerSelectValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[triggerSelect_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[triggerSelect_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Select index:0Select text:item1');
      console.info('[triggerSelect_static_0100] END');
      done();
    });
    

  })
}

