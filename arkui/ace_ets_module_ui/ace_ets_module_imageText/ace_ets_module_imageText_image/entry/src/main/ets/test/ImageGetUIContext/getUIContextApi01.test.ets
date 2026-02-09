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

import router from '@ohos.router';
import { describe, Size, beforeEach, afterEach, TestType, it, expect, Level } from '@ohos/hypium';
import { UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

const SLEEP_TIME = 1000;

export default function getUIContextApi01() {
  describe('getUIContextApi01', () => {
    beforeEach(async (done: Function) => {
      console.info('getUIContextApi01 beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageGetUIContext/getUIContextApi01',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get getUIContextApi01 state success ' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!('getUIContextApi01' == pages.name)) {
          console.info('get getUIContextApi01 state success ' + JSON.stringify(pages.name));
          await CommonFunc.sleep(SLEEP_TIME);
          console.info('push getUIContextApi01 page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push getUIContextApi01 page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('getUIContextApi01 after each called');
    });

    /**
     * @tc.number setImageCacheCount0101
     * @tc.name   setImageCacheCount0101
     * @tc.desc   Test the setImageCacheCount interface to set normal values
     * @tc.level  Level 1
     * @tc.type
     * @tc.size
     */
    it('setImageCacheCount0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('setImageCacheCount0101 START');
      let driver = await Driver.create();
      let button4 = await driver.findComponent(ON.id('Button001'));
      await button4.click();
      console.info('button1 click success');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('text001');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[setImageCacheCount0101]:' + JSON.stringify(obj.$attrs));
      console.info('[setImageCacheCount0101]:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('setImageCacheCount = 50');
      console.info('setImageCacheCount0101 END');
      done();
    });

    /**
     * @tc.number setImageRawDataCacheSize0102
     * @tc.name   setImageRawDataCacheSize0102
     * @tc.desc   Test the setImageRawDataCacheSize interface to set normal values
     * @tc.level  Level 1
     * @tc.type
     * @tc.size
     */
    it('setImageRawDataCacheSize0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('setImageRawDataCacheSize0102 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      let button4 = await driver.findComponent(ON.id('Button001'));
      await button4.click();
      console.info('button1 click success');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('text002');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[setImageRawDataCacheSize0102]:' + JSON.stringify(obj.$attrs));
      console.info('[setImageRawDataCacheSize0102]:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('setImageRawDataCacheSize = 10485760(B)');
      console.info('setImageRawDataCacheSize0102 END');
      done();
    });
  })
}