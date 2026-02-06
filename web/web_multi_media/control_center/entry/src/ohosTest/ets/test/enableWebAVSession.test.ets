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

import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitAndClickComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webenableSmoothDragResizeTestJsunit() {
  describe('enableWebAVSessionTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/enableWebAVSession"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get enableSmoothDragResizeenableSmoothDragResize state success " + JSON.stringify(pages));
        if (!("enableWebAVSession" == pages.name)) {
          console.info("get enableWebAVSession state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push enableWebAVSession page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push enableWebAVSession page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("enableWebAVSession beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("enableWebAVSession afterEach start");
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_ENABLESMOOTHDRAGRESIZE_API_001
     *tc.name enableSmoothDragResize01
     *tc.desic test enableSmoothDragResize01 interface when choose callback mode.
     */
    it('enableWebAVSession01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("enableWebAVSession01", 132760)
      Utils.registerBaseEvent("enableWebAVSession01", 'enableWebAVSession', 132770, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent('enableWebAVSessionButton');
    })


  })
}