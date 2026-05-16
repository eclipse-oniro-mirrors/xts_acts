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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
// UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
// BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import  common  from '@ohos.app.ability.common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function popupArrowJsunit() {
  describe('popupArrowJsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("popupArrowJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/popupControl/popupArrow',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get popupArrowJsunit state pages:" + JSON.stringify(pages));
        if (!("popupArrow" == pages.name)) {
          console.info("get popupArrowJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push popupArrowJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push popupArrowJsunit page error:" + err);
      }
      console.info("popupArrowJsunit beforeEach end");
    });

    
    
    /**
     * @tc.number   popupArrowJsunit_static_0100
     * @tc.name     popupArrowJsunit_static_0100
     * @tc.desc     popupArrowJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('popupArrowJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[popupArrowJsunit_0100] START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('popup_arrow'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('popup_arrow');
      console.info("[popupArrowJsunit_0100] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[popupArrowJsunit_0100] JSON.parseJsonElement(strJson) content is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('customPopup');
      console.info('[popupArrowJsunit_0100] END');
      done();
    });
  })
}