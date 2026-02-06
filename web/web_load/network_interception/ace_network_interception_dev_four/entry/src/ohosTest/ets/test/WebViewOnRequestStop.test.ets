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

const EVENT_ID_SET_EMIT_KEY = 203010;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewOnRequestStop() {

  describe('webViewOnRequestStop', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnRequestStop',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnRequestStop state success " + JSON.stringify(pages));
        if (!("OnRequestStop" == pages.name)) {
          console.info("get OnRequestStop state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push OnRequestStop page success");
        }
      } catch (err) {
        console.error("push OnRequestStop page error: " + err);
      }
      await driver.waitForComponent(ON.id("OnRequestStop"), 10000);
      console.log("waitForComponent OnRequestStop");
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
    * @tc.number     : SUB_WEB_WEBDEAULTONREQUESTSTOP_0100
    * @tc.name       : defaultOnRequestStop0100
    * @tc.desc       : test WebdefaultOnRequestStop
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultOnRequestStop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultOnRequestStop0100", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("defaultOnRequestStop0100", true, 203020, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "OnRequestStop");
      if (await Utils.waitForExist(() => isReturn, 'defaultOnRequestStop0100' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTONREQUESTSTOP_0200
    * @tc.name       : defaultOnRequestStop0200
    * @tc.desc       : test WebdefaultOnRequestStop
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultOnRequestStop0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultOnRequestStop0200", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("defaultOnRequestStop0200", true, 203030, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "OnRequestStop");
      if (await Utils.waitForExist(() => isReturn, 'defaultOnRequestStop0200' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTONREQUESTSTOP_0300
    * @tc.name       : defaultOnRequestStop0300
    * @tc.desc       : test WebdefaultOnRequestStop
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultOnRequestStop0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultOnRequestStop0300", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("defaultOnRequestStop0300", true, 203040, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "OnRequestStop");
      if (await Utils.waitForExist(() => isReturn, 'defaultOnRequestStop0300' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}
