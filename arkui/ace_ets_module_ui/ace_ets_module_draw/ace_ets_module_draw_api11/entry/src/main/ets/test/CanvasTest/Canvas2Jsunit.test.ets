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
import { describe, beforeEach, afterEach, it, Level } from "@ohos/hypium";
import router from '@ohos.router';
import Utils from '../Utils';

export default function canvas2Jsunit() {
  describe('canvas2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("canvas beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Canvas/canvas2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get canvas2 state pages:" + JSON.stringify(pages));
        if (!("canvas2" == pages.name)) {
          console.info("get canvas2 state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push canvas2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push canvas page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("canvas2 after each called");
    });

    /**
     * @tc.name   testCanvas01
     * @tc.number testCanvas01
     * @tc.desc   testCanvas01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvas01', Level.LEVEL0, async (done: Function) => {
      console.info('[testCanvas01] START');
      await Utils.sleep(1000);
      console.info('[testCanvas01]----------- START');
      console.info('testCanvas01 END');
      done();
    });
  });
}
