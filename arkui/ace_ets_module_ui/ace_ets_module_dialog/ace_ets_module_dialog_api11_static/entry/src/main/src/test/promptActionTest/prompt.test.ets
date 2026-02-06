'use static';
/*
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

export default function promptShowDialogJsunit() {

  describe('promptShowDialogTest', () => {
    beforeAll(() => {
      console.info("promptShowDialogTest beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("promptShowDialogTest  beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/prompt1',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get prompt state pages: " + JSON.stringify(pages));
        if (!("prompt" == pages.name)) {
          console.info("get prompt state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance .pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push prompt success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push prompt page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("promptShowDialog after each called");
    });


    
    
/**
     * @tc.number   testpromptShowDialog_static_001
     * @tc.name     testpromptShowDialog_static_001
     * @tc.desc     testpromptShowDialog_static_001
     * @tc.level    Level.LEVEL2
     */
    it('testpromptShowDialog_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('promptShowDialog testpromptShowDialog001 START');
      await Utils.sleep(1000);
      try {
        let innerEventOne: emitter.InnerEvent = {
          eventId: 60220,
          priority: emitter.EventPriority.LOW
        }
        let callback1 = (eventData: emitter.EventData) => {
          console.info("testpromptShowDialog001 get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as Record<String,RecordData>)?.["STATUS"]).assertEqual(true);
          done()
        }
        console.info("onSelect_001 click result is: " +
        JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
        emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testpromptShowDialog001 on emitter err : " + JSON.stringify(err));
      }
      console.info('testpromptShowDialog001 END');
    });


    
    
/**
     * @tc.number   testpromptShowDialog_static_002
     * @tc.name     testpromptShowDialog_static_002
     * @tc.desc     testpromptShowDialog_static_002
     * @tc.level    Level.LEVEL2
     */
    it('testpromptShowDialog_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('promptShowDialog testshowActionMenu0001_static START');
      await Utils.sleep(1000);
      try {
        let innerEventTwo: emitter.InnerEvent = {
          eventId: 60221,
          priority: emitter.EventPriority.LOW
        }
        let callback2 = (backData1: emitter.EventData) => {
          console.info("onRequestPopupData_0011 get event state result is: " + JSON.stringify(backData1));
          expect(((backData1.data) as Record<String,RecordData>)?.["STATUS"]).assertEqual(true);
          done()
        }
        console.info("onSelect_002 click result is: " +
        JSON.stringify(inspector.sendEventByKey('showActionMenuText', 10, "")));
        emitter.on(innerEventTwo, callback2);
      } catch (err) {
        console.info("onRequestPopupData_0011 on emitter err : " + JSON.stringify(err));
      }
      console.info('testshowActionMenu0001_static END');
    });
  })
}
