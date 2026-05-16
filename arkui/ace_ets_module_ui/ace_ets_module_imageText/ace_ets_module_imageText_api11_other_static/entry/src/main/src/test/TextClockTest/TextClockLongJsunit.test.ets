'use static';
/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  Component,
  Driver,
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { UtilsTest, startAbility } from '../Util.test';


export default function TextClockLongJsunit() {
  describe('TextClockLongJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClock beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextClock/TextClockLongPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClock state pages:" + JSON.stringify(pages));
        if (!("TextClockLongPage" == pages.name)) {
          console.info("get TextClock pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextClock page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push TextClock page error: " + err);
        expect().assertFail();
      }

    });

    
    
/**
     * @tc.number   TextClockLongJsunit_static_0100
     * @tc.name     TextClockLongJsunit_static_0100
     * @tc.desc     TextClockLongJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('TextClockLongJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[TextClockLongJsunit_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let start = await driver.findComponent(ON.id('start'));
      let stop = await driver.findComponent(ON.id('stop'));
      let accumulateTime = await driver.findComponent(ON.id("accumulateTime1"));

      await (start?.click() as Promise<void>)
      await driver.delayMs(1000)
      let textShadowOrFontFeature = await driver.findComponent(ON.id("textShadowOrFontFeature"));
      expect(!textShadowOrFontFeature).assertEqual(false)

      await (stop?.click() as Promise<void>)
      let accumulateTimeTextStop = await (accumulateTime?.getText() as Promise<string>)
      await driver.delayMs(3000)
      let accumulateTimeTextStop2 = await (accumulateTime?.getText() as Promise<string>)
      expect(accumulateTimeTextStop).assertEqual(accumulateTimeTextStop2)
      await (start?.click() as Promise<void>)
      console.info('[TextClockLongJsunit_0100] END');
      done();
    });

    
    
/**
     * @tc.number   TextClockLongJsunit_static_0200
     * @tc.name     TextClockLongJsunit_static_0200
     * @tc.desc     TextClockLongJsunit_static_0200
     * @tc.level    Level.LEVEL2
     */
it('TextClockLongJsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Test Visible
      console.info('[TextClockLongJsunit_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let show = await driver.findComponent(ON.id('show'));
      let hide = await driver.findComponent(ON.id('hide'));
      await (hide?.click() as Promise<void>)
      let accumulateTime = await driver.findComponent(ON.id("accumulateTime1"));
      let accumulateTimeTextHideStart = await (accumulateTime?.getText() as Promise<string>)
      await driver.delayMs(3000)
      let accumulateTimeTextHideEnd = await (accumulateTime?.getText() as Promise<string>)
      expect(accumulateTimeTextHideStart).assertEqual(accumulateTimeTextHideEnd)
      await (show?.click() as Promise<void>)
      console.info('[TextClockLongJsunit_0200] END');
      done();
    });

    
    
/**
     * @tc.number   TextClockLongJsunit_static_0300
     * @tc.name     TextClockLongJsunit_static_0300
     * @tc.desc     TextClockLongJsunit_static_0300
     * @tc.level    Level.LEVEL2
     */
it('TextClockLongJsunit_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Test sliding out screen
      console.info('[TextClockLongJsunit_0300] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let bottom = await driver.findComponent(ON.id("TextClockLongBottom"));
      await (bottom?.click() as Promise<void>)
      await driver.delayMs(1000)
      let accumulateTime1 = await driver.findComponent(ON.id("accumulateTime2"));
      let accumulateTimeTextStart = await (accumulateTime1?.getText() as Promise<string>)
      await driver.delayMs(3000)
      let accumulateTime2 = await driver.findComponent(ON.id("accumulateTime2"));
      let accumulateTimeTextEnd = await (accumulateTime2?.getText() as Promise<string>)
      expect(accumulateTimeTextStart).assertEqual(accumulateTimeTextEnd)
      console.info('[TextClockLongJsunit_0300] END');
      done();
    });
  })
}
