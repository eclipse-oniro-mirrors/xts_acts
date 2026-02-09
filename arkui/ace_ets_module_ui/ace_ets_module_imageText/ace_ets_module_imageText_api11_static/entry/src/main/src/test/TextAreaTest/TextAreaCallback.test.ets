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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router'
import {  Driver, Component, ON } from '@ohos.UiTest'
import emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { UtilsTest } from '../Util.test';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function TextAreaCallbackTest() {

  const SUITE: string = 'TextAreaCallback'
  const waitUiReadyMs: int = 500;

  describe('TextAreaCallbackTest', () => {

    beforeAll(() => {
      console.info("TextAreaCallbackTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaCallbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaCallback",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get TextAreaCallbackTest state pages:" + JSON.stringify(pages));
        if (!("TextAreaCallback" == pages.name)) {
          console.info("get TextAreaCallbackTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextAreaCallbackTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaCallbackTest page error:" + err);
      }
      console.info("TextAreaCallbackTest beforeEach end");
    });


    /*
     *tc.number ArkUI_TextArea_Callback_static_0100
     *tc.name   TextArea.onEditChange
     *tc.desc   TextArea.onEditChange
     */
    /**
     * @tc.number   ArkUI_TextArea_Callback_static_0100
     * @tc.name     ArkUI_TextArea_Callback_static_0100
     * @tc.desc     ArkUI_TextArea_Callback_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_TextArea_Callback_static_0100', Level.LEVEL1, async (done: () => void) => {
      let CASE = 'ArkUI_TextArea_Callback_static_0100'
      console.info(`${SUITE} ${CASE} START`);


      let callback = (event: emitter.EventData) => {
        expect((event.data as ESObject)?.getProperty('isEditing')).assertEqual(true);
        step2()
      }
      let event: emitter.InnerEvent = {
        eventId: 60202,
        priority: emitter.EventPriority.LOW
      }
      emitter.on(event, callback);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      inspector.sendEventByKey('TextAreaCallback_TextArea1', 10, "")
      done()
      console.info(`${SUITE} ${CASE} END`);
    });

  })
}

async function step2() {
  let callback = (event: emitter.EventData) => {
    expect((event.data as ESObject)?.getProperty('isEditing')).assertEqual(false);
  }
  let event: emitter.InnerEvent = {
    eventId: 60201,
    priority: emitter.EventPriority.LOW
  }
  emitter.on(event, callback);
  let driver = Driver.create()
  await driver.delayMs(500)
  inspector.sendEventByKey('TextAreaCallback_TextArea2', 10, "")
}