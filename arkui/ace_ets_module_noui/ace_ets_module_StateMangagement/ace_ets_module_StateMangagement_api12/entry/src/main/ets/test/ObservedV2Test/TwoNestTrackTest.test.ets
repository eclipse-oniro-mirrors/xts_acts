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

export default function TwoNestTrackTest() {
  describe('TwoNestTrackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TwoNestTrackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ObservedV2/TwoNestTrack',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TwoNestTrackTest state pages: " + JSON.stringify(pages));
        if (!("TwoNestTrack" == pages.name)) {
          console.info("get TwoNestTrackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TwoNestTrackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TwoNestTrackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    TwoNestTrack
     * @tc.name      TwoNestTrackTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TwoNestTrackTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('TwoNestTrackTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TwoNestTrack_2A'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TwoNestTrack_1A');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TwoNestTrackTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('length:19');
      console.info('[TwoNestTrackTest_0100] END');
      done();
    });
  })
}

