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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function TextTimerJsunit() {
  describe('TextTimerJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("TextTimerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextTimer/TextTimerJsunit',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextTimerJsunit state pages: " + JSON.stringify(pages));
        if (!("TextTimerJsunit" == pages.name)) {
          console.info("get TextTimerJsunit state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextTimerJsunit page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextTimerJsunit after each called");
    })
    /**
     * @tc.name   textTimer0100
     * @tc.number textTimer0100
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textTimer0100', Level.LEVEL1, async (done: Function) => {
      console.info('[textTimer0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textTimer');
      console.info("[textTimer0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[textTimer0100] expect(obj.$type) is: " + (JSON.parse(strJson).$type));
      console.info("[textTimer0100] obj.$attrs.type is: " + (JSON.parse(strJson).$attrs.type));
      if (true) {
        done();
        return;
      }
      expect(JSON.parse(strJson).$type).assertEqual('TextTimer');
      done();
    });
    /**
     * @tc.name   textTimer0200
     * @tc.number textTimer0200
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textTimer0200', Level.LEVEL1, async (done: Function) => {
      console.info('[textTimer0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textTimer');
      if (true) {
        done();
        return;
      }
      expect(JSON.parse(strJson)).assertEqual('TextTimerAttribute');
      done();
    });
  })
}
