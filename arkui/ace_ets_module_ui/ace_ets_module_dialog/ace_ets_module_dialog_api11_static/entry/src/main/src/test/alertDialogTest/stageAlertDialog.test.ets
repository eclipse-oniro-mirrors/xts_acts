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
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function stageAlertDialog() {
  describe('stageAlertDialog', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      console.info("stageAlertDialog beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("stageAlertDialog beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/stageAlertDialog',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get stageAlertDialog state pages: " + JSON.stringify(pages));
        if (!("stageAlertDialog" == pages.name)) {
          console.info("get stageAlertDialog state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push stageAlertDialog success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stageAlertDialog page error: " + err);
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
     * @tc.number   stageAlertDialog_static_001
     * @tc.name     stageAlertDialog_static_001
     * @tc.desc     stageAlertDialog_static_001
     * @tc.level    Level.LEVEL2
     */
    it('stageAlertDialog_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('stageAlertDialog001 START');
      setTimeout(() => {
        try {
          let innerEventOne: emitter.InnerEvent = {
            eventId: 60220,
            priority: emitter.EventPriority.LOW
          }
          let callback1 = (eventData: emitter.EventData) => {
            console.info("stageAlertDialog001 get event state result is: " + JSON.stringify(eventData));
            expect(((eventData.data) as Record<String,RecordData>)?.['STATUS']).assertEqual(true);
            done();
          }
          try {
            emitter.on(innerEventOne, callback1);
          } catch (err) {
            console.info("stageAlertDialog001 on emitter err : " + JSON.stringify(err));
          }
          console.info("stageAlertDialog001 click result is: " +
          JSON.stringify(inspector.sendEventByKey('routerInstanceText', 10, "")));
          console.info('stageAlertDialog001 END ');
        } catch (err) {
          expect().assertFail()
          console.info('stageAlertDialog001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
/**
     * @tc.number   stageAlertDialog_static_002
     * @tc.name     stageAlertDialog_static_002
     * @tc.desc     stageAlertDialog_static_002
     * @tc.level    Level.LEVEL2
     */
    it('stageAlertDialog_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('stageAlertDialog002 START');
      setTimeout(() => {
        try {
          let innerEventTwo: emitter.InnerEvent = {
            eventId: 60221,
            priority: emitter.EventPriority.LOW
          }
          let callback1 = (eventData: emitter.EventData) => {
            console.info("stageAlertDialog002 get event state result is: " + JSON.stringify(eventData));
            expect(((eventData.data) as Record<String,RecordData>)?.['STATUS']).assertEqual(10);
            done();
          }
          try {
            emitter.on(innerEventTwo, callback1);
          } catch (err) {
            console.info("stageAlertDialog002 on emitter err : " + JSON.stringify(err));
          }
          console.info("stageAlertDialog002 click result is: " +
          JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
          console.info('TstageAlertDialog002 END ');
        } catch (err) {
          expect().assertFail()
          console.info('stageAlertDialog002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
/**
     * @tc.number   stageAlertDialog_static_003
     * @tc.name     stageAlertDialog_static_003
     * @tc.desc     stageAlertDialog_static_003
     * @tc.level    Level.LEVEL2
     */
    it('stageAlertDialog_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('stageAlertDialog003_static START');
      setTimeout(() => {
        try {
          let innerEventThree: emitter.InnerEvent = {
            eventId: 60222,
            priority: emitter.EventPriority.LOW
          }
          let callback1 = (eventData: emitter.EventData) => {
            console.info("stageAlertDialog003_static get event state result is: " + JSON.stringify(eventData));
            expect(((eventData.data) as Record<String,RecordData>)?.['STATUS']).assertEqual("STATUS");
            done();
          }
          try {
            emitter.on(innerEventThree, callback1);
          } catch (err) {
            console.info("stageAlertDialog003_static on emitter err : " + JSON.stringify(err));
          }
          console.info("stageAlertDialog003_static click result is: " +
          JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
          console.info('TstageAlertDialog003_static END ');
        } catch (err) {
          expect().assertFail()
          console.info('stageAlertDialog003_static ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}