/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';

export default function noBarrierComponentsTest() {
  describe('noBarrierComponentsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/noBarrierComponents',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get noBarrierComponents state success " + JSON.stringify(pages));
        if (!("noBarrierComponents" == pages.name)) {
          console.info("get noBarrierComponents state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push noBarrierComponents page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push noBarrierComponents page error: " + err);
      }
      done()
    });
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    
    
    it('noBarrierComponents025', 0, async (done: Function) => {
      console.info('noBarrierComponents025 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Select");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Select");
          console.info('noBarrierComponents025 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents025 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    
    it('noBarrierComponents029', 0, async (done: Function) => {
      console.info('noBarrierComponents029 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey("Web");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual("Web");
          console.info('noBarrierComponents029 END ');
        } catch (err) {
          expect().assertFail()
          console.info('noBarrierComponents029 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}