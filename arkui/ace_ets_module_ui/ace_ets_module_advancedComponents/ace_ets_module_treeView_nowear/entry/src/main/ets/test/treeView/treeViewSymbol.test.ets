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
import Utils from '../Utils.test';

export default function treeViewSymbol() {
  describe('treeViewSymbol', () => {
    beforeEach(async (done: Function) => {
      console.info('treeViewSymbol beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/treeView/treeViewSymbol',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get treeViewSymbol state pages: ' + JSON.stringify(pages));
        if (!('treeViewSymbol' == pages.name)) {
          console.info('get treeViewSymbol pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push treeViewSymbol page result successful');
        }
      } catch (err) {
        console.error('push treeViewSymbol page error: ' + err);
      }

      await Utils.sleep(1000)
      console.info('treeViewSymbol beforeEach end');
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('treeViewSymbol after each called');
    })

    /**
     * @tc.number treeViewSymbol
     * @tc.name   treeViewSymbol_0100
     * @tc.desc   Test treeViewSymbol
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewSymbol_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewSymbol_0100] START');
      try{
        let driver: Driver = Driver.create();
        await driver.assertComponentExist(ON.text('ClickNodeId='));
        let addText = await driver.findComponent(ON.text('新增'));
        expect(addText !== null).assertTrue();
      } finally {
        done();
      }
    })
  })
}