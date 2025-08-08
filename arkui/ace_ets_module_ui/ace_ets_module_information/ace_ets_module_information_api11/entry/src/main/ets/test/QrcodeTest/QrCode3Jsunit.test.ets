/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function qrCodeJsunit() {
  describe('qrCodeTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Qrcode/QrCode3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get QrCode state success " + JSON.stringify(pages));
        if (!("QrCode3" == pages.name)) {
          console.info("get QrCode pages success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push QrCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push QrCode page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("QrCode after each called");
    });

    it('test_qrCode_001', 0, async (done: Function) => {
      console.info('[test_qrCode_001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('QrCodeColor');

      console.info("[test_qrCode_001] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual('#FF008000');
      expect(JSON.parse(strJson).$attrs.color).assertEqual('#FF0000FF');
      done();
    });

    it('test_qrCode_002', 0, async (done: Function) => {
      console.info('[test_qrCode_002] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "color": "#FFB6C1"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 170,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_002] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('QrCodeColor');

      console.info("[test_qrCode_002] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .color));
      expect(JSON.parse(strJson).$attrs.color).assertEqual('#FFFFB6C1');
      done();
    });

    it('test_qrCode_003', 0, async (done: Function) => {
      console.info('[test_qrCode_003] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "backgroundColor": "#FFB6C1"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 171,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_003] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('QrCodeBackgroundColor');

      console.info("[test_qrCode_003] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual('#FFFFB6C1');
      done();
    });

    it('test_qrCode_004', 0, async (done: Function) => {
      console.info('[test_qrCode_004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "color": 'a'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1023,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_004] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('QrCodeColor');
      let strJsonDefault = getInspectorByKey('QrCodeDefault');
      console.info("[test_qrCode_004] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[test_qrCode_004] component objDefault is: " + JSON.stringify(JSON.parse(strJsonDefault)));
      let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
      if (targetVersion < 11) {
        expect(JSON.parse(strJson).$attrs.color).assertEqual('#FF000000');
      } else {
        expect(JSON.parse(strJson).$attrs.color).assertEqual(JSON.parse(strJsonDefault).$attrs.color);
      }
      done();
    });

    it('test_qrCode_005', 0, async (done: Function) => {
      console.info('[test_qrCode_005] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "color": 332
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1024,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_005] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_005] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('QrCodeColor');
      console.info("[test_qrCode_005] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.color).assertEqual('#FF00014C');
      done();
    });

    it('test_qrCode_006', 0, async (done: Function) => {
      console.info('[test_qrCode_006] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "backgroundColor": 'b'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1025,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_006] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_006] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('QrCodeColor');
      let strJsonDefault = getInspectorByKey('QrCodeDefault');

      console.info("[test_qrCode_006] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[test_qrCode_006] component objDefault is: " + JSON.stringify(JSON.parse(strJsonDefault)));
      // 非法入参默认初始值
      let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
      if (targetVersion < 11) {
        expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(JSON.parse(strJson).$attrs.backgroundColor)
          .assertEqual(JSON.parse(strJsonDefault).$attrs.backgroundColor);
      }
      done();
    });

    it('test_qrCode_007', 0, async (done: Function) => {
      console.info('[test_qrCode_007] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "backgroundColor": 333
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1026,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_qrCode_007] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_qrCode_007] change component color error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('QrCodeColor');

      console.info("[test_qrCode_007] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual('#FF00014D');
      done();
    });
  })
}
