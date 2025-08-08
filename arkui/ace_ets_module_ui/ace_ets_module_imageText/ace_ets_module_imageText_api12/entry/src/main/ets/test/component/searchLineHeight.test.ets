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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function searchLineHeight() {
  describe('searchLineHeight', () => {
    beforeEach(async (done: Function) => {
      console.info("searchLineHeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/searchLineHeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get searchLineHeight state pages: " + JSON.stringify(pages));
        if (!("searchLineHeight" == pages.name)) {
          console.info("get searchLineHeight pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push searchLineHeight page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push searchLineHeight page error: " + err);
      }

      await CommonFunc.sleep(1000)
      console.info("searchLineHeight beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("searchLineHeight after each called");
    })

    /**
       * @tc.number searchLineHeight_0100
       * @tc.name   Test the properties of components
       * @tc.desc   Set attribute values
       * @tc.size   MediumTest
       * @tc.type   Function
       * @tc.level  0
       */
    it('searchLineHeight_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[searchLineHeight_0100] START');
      let strJson = getInspectorByKey('key_search_lineHeight_001');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[searchLineHeight_0100] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.lineHeight).assertEqual('30.00fp');
      console.info('[searchLineHeight_0100] END');
      done();
    });
  })
}
