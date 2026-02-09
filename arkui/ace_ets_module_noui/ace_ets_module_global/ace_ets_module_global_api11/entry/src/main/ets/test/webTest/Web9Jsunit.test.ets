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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils'
let emitKey = "emitUserAgent";
export default function web9Jsunit() {
  describe('web9Jsunit', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/web/web_api_9',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get web9Jsunit state success " + JSON.stringify(pages));
        if (!("web_api_9" == pages.name)) {
          console.info("get web9Jsunit state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push web9Jsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push web9Jsunit page error " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      console.info("web beforeEach start");
    })
    afterEach(async () => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
    })

    /**
     * @tc.name   webContextMenuResultTest001
     * @tc.number webContextMenuResultTest001
     * @tc.desc   webContextMenuResultTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webContextMenuResultTest001', Level.LEVEL0, async () => {
      emitKey = "emitwebContextMenuResult";
      Utils.registerContainEvent("webContextMenuResult", true, 1101);
    })

    /**
     * @tc.name   setWebControllerTest002
     * @tc.number setWebControllerTest002
     * @tc.desc   setWebControllerTest002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setWebControllerTest002', Level.LEVEL0, async () => {
      emitKey = "emitsetWebController";
      Utils.registerContainEvent("setWebController", true, 1102);
    })

    /**
     * @tc.name   setWebControllerTest003
     * @tc.number setWebControllerTest003
     * @tc.desc   setWebControllerTest003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setWebControllerTest003', Level.LEVEL0, async () => {
      emitKey = "emitHitTestValue";
      Utils.registerContainEvent("HitTestValue", true, 1103);
      sendEventByKey('web2', 10, '');
    })
  })
}