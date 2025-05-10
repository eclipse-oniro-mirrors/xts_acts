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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../MainAbility/utils/Common';

export default function curvesJsunit() {
  describe('curvesJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("curves beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/curves',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get curves state pages:" + JSON.stringify(pages));
        if (!("curves" == pages.name)) {
          console.info("get curves state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push curves page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push curves page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("curves after each called");
    });
  })
}
