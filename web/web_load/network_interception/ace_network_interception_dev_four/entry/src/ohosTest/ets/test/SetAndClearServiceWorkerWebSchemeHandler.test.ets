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
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 202770;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function setAndClearServiceWorkerWebSchemeHandler() {

  describe('setAndClearServiceWorkerWebSchemeHandler', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/setAndClearServiceWorkerWebSchemeHandler',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setAndClearServiceWorkerWebSchemeHandler state success " + JSON.stringify(pages));
        if (!("setAndClearServiceWorkerWebSchemeHandler" == pages.name)) {
          console.info("get setAndClearServiceWorkerWebSchemeHandler state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push setAndClearServiceWorkerWebSchemeHandler page success");
        }
      } catch (err) {
        console.error("push setAndClearServiceWorkerWebSchemeHandler page error: " + err);
      }
      await driver.waitForComponent(ON.id("setAndClearServiceWorkerWebSchemeHandler"), 10000);
      console.log("waitForComponent setAndClearServiceWorkerWebSchemeHandler");
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
    * @tc.number     : SUB_WEB_SETANDCLEARSERVICEWORKERWEBSCHEMEHANDLER_0100
    * @tc.name       : setAndClearServiceWorkerWebSchemeHandler0100
    * @tc.desc       : test setAndClearServiceWorkerWebSchemeHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('setAndClearServiceWorkerWebSchemeHandler0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("setAndClearServiceWorkerWebSchemeHandler0100", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("setAndClearServiceWorkerWebSchemeHandler0100",  'GET|false', 202780, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "setAndClearServiceWorkerWebSchemeHandler");
      if (await Utils.waitForExist(() => isReturn, 'setAndClearServiceWorkerWebSchemeHandler0100' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_SETANDCLEARSERVICEWORKERWEBSCHEMEHANDLER_0200
    * @tc.name       : setAndClearServiceWorkerWebSchemeHandler0200
    * @tc.desc       : test setAndClearServiceWorkerWebSchemeHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('setAndClearServiceWorkerWebSchemeHandler0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("setAndClearServiceWorkerWebSchemeHandler0200", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("setAndClearServiceWorkerWebSchemeHandler0200",  'lock|lock|lock|false|true', 202790, () => { isReturn = 1 });
      Utils.registerBaseEvent("setAndClearServiceWorkerWebSchemeHandler0200",  'lock|lock|lock|false|true', 202790, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "setAndClearServiceWorkerWebSchemeHandler");
      if (await Utils.waitForExist(() => isReturn, 'setAndClearServiceWorkerWebSchemeHandler0200' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}
