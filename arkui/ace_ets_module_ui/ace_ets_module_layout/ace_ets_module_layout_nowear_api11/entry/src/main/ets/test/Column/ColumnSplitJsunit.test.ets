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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "@ohos/hypium"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils2';

interface optionsObj {
  uri: string
}

export default function ColumnSplitJsunit() {
  describe('ColumnSplitJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("columnSplit beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/Column/columnSplitPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get columnSplit state pages: " + JSON.stringify(pages));
        if (!("columnSplitPage" == pages.name)) {
          console.info("get columnSplit pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push columnSplit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnSplit page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("columnSplit after each called");
    })

   
    /**
     * @tc.number test ColumnSplit resizeable
     * @tc.name   Test the show property of the ColumnSplit component
     * @tc.desc   set the ColumnSplit property value is boolean
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testColumnSplitResizeable01',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'testColumnSplitResizeable01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('columnsplitkey');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('ColumnSplit');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
