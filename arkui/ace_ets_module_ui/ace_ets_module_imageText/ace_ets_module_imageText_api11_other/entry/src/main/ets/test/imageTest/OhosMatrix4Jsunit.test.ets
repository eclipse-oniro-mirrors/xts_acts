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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';

class ScaleValue {
  x: number = 0
  y: number = 0
}

class Matrix {
  x: number = 0
}

export default function ohosMatrix4Jsunit() {
  describe('appInfoTest_five_1', () => {
    beforeEach(async (done: Function) => {
      console.info("ohosMatrix4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ohosMatrix4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ohosMatrix4 state pages:" + JSON.stringify(pages));
        if (!("ohosMatrix4 " == pages.name)) {
          console.info("get ohosMatrix4  state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ohosMatrix4  page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ohosMatrix4  page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(3000);
      console.info("OhosMatrix4 each called");
    });

    it('test_OhosMatrix4_001', Level.LEVEL1, async (done: Function) => {
      console.info('[test_OhosMatrix4_001] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('rotate7');
      console.info("[test_OhosMatrix4_001] component strJson:" + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Image');
      expect(JSON.parse(strJson).$attrs.transform.type)
        .assertEqual('matrix')
      expect(JSON.parse(strJson).$attrs.transform.matrix)
        .assertNotNull;
      done();
    });

    it('test_OhosMatrix4_002', Level.LEVEL1, async (done: Function) => {
      console.info('[test_OhosMatrix4_002] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('rotate8');
      console.info("[test_OhosMatrix4_001] component strJson:" + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Image');
      expect(JSON.parse(strJson).$attrs.transform.type)
        .assertEqual('matrix')
      expect(JSON.parse(strJson).$attrs.transform.matrix)
        .assertEqual('5.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,-200.000000,0.000000,0.000000,1.000000,')
      done();
    });

    it('test_OhosMatrix4_003', Level.LEVEL1, async (done: Function) => {
      console.info('[test_OhosMatrix4_003] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('rotate9');
      console.info("[test_OhosMatrix4_003] component strJson:" + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Image');
      expect(JSON.parse(strJson).$attrs.transform.type)
        .assertEqual('matrix')
      expect(JSON.parse(strJson).$attrs.transform.matrix)
        .assertEqual('1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,100.000000,200.000000,30.000000,1.000000,')
      done();
    });

    it('test_OhosMatrix4_004', Level.LEVEL1, async (done: Function) => {
      console.info('[test_OhosMatrix4_004] START');
      await CommonFunc.sleep(1000);
      let scaleValue: ScaleValue = {
        x: 1, y: 1
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scaleValue": JSON.stringify(scaleValue)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 140,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_OhosMatrix4_004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_OhosMatrix4_004] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('rotate3');
      console.info("[test_OhosMatrix4_004] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.scale.x).assertEqual('1.000000');
      expect(JSON.parse(strJsonNew).$attrs.scale.y).assertEqual('1.000000');
      done();
    });

    it('test_OhosMatrix4_005', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(1000)
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[test_OhosMatrix4_005] get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.matrix1).assertEqual("[100, 10]")
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 141,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[test_OhosMatrix4_005] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[test_OhosMatrix4_005] sendEventByKey ' + JSON.stringify(sendEventByKey('rotate5', 10, "")));
      await CommonFunc.sleep(1000)
      console.info('[test_OhosMatrix4_005] testSendTouchEvent END');
      done();
    });

    it('test_OhosMatrix4_006', Level.LEVEL1, async (done: Function) => {
      console.info('[test_OhosMatrix4_006] START');
      await CommonFunc.sleep(1000);
      let matrix2: Matrix = {
        x: 400
      }
      let matrix3: Matrix = {
        x: 2
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "matrix2": JSON.stringify(matrix2),
            "matrix3": JSON.stringify(matrix3)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 140,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_OhosMatrix4_006] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_OhosMatrix4_006] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('rotate6');
      console.info("[test_OhosMatrix4_006] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      console.info("[test_OhosMatrix4_006] component transform is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .transform));
      expect(JSON.stringify(JSON.parse(strJsonNew).$attrs.transform))
        .assertEqual('{"type":"matrix","matrix":"3.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,900.000000,0.000000,0.000000,1.000000,"}');
      done();
    });
  })
}




