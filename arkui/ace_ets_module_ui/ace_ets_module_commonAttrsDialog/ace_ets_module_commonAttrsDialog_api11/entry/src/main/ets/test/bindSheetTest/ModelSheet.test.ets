/*
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
import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import emitter from '@ohos.events.emitter';

export default function ModelSheetTest() {
  describe('ModelSheetTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheet/Index',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Model_Visual_0150
     * @tc.number ArkUX_Model_Visual_0150
     * @tc.desc   Sets the bindSheet property parameter to different value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Model_Visual_0150', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Model_Visual_0150 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10150,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_0150 get state result is: " + JSON.stringify(indexData));
          expect(indexData.data?.detents).assertEqual([SheetSize.LARGE, SheetSize.MEDIUM, SheetSize.MEDIUM]);
          expect(indexData.data?.blurStyle).assertEqual(BlurStyle.Thin);
          expect(indexData.data?.showClose).assertEqual(false);
          expect(indexData.data?.title).assertEqual({
            title: "323", subtitle: "156"
          });
          expect(indexData.data?.preferType).assertEqual(SheetType.POPUP);
          expect(indexData.data?.shouldDismiss).assertEqual(true);
          expect(indexData.data?.enableOutsideInteractive).assertEqual(false)
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0150 on emitter err : " + JSON.stringify(err));
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

    /**
     * @tc.name   ArkUX_Model_Visual_0160
     * @tc.number ArkUX_Model_Visual_0160
     * @tc.desc   Sets the bindSheet property parameter to different value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Model_Visual_0160', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Model_Visual_0160 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10160,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_0160 get state result is: " + JSON.stringify(indexData));
          expect(indexData.data?.detents).assertEqual([SheetSize.MEDIUM, SheetSize.LARGE, 100]);
          expect(indexData.data?.blurStyle).assertEqual(BlurStyle.Thick);
          expect(indexData.data?.showClose).assertEqual(true);
          expect(indexData.data?.title).assertEqual({
            title: "title", subtitle: "subtitle"
          });
          expect(indexData.data?.preferType).assertEqual(SheetType.CENTER);
          expect(indexData.data?.shouldDismiss).assertEqual(true);
          expect(indexData.data?.enableOutsideInteractive).assertEqual(true)
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0160 on emitter err : " + JSON.stringify(err));
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

    /**
     * @tc.name   ArkUX_Model_Visual_0170
     * @tc.number ArkUX_Model_Visual_0170
     * @tc.desc   Sets the bindSheet property parameter to different value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Model_Visual_0170', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Model_Visual_0170 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10170,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_0170 get state result is: " + JSON.stringify(indexData));
          expect(indexData.data?.detents).assertEqual([100, 100, SheetSize.LARGE]);
          expect(indexData.data?.blurStyle).assertEqual(BlurStyle.Regular);
          expect(indexData.data?.showClose).assertEqual(false);
          expect(indexData.data?.title).assertEqual({
            title: "asdasd", subtitle: "1232561"
          });
          expect(indexData.data?.preferType).assertEqual(SheetType.POPUP);
          expect(indexData.data?.shouldDismiss).assertEqual(true);
          expect(indexData.data?.enableOutsideInteractive).assertEqual(false)
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0170 on emitter err : " + JSON.stringify(err));
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

    /**
     * @tc.name   ArkUX_Model_Visual_0180
     * @tc.number ArkUX_Model_Visual_0180
     * @tc.desc   Sets the bindSheet property parameter to different value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Model_Visual_0180', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Model_Visual_0180 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10180,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_0180 get state result is: " + JSON.stringify(indexData));
          expect(indexData.data?.detents).assertEqual([0, 0, 0]);
          expect(indexData.data?.blurStyle).assertEqual(BlurStyle.BACKGROUND_REGULAR);
          expect(indexData.data?.showClose).assertEqual(true);
          expect(indexData.data?.title).assertEqual({
            title: " ", subtitle: " "
          });
          expect(indexData.data?.preferType).assertEqual(SheetType.CENTER);
          expect(indexData.data?.shouldDismiss).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0180 on emitter err : " + JSON.stringify(err));
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

    /**
     * @tc.name   ArkUX_Model_Visual_0190
     * @tc.number ArkUX_Model_Visual_0190
     * @tc.desc   Sets the bindSheet property parameter to different value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Model_Visual_0190', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Model_Visual_0190 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10190,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_0190 get state result is: " + JSON.stringify(indexData));
          expect(indexData.data?.detents).assertEqual([, ,]);
          expect(indexData.data?.blurStyle).assertEqual(" ");
          expect(indexData.data?.showClose).assertEqual(" ");
          expect(indexData.data?.title).assertEqual({
            title: " ", subtitle: " "
          });
          expect(indexData.data?.preferType).assertEqual(" ");
          expect(indexData.data?.shouldDismiss).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0190 on emitter err : " + JSON.stringify(err));
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

    /**
     * @tc.name   ArkUX_Model_Visual_0200
     * @tc.number ArkUX_Model_Visual_0200
     * @tc.desc   Sets the bindSheet property parameter to different value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Model_Visual_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Model_Visual_0200 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10200,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_0200 get state result is: " + JSON.stringify(indexData));
          expect(indexData.data?.detents).assertEqual([SheetSize.LARGE, 10000, SheetSize.MEDIUM]);
          expect(indexData.data?.blurStyle).assertEqual(BlurStyle.BACKGROUND_THIN);
          expect(indexData.data?.showClose).assertEqual(false);
          expect(indexData.data?.title).assertEqual({
            title: "标题", subtitle: "文字"
          });
          expect(indexData.data?.preferType).assertEqual(SheetType.POPUP);
          expect(indexData.data?.shouldDismiss).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0200 on emitter err : " + JSON.stringify(err));
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

    /**
     * @tc.name   ArkUX_Model_Visual_0210
     * @tc.number ArkUX_Model_Visual_0210
     * @tc.desc   Sets the bindSheet property parameter to different value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Model_Visual_0210', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Model_Visual_0210 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10210,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_0210 get state result is: " + JSON.stringify(indexData));
          expect(indexData.data?.detents).assertEqual([0, 100, 12345]);
          expect(indexData.data?.blurStyle).assertEqual(BlurStyle.BACKGROUND_ULTRA_THICK);
          expect(indexData.data?.showClose).assertEqual(false);
          expect(indexData.data?.title).assertEqual({
            title: "@@@", subtitle: "+++"
          });
          expect(indexData.data?.preferType).assertEqual(SheetType.POPUP);
          expect(indexData.data?.shouldDismiss).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0210 on emitter err : " + JSON.stringify(err));
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

    /**
     * @tc.name   ArkUX_Model_Visual_0220
     * @tc.number ArkUX_Model_Visual_0220
     * @tc.desc   Sets the bindSheet property parameter to different value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Model_Visual_0220', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Model_Visual_0220 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10220,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_0220 get state result is: " + JSON.stringify(indexData));
          expect(indexData.data?.detents).assertEqual([54321, 11111, 123456]);
          expect(indexData.data?.blurStyle).assertEqual(BlurStyle.NONE);
          expect(indexData.data?.showClose).assertEqual(true);
          expect(indexData.data?.title).assertEqual({
            title: "。。。", subtitle: "，，，"
          });
          expect(indexData.data?.preferType).assertEqual(SheetType.CENTER);
          expect(indexData.data?.shouldDismiss).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0220 on emitter err : " + JSON.stringify(err));
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