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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function TextClockNodeTest() {
  describe('TextClockNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TextClockNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextClock/TextClockNodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextClockNodeTest state pages: ' + JSON.stringify(pages));
        if (!('TextClockNodeTest' == pages.name)) {
          console.info('get TextClockNodeTest pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push TextClockNodeTest page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('TextClockNodeTest beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TextClockNodeTest after each called');
    })

    /**
     * @tc.name   TextClockNode0100
     * @tc.number TextClockNode0100
     * @tc.desc   frameNode: createNodeTextClockToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextClockNode0100', Level.LEVEL2, async (done: Function) => {

        let tagName = 'TextClockNode0100';
        console.info('[' + tagName + '] START============================');
        let strJsonNew = getInspectorByKey('key_ TextClock_001');
        console.info('[' + tagName + '] Search is: ' + JSON.stringify(JSON.parse(strJsonNew).$type));
        expect(JSON.parse(strJsonNew).$type).assertEqual('TextClock');
        console.info('[' + tagName + '] END ===========================');
        done();
      });
    })
  }