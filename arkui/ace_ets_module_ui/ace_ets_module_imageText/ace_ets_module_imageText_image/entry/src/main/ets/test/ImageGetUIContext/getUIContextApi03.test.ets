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

export default function getUIContextApi03() {
  describe('getUIContextApi03', () => {
    beforeEach(async (done: Function) => {
      console.info('getUIContextApi03 beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageGetUIContext/getUIContextApi03',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get getUIContextApi03 state success ' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!('getUIContextApi03' == pages.name)) {
          console.info('get getUIContextApi03 state success ' + JSON.stringify(pages.name));
          await CommonFunc.sleep(SLEEP_TIME);
          console.info('push getUIContextApi03 page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push getUIContextApi03 page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('getUIContextApi03 after each called');
    });

    /**
     * @tc.number setImageCacheCount1001
     * @tc.name   setImageCacheCount1001
     * @tc.desc   Test the setImageCacheCount interface to set outlier values
     * @tc.level  Level 2
     * @tc.type
     * @tc.size
     */
    it('setImageCacheCount1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('setImageCacheCount1001 START');
      let driver = await Driver.create();
      let button4 = await driver.findComponent(ON.id('Button001'));
      await button4.click();
      console.info('button1 click success');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('text001');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[setImageCacheCount1001]:' + JSON.stringify(obj.$attrs));
      console.info('[setImageCacheCount1001]:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('setImageCacheCount = 0');
      console.info('setImageCacheCount1001 END');
      done();
    });

    /**
     * @tc.number setImageRawDataCacheSize1002
     * @tc.name   setImageRawDataCacheSize1002
     * @tc.desc   Test the setImageRawDataCacheSize interface to set outlier values
     * @tc.level  Level 2
     * @tc.type
     * @tc.size
     */
    it('setImageRawDataCacheSize1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('setImageRawDataCacheSize1002 START');
      let driver = await Driver.create();
      let button4 = await driver.findComponent(ON.id('Button001'));
      await button4.click();
      console.info('button1 click success');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('text002');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[setImageRawDataCacheSize1002]:' + JSON.stringify(obj.$attrs));
      console.info('[setImageRawDataCacheSize1002]:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('setImageRawDataCacheSize = 0');
      console.info('setImageRawDataCacheSize1002 END');
      done();
    });
  })
}