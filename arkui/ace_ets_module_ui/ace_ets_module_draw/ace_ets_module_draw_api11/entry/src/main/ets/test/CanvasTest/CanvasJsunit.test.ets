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
import { describe, beforeEach, afterEach, it } from "@ohos/hypium";
import router from '@ohos.router';
import Utils from '../Utils';

export default function canvasJsunit() {
  describe('canvasJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("canvas beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Canvas/canvas3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get canvas state pages:" + JSON.stringify(pages));
        if (!("canvas3" == pages.name)) {
          console.info("get canvas state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push canvas page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push canvas page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("canvas after each called");
    });

    it('testCanvas01', 0, async (done: Function) => {
      console.info('[testCanvas01] START');
      await Utils.sleep(1000);
      console.info('[testCanvas01]----------- START');
      console.info('testCanvas01 END');
      done();
    });
  });
}
