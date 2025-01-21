/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from './Utils.ets'

export default function ohosrouterJsunit() {
  describe('ohosrouterJsunit', () => {
    beforeAll(async (done: Function) => {
      console.info("ohosrouterJsunit beforeAll");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ohosrouterJsunit aftereach");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_001
     * @tc.name         ohosrouterJsunit_001
     * @tc.desc         test routermode
     */
    it('ohosrouterJsunit_001', 0, async (done: Function) => {
      try {
        expect(1).assertEqual(router.RouterMode.Single);
        done();
      } catch (error) {
        console.error(`ohosrouterJsunit_001 pushUrl args error code is ${error.code}, message is ${error.message}`)
        expect().assertFail();
      }
    });
  })
}
