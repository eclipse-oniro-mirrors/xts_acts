/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "emitOnDownloadStart";

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {

    beforeAll(async  (done: Function) => {
      let options: router.RouterOptions = {
        url: "testability/pages/webDownload"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webJsunit state success " + JSON.stringify(pages));
        if (!("webDownload" == pages.name)) {
          console.info("get webJsunit state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webJsunit page error: " + err);
      }
      await Utils.sleep(2000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
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
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_046
     *tc.name onDownloadStart
     *tc.desic Triggered when starting to download
     */
    it('onDownloadStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoom";
      Utils.registerEvent("onDownloadStart", "https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/mobileservices/2022/download/PC107f1b3947c942ffaa14334a879065d8.2107261020.exe", 68, done);
      sendEventByKey('webcomponent', 10, '');
    })

  })
}
