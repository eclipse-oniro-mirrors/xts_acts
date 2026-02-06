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

import { beforeAll, beforeEach,afterEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();
export default function webOnBeforeUnload() {

  describe('webOnBeforeUnload', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnBeforeUnload',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnBeforeUnload state success " + JSON.stringify(pages));
        if (!("WebOnBeforeUnload" == pages.name)) {
          console.info("get WebOnBeforeUnload state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnBeforeUnload page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnBeforeUnload page error: " + err);
      }
      console.log("waitForComponent WebOnBeforeUnloadButton click==>")
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebOnBeforeUnload beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_ONBEFOREUNLOAD_ISRELOAD_API_0100
    * @tc.name       : testOnBeforeUnloadIsReloadTrue
    * @tc.desc       : test onBeforeUnload isReload true
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOnBeforeUnloadIsReloadTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnBeforeUnloadIsReloadTrue', 141411);
      let isReturn = false;
      Utils.registerBaseEvent('testOnBeforeUnloadIsReloadTrue', 1, 141460, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("WebOnBeforeUnloadButton",driver)
      await waitForExist(()=>isReturn, "testOnBeforeUnloadIsReloadTrue", true,1000);
      done();
    })
    /*
    * @tc.number     : SUB_ACE_WEB_ONBEFOREUNLOAD_ISRELOAD_API_0200
    * @tc.name       : testOnBeforeUnloadIsReloadFalse
    * @tc.desc       : test onBeforeUnload isReload false
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOnBeforeUnloadIsReloadFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnBeforeUnloadIsReloadFalse', 141411);
      let isReturn = false;
      Utils.registerBaseEvent('testOnBeforeUnloadIsReloadFalse', 2, 141470, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("WebOnBeforeUnloadButton",driver)
      await waitForExist(()=>isReturn, "testOnBeforeUnloadIsReloadFalse", true,1000);
      done();
    })

  })
}
