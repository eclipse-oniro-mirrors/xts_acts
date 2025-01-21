/*
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

import router from '@system.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import events_emitter from '@ohos.events.emitter';

export default function ModelSheetTest() {
  describe('ModelSheetTest', () => {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/Index',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
      done()
    });

    /*
     *@tc.number ArkUX_Model_Visual_0150
     *@tc.name   Support modifying the modelsheet bindSheet change of modelsheet component
     *@tc.desc   Sets the bindSheet property parameter to different value
     */
    it('ArkUX_Model_Visual_0150', 0, async function (done) {
      console.info('ArkUX_Model_Visual_0150 START');
      try {
        let indexEvent = {
          eventId: 10150,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent) => {
          console.info("ArkUX_Model_Visual_0150 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data.detents).assertEqual([SheetSize.LARGE, SheetSize.MEDIUM, SheetSize.MEDIUM]);
          expect(indexEvent.data.blurStyle).assertEqual(BlurStyle.Thin);
          expect(indexEvent.data.showClose).assertEqual(false);
          expect(indexEvent.data.title).assertEqual({
            title: "323", subtitle: "156"
          });
          expect(indexEvent.data.preferType).assertEqual(SheetType.POPUP);
          expect(indexEvent.data.shouldDismiss).assertEqual(true);
          expect(indexEvent.data.enableOutsideInteractive).assertEqual(false)
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0150 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('ArkUX_Model_Visual_0150', 10, "")
        console.info("ArkUX_Model_Visual_0150 click result is: " + JSON.stringify(sendEventByKey('ArkUX_Model_Visual_0150', 10, "")));
        console.info('ArkUX_Model_Visual_0150 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0150 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /*
     *@tc.number ArkUX_Model_Visual_0160
     *@tc.name   Support modifying the modelsheet bindSheet change of modelsheet component
     *@tc.desc   Sets the bindSheet property parameter to different value
     */
    it('ArkUX_Model_Visual_0160', 0, async function (done) {
      console.info('ArkUX_Model_Visual_0160 START');
      try {
        let indexEvent = {
          eventId: 10160,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent) => {
          console.info("ArkUX_Model_Visual_0160 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data.detents).assertEqual([SheetSize.MEDIUM, SheetSize.LARGE, 100]);
          expect(indexEvent.data.blurStyle).assertEqual(BlurStyle.Thick);
          expect(indexEvent.data.showClose).assertEqual(true);
          expect(indexEvent.data.title).assertEqual({
            title: "title", subtitle: "subtitle"
          });
          expect(indexEvent.data.preferType).assertEqual(SheetType.CENTER);
          expect(indexEvent.data.shouldDismiss).assertEqual(true);
          expect(indexEvent.data.enableOutsideInteractive).assertEqual(true)
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0160 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('ArkUX_Model_Visual_0160', 10, "")
        console.info("ArkUX_Model_Visual_0160 click result is: " + JSON.stringify(sendEventByKey('ArkUX_Model_Visual_0160', 10, "")));
        console.info('ArkUX_Model_Visual_0160 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0160 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /*
     *@tc.number ArkUX_Model_Visual_0170
     *@tc.name   Support modifying the modelsheet bindSheet change of modelsheet component
     *@tc.desc   Sets the bindSheet property parameter to different value
     */
    it('ArkUX_Model_Visual_0170', 0, async function (done) {
      console.info('ArkUX_Model_Visual_0170 START');
      try {
        let indexEvent = {
          eventId: 10170,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent) => {
          console.info("ArkUX_Model_Visual_0170 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data.detents).assertEqual([100, 100, SheetSize.LARGE]);
          expect(indexEvent.data.blurStyle).assertEqual(BlurStyle.Regular);
          expect(indexEvent.data.showClose).assertEqual(false);
          expect(indexEvent.data.title).assertEqual({
            title: "asdasd", subtitle: "1232561"
          });
          expect(indexEvent.data.preferType).assertEqual(SheetType.POPUP);
          expect(indexEvent.data.shouldDismiss).assertEqual(true);
          expect(indexEvent.data.enableOutsideInteractive).assertEqual(false)
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0170 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('ArkUX_Model_Visual_0170', 10, "")
        console.info("ArkUX_Model_Visual_0170 click result is: " + JSON.stringify(sendEventByKey('ArkUX_Model_Visual_0170', 10, "")));
        console.info('ArkUX_Model_Visual_0170 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0170 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /*
     *@tc.number ArkUX_Model_Visual_0180
     *@tc.name   Support modifying the modelsheet bindSheet change of modelsheet component
     *@tc.desc   Sets the bindSheet property parameter to different value
     */
    it('ArkUX_Model_Visual_0180', 0, async function (done) {
      console.info('ArkUX_Model_Visual_0180 START');
      try {
        let indexEvent = {
          eventId: 10180,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent) => {
          console.info("ArkUX_Model_Visual_0180 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data.detents).assertEqual([0, 0, 0]);
          expect(indexEvent.data.blurStyle).assertEqual(BlurStyle.BACKGROUND_REGULAR);
          expect(indexEvent.data.showClose).assertEqual(true);
          expect(indexEvent.data.title).assertEqual({
            title: " ", subtitle: " "
          });
          expect(indexEvent.data.preferType).assertEqual(SheetType.CENTER);
          expect(indexEvent.data.shouldDismiss).assertEqual(true);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0180 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('ArkUX_Model_Visual_0180', 10, "")
        console.info("ArkUX_Model_Visual_0180 click result is: " + JSON.stringify(sendEventByKey('ArkUX_Model_Visual_0180', 10, "")));
        console.info('ArkUX_Model_Visual_0180 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0180 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /*
     *@tc.number ArkUX_Model_Visual_0190
     *@tc.name   Support modifying the modelsheet bindSheet change of modelsheet component
     *@tc.desc   Sets the bindSheet property parameter to different value
     */
    it('ArkUX_Model_Visual_0190', 0, async function (done) {
      console.info('ArkUX_Model_Visual_0190 START');
      try {
        let indexEvent = {
          eventId: 10190,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent) => {
          console.info("ArkUX_Model_Visual_0190 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data.detents).assertEqual([, ,]);
          expect(indexEvent.data.blurStyle).assertEqual(" ");
          expect(indexEvent.data.showClose).assertEqual(" ");
          expect(indexEvent.data.title).assertEqual({
            title: " ", subtitle: " "
          });
          expect(indexEvent.data.preferType).assertEqual(" ");
          expect(indexEvent.data.shouldDismiss).assertEqual(true);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0190 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('ArkUX_Model_Visual_0190', 10, "")
        console.info("ArkUX_Model_Visual_0190 click result is: " + JSON.stringify(sendEventByKey('ArkUX_Model_Visual_0190', 10, "")));
        console.info('ArkUX_Model_Visual_0190 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0190 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /*
     *@tc.number ArkUX_Model_Visual_0200
     *@tc.name   Support modifying the modelsheet bindSheet change of modelsheet component
     *@tc.desc   Sets the bindSheet property parameter to different value
     */
    it('ArkUX_Model_Visual_0200', 0, async function (done) {
      console.info('ArkUX_Model_Visual_0200 START');
      try {
        let indexEvent = {
          eventId: 10200,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent) => {
          console.info("ArkUX_Model_Visual_0200 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data.detents).assertEqual([SheetSize.LARGE, 10000, SheetSize.MEDIUM]);
          expect(indexEvent.data.blurStyle).assertEqual(BlurStyle.BACKGROUND_THIN);
          expect(indexEvent.data.showClose).assertEqual(false);
          expect(indexEvent.data.title).assertEqual({
            title: "标题", subtitle: "文字"
          });
          expect(indexEvent.data.preferType).assertEqual(SheetType.POPUP);
          expect(indexEvent.data.shouldDismiss).assertEqual(true);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0200 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('ArkUX_Model_Visual_0200', 10, "")
        console.info("ArkUX_Model_Visual_0200 click result is: " + JSON.stringify(sendEventByKey('ArkUX_Model_Visual_0200', 10, "")));
        console.info('ArkUX_Model_Visual_0200 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0200 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /*
     *@tc.number ArkUX_Model_Visual_0210
     *@tc.name   Support modifying the modelsheet bindSheet change of modelsheet component
     *@tc.desc   Sets the bindSheet property parameter to different value
     */
    it('ArkUX_Model_Visual_0210', 0, async function (done) {
      console.info('ArkUX_Model_Visual_0210 START');
      try {
        let indexEvent = {
          eventId: 10210,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent) => {
          console.info("ArkUX_Model_Visual_0210 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data.detents).assertEqual([0, 100, 12345]);
          expect(indexEvent.data.blurStyle).assertEqual(BlurStyle.BACKGROUND_ULTRA_THICK);
          expect(indexEvent.data.showClose).assertEqual(false);
          expect(indexEvent.data.title).assertEqual({
            title: "@@@", subtitle: "+++"
          });
          expect(indexEvent.data.preferType).assertEqual(SheetType.POPUP);
          expect(indexEvent.data.shouldDismiss).assertEqual(true);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0210 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('ArkUX_Model_Visual_0210', 10, "")
        console.info("ArkUX_Model_Visual_0210 click result is: " + JSON.stringify(sendEventByKey('ArkUX_Model_Visual_0210', 10, "")));
        console.info('ArkUX_Model_Visual_0210 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0210 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /*
     *@tc.number ArkUX_Model_Visual_0220
     *@tc.name   Support modifying the modelsheet bindSheet change of modelsheet component
     *@tc.desc   Sets the bindSheet property parameter to different value
     */
    it('ArkUX_Model_Visual_0220', 0, async function (done) {
      console.info('ArkUX_Model_Visual_0220 START');
      try {
        let indexEvent = {
          eventId: 10220,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent) => {
          console.info("ArkUX_Model_Visual_0220 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data.detents).assertEqual([54321, 11111, 123456]);
          expect(indexEvent.data.blurStyle).assertEqual(BlurStyle.NONE);
          expect(indexEvent.data.showClose).assertEqual(true);
          expect(indexEvent.data.title).assertEqual({
            title: "。。。", subtitle: "，，，"
          });
          expect(indexEvent.data.preferType).assertEqual(SheetType.CENTER);
          expect(indexEvent.data.shouldDismiss).assertEqual(true);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0220 on events_emitter err : " + JSON.stringify(err));
        }
        sendEventByKey('ArkUX_Model_Visual_0220', 10, "")
        console.info("ArkUX_Model_Visual_0220 click result is: " + JSON.stringify(sendEventByKey('ArkUX_Model_Visual_0220', 10, "")));
        console.info('ArkUX_Model_Visual_0220 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0220 ERR  ' + JSON.stringify(err));
      }
      done();
    });

  })
}