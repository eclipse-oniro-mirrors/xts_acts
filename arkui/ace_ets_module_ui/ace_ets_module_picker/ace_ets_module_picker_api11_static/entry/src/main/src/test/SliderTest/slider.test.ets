'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import events_emitter from '@ohos.events.emitter';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
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
import { RecordData } from '@ohos.base';
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

export default function sliderMovingJsunit() {
  describe('sliderMovingTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/slider2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get slider state pages:" + JSON.stringify(pages));
        if (!("slider2" == pages.name)) {
          console.info("get slider pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push slider page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("sliderMoving after each called");
    });


    
    
    /**
     * @tc.number   testsliderMoving0011_static
     * @tc.name     testsliderMoving0011_static
     * @tc.desc     testsliderMoving0011_static
     * @tc.level    Level.LEVEL1
     */
it('testsliderMoving0011_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('sliderMoving testsliderMoving0011 START');
      await Utils.sleep(2000);
      try {
        let event: events_emitter.InnerEvent = {
          eventId: 60307,
          priority: events_emitter.EventPriority.LOW
        }
        let callback: (eventData: events_emitter.EventData)=>void = (eventData: events_emitter.EventData) => {
          try {
            if (eventData != null && eventData.data != null) {
              console.info("testsliderMoving0011 get event data is: " + JSON.stringify(eventData));
              const data = eventData.data as Record<String,RecordData> //需要先获取并声明类型之后  再访问成员属性
              if (data!['Mode'] != null) {
                expect(data!['Mode'] as double).assertEqual(0);
              }
            }
          } catch (err) {
            console.info("testsliderMoving0011 get event err data is: " + JSON.stringify(err));
          }
        }
        events_emitter.on(event, callback);
        // console.info("testsliderMoving0011 click result is: " + JSON.stringify(inspector.sendEventByKey('Slider', 10, "")));
        await Utils.sleep(3000);
      } catch (err) {
        console.info("testsliderMoving0011 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testsliderMoving0011 END');
      done();
    });
  })
}
