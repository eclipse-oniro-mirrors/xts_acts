/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitOnsslerroreventreceiveWebC";

export default function webOnSslError() {
  describe('ActsAceWebDevWebOnSslErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webOnSslError',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webOnSslError state success " + JSON.stringify(pages));
        if (!("webOnSslError" == pages.name)) {
          console.info("get webOnSslError state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webOnSslError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webOnSslError page error: " + err);
      }
      done();
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("webOnSslError beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webOnSslError afterEach start:" + emitKey);
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
      done();
    })
    /*
     * @tc.number     : SUB_ACE_BASIC_ETS_WEBPATR4_API_0100
     * @tc.name       : testOnsslerroreventreceiveWebC
     * @tc.desc       : onsslerroreventreceive after load https://wrong.host.badssl.com
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOnsslerroreventreceiveWebC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnsslerroreventreceiveWebC";
      Utils.registerEvent("testOnsslerroreventreceiveWebC", "1", 420, done);
      sendEventByKey('webOnSslError', 10, '');
    })
  })
}