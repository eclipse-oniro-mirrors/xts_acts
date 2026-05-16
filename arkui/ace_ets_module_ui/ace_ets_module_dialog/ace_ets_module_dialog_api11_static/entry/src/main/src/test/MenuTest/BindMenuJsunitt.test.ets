'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function bindMenuTesttt() {
  describe('bindMenuTesttt', () => {
    beforeAll(() => {
      console.info("bindMenuTesttt beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("bindMenuTesttt  beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("bindMenu beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/bindMenuu',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get bindMenu state pages: " + JSON.stringify(pages));
        if (!("bindMenuu" == pages.name)) {
          console.info("get bindMenu state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance .pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push bindMenu success: " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push bindMenu page error:" + err);
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("bindMenu after each called");
    });


    
    
/**
     * @tc.number   bindMenuTest_static_0100
     * @tc.name     bindMenuTest_static_0100
     * @tc.desc     bindMenuTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('bindMenuTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenuTest_static_0100 START');
      await CommonFunc.sleep(1000);
      console.info("bindMenuTest_static_0100 text click result is: " +
      JSON.stringify(inspector.sendEventByKey('text', 10, "")));
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: emitter.EventData) => {
        console.info("bindMenuTest_static_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(((indexEvent.data) as Record<String,RecordData>)?.['ACTION']).assertEqual(true);
        done();
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 64,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err: Error) {
        console.info("bindMenuTest_static_0100 on emitter err : " + JSON.stringify(err));
      }
      console.info("bindMenuTest_static_0100 button click result is: " +
      JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('bindMenuTest_static_0100 END');
      done();
    });
  })
}