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

export default function CheckboxNodeTest() {
  describe('CheckboxNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('checkboxNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkbox/checkboxNode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get checkboxNode state pages: ' + JSON.stringify(pages));
        if (!('checkboxNode' == pages.name)) {
          console.info('get checkboxNode pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push checkboxNode page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('checkboxNode beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('checkboxNode after each called');
    })
   
    /**
     * @tc.number    checkboxNode0100
     * @tc.name      checkboxNode0100
     * @tc.desc      frameNode: createNodecheckboxToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('checkboxNode0100', 0, async (done: Function) => {

      let tagName = 'checkboxNode0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_checkbox_01');
      console.info('[' + tagName + '] Search is: ' + JSON.stringify(JSON.parse(strJsonNew).$type));
      expect(JSON.parse(strJsonNew).$type).assertEqual('Checkbox');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
