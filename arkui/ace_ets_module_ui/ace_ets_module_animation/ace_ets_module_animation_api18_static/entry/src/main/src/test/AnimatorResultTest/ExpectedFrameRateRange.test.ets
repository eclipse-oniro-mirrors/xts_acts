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
import emitter from '@ohos.events.emitter'
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

export default function ExpectedFrameRateRange() {
  describe('ExpectedFrameRateRange', () => {
    beforeAll(() => {
      console.info("ExpectedFrameRateRange beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation18.static", "EntryAbility")
      
    });

    beforeEach(async () => {
      console.info('ExpectedFrameRateRange beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AnimatorResult/ExpectedFrameRateRange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ExpectedFrameRateRange state pages:' + JSON.stringify(pages));
        if (!('ExpectedFrameRateRange' == pages.name)) {
          console.info('get ExpectedFrameRateRange pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ExpectedFrameRateRange page error:' + err);
      }
      console.info('ExpectedFrameRateRange beforeEach end');
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ExpectedFrameRateRange after each called');
    });
    
    
/**
     * @tc.number   ExpectedFrameRateRange_static_001
     * @tc.name     ExpectedFrameRateRange_static_001
     * @tc.desc     ExpectedFrameRateRange_static_001
     * @tc.level    Level.LEVEL3
     */
it('ExpectedFrameRateRange_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[ExpectedFrameRateRange_static_001] START');
      let indexEvent:emitter.InnerEvent = {
        eventId: 51,
        priority: emitter.EventPriority.LOW
      }
      let callback = (indexEvent: emitter.EventData) => {
        console.info('ExpectedFrameRateRange_static_001 get state result is: ' + JSON.stringify(indexEvent))
        const event: Record<String,RecordData> = indexEvent.data as Record<String,RecordData>
        try {
          expect(event['min']).assertEqual(60);
          expect(event['max']).assertEqual(120);
          expect(event['expected']).assertEqual(90);
        } catch (err) {
          console.info('ExpectedFrameRateRange_static_001 get state result is err: ' + JSON.stringify(err));
        }
        console.info('[ExpectedFrameRateRange_static_001] END');
        done();
      }
      try {
        console.log('emitter  === start')
        emitter.on(indexEvent, callback);
        console.log('emitter  === end')
      } catch (err) {
        console.info('ExpectedFrameRateRange_static_001 on emitter err : ' + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let play = await driver.findComponent(ON.id('circleId'));
      console.info('[ExpectedFrameRateRange_static_001] ' + JSON.stringify(play));
      await (play?.click() as Promise<void>);
      console.log('[ExpectedFrameRateRange_static_001] play btn clicked')
    });
  })
}