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
import CommonFunc from '../../MainAbility/common/Common';

export default function subHeaderSelect() {
  describe('subHeaderSelect', () => {
    beforeEach(async (done: Function) => {
      console.info('subHeaderSelect beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/subHeader/subHeaderSelect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get subHeaderSelect state pages: ' + JSON.stringify(pages));
        if (!('subHeaderSelect' == pages.name)) {
          console.info('get subHeaderSelect pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push subHeaderSelect page result successful');
        }
      } catch (err) {
        console.error('push subHeaderSelect page error: ' + err);
      }

      await CommonFunc.sleep(1000);
      console.info('subHeaderSelect beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('subHeaderSelect after each called');
    })

    /**
     * @tc.number subHeaderSelect
     * @tc.name   subHeaderSelect_0100
     * @tc.desc   Test subHeaderSelect
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderSelect_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderSelect_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // subHeaderSelect是否存在以下入口。
      let selectDemoValue = await driver.findComponent(ON.text('下载'));
      expect(selectDemoValue !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[subHeaderSelect_0100] END');
      done();
    });
  })
}