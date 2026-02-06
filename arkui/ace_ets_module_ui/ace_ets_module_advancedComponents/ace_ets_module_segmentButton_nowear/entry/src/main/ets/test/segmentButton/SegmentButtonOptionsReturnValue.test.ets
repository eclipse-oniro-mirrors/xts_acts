/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';
import CommonFunc from '../../MainAbility/common/Common';
import {
  SegmentButtonItemOptions,
  SegmentButtonItemOptionsArray,
  SegmentButtonItemTuple
} from '@kit.ArkUI';

export default function SegmentButtonOptionsReturnValue() {
  describe('SegmentButtonOptionsReturnValue', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonOptionsReturnValue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButtonOptionsReturnValue",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButtonOptionsReturnValue" == pages.name)) {
          console.info("get SegmentButtonOptionsReturnValue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonOptionsReturnValue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonOptionsReturnValue page error:" + err);
      }
      console.info("SegmentButtonOptionsReturnValue beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonOptionsReturnValue after each called");
    });

    /**
     * @tc.name   SegmentButtonOptionsReturnValue_001
     * @tc.number SegmentButtonOptionsReturnValue_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonOptionsReturnValue_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonOptionsReturnValue_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("SBOShift"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let res_0011: undefined | SegmentButtonItemOptions = AppStorage.get<undefined | SegmentButtonItemOptions>('SBOShift');
      console.info("[SegmentButtonOptionsReturnValue_001] component res_0011 is: " + JSON.stringify(res_0011));
      expect(res_0011).assertEqual(undefined);
      console.info("[SegmentButtonOptionsReturnValue_001] component appstorage.clear: " + JSON.stringify(AppStorage.clear()));
      console.info('[SegmentButtonOptionsReturnValue_001] END');
      done();
    });


    /**
     * @tc.name   SegmentButtonOptionsReturnValue_002
     * @tc.number SegmentButtonOptionsReturnValue_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonOptionsReturnValue_002', Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonOptionsReturnValue_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("SBOPop"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let res_0021: undefined | SegmentButtonItemOptions = AppStorage.get<undefined | SegmentButtonItemOptions>('SBOPop');
      console.info("[SegmentButtonOptionsReturnValue_002] component res_0021 is: " + JSON.stringify(res_0021));
      expect(res_0021).assertEqual(undefined);
      console.info("[SegmentButtonOptionsReturnValue_002] component appstorage.clear: " + JSON.stringify(AppStorage.clear()));
      console.info('[SegmentButtonOptionsReturnValue_002] END');
      done();
    });

    /**
     * @tc.name   SegmentButtonOptionsReturnValue_003
     * @tc.number SegmentButtonOptionsReturnValue_003
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonOptionsReturnValue_003', Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonOptionsReturnValue_003] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("SBOSplice"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let res_0031 = AppStorage.get<SegmentButtonItemOptions[]>('SBOSplice');
      let res_0032 = AppStorage.get<SegmentButtonItemOptions[]>('SBOSpliceEmpty');
      console.info("[SegmentButtonOptionsReturnValue_003] component res_0031 is: " + JSON.stringify(res_0031));
      console.info("[SegmentButtonOptionsReturnValue_003] component res_0032 is: " + JSON.stringify(res_0032));
      expect(res_0031!.length > 0).assertTrue();
      expect(res_0032!.length).assertEqual(0);
      console.info("[SegmentButtonOptionsReturnValue_003] component appstorage.clear: " + JSON.stringify(AppStorage.clear()));
      console.info('[SegmentButtonOptionsReturnValue_003] END');
      done();
    })

    /**
     * @tc.name   SegmentButtonOptionsReturnValue_004
     * @tc.number SegmentButtonOptionsReturnValue_004
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonOptionsReturnValue_004', Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonOptionsReturnValue_004] START');
      await CommonFunc.sleep(2000);
      let x: SegmentButtonItemOptionsArray =
        SegmentButtonItemOptionsArray.create([{ text: '1' }, { text: '2' }, { text: '3' }] as SegmentButtonItemTuple)
      let res_0041: SegmentButtonItemOptions[] = x.splice(0, 1);
      console.info("[SegmentButtonOptionsReturnValue_004] component res_0041 is: " + JSON.stringify(res_0041));
      let res_0042: SegmentButtonItemOptions[] = x.splice(0, 1);
      console.info("[SegmentButtonOptionsReturnValue_004] component res_0042 is: " + JSON.stringify(res_0042));
      let res_0043: SegmentButtonItemOptions | undefined = x.pop();
      console.info("[SegmentButtonOptionsReturnValue_004] component res_0043 is: " + JSON.stringify(res_0042));
      let res_0044: SegmentButtonItemOptions | undefined = x.shift();
      console.info("[SegmentButtonOptionsReturnValue_004] component res_0044 is: " + JSON.stringify(res_0042));
      expect(res_0041.length > 0).assertTrue();
      expect(res_0042.length == 0).assertTrue();
      expect(res_0043).assertUndefined();
      expect(res_0044).assertUndefined();
      await CommonFunc.sleep(2000);
      console.info('[SegmentButtonOptionsReturnValue_004] END');
      done();
    })

  })
}
