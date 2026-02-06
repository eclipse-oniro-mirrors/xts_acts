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

export default function searchMaxFontSize() {
  describe('searchMaxFontSize', () => {
    beforeEach(async (done: Function) => {
      console.info("searchMaxFontSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/searchMaxFontSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get searchMaxFontSize state pages: " + JSON.stringify(pages));
        if (!("searchMaxFontSize" == pages.name)) {
          console.info("get searchMaxFontSize pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push searchMaxFontSize page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push searchMaxFontSize page error: " + err);
      }

      await CommonFunc.sleep(1000)
      console.info("searchMaxFontSize beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("searchMaxFontSize after each called");
    })

    /**
     * @tc.number searchMaxFontSize0100
     * @tc.name   Test the maxFontSize property of the search component
     * @tc.desc   set the maxFontSize property value is  21
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('searchMaxFontSize0100',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'searchMaxFontSize0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_search_maxFontSize_001');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Search maxFontSize is: ' + JSON.stringify(obj.$attrs.maxFontSize));


      expect(obj.$attrs.maxFontSize).assertEqual('21.00fp');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
