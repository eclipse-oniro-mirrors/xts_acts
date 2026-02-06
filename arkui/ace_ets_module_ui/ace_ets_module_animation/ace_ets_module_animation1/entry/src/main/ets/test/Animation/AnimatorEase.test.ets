/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils'
import { Component, Driver, UiWindow, ON } from '@ohos.UiTest';
export default function AnimatorEase() {
  describe('AnimatorEase', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Animation/AnimatorEase',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get AnimatorEase state success ' + JSON.stringify(pages));
        if (!('AnimatorEase' == pages.name)) {
          console.info('get AnimatorEase state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push AnimatorEase page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push AnimatorEase page error: ' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('AnimatorEase after each called');
    });

    /**
     * @tc.name   AnimatorEase_0100
     * @tc.number AnimatorEase_0100
     * @tc.desc   test easeing param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AnimatorEase_0100', Level.LEVEL0, async (done: Function) => {
      console.info('AnimatorEase_0100 START');
      await Utils.sleep(1000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let playBtn: Component = await driver.findComponent(ON.id('Play'));
      await playBtn.click()
      console.info('[AnimatorEase_0100] playBtn click');
      await driver.delayMs(2000);

      let cancelBtn: Component = await driver.findComponent(ON.id('Cancel'));
      await cancelBtn.click()
      console.info('[AnimatorEase_0100] cancelBtn click');
      await driver.delayMs(2000);

      let strJson1: string = getInspectorByKey('Test001');
      console.info('[AnimatorEase_0100] strJson1: ' + JSON.parse(strJson1).$attrs.content);
      let strJson2: string = getInspectorByKey('Test002');
      console.info('[AnimatorEase_0100] strJson2: ' + JSON.parse(strJson2).$attrs.content);
      let strJson3: string = getInspectorByKey('Test003');
      console.info('[AnimatorEase_0100] strJson3: ' + JSON.parse(strJson3).$attrs.content);
      let strJson4: string = getInspectorByKey('Test004');
      console.info('[AnimatorEase_0100] strJson4: ' + JSON.parse(strJson4).$attrs.content);
      let strJson5: string = getInspectorByKey('Test005');
      console.info('[AnimatorEase_0100] strJson5: ' + JSON.parse(strJson5).$attrs.content);
      let strJson6: string = getInspectorByKey('Test006');
      console.info('[AnimatorEase_0100] strJson6: ' + JSON.parse(strJson6).$attrs.content);

      let strJson7: string = getInspectorByKey('Test007');
      console.info('[AnimatorEase_0100] strJson7: ' + JSON.parse(strJson7).$attrs.content);
      let strJson8: string = getInspectorByKey('Test008');
      console.info('[AnimatorEase_0100] strJson8: ' + JSON.parse(strJson8).$attrs.content);
      let strJson9: string = getInspectorByKey('Test009');
      console.info('[AnimatorEase_0100] strJson9: ' + JSON.parse(strJson9).$attrs.content);
      let strJson10: string = getInspectorByKey('Test010');
      console.info('[AnimatorEase_0100] strJson10: ' + JSON.parse(strJson10).$attrs.content);
      let strJson11: string = getInspectorByKey('Test011');
      console.info('[AnimatorEase_0100] strJson11: ' + JSON.parse(strJson11).$attrs.content);
      let strJson12: string = getInspectorByKey('Test012');
      console.info('[AnimatorEase_0100] strJson12: ' + JSON.parse(strJson12).$attrs.content);
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('animator001-1');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('animator002-1');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('animator003-1');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('animator004-1');
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('animator005-1');
      expect(JSON.parse(strJson6).$attrs.content).assertEqual('animator006-1');
      expect(JSON.parse(strJson7).$attrs.content).assertEqual('animator007-1');
      expect(JSON.parse(strJson8).$attrs.content).assertEqual('animator008-1');
      expect(JSON.parse(strJson9).$attrs.content).assertEqual('animator009-1');
      expect(JSON.parse(strJson10).$attrs.content).assertEqual('animator010-1');
      expect(JSON.parse(strJson11).$attrs.content).assertEqual('animator011-1');
      expect(JSON.parse(strJson12).$attrs.content).assertEqual('animator012-1');
      console.info('AnimatorEase_0100 END');
      done();
    });
 })
}