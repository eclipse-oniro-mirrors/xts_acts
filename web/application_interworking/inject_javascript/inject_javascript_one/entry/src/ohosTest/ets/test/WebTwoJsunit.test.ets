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

import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

let emitKey = "emitRegisterJavaScriptProxyTwo";

export default function webTwoJsunit() {
  describe('webTwoJsunit', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/RegisterJavaScriptProxy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webTwo state success ' + JSON.stringify(pages));
        if (!("RegisterJavaScriptProxy" == pages.name)) {
          console.info('get webTwo state success ' + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info('push webTwo page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webTwo page error: ' + err);
      }
      await driver.waitForComponent(ON.id("webcomponenttwo"), 10000);
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('web beforeEach start');
      done();
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_FOUR_API_005                                                                                                                                                             
     *tc.name RegisterJavaScriptProxy                                                                                                                                                                                                                 
     *tc.desic Sets allow the Web access overview mode
     */
    it('RegisterJavaScriptProxy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRegisterJavaScriptProxyTwo", 172270)
      Utils.registerEvent("RegisterJavaScriptProxy", '\"okok\"', 172280, done);
      await Utils.waitAndClickComponent(driver, 'webcomponenttwo');
    })
  })
}