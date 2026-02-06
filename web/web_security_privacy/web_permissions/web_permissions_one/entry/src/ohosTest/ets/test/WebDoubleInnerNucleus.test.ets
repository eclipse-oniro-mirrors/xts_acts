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
import { expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@ohos.UiTest';
import webview from '@ohos.web.webview';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webOnPermissionRequest() {

  describe('WebDoubleInnerNucleusTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebDoubleInnerNucleus',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebDoubleInnerNucleus state success " + JSON.stringify(pages));
        if (!("WebDoubleInnerNucleus" == pages.name)) {
          console.info("get WebDoubleInnerNucleus state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebDoubleInnerNucleus page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebDoubleInnerNucleus page error: " + err);
      }
      let driver: Driver = Driver.create();
      await driver.waitForComponent(ON.id("WebviewDoubleInnerNucleus"),10000);
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


    // /*
    //   * @tc.number      : SUB_ACE_WEB_EMITWEBDOUBLEINNERNUCLEUS_API_0001
    //   * @tc.name        : emitWebDoubleInnerNucleus002
    //   * @tc.desc        : emitWebDoubleInnerNucleus002
    //   * @tc.size        : MediumTest
    //   * @tc.type        : Function
    //   * @tc.level       : Level 0
    //   */
    // it('emitWebDoubleInnerNucleus002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   Utils.emitEvent("emitWebDoubleInnerNucleus002", 10)
    //   Utils.registerEvent("emitWebDoubleInnerNucleus002", true, 20250901, done);
    //   sendEventByKey('WebviewDoubleInnerNucleus', 10, '');
    // })

    /*
       * @tc.number      : SUB_ACE_WEB_EMITWEBDOUBLEINNERNUCLEUS_API_0001
       * @tc.name        : emitWebDoubleInnerNucleus001
       * @tc.desc        : emitWebDoubleInnerNucleus001
       * @tc.size        : MediumTest
       * @tc.type        : Function
       * @tc.level       : Level 0
       */
    it('emitWebDoubleInnerNucleus001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebDoubleInnerNucleus001", 162000)
      Utils.registerEvent("emitWebDoubleInnerNucleus001", webview.ArkWebEngineVersion.M132, 162010, done);
      sendEventByKey('WebviewDoubleInnerNucleus', 10, '');
    })

  })
}
