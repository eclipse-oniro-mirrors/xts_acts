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
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function APIScrollflingSpeedLimitJsunit() {
  describe('APIScrollflingSpeedLimitJsunit', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("APIScrollflingSpeedLimitJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/APIScrollflingSpeedLimit',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get APIScrollflingSpeedLimitJsunit state pages:" + JSON.stringify(pages));
        if (!("APIScrollflingSpeedLimit" == pages.name)) {
          console.info("get APIScrollflingSpeedLimitJsunit state pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          // console.info("push APIScrollflingSpeedLimitJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIScrollflingSpeedLimitJsunit page error:" + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   APIScrollflingSpeedLimitJsunit_static_0100
     * @tc.name     APIScrollflingSpeedLimitJsunit_static_0100
     * @tc.desc     APIScrollflingSpeedLimitJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('APIScrollflingSpeedLimitJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('APIScrollflingSpeedLimitJsunit_static_0100 START');
      let strcontent = inspector.getInspectorByKey('ScrollflingSpeedLimitKey');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      console.info('APIScrollflingSpeedLimitJsunit_static_0100 component obj is: ' + obj);
      console.info('APIScrollflingSpeedLimitJsunit_static_0100 component obj.$attrs.flingSpeedLimit is: ' +
      obj.getElement('$attrs').getString('flingSpeedLimit'));
      expect(obj.getElement('$attrs').getString('flingSpeedLimit')).assertEqual(`10.00vp`);
      console.info('APIScrollflingSpeedLimitJsunit_static_0100 END')
      done();
    });

  })
}