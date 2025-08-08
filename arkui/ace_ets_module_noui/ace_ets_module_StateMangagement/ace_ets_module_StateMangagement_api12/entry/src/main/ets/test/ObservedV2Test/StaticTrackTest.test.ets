/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function StaticTrackTest() {
  describe('StaticTrackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StaticTrackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ObservedV2/StaticTrack',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StaticTrackTest state pages: " + JSON.stringify(pages));
        if (!("StaticTrack" == pages.name)) {
          console.info("get StaticTrackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push StaticTrackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StaticTrackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    StaticTrack
     * @tc.name      StaticTrackTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('StaticTrackTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('StaticTrackTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('StaticTrack_1A'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('StaticTrack_1A');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StaticTrackTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('19');
      console.info('[StaticTrackTest_0100] END');
      done();
    });
  })
}

