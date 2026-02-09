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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Utils.test';
import inspector from '@ohos.arkui.inspector';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function UnmarshallingErrorCodeTest() {
  describe('UnmarshallingErrorCodeTest', () => {
    beforeAll(() => {
      console.info("UnmarshallingErrorCodeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api13.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("UnmarshallingErrorCodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/unmarshalling',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get UnmarshallingErrorCodeTest state pages: " + JSON.stringify(pages));
        if (!("unmarshalling" == pages.name)) {
          console.info("get UnmarshallingErrorCodeTest state pages.name: " + JSON.stringify(pages.name));
          // let result = routerInstance.replaceUrl(options);
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push UnmarshallingErrorCodeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UnmarshallingErrorCodeTest page error: " + err);
        expect().assertFail();
      }
    });


    

    
/**
     * @tc.number   UnmarshallingErrorCodeTest_static_0010
     * @tc.name     UnmarshallingErrorCodeTest_static_0010
     * @tc.desc     UnmarshallingErrorCodeTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('UnmarshallingErrorCodeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[UnmarshallingErrorCodeTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Unmarshalling_button'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      console.info('[UnmarshallingErrorCodeTest_0010] click succ');
      let strJson = inspector.getInspectorByKey('Unmarshalling_GetCode401');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[UnmarshallingErrorCodeTest_0010] ErrorCode: ' + JSON.stringify(obj.getElement('$attrs').getString('text')));
      expect(obj.getElement('$attrs').getString('text')).assertEqual('401');
      console.info('[UnmarshallingErrorCodeTest_0010] END');
      done();
    });
  })
}