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

export default function SegmentButtonItemOptionsArray1() {
  describe('SegmentButtonItemOptionsArray1', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonItemOptionsArray1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButtonItemOptionsArray1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButtonItemOptionsArray1" == pages.name)) {
          console.info("get SegmentButtonItemOptionsArray1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonItemOptionsArray1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonItemOptionsArray1 page error:" + err);
      }
      console.info("SegmentButtonItemOptionsArray1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonItemOptionsArray1 after each called");
    });

       /**
        * @tc.name   SegmentButtonItemOptionsArray1_001
        * @tc.number SegmentButtonItemOptionsArray1_001
        * @tc.desc   Frequently updating and modifying the values of parent components
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
       it('SegmentButtonItemOptionsArray1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
       console.info('[SegmentButtonItemOptionsArray1_001] START');
       await CommonFunc.sleep(2000);
       let driver: Driver = Driver.create();
       let btn: Component = await driver.findComponent(ON.id("SegmentButtonItemOptionsArray101"));
       await CommonFunc.sleep(1000);
       await btn.click();
       await CommonFunc.sleep(1000);
       let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0];
       console.info("[SegmentButtonItemOptionsArray1_001] component obj is: " + JSON.stringify(obj));
       expect(obj.$attrs.content).assertEqual('2');
       console.info('[SegmentButtonItemOptionsArray1_001] END');
       done();
     });

    
           /**
            * @tc.name   SegmentButtonItemOptionsArray1_002
            * @tc.number SegmentButtonItemOptionsArray1_002
            * @tc.desc   Frequently updating and modifying the values of parent components
            * @tc.type   FUNCTION
            * @tc.size   MEDIUMTEST
            * @tc.level  LEVEL0
            */
           it('SegmentButtonItemOptionsArray1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
       console.info('[SegmentButtonItemOptionsArray1_002] START');
       await CommonFunc.sleep(2000);
       let driver: Driver = Driver.create();
       let btn: Component = await driver.findComponent(ON.id("SegmentButtonItemOptionsArray102"));
       await CommonFunc.sleep(1000);
       await btn.click();
       await CommonFunc.sleep(1000);
       let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[2]
        .$children[0]
        .$children[0]
        .$children[0];
       console.info("[SegmentButtonItemOptionsArray1_002] component obj is: " + JSON.stringify(obj));
       expect(obj.$attrs.content).assertEqual('4');
       console.info('[SegmentButtonItemOptionsArray1_002] END');
       done();
     });

           /**
            * @tc.name   SegmentButtonItemOptionsArray1_003
            * @tc.number SegmentButtonItemOptionsArray1_003
            * @tc.desc   Frequently updating and modifying the values of parent components
            * @tc.type   FUNCTION
            * @tc.size   MEDIUMTEST
            * @tc.level  LEVEL0
            */
           it('SegmentButtonItemOptionsArray1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
       console.info('[SegmentButtonItemOptionsArray1_003] START');
       await CommonFunc.sleep(2000);
       let driver: Driver = Driver.create();
       let btn: Component = await driver.findComponent(ON.id("SegmentButtonItemOptionsArray103"));
       await CommonFunc.sleep(1000);
       await btn.click();
       await CommonFunc.sleep(1000);
       let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[3]
        .$children[0]
        .$children[0]
        .$children[0];
       console.info("[SegmentButtonItemOptionsArray1_003] component obj is: " + JSON.stringify(obj));
       expect(obj.$attrs.content).assertEqual('push');
       console.info('[SegmentButtonItemOptionsArray1_003] END');
       done();
     }) 

      /**
       * @tc.name   SegmentButtonItemOptionsArray1_004
       * @tc.number SegmentButtonItemOptionsArray1_004
       * @tc.desc   Frequently updating and modifying the values of parent components
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SegmentButtonItemOptionsArray1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
       console.info('[SegmentButtonItemOptionsArray1_004] START');
       await CommonFunc.sleep(2000);
       let driver: Driver = Driver.create();
       let btn: Component = await driver.findComponent(ON.id("SegmentButtonItemOptionsArray104"));
       await CommonFunc.sleep(1000);
       await btn.click();
       await CommonFunc.sleep(1000);
       let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0];
       console.info("[SegmentButtonItemOptionsArray1_004] component obj is: " + JSON.stringify(obj));
       expect(obj.$attrs.content).assertEqual('unshift');
       console.info('[SegmentButtonItemOptionsArray1_003] END');
       done();
     });
     /**
      * @tc.name   SegmentButtonItemOptionsArray1_005
      * @tc.number SegmentButtonItemOptionsArray1_005
      * @tc.desc   Frequently updating and modifying the values of parent components
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SegmentButtonItemOptionsArray1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
       console.info('[SegmentButtonItemOptionsArray1_005] START');
       await CommonFunc.sleep(2000);
       let driver: Driver = Driver.create();
       let btn: Component = await driver.findComponent(ON.id("SegmentButtonItemOptionsArray105"));
       await CommonFunc.sleep(1000);
       await btn.click();
       await CommonFunc.sleep(1000);
       let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[1]
        .$children[0]
        .$children[0]
        .$children[0];
       console.info("[SegmentButtonItemOptionsArray1_005] component obj is: " + JSON.stringify(obj));
       expect(obj.$attrs.content).assertEqual('splice1');
       console.info('[SegmentButtonItemOptionsArray1_005] END');
       done();
     });
    /**
     * @tc.name   SegmentButtonItemOptionsArray1_006
     * @tc.number SegmentButtonItemOptionsArray1_006
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonItemOptionsArray1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonItemOptionsArray1_006] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("SegmentButtonItemOptionsArray106"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0];
      console.info("[SegmentButtonItemOptionsArray1_006] component obj is: " + JSON.stringify(obj));
       expect(obj.$attrs.content).assertEqual('a');
      console.info('[SegmentButtonItemOptionsArray1_006] END');
      done();
    });
  })
}
