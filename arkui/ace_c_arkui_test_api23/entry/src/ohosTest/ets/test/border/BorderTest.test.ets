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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@kit.TestKit';

export default function borderTest() {

  describe('BorderTest', () => {

    let PAGE_TAG = 'BorderTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`border/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   BorderCapi_0100
     * @tc.number BorderCapi_0100
     * @tc.desc   test dashGap&dashWidth value is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BorderCapi_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('BorderCapi_0100 START');
      let strJson: string = getInspectorByKey('borderText1');
      await Utils.sleep(1000);
      console.info("[BorderCapi_0100] component border is: " + JSON.parse(strJson).$attrs.border);
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap.left).assertEqual('0.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap.right).assertEqual('0.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap.top).assertEqual('0.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap.bottom).assertEqual('0.00vp');

      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth.left).assertEqual('0.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth.right).assertEqual('0.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth.top).assertEqual('0.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth.bottom).assertEqual('0.00vp');
      console.info('BorderCapi_0100 END');
      done();
    });

    /**
     * @tc.name   BorderCapi_0200
     * @tc.number BorderCapi_0200
     * @tc.desc   test dashGap&dashWidth value is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BorderCapi_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('BorderCapi_0200 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('borderButton1'));
      await button.click();
      await Utils.sleep(1000);

      let strJson: string = getInspectorByKey('borderText1');
      console.info("[BorderCapi_0200] component border is: " + JSON.parse(strJson).$attrs.border);
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap.left).assertEqual('10.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap.right).assertEqual('10.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap.top).assertEqual('10.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap.bottom).assertEqual('10.00vp');

      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth.left).assertEqual('10.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth.right).assertEqual('10.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth.top).assertEqual('10.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth.bottom).assertEqual('10.00vp');
    
      console.info('BorderCapi_0200 END');
      done();
    });

    /**
     * @tc.name   BorderCapi_0300
     * @tc.number BorderCapi_0300
     * @tc.desc   test dashGap&dashWidth value is -2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BorderCapi_0300',  Level.LEVEL1, async (done: Function) => {
      console.info('BorderCapi_0300 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('borderButton2'));
      await button.click();
      await Utils.sleep(1000);

      let strJson: string = getInspectorByKey('borderText1');
      console.info("[BorderCapi_0300] component border is: " + JSON.parse(strJson).$attrs.border);
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap.left).assertEqual('-1.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap.right).assertEqual('-1.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap.top).assertEqual('-1.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashGap.bottom).assertEqual('-1.00vp');

      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth.left).assertEqual('-1.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth.right).assertEqual('-1.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth.top).assertEqual('-1.00vp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.border).dashWidth.bottom).assertEqual('-1.00vp');
      console.info('BorderCapi_0300 END');
      done();
    });
  })
}