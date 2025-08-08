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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function extendTrackTest() {
  describe('extendTrackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("extendTrackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Track/extendTrack',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get extendTrackTest state pages: " + JSON.stringify(pages));
        if (!("extendTrack" == pages.name)) {
          console.info("get extendTrackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push extendTrackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push extendTrackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('extendTrack_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(2000);
    });
    /**
     * @tc.number SUB_ACE_extendTrackTest_0100
     * @tc.name extendTrackTest_0100
     * @tc.desc extendTrack
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('extendTrackTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('extendTrackTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('extendTrack_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('extendTrack_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[extendTrackTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[extendTrackTest_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('c1=80');
      console.info('[extendTrackTest_0100] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_extendTrackTest_0200
     * @tc.name extendTrackTest_0200
     * @tc.desc extendTrack
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('extendTrackTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('extendTrackTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('extendTrack_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('extendTrack_2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[extendTrackTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[extendTrackTest_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('p1=80');
      console.info('[extendTrackTest_0200] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_extendTrackTest_0300
     * @tc.name extendTrackTest_0300
     * @tc.desc extendTrack
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('extendTrackTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('extendTrackTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('extendTrack_3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('extendTrack_3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[extendTrackTest_0300] component obj is: " + JSON.stringify(obj));
      console.info("[extendTrackTest_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('cj1=80');
      console.info('[extendTrackTest_0400] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_extendTrackTest_0400
     * @tc.name extendTrackTest_0400
     * @tc.desc extendTrack
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('extendTrackTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('extendTrackTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('extendTrack_4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('extendTrack_4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[extendTrackTest_0400] component obj is: " + JSON.stringify(obj));
      console.info("[extendTrackTest_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('pj1=80');
      console.info('[extendTrackTest_0400] END');
      done();
    });
  })
}

