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


export default function TrackSetTest() {
  describe('TrackSetTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TrackSetTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ObservedV2/TrackSet',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TrackSetTest state pages: " + JSON.stringify(pages));
        if (!("TrackSet" == pages.name)) {
          console.info("get TrackSetTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TrackSetTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TrackSetTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   TrackSetTest_0100
     * @tc.number TrackSet
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TrackSetTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('TrackSetTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TrackSet_aA'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TrackSet_5A');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TrackSetTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('5');
      console.info('[TrackSetTest_0100] END');
      done();
    });
  })
}

