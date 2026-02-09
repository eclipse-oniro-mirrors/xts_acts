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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 201230;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function ActsWebNapiLoadDataTest() {

  describe('ActsWebNapiLoadDataTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebNapiLoadDataTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebNapiLoadDataTest state success " + JSON.stringify(pages));
        if (!("WebNapiLoadDataTest" == pages.name)) {
          console.info("get WebNapiLoadDataTest state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebNapiLoadDataTest page success");
        }
      } catch (err) {
        console.error("push WebNapiLoadDataTest page error: " + err);
      }
      await driver.waitForComponent(ON.id("webNapiLoadDataButton"), 10000);
      console.log("waitForComponent webNapiLoadDataButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebNapiLoadDataTest beforeEach start");
      done();
    })

    /**
     * @tc.name   testWebNapiLoadData001
     * @tc.number SUB_ACE_WEB_LOAD_DATA_API_0001
     * @tc.desc   test napi loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebNapiLoadData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done:Function)=>{
      Utils.emitEvent("emitWebNapiLoadData001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebNapiLoadData001", 0, 201240, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webNapiLoadDataButton");
      if (await Utils.waitForExist(() => isReturn, 'testWebNapiLoadData001' + '_returnCheck', true, 1000)) {
        done();
      }
    })
  })
}