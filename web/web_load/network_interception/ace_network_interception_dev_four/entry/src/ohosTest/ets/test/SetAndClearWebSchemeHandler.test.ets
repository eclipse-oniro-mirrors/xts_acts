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

const EVENT_ID_SET_EMIT_KEY = 202800;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function setAndClearWebSchemeHandler() {

  describe('setAndClearWebSchemeHandler', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/setAndClearWebSchemeHandler',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setAndClearWebSchemeHandler state success " + JSON.stringify(pages));
        if (!("setAndClearWebSchemeHandler" == pages.name)) {
          console.info("get setAndClearWebSchemeHandler state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push setAndClearWebSchemeHandler page success");
        }
      } catch (err) {
        console.error("push setAndClearWebSchemeHandler page error: " + err);
      }
      await driver.waitForComponent(ON.id("setAndClearWebSchemeHandler"), 10000);
      console.log("waitForComponent setAndClearWebSchemeHandler");
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
    * @tc.number     : SUB_WEB_SETANDCLEARWEBSCHEMEHANDLER_0100
    * @tc.name       : setAndClearWebSchemeHandler0100
    * @tc.desc       : test setAndClearWebSchemeHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('setAndClearWebSchemeHandler0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("setAndClearWebSchemeHandler0100", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("setAndClearWebSchemeHandler0100",  'https://www.example.com/|GET||false', 202810, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "setAndClearWebSchemeHandler");
      if (await Utils.waitForExist(() => isReturn, 'setAndClearWebSchemeHandler0100' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_SETANDCLEARWEBSCHEMEHANDLER_0200
    * @tc.name       : setAndClearWebSchemeHandler0200
    * @tc.desc       : test setAndClearWebSchemeHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('setAndClearWebSchemeHandler0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("setAndClearWebSchemeHandler0200", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("setAndClearWebSchemeHandler0200",  'lock|lock|lock|false|true', 202820, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "setAndClearWebSchemeHandler");
      if (await Utils.waitForExist(() => isReturn, 'setAndClearWebSchemeHandler0200' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_SETANDCLEARWEBSCHEMEHANDLER_0300
    * @tc.name       : setAndClearWebSchemeHandler0300
    * @tc.desc       : test setAndClearWebSchemeHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('setAndClearWebSchemeHandler0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("setAndClearWebSchemeHandler0300", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("setAndClearWebSchemeHandler0300",  'https://www.example.com/|GET||false', 202830, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "setAndClearWebSchemeHandler");
      if (await Utils.waitForExist(() => isReturn, 'setAndClearWebSchemeHandler0300' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}
