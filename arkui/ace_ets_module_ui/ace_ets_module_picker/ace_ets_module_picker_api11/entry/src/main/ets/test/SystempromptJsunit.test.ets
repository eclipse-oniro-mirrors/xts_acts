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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function systempromptJsunit() {
  describe('systempromptJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("prompt beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/systemPrompt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get prompt state pages:" + JSON.stringify(pages));
        if (!("systemPrompt" == pages.name)) {
          console.info("get prompt state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push prompt  page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push prompt  page error:" + err);
      }
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("prompt each called");
    });
    it('promptTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('promptTest_0100 is start');
      await Utils.sleep(1500);
      console.info("promptTest_0100 click result is: " + JSON.stringify(sendEventByKey('button1',10,"")));
      await Utils.sleep(1500);
      console.info('promptTest_0100 END');
      done();
    });
    it('promptTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('promptTest_0200 is start');
      await Utils.sleep(1500);
      console.info("promptTest_0200 click result is: " + JSON.stringify(sendEventByKey('button2',10,"")));
      await Utils.sleep(1500);
      console.info('promptTest_0200 END');
      done();
    });
  })
}




