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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
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
import emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function stageActionSheet() {
  describe('stageActionSheet', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      console.info("stageActionSheet beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("stageActionSheet  beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/actionSheet/stageActionSheet',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get stageActionSheet state pages: " + JSON.stringify(pages));
        if (!("stageActionSheet" == pages.name)) {
          console.info("get stageActionSheet state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance .pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push stageActionSheet success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stageActionSheet page error: " + err);
      }
      // done()
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    
    
/**
     * @tc.number   testShowActionShee001
     * @tc.name     testShowActionShee001
     * @tc.desc     testShowActionShee001
     * @tc.level    Level.LEVEL2
     */
it('testShowActionShee001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('testShowActionShee001 START');
      setTimeout(() => {
        try {
          let innerEventOne: emitter.InnerEvent = {
            eventId: 60220,
            priority: emitter.EventPriority.LOW
          }
          let callback1 = (eventData: emitter.EventData) => {
            console.info("testShowActionShee001 get event state result is: " + JSON.stringify(eventData));
            expect(((eventData.data) as Record<String,RecordData>)?.['STATUS']).assertEqual(true);
            done();
          }
          try {
            emitter.on(innerEventOne, callback1);
          } catch (err) {
            console.info("testShowActionShee001 on emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " +
          JSON.stringify(inspector.sendEventByKey('routerInstance Text', 10, "")));
          console.info('testShowActionShee001 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testShowActionShee001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
/**
     * @tc.number   testShowActionShee002
     * @tc.name     testShowActionShee002
     * @tc.desc     testShowActionShee002
     * @tc.level    Level.LEVEL2
     */
it('testShowActionShee002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('testShowActionShee002 START');
      setTimeout(() => {
        try {
          let innerEventTwo: emitter.InnerEvent = {
            eventId: 60221,
            priority: emitter.EventPriority.LOW
          }
          let callback1 = (eventData: emitter.EventData) => {
            console.info("testShowActionShee002 get event state result is: " + JSON.stringify(eventData));
            expect(((eventData.data) as Record<String,RecordData>)?.['STATUS']).assertEqual(10);
            done();
          }
          try {
            emitter.on(innerEventTwo, callback1);
          } catch (err) {
            console.info("testShowActionShee002 on emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " +
          JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
          console.info('testShowActionShee002 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testShowActionShee002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
/**
     * @tc.number   testShowActionShee003_static
     * @tc.name     testShowActionShee003_static
     * @tc.desc     testShowActionShee003_static
     * @tc.level    Level.LEVEL2
     */
it('testShowActionShee003_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('testShowActionShee003_static START');
      setTimeout(() => {
        try {
          let innerEventThree: emitter.InnerEvent = {
            eventId: 60222,
            priority: emitter.EventPriority.LOW
          }
          let callback1 = (eventData: emitter.EventData) => {
            console.info("testShowActionShee003_static get event state result is: " + JSON.stringify(eventData));
            expect(((eventData.data) as Record<String,RecordData>)?.['STATUS']).assertEqual("STATUS");
            done();
          }
          try {
            emitter.on(innerEventThree, callback1);
          } catch (err) {
            console.info("testShowActionShee003_static on emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " +
          JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
          console.info('testShowActionShee003_static END ');
        } catch (err) {
          expect().assertFail()
          console.info('testShowActionShee003_static ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}