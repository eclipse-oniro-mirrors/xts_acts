/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function navigationPosition() {
  describe('navigationPosition', function () {
    beforeEach(async function (done) {
      console.info("navigationPosition beforeEach start");
      let options = {
        uri: 'MainAbility/pages/navigationPosition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get navigationPosition state pages: " + JSON.stringify(pages));
        if (!("navigationPosition" == pages.name)) {
          console.info("get navigationPosition state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push navigationPosition page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push navigationPosition page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
       * @tc.number: SUB_ACE_COMPONENT_SR000I1RO8_018
       * @tc.name  : navigationPosition_001
       * @tc.desc  : Set navBarPosition to Start
       * @tc.level : Level 2
       */
    it('navigationPosition_001', 0, async function (done) {

      console.info('[navigationPosition_001] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'navBarPositionIndex', value: 0 });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('navigationPosition');
      let obj = JSON.parse(strJson);
      console.info("[navigationPosition_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.navBarPosition).assertEqual('NavBarPosition.Start');

      console.info('[navigationPosition_001] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_COMPONENT_SR000I1RO8_017
       * @tc.name  : navigationPosition_002
       * @tc.desc  : Set navBarPosition to End
       * @tc.level : Level 2
       */
    it('navigationPosition_002', 0, async function (done) {

      console.info('[navigationPosition_002] START');
      globalThis.value.message.notify({name:'navBarPositionIndex', value: 1 });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('navigationPosition');
      let obj = JSON.parse(strJson);
      console.info("[navigationPosition_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.navBarPosition).assertEqual('NavBarPosition.End');

      console.info('[navigationPosition_002] END');
      done();
    });




  })
}
