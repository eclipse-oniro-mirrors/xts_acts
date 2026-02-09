/*
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageContentTransitionEffectTest() {
  describe('ImageContentTransitionEffectTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageContentTransitionEffectTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageContentTransitionEffect/ImageContentTransitionEffect',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get ImageContentTransitionEffectTest state success ' + JSON.stringify(pages));
        if (!pages.name.includes('ImageContentTransitionEffect')) {
          const result = await router.replaceUrl(options);
          console.info('push ImageContentTransitionEffectTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000); 
      } catch (err) {
        console.error('push ImageContentTransitionEffectTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageContentTransitionEffectTest afterEach called');
    });

    /**
     * @tc.name   ImageContentTransitionEffectTest001
     * @tc.number ImageContentTransitionEffectTest001
     * @tc.desc   test the contentTransition:ContentTransitionEffect.OPACITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageContentTransitionEffectTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageContentTransitionEffectTest001] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('OpacityID'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('image');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageContentTransitionEffectTest001] obj.$attrs.contentTransition is: ' + JSON.stringify(obj.$attrs.contentTransition));
      expect(obj.$attrs.contentTransition).assertEqual('ContentTransitionEffect.OPACITY');
      console.info('[ImageContentTransitionEffectTest001] END');
      done();
    });

    /**
     * @tc.name   ImageContentTransitionEffectTest002
     * @tc.number ImageContentTransitionEffectTest002
     * @tc.desc   test the contentTransition:ContentTransitionEffect.IDENTITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageContentTransitionEffectTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageContentTransitionEffectTest002] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button2 = await driver.findComponent(ON.id('IdentityID'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('image');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageContentTransitionEffectTest002] obj.$attrs.contentTransition is: ' + JSON.stringify(obj.$attrs.contentTransition));
      expect(obj.$attrs.contentTransition).assertEqual('ContentTransitionEffect.IDENTITY');
      console.info('[ImageContentTransitionEffectTest002] END');
      done();
    });

    /**
     * @tc.name   ImageContentTransitionEffectTest003
     * @tc.number ImageContentTransitionEffectTest003
     * @tc.desc   test the contentTransition:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageContentTransitionEffectTest003', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageContentTransitionEffectTest003] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button3 = await driver.findComponent(ON.id('undefinedID'));
      await CommonFunc.sleep(500);
      await button3.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('image');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageContentTransitionEffectTest003] obj.$attrs.contentTransition is: ' + JSON.stringify(obj.$attrs.contentTransition));
      expect(obj.$attrs.contentTransition).assertEqual('ContentTransitionEffect.IDENTITY');
      console.info('[ImageContentTransitionEffectTest003] END');
      done();
    });

    /**
     * @tc.name   ImageContentTransitionEffectTest004
     * @tc.number ImageContentTransitionEffectTest004
     * @tc.desc   test the contentTransition:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageContentTransitionEffectTest004', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageContentTransitionEffectTest004] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button4 = await driver.findComponent(ON.id('nullID'));
      await CommonFunc.sleep(500);
      await button4.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('image');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageContentTransitionEffectTest004] obj.$attrs.contentTransition is: ' + JSON.stringify(obj.$attrs.contentTransition));
      expect(obj.$attrs.contentTransition).assertEqual('ContentTransitionEffect.IDENTITY');
      console.info('[ImageContentTransitionEffectTest004] END');
      done();
    });
  })
}