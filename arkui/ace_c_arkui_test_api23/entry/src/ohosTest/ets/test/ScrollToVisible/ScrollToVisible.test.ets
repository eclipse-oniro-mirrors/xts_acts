/*
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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';
import nativerenderndk from 'libnativerender.so'

export default function ScrollToVisibleTest() {

  describe('ScrollToVisibleTest', () => {

    let PAGE_TAG = 'ScrollToVisible';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`ScrollToVisible/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   ScrollToVisibleTest_0010
     * @tc.number ScrollToVisibleTest_0010
     * @tc.desc   test TextInput ScrollToVisible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScrollToVisibleTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[ScrollToVisibleTest_0010] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let ScrollToVisibleButton = await driver.findComponent(ON.id('ScrollToVisibleButton'));
      await ScrollToVisibleButton.click();
      await Utils.sleep(1000);
      console.info('ScrollToVisibleButton click')
      let result: number = nativerenderndk.GetTextInputScrollToVisibleTest();
      expect(result).assertEqual(1);
      console.info('[ScrollToVisibleTest_0010] END');
      done();
    })

    /**
     * @tc.name   ScrollToVisibleTest_0020
     * @tc.number ScrollToVisibleTest_0020
     * @tc.desc   test TextArea ScrollToVisible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScrollToVisibleTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[ScrollToVisibleTest_0020] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let ScrollToVisibleButton = await driver.findComponent(ON.id('ScrollToVisibleButton'));
      await ScrollToVisibleButton.click();
      await Utils.sleep(1000);
      console.info('ScrollToVisibleButton click')
      let result: number = nativerenderndk.GetTextAreaScrollToVisibleTest();
      expect(result).assertEqual(1);
      console.info('[ScrollToVisibleTest_0020] END');
      done();
    })
  })
}