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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

export default function FilterTestTwo() {
  describe('FilterTestTwo', () => {
    beforeEach(async (done: Function) => {
      console.info('FilterTestTwo beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/filter/filterPageTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get FilterTestTwo state pages: ' + JSON.stringify(pages));
        if (!('filterPageTwo' == pages.name)) {
          console.info('get FilterTestTwo pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push FilterTestTwo page result successful');
        }
      } catch (err) {
        console.error('push FilterTestTwo page error: ' + err);
      }

      await Utils.sleep(1000)
      console.info('FilterTestTwo beforeEach end');
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('FilterTestTwo after each called');
    })

    /**
     * @tc.number FilterTestTwo
     * @tc.name   FilterTestTwo_0100
     * @tc.desc   Test Filter
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('filterTestTwo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[filterTestTwo_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看是否存在以下入口。
      let found = await driver.findComponent(ON.text('全部'));
      await driver.delayMs(2000);
      expect(found !== null).assertTrue();
      console.info('[filterTestTwo_0100] END');
      done();
    });
  })
}