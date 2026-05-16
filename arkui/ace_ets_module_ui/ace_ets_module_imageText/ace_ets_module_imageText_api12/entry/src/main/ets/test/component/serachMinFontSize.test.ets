/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export default function searchMinFontSize() {
  describe('searchMinFontSize', () => {
    beforeEach(async (done: Function) => {
      console.info("searchMinFontSize beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/searchMinFontSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get searchMinFontSize state pages: " + JSON.stringify(pages));
        if (!("searchMinFontSize" == pages.name)) {
          console.info("get searchMinFontSize pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push searchMinFontSize page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push searchMinFontSize page error: " + err);
      }

      await CommonFunc.sleep(1000)
      console.info("searchMinFontSize beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("searchMinFontSize after each called");
    })

    /**
     * @tc.name   searchMinFontSize0100
     * @tc.number searchMinFontSize0100
     * @tc.desc   set the minFontSize property value is  16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchMinFontSize0100',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'searchMinFontSize0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_search_minFontSize_001');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Search minFontSize is: ' + JSON.stringify(obj.$attrs.minFontSize));

      expect(obj.$attrs.minFontSize).assertEqual('16.00fp');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
