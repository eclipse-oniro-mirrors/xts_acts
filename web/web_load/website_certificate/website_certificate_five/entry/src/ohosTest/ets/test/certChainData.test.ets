/**
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

import { describe, beforeEach, it, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 202380;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function certChainDataTest() {
  describe('certChainDataTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/certChainData"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get certChainData state success " + JSON.stringify(pages));
        if (!("certChainData" == pages.name)) {
          console.info("get certChainData state success " + JSON.stringify(pages.name));
          await router.push(options);
          console.info("push certChainData page success");
        }
      } catch (err) {
        console.error("push certChainData page error: " + err);
      }
      await driver.waitForComponent(ON.id("certChainDataWeb"), 10000);
      console.log("waitForComponent certChainDataWeb");
      done()
    });

    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("certChainData beforeEach start");
      done();
    })

    /*
     *tc.number SUB_ACE_CERTCHAINDATA_API_001
     *tc.name certChainData01
     *tc.desic test certChainData01 interface when choose callback mode.
     */
    it('certChainData01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      Utils.emitEvent("certChainData01", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("certChainData01", true, 202390, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "certChainDataWeb");
      if (await Utils.waitForExist(() => isReturn, 'certChainData01' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}