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
import Utils from './Utils';

export default function richTextJsunit() {
  describe('richTextTest', () => {
    beforeEach(async (done: Function) => {
      console.info("richText beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/richText',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richText state pages:" + JSON.stringify(pages));
        if (!("richText" == pages.name)) {
          console.info("get richText state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push richText page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richText page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("richText after each called");
    });

    it('testRichText01', 0, async (done: Function) => {
      console.info('[testRichText01] START');
      let strJson: string = getInspectorByKey('richText');
      console.info('[testRichText01]' + strJson);
      console.info('[testRichText01] END');
      done();
    });
  });
}