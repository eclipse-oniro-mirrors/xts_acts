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
import {Component,  Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textChangeEnabledJsunit() {
  describe('textChangeEnabledJsunit', () => {

    beforeAll(() => {
      console.info("textChangeEnabledJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textChangeEnabledJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/textChangeEnabled',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textChangeEnabledJsunit state pages:" + JSON.stringify(pages));
        if (!("textChangeEnabled" == pages.name)) {
          console.info("get textChangeEnabledJsunit pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textChangeEnabledJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textChangeEnabledJsunit page error:" + err);
      }
      console.info("textChangeEnabledJsunit beforeEach end");
    });


    /**
     * @tc.number   textChangeEnabledJsunit_static_0100
     * @tc.name     textChangeEnabledJsunit_static_0100
     * @tc.desc     textChangeEnabledJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('textChangeEnabledJsunit_static_0100', Level.LEVEL2, async (done: ()=>void) => {
      console.info('textChangeEnabledJsunit_static_0100 START');
      let strJson = inspector.getInspectorByKey('aCanEnable');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textChangeEnabledJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[textChangeEnabledJsunit_static_0100] enabled: " + JSON.stringify(obj.getElement('$attrs').getBoolean('enabled')));
      expect(obj.getElement('$attrs').getBoolean('enabled')).assertEqual(false);
      console.info('[textChangeEnabledJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   textChangeEnabledJsunit_static_0200
     * @tc.name     textChangeEnabledJsunit_static_0200
     * @tc.desc     textChangeEnabledJsunit_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('textChangeEnabledJsunit_static_0200', Level.LEVEL2, async (done: ()=>void) => {
      console.info('textChangeEnabledJsunit_static_0200 START');
      let strJson = inspector.getInspectorByKey('vCanEnable');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textChangeEnabledJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[textChangeEnabledJsunit_static_0200] enabled: " + JSON.stringify(obj.getElement('$attrs').getBoolean('enabled')));
      expect(obj.getElement('$attrs').getBoolean('enabled')).assertEqual(false);
      console.info('[textChangeEnabledJsunit_static_0200] END');
      done();
    });

  })
}

