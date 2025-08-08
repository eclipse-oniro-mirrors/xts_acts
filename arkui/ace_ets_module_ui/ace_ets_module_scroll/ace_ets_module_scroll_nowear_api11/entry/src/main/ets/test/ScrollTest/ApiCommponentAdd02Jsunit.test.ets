/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import ohosrouter from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
const waitUiReadyMs = 1000;

export default function ApiCommponentAdd02Jsunit() {
  describe('ApiCommponentAdd02Jsunit', () => {
    beforeAll(async (done: Function) => {
      console.info("ApiCommponentAdd02Jsunit beforeEach start");
      try {
        ohosrouter.clear();
        let pages = ohosrouter.getState();
        console.info("ApiCommponentAdd02Jsunit " + JSON.stringify(pages));
        if (!("loadingprogrees_add" == pages.name)) {
          console.info("ApiCommponentAdd02Jsunit state success " + JSON.stringify(pages.name));
          ohosrouter.pushUrl({
            url: 'MainAbility/pages/Scroll/loadingprogrees_add02',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
          await CommonFunc.sleep(2000);
          console.info("push circle page success ");
        }
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      done()

    });

    it('ApiCommponentAdd02Jsunit_0900', 0, async (done: Function) => {
      console.info('apiCommponentAdd02Jsunit_0900 START');
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/waterflow_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      let strJson = getInspectorByKey('waterflowAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAdd02Jsunit_0900'] component obj is: " + obj.$attrs.enableScrollInteraction);
      expect(obj.$attrs.enableScrollInteraction ).assertTrue();
      done();
    });
  })
}