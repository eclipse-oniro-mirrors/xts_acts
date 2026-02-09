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
 

export default function provideTrackTest() {
  describe('provideTrackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("provideTrackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Track/provideTrack',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get provideTrackTest state pages: " + JSON.stringify(pages));
        if (!("provideTrack" == pages.name)) {
          console.info("get provideTrackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push provideTrackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push provideTrackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('provideTrack_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(2000);
    });
    /**
     * @tc.name   provideTrackTest_0100
     * @tc.number SUB_ACE_provideTrackTest_0100
     * @tc.desc   provideTrack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('provideTrackTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('provideTrackTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('change_consume'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Track_consume');
      let strJson1 = getInspectorByKey('Track_consume1');
      let strJson2 = getInspectorByKey('Track_provide');
      let strJson3 = getInspectorByKey('Track_provide1');
      let obj: ESObject = JSON.parse(strJson);
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[provideTrackTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[provideTrackTest_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('memberA=21');
      expect(obj1.$attrs.content).assertEqual('memberC=31');
      expect(obj2.$attrs.content).assertEqual('memberA=21');
      expect(obj3.$attrs.content).assertEqual('memberC=31');
      console.info('[provideTrackTest_0100] END');
      done();
    });
    /**
     * @tc.name   provideTrackTest_0200
     * @tc.number SUB_ACE_provideTrackTest_0200
     * @tc.desc   provideTrack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('provideTrackTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('provideTrackTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('change_provide'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Track_consume');
      let strJson1 = getInspectorByKey('Track_consume1');
      let strJson2 = getInspectorByKey('Track_provide');
      let strJson3 = getInspectorByKey('Track_provide1');
      let obj: ESObject = JSON.parse(strJson);
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[provideTrackTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[provideTrackTest_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('memberA=21');
      expect(obj1.$attrs.content).assertEqual('memberC=31');
      expect(obj2.$attrs.content).assertEqual('memberA=21');
      expect(obj3.$attrs.content).assertEqual('memberC=31');
      console.info('[provideTrackTest_0100] END');
      done();
    });
  })
}

