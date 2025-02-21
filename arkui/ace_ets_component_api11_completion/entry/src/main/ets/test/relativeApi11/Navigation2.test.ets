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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function Navigation1() {
  describe('Navigation1', function () {
    beforeEach(async function (done) {
      console.info("appendChildTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/relativeApi11/Navigation2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Navigation2 state pages: " + JSON.stringify(pages));
        if (!("Navigation2" == pages.name)) {
          console.info("get Navigation2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Navigation2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Navigation2 page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.number    Navigation2_0100
     * @tc.name      Navigation2_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Navigation2_0100', 0, async function (done) {
      console.info('Navigation2_0100 START');
      let strJson = getInspectorByKey('NavigtionText2');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('NavPathStack');
      console.info('[Navigation2_0100] END');
      done();
    });
  })
}

