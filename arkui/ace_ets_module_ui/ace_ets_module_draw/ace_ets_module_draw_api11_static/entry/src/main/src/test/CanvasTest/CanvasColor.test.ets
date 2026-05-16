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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router'
import { Component, Driver, ON } from '@ohos.UiTest'
import emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import { startAbility, stopApplication, UtilsTest } from '../Util.test'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function CanvasColorTest() {

  const SUITE: string = 'CanvasColor'
  describe('CanvasColorTest', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/CanvasColor",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CanvasColorTest state pages:" + JSON.stringify(pages));
        if (!("CanvasColor" == pages.name)) {
          console.info("get CanvasColorTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });

    
    /**
     * @tc.number   ArkUI_Canvas_Color_static_0100
     * @tc.name     ArkUI_Canvas_Color_static_0100
     * @tc.desc     ArkUI_Canvas_Color_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Canvas_Color_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_Canvas_Color_static_0100'
      console.info(`${SUITE} ${CASE} START`)
      let strJson: string = inspector.getInspectorByKey('CanvasColor_Canvas1')
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Canvas')
      console.info(`${SUITE} ${CASE} END`)
      done()
    });
  })
}
