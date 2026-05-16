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
import events_emitter from '@ohos.events.emitter';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, afterAll } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

export default function stageTextPickerDialog() {
  describe('stageTextPickerDialog', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPicker/stageTextPickerDialog',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stageTextPickerDialog state pages:" + JSON.stringify(pages));
        if (!("stageTextPickerDialog" == pages.name)) {
          console.info("get stageTextPickerDialog pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push stageTextPickerDialog page error: " + err);
      }
    });



    
    
    /**
     * @tc.number   testTextPickerDialog001_static
     * @tc.name     testTextPickerDialog001_static
     * @tc.desc     testTextPickerDialog001_static
     * @tc.level    Level.LEVEL1
     */
it('testTextPickerDialog001_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTextPickerDialog001_static START');
      setTimeout(() => {
        try {
          let innerEventOne: events_emitter.InnerEvent = {
            eventId: 60220,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            if (eventData != null && eventData.data != null) {
              console.info("testTextPickerDialog001_static get event state result is: " + JSON.stringify(eventData));
              const data = eventData.data as ESObject //需要先获取并声明类型之后  再访问成员属性
              if (data.getProperty('STATUS') != null) {
                expect(data.getProperty('STATUS').toBoolean()).assertEqual(true);
              }
            }
            done();
          }
          try {
            events_emitter.on(innerEventOne, callback1);
          } catch (err) {
            console.info("testTextPickerDialog001_static on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(inspector.sendEventByKey('showToastText', 10, "")));
          console.info('testTextPickerDialog001_static END ');
        } catch (err) {
          expect().assertFail()
          console.info('testTextPickerDialog001_static ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    /**
     * @tc.number   testTextPickerDialog002_static
     * @tc.name     testTextPickerDialog002_static
     * @tc.desc     testTextPickerDialog002_static
     * @tc.level    Level.LEVEL1
     */
it('testTextPickerDialog002_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTextPickerDialog002_static START');
      setTimeout(() => {
        try {
          let innerEventTwo: events_emitter.InnerEvent = {
            eventId: 60221,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            if (eventData != null && eventData.data != null) {
              console.info("testTextPickerDialog002_static get event state result is: " + JSON.stringify(eventData));
              const data = eventData.data as ESObject //需要先获取并声明类型之后  再访问成员属性
              if (data.getProperty('STATUS') != null) {
                expect(data.getProperty('STATUS').toNumber()).assertEqual(10);
              }
            }
            done();
          }
          try {
            events_emitter.on(innerEventTwo, callback1);
          } catch (err) {
            console.info("testTextPickerDialog002_static on events_emitter err : " + JSON.stringify(err));
          }
          console.info("onSelect_001 click result is: " + JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
          console.info('testTextPickerDialog002_static END ');
        } catch (err) {
          expect().assertFail()
          console.info('testTextPickerDialog002_static ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    /**
     * @tc.number   testTextPickerDialog003_static
     * @tc.name     testTextPickerDialog003_static
     * @tc.desc     testTextPickerDialog003_static
     * @tc.level    Level.LEVEL1
     */
it('testTextPickerDialog003_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTextPickerDialog003_static START');
      setTimeout(() => {
        try {
          let innerEventThree: events_emitter.InnerEvent = {
            eventId: 60222,
            priority: events_emitter.EventPriority.LOW
          }
          let callback1 = (eventData: events_emitter.EventData) => {
            if (eventData != null && eventData.data != null) {
              console.info("testTextPickerDialog003_static get event state result is: " + JSON.stringify(eventData));
              const data = eventData.data as ESObject //需要先获取并声明类型之后  再访问成员属性
              if (data.getProperty('STATUS') != null) {
                expect(data.getProperty('STATUS')).assertEqual("STATUS");
              }
            }
            done();
          }
          try {
            events_emitter.on(innerEventThree, callback1);
          } catch (err) {
            console.info("testTextPickerDialog003_static on events_emitter err : " + JSON.stringify(err));
          }
          console.info("testTextPickerDialog003_static click result is: " + JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
          console.info('testTextPickerDialog003_static END ');
        } catch (err) {
          expect().assertFail()
          console.info('testTextPickerDialog003_static ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}