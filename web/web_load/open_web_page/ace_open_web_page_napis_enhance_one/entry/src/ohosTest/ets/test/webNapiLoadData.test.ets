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

import { beforeAll, afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
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
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebNapiLoadDataTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebNapiLoadDataTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("WebNapiLoadDataTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebNapiLoadDataTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebNapiLoadDataTest afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_LOAD_DATA_API_0001
    * @tc.name       : testWebNapiLoadData001
    * @tc.desc       : test napi loadData
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testWebNapiLoadData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done:Function)=>{
      Utils.emitEvent("emitWebNapiLoadData001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebNapiLoadData001",0,2025022401,done);
      sendEventByKey('webNapiLoadDataButton',10,'');
    })


  })
}
