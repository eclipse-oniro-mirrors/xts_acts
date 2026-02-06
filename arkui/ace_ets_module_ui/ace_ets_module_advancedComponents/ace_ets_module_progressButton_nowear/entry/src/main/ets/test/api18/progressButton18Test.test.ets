/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';

export default function progressButton18Test() {
  describe('progressButton18Test', () => {
    beforeEach(async (done: Function) => {
      console.info('progressButton18Test beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/api18/progressButton18Test',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get progressButton18Test state pages: ' + JSON.stringify(pages));
        if (!('progressButton18Test' == pages.name)) {
          console.info('get progressButton18Test pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push progressButton18Test page result successful');
        }
      } catch (err) {
        console.error('push progressButton18Test page error: ' + err);
      }

      await CommonFunc.sleep(1000);
      console.info('progressButton18Test beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('progressButton18Test after each called');
    })

    /**
     * @tc.number progressButton18Test
     * @tc.name   progressButton18Test_0100
     * @tc.desc   Test progressButton page
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('progressButton18Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[progressButton18Test_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      //查询ProgressButton是否存在 '下载'的文本
      let ProgressButtonItem = await driver.findComponent(ON.text('下载'));
      expect(ProgressButtonItem !== null).assertTrue();
      console.info('[progressButton18Test_0100] END');
      done();
    });
  })
}