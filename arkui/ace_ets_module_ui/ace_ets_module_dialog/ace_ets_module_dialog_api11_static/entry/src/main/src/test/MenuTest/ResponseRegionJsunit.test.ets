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
import { TouchObject, TouchType } from '@ohos.arkui.component';
import { sendTouchEvent } from "@ohos.arkui.Test";
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ResponseRegionJsunit() {
  describe('responseRegionTest', () => {
    let x_value: number;
    let y_value: number;
    beforeAll(() => {
      console.info("responseRegionTest beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("responseRegionTest  beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("ResponseRegion beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/ResponseRegion',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get ResponseRegion state pages: " + JSON.stringify(pages));
        if (!("ResponseRegion" == pages.name)) {
          console.info("get ResponseRegion state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance .pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ResponseRegion success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResponseRegion page error:" + err);
      }

    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ResponseRegion after each called");
    });


    
    
/**
     * @tc.number   testResponseRegion01_static
     * @tc.name     testResponseRegion01_static
     * @tc.desc     testResponseRegion01_static
     * @tc.level    Level.LEVEL2
     */
it('testResponseRegion01_static', Level.LEVEL2, async (done: () => void): Promise<void> => {

      try {
        console.info('[testResponseRegion01_static] START');
        try {
          let eventData: emitter.EventData = {
            data: {
              "touchable": true,
            } as Record<String,RecordData>
          }
          let innerEvent: emitter.InnerEvent = {
            eventId: 30,
            priority: emitter.EventPriority.LOW
          }
          console.info("[testResponseRegion01_static] start to publish emit:" +
          JSON.stringify(((eventData.data) as Record<String,RecordData>)));
          emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[testResponseRegion01_static] change component data error: " + err.message);
        }
        await Utils.sleep(1000);
        console.info('[testResponseRegion01_static] END');
        done();
      }catch(err) {
        expect().assertFail();
      }
    });


    
    
/**
     * @tc.number   testResponseRegion02_static
     * @tc.name     testResponseRegion02_static
     * @tc.desc     testResponseRegion02_static
     * @tc.level    Level.LEVEL2
     */
it('testResponseRegion02_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let rect = Utils.getComponentRect('region')
      console.info("[testResponseRegion02_static] rectInfo is " + JSON.stringify(rect));
      x_value = rect.left + (rect.right - rect.left) / 10
      y_value = rect.top + (rect.bottom - rect.top) / 10
      console.info("[testResponseRegion02_static] onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
      let point: TouchObject = {
        id: 1,
        x: x_value,
        y: y_value,
        type: TouchType.Down,
        windowX: 0,
        windowY: 0,
        displayX: 0,
        displayY: 0
      }
      let callbackTwo = (eventData: emitter.EventData) => {
        console.info("[testResponseRegion02_static] get event state result is: " + JSON.stringify(eventData));
        const data = eventData.data as Record<String,RecordData>;
        expect(data['ACTION']).assertEqual(true)
        expect(data['EVENT_TYPE']).assertEqual('Down')
        done();
      }
      let innerEventTwo: emitter.InnerEvent = {
        eventId: 31,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(innerEventTwo, callbackTwo)
      } catch (err) {
        console.info("[testResponseRegion02_static] on emitter err : " + JSON.stringify(err));
      }
      console.info('[testResponseRegion02_static] testSendTouchEvent ' + sendTouchEvent(point));
      await Utils.sleep(1000)
      console.info('[testResponseRegion02_static] END');
    });
  })
}
