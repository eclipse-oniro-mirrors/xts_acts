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
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function monopolizeTest() {
  describe('monopolizeTest', function () {
    beforeEach(async function (done) {
      console.info("monopolizeTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/commonApi/monopolize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get monopolizeTest state pages: " + JSON.stringify(pages));
        if (!("monopolize" == pages.name)) {
          console.info("get monopolizeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push monopolizeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push monopolizeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number monopolize
     * @tc.name monopolizeTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('monopolizeTest_0100', 0, async function (done) {
      console.info('monopolizeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('monopolize_column');
      let obj = JSON.parse(strJson);
      console.info("[monopolizeTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[monopolizeTest_0100] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[monopolizeTest_0100] text: " + JSON.stringify(obj.$attrs.monopolizeEvents));
      expect(obj.$attrs.monopolizeEvents).assertEqual(false);
      console.info('[monopolizeTest_0100] END');
      done();
    });
  })
  }

