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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import bundle from '@ohos.bundle.bundleManager';

export default function qrCodeJsunit() {
  describe('qrCodeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/qrCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get QrCode state success " + JSON.stringify(pages));
        if (!("qrCode" == pages.name)) {
          console.info("get QrCode pages success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push QrCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push QrCode page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   test_qrCode_001
     * @tc.number test_qrCode_001
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_qrCode_001', Level.LEVEL0, async (done: Function) => {
      console.info('[test_qrCode_001] START');
      let strJson = getInspectorByKey('QrCodeColorKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_qrCode_001] obj is: " + JSON.stringify(obj.$attrs));
      expect(Math.abs(obj.$attrs.opacity - 0.1) < 0.000001).assertTrue();
      console.info('[test_qrCode_001] END');
      done();
    });

    /**
     * @tc.name   test_qrCode_002
     * @tc.number test_qrCode_002
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_qrCode_002', Level.LEVEL0, async (done: Function) => {
      console.info('[test_qrCode_002] START');
      let strJson = getInspectorByKey('QrCodeColorKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_qrCode_002] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.color).assertEqual("#FF0011FF");

      console.info('[test_qrCode_002] END');
      done();
    });

    /**
     * @tc.name   test_qrCode_003
     * @tc.number test_qrCode_003
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_qrCode_003', Level.LEVEL0, async (done: Function) => {
      console.info('[test_qrCode_003] START');
      let strJson = getInspectorByKey('QrCodeColorKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_qrCode_003] obj is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.backgroundColor).assertEqual("#FF008000");
      console.info('[test_qrCode_003] END');
      done();
    });
  })
}
