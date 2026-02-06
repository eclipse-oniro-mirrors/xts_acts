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

export default function chainWeightTest() {

  describe('ChainWeightTest', () => {

    let PAGE_TAG = 'ChainWeightTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`chainWeight/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   ChainWeightCapi_0100
     * @tc.number ChainWeightCapi_0100
     * @tc.desc   test chainWeight value is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ChainWeightCapi_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('ChainWeightCapi_0100 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);

      let rect1 = Utils.getComponentRect('rowChainWeightCapi1');
      let rect2 = Utils.getComponentRect('rowChainWeightCapi2');
      let rect3 = Utils.getComponentRect('rowChainWeightCapi3');
      console.info('ChainWeightCapi_0100 row1 left: ' + rect1.left + ',top: ' + rect1.top + ',right: ' + rect1.right + ',bottom: ' + rect1.bottom);
      console.info('ChainWeightCapi_0100 row2 left: ' + rect2.left + ',top: ' + rect2.top + ',right: ' + rect2.right + ',bottom: ' + rect2.bottom);
      console.info('ChainWeightCapi_0100 row3 left: ' + rect3.left + ',top: ' + rect3.top + ',right: ' + rect3.right + ',bottom: ' + rect3.bottom);
      expect(Math.floor(Math.round((rect1.right - rect1.left) - (rect2.right - rect2.left)/2)) <= 1).assertTrue();
      expect(Math.floor(Math.round((rect3.bottom - rect3.top) - (rect2.bottom - rect2.top)/2)) <= 1).assertTrue();
      console.info('ChainWeightCapi_0100 END');
      done();
    });

    /**
     * @tc.name   ChainWeightCapi_0200
     * @tc.number ChainWeightCapi_0200
     * @tc.desc   test chainWeight value is -5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ChainWeightCapi_0200',  Level.LEVEL1, async (done: Function) => {
      console.info('ChainWeightCapi_0200 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('button-5'));
      await button.click();
      await Utils.sleep(1000);

      let rect1 = Utils.getComponentRect('rowChainWeightCapi1');
      let rect2 = Utils.getComponentRect('rowChainWeightCapi2');
      let rect3 = Utils.getComponentRect('rowChainWeightCapi3');
      console.info('ChainWeightCapi_0200 row1 left: ' + rect1.left + ',top: ' + rect1.top + ',right: ' + rect1.right + ',bottom: ' + rect1.bottom);
      console.info('ChainWeightCapi_0200 row2 left: ' + rect2.left + ',top: ' + rect2.top + ',right: ' + rect2.right + ',bottom: ' + rect2.bottom);
      console.info('ChainWeightCapi_0200 row3 left: ' + rect3.left + ',top: ' + rect3.top + ',right: ' + rect3.right + ',bottom: ' + rect3.bottom);
      expect(Math.abs(Math.round((rect2.right - rect2.left) - (rect1.right - rect1.left)/2)) <= 3).assertTrue();
      expect(Math.abs(Math.round((rect2.bottom - rect2.top) - (rect3.bottom - rect3.top)/2)) <= 3).assertTrue();
      console.info('ChainWeightCapi_0200 END');
      done();
    });
  })
}