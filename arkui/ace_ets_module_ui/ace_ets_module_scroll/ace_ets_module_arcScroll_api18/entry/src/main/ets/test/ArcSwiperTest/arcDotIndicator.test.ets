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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function arcDotIndicator() {
  describe('arcDotIndicator', () => {
    beforeEach(async (done: Function) => {
      console.info("arcDotIndicator beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ArcSwiper/arcDotIndicator",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get arcDotIndicator state pages:" + JSON.stringify(pages));
        if (!("arcDotIndicator" == pages.name)) {
          console.info("get arcDotIndicator pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push arcDotIndicator page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push arcDotIndicator page error:" + err);
      }
      console.info("arcDotIndicator beforeEach end");
      done();
    });

    /**
     * @tc.number    arcDotIndicator_001
     * @tc.name      arcDotIndicator_0100
     * @tc.desc      The direction of the arc-shaped indicator is the 6 o'clock direction.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('arcDotIndicator_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[arcDotIndicator_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('arcs_arcDirection');
      console.info('arcDotIndicator_0100 :' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info("arcDotIndicator_0100 component obj is: " + JSON.stringify(obj));
      console.info("arcDotIndicator_0100 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("arcDotIndicator_0100 indicator is: " + JSON.stringify(obj.$attrs.indicator));
      let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
      console.info("arcDotIndicator_0100 arcDirection is: " + JSON.stringify(obj2.arcDirection));
      expect(obj2.arcDirection).assertEqual("ArcDirection.SIX_CLOCK_DIRECTION");
      expect(obj2.itemColor).assertEqual("#FF808080");
      expect(obj2.selectedItemColor).assertEqual("#FF008000");
      console.info('arcDotIndicator_0100 END ');
      done();
    });

    /**
     * @tc.number    arcDotIndicator_002
     * @tc.name      arcDotIndicator_0200
     * @tc.desc      The direction of the arc-shaped indicator is the 3 o'clock direction.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('arcDotIndicator_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[arcDotIndicator_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('arcs_arcDirection_3'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('arcs_arcDirection');
      console.info('arcDotIndicator_0200 :' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info("arcDotIndicator_0200 component obj is: " + JSON.stringify(obj));
      console.info("arcDotIndicator_0200 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("arcDotIndicator_0200 indicator is: " + JSON.stringify(obj.$attrs.indicator));
      let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
      console.info("arcDotIndicator_0200 arcDirection is: " + JSON.stringify(obj2.arcDirection));
      expect(obj2.arcDirection).assertEqual("ArcDirection.THREE_CLOCK_DIRECTION");
      expect(obj2.itemColor).assertEqual("#FF0000FF");
      expect(obj2.selectedItemColor).assertEqual("#FFFFFF00");
      console.info('[arcDotIndicator_0200] END');
      done();
    });

    /**
     * @tc.number    arcDotIndicator_003
     * @tc.name      arcDotIndicator_0300
     * @tc.desc      The direction of the arc-shaped indicator is the 3 o'clock direction.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('arcDotIndicator_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[arcDotIndicator_0300] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('arcs_arcDirection_9'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('arcs_arcDirection');
      console.info('arcDotIndicator_0300 :' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info("arcDotIndicator_0300 component obj is: " + JSON.stringify(obj));
      console.info("arcDotIndicator_0300 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("arcDotIndicator_0300 indicator is: " + JSON.stringify(obj.$attrs.indicator));
      let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
      console.info("arcDotIndicator_0300 arcDirection is: " + JSON.stringify(obj2.arcDirection));
      expect(obj2.arcDirection).assertEqual("ArcDirection.NINE_CLOCK_DIRECTION");
      expect(obj2.itemColor).assertEqual("#FFFFEC8B");
      expect(obj2.selectedItemColor).assertEqual("#FFFF0000");
      console.info('[arcDotIndicator_0300] END');
      done();
    });
  })
}
