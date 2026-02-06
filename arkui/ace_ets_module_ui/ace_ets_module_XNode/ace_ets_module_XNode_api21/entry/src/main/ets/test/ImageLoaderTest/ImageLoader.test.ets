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

export default function ImageLoaderTest() {
  describe('ImageLoaderTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageLoaderTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageLoader/ImageLoader',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get ImageLoaderTest state success ' + JSON.stringify(pages));
        if (!pages.name.includes('ImageLoaderTest')) {

          const result = await router.replaceUrl(options);
          console.info('push ImageLoaderTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000); 
      } catch (err) {
        console.error('push ImageLoaderTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageLoaderTest afterEach called');

    });

    /**
     * @tc.name   ImageLoaderTest001
     * @tc.number ImageLoaderTest001
     * @tc.desc   test the loadSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageLoaderTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageLoaderTest001] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('btnLoadSync'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('imageWidth');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageLoaderTest001] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));

      let strJson1 = getInspectorByKey('imageHeight');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageLoaderTest001] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));

      expect(obj.$attrs.content).assertEqual('220');
      expect(obj1.$attrs.content).assertEqual('220');
      console.info('[ImageLoaderTest001] END');
      done();
    });

    /**
     * @tc.name   ImageLoaderTest002
     * @tc.number ImageLoaderTest002
     * @tc.desc   test the load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageLoaderTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageLoaderTest002] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button2 = await driver.findComponent(ON.id('btnLoad'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('imageWidth');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageLoaderTest002] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));

      let strJson1 = getInspectorByKey('imageHeight');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[ImageLoaderTest002] obj1.$attrs.content is: ' + JSON.stringify(obj1.$attrs.content));

      expect(obj.$attrs.content).assertEqual('500');
      expect(obj1.$attrs.content).assertEqual('320');
      console.info('[ImageLoaderTest002] END');
      done();
    });

    /**
     * @tc.name   ImageLoaderTest003
     * @tc.number ImageLoaderTest003
     * @tc.desc   test the loadSync errorCode 111001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageLoaderTest003', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageLoaderTest003] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button3 = await driver.findComponent(ON.id('btnLoadSyncErr'));
      await CommonFunc.sleep(500);
      await button3.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('errorCode');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageLoaderTest003] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));

      expect(obj.$attrs.content).assertEqual('111001');
      console.info('[ImageLoaderTest003] END');
      done();
    });

    /**
     * @tc.name   ImageLoaderTest004
     * @tc.number ImageLoaderTest004
     * @tc.desc   test the load errorCode 111001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageLoaderTest004', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageLoaderTest004] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button3 = await driver.findComponent(ON.id('btnLoadErr'));
      await CommonFunc.sleep(500);
      await button3.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('errorCode');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageLoaderTest004] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));

      expect(obj.$attrs.content).assertEqual('111001');
      console.info('[ImageLoaderTest004] END');
      done();
    });
  })
}