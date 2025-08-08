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
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function StateTrackTest() {
  describe('StateTrackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StateTrackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Track/StateTrack',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StateTrackTest state pages: " + JSON.stringify(pages));
        if (!("StateTrack" == pages.name)) {
          console.info("get StateTrackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateTrackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateTrackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('StateTrack_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(2000);
    });
    /**
     * @tc.number SUB_ACE_StateTrackTest_0100
     * @tc.name StateTrackTest_0100
     * @tc.desc StateTrack
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('StateTrackTest_0100', 0, async (done: Function) => {
      console.info('StateTrackTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('change_stateA'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Track_prop');
      let strJson1 = getInspectorByKey('Track_objectlink');
      let strJson2 = getInspectorByKey('Track_link');
      let strJson3 = getInspectorByKey('Track_state');
      let obj: ESObject = JSON.parse(strJson);
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[StateTrackTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateTrackTest_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('memberA=21');
      expect(obj1.$attrs.content).assertEqual('memberA=21');
      expect(obj2.$attrs.content).assertEqual('memberA=21');
      expect(obj3.$attrs.content).assertEqual('memberA=21');
      console.info('[StateTrackTest_0100] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_StateTrackTest_0200
     * @tc.name StateTrackTest_0200
     * @tc.desc StateTrack
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('StateTrackTest_0200', 0, async (done: Function) => {
      console.info('StateTrackTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('change_stateB'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Track_prop1');
      let strJson1 = getInspectorByKey('Track_objectlink1');
      let strJson2 = getInspectorByKey('Track_link1');
      let strJson3 = getInspectorByKey('Track_state1');
      let obj: ESObject = JSON.parse(strJson);
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[StateTrackTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[StateTrackTest_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('memberC=31');
      expect(obj1.$attrs.content).assertEqual('memberC=31');
      expect(obj2.$attrs.content).assertEqual('memberC=31');
      expect(obj3.$attrs.content).assertEqual('memberC=31');
      console.info('[StateTrackTest_0100] END');
      done();
    });
  })
}

