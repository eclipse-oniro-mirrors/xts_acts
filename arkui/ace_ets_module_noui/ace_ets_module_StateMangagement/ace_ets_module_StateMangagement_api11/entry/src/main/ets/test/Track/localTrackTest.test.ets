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
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';

export default function localTrackTest() {
  describe('localTrackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("localTrackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Track/localTrack',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get localTrackTest state pages: " + JSON.stringify(pages));
        if (!("localTrack" == pages.name)) {
          console.info("get localTrackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push localTrackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push localTrackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('localTrack_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(2000);
    });
    /**
     * @tc.number SUB_ACE_localTrackTest_0100
     * @tc.name localTrackTest_0100
     * @tc.desc localTrack
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('localTrackTest_0100', 0, async (done: Function) => {
      console.info('localTrackTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('Track_LocalStorageProp'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Track_LocalStorageProp');
      let strJson1 = getInspectorByKey('Track_LocalStorageLink');
      let obj = JSON.parse(strJson);
      let obj1 = JSON.parse(strJson1);
      console.info("[localTrackTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[localTrackTest_0100] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('LocalStorageProp:11');
      expect(obj1.$attrs.label).assertEqual('LocalStorageLink:10');
      console.info('[localTrackTest_0100] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_localTrackTest_0200
     * @tc.name localTrackTest_0200
     * @tc.desc localTrack
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('localTrackTest_0200', 0, async (done: Function) => {
      console.info('localTrackTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('Track_LocalStorageLink'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Track_LocalStorageProp');
      let strJson1 = getInspectorByKey('Track_LocalStorageLink');
      let obj = JSON.parse(strJson);
      let obj1 = JSON.parse(strJson1);
      console.info("[localTrackTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[localTrackTest_0200] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('LocalStorageProp:12');
      expect(obj1.$attrs.label).assertEqual('LocalStorageLink:12');
      console.info('[localTrackTest_0200] END');
      done();
    });
  })
}

