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
import hilog from '@ohos.hilog';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility, stopApplication } from './Util.test';
import router from '@ohos.router';

export default function stageDatePickerDialog() {
  describe('stageDatePickerDialog', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stageDatePickerDialog',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stageDatePickerDialog state pages:" + JSON.stringify(pages));
        if (!("stageDatePickerDialog" == pages.name)) {
          console.info("get stageDatePickerDialog pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push stageDatePickerDialog page error: " + err);
      }
    });


    
    /**
     * @tc.number   testDatePickerDialog001_static
     * @tc.name     testDatePickerDialog001_static
     * @tc.desc     testDatePickerDialog001_static
     * @tc.level    Level.LEVEL1
     */
it('testDatePickerDialog001_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testDatePickerDialog001 START');
      setTimeout(() => {
        try {
          let innerEventOne: events_emitter.InnerEvent = {
            eventId: 60220,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            console.info("testDatePickerDialog001 get event state result is: " + JSON.stringify(eventData));
            expect((eventData.data as ESObject)?.getProperty('STATUS').toBoolean()).assertEqual(true);
            done();
          }
          try {
            events_emitter.on(innerEventOne, callback1);
          } catch (err) {
            console.info("testDatePickerDialog001 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(inspector.sendEventByKey('showToastText', 10, "")));
          console.info('testDatePickerDialog001 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testDatePickerDialog001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   testDatePickerDialog002_static
     * @tc.name     testDatePickerDialog002_static
     * @tc.desc     testDatePickerDialog002_static
     * @tc.level    Level.LEVEL1
     */
it('testDatePickerDialog002_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testDatePickerDialog002 START');
      setTimeout(() => {
        try {
          let innerEventTwo: events_emitter.InnerEvent = {
            eventId: 60221,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            console.info("testDatePickerDialog002 get event state result is: " + JSON.stringify(eventData));
            expect((eventData.data as ESObject)?.getProperty('STATUS').toNumber()).assertEqual(10);
            done();
          }
          try {
            events_emitter.on(innerEventTwo, callback1);
          } catch (err) {
            console.info("testDatePickerDialog002 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
          console.info('testDatePickerDialog002 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testDatePickerDialog002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    
    /**
     * @tc.number   testDatePickerDialog003_static
     * @tc.name     testDatePickerDialog003_static
     * @tc.desc     testDatePickerDialog003_static
     * @tc.level    Level.LEVEL1
     */
it('testDatePickerDialog003_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testDatePickerDialog003 START');
      setTimeout(() => {
        try {
          let innerEventThree: events_emitter.InnerEvent = {
            eventId: 60222,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            console.info("testDatePickerDialog003 get event state result is: " + JSON.stringify(eventData));
            expect((eventData.data as ESObject)?.getProperty('STATUS').toString()).assertEqual("STATUS");
            done();
          }
          try {
            events_emitter.on(innerEventThree, callback1);
          } catch (err) {
            console.info("testDatePickerDialog003 on events_emitter err : " + JSON.stringify(err));
          }
          console.info("testDatePickerDialog003 click result is: " + JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
          console.info('testDatePickerDialog003 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testDatePickerDialog003 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}