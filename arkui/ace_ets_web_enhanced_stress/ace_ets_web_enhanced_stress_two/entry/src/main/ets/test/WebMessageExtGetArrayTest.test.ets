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

import { afterEach, beforeEach, describe, it } from '@ohos/hypium';
import { Constants } from './Constants';
import Utils from './Utils';

export default function webMessageExtGetArrayTest() {

  describe('WebMessageExtGetArrayTest', () => {
    let pageName = 'WebMessageExtGetArrayTest'

    beforeEach(async (done: Function) => {
      console.info(`${pageName} beforeEach start`);
      done();
    })

    afterEach(async (done: Function) => {
      console.info(`${pageName} afterEach start`);
      await Utils.sleep(2000);
      console.info(`${pageName} afterEach end`);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_WEBMESSAGEEXT_GETARRAY_0100
    * @tc.name        : testWebMessageExtGetArray001
    * @tc.desc        : test getArray stress
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebMessageExtGetArray001', 0, async (done: Function) => {
      Utils.doIt("testWebMessageExtGetArray001", 120000, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_MESSAGE_EXT_GET_ARRAY_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}
