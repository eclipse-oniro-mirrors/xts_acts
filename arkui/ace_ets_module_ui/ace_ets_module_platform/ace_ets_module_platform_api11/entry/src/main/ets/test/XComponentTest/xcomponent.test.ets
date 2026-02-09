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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';

export default function xcomponentGetXComponentContextJsunit() {
  describe('xcomponentGetXComponentContextTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/Xcomponent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get xcomponent state success " + JSON.stringify(pages));
        if (!("xcomponent" == pages.name)) {
          console.info("get xcomponent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push xcomponent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push xcomponent page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("xcomponentGetXComponentContext after each called");
    });

    /**
     * @tc.name   testxcomponentGetXComponentContext0010
     * @tc.number SUB_ACE_BASIC_ETS_API_0009
     * @tc.desc   testxcomponentGetXComponentContext0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testxcomponentGetXComponentContext0010', Level.LEVEL1, async () => {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContext0010 START');
      await Utils.sleep(1000);
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60228,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info("onRequestPopupData_0010 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.STATUS).assertEqual("callBackSuccess");
        }
        events_emitter.on(innerEventOne, callback1);
        await Utils.sleep(1000);
        console.info("onSelect_0012 click result is: " + JSON.stringify(sendEventByKey('getXComponentContextText', 10, "")));
        await Utils.sleep(2000);
      } catch (err) {
        console.info("onRequestPopupData_0010 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testxcomponentGetXComponentContext0010 END');

    });

    /**
     * @tc.name   testxcomponentSetXComponentSurfaceSize0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0010
     * @tc.desc   testxcomponentSetXComponentSurfaceSize0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testxcomponentSetXComponentSurfaceSize0001', Level.LEVEL1, async () => {
      console.info('xcomponentSetXComponentContext testxcomponentSetXComponentSurfaceSize0001 START');
      await Utils.sleep(2000);
      console.info("setXComponentSurfaceSize0001 click result is: " + JSON.stringify(sendEventByKey('setXComponentSurfaceSizeText', 10, "")));
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setXComponentSurfaceSizeText');
      //console
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual("Text");
      expect(JSON.parse(strJson).$attrs.surfaceWidth).assertEqual(undefined);
      console.info('testxcomponentSetXComponentSurfaceSize0001 END');

    });

    /**
     * @tc.name   testxcomponentSetXComponentSurfaceSize0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0010
     * @tc.desc   testxcomponentSetXComponentSurfaceSize0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testxcomponentSetXComponentSurfaceSize0002', Level.LEVEL1, async () => {
      console.info('xcomponentSetXComponentContext testxcomponentSetXComponentSurfaceSize0002 START');
      await Utils.sleep(2000);
      console.info("testxcomponentSetXComponentSurfaceSize0002 click result is: " + JSON.stringify(sendEventByKey('setXComponentSurfaceSizeText', 10, "")))
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setXComponentSurfaceSizeText');
      //console
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual("Text");
      expect(JSON.parse(strJson).$attrs.surfaceHeight).assertEqual(undefined);
      console.info('testxcomponentSetXComponentSurfaceSize0002 END');

    });
  })
}
