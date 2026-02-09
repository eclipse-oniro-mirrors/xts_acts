/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it,expect, Level } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function QRCodeApiTest() {
  describe('QRCodeApiTest', () => {
    beforeEach(async (done: Function) => {
      console.info("QRCodeApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/QRCode/QRCodeApiTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get QRCodeApiTest state success " + JSON.stringify(pages));
        if (!("QRCodeApiTest" == pages.name)) {
          console.info("get QRCodeApiTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push QRCodeApiTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push QRCodeApiTest page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("QRCodeApiTest after each called");
    });

    /**
     * @tc.name   QRCode_Api_001
     * @tc.number QRCode_Api_001
     * @tc.desc   QRCode test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('QRCode_Api_001', Level.LEVEL2, async (done: Function) => {
      console.info('[QRCode_Api_001] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('QRCode_Api_QRCode1');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[QRCode_Api_QRCode1] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.opacity).assertEqual(0.5);

      console.info('[QRCode_Api_QRCode1] END');
      done();
    });
  })
}


