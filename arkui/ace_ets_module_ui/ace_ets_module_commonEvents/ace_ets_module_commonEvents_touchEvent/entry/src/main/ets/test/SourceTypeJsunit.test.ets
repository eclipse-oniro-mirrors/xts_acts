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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import RectValue from './Rect.test'

rect_value: RectValue;
export default function sourceTypeJsunit() {

  describe('sourceTypeJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("sourceType beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/sourceType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sourceType state pages:" + JSON.stringify(pages));
        if (!("sourceType" == pages.name)) {
          console.info("get sourceType state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push sourceType page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sourceType page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("sourceType after each called");
    });

    /**
     * @tc.name   sourceTypeTest_0100
     * @tc.number SUB_ARKUI_CAPI_sourceTypeTest_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sourceTypeTest_0100', Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000)

      let rect: RectValue= await Utils.getComponentRect('button')
      console.info("sourceTypeTest_0100 rectInfo is " + JSON.stringify(rect));
      let x_value: number = rect.left + (rect.right - rect.left) / 2
      let y_value: number = rect.top + (rect.bottom - rect.top) / 2
      console.info("sourceTypeTest_0100 onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
      let point: TouchObject = {
        id: 1,
        x: x_value,
        y: y_value,
        type: TouchType.Down,
        screenX: 0,
        screenY: 0,
        windowX: 0,
        windowY: 0,
        displayX: 0,
        displayY: 0
      }
      let callback = (indexData: events_emitter.EventData) => {
        console.info("sourceTypeTest_0100 get event state result is: " + JSON.stringify(indexData));
        expect(JSON.parse(indexData.data?.event).source).assertEqual(0)
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 198,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("sourceTypeTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('sourceTypeTest_0100 sendTouchEvent :' + sendTouchEvent(point));
      await Utils.sleep(1000)
      console.info('sourceTypeTest_0100 testSendTouchEvent END');
      done();
    });
  })
}