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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function GridItemNodeTest() {
  describe('GridItemNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('griditemNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridItem/griditemNode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get griditemNode state pages: ' + JSON.stringify(pages));
        if (!('griditemNode' == pages.name)) {
          console.info('get griditemNode pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push griditemNode page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('griditemNode beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('griditemNode after each called');
    })

     /**
     * @tc.number    gridItemNode0100
     * @tc.name      gridItemNode0100
     * @tc.desc      frameNode: createNodegridItemToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
     it('gridItemNode0100', 0, async (done: Function) => {

      let tagName = 'gridItemNode0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_ gridItem_001');
      console.info('[' + tagName + '] Search is: ' + JSON.stringify(JSON.parse(strJsonNew).$type));
      expect(JSON.parse(strJsonNew).$type).assertEqual('GridItem');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}