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
import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';

const EVENT_ID_SET_EMIT_KEY = 202940;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewGetRequestResourceType() {

  describe('webViewGetRequestResourceType', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewGetRequestResourceType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewGetRequestResourceType state success " + JSON.stringify(pages));
        if (!("webViewGetRequestResourceType" == pages.name)) {
          console.info("get webViewGetRequestResourceType state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webViewGetRequestResourceType page success");
        }
      } catch (err) {
        console.error("push webViewGetRequestResourceType page error: " + err);
      }
      await driver.waitForComponent(ON.id("GetRequestResourceType"), 10000);
      console.log("waitForComponent GetRequestResourceType");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEBVIEWGETREQUESTRESOURCETYPE_0100
    * @tc.name       : getRequestResourceType0100
    * @tc.desc       : test webViewGetRequestResourceType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('getRequestResourceType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("getRequestResourceType0100", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("getRequestResourceType0100", 0, 202950, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "GetRequestResourceType");
      if (await Utils.waitForExist(() => isReturn, 'getRequestResourceType0100' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}
