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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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
 

export default function storageTrackTest() {
  describe('storageTrackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("storageTrackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Track/storageTrack',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get storageTrackTest state pages: " + JSON.stringify(pages));
        if (!("storageTrack" == pages.name)) {
          console.info("get storageTrackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push storageTrackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push storageTrackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('storageTrack_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(2000);
    });
    /**
     * @tc.name   storageTrackTest_0100
     * @tc.number SUB_ACE_storageTrackTest_0100
     * @tc.desc   storageTrack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storageTrackTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('storageTrackTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('Track_storageProp'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Track_storageProp');
      let strJson1 = getInspectorByKey('Track_storageLink');
      let obj: ESObject = JSON.parse(strJson);
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[storageTrackTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[storageTrackTest_0100] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('storageProp:11');
      expect(obj1.$attrs.label).assertEqual('storageLink:10');
      console.info('[storageTrackTest_0100] END');
      done();
    });
    /**
     * @tc.name   storageTrackTest_0200
     * @tc.number SUB_ACE_storageTrackTest_0200
     * @tc.desc   storageTrack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storageTrackTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('storageTrackTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('Track_storageLink'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Track_storageProp');
      let strJson1 = getInspectorByKey('Track_storageLink');
      let obj: ESObject = JSON.parse(strJson);
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[storageTrackTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[storageTrackTest_0200] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('storageProp:12');
      expect(obj1.$attrs.label).assertEqual('storageLink:12');
      console.info('[storageTrackTest_0200] END');
      done();
    });
  })
}

