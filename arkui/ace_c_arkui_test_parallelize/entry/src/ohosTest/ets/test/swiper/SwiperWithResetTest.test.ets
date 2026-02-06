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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';

export default function SwiperWithResetTest(){

  describe('SwiperWithResetTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   SwiperWithResetTest_001
     * @tc.number SwiperWithResetTest_001
     * @tc.desc   SwiperWithResetTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperWithResetTest_001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'testSwiperWithReset';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(2000);
      let driver = await Driver.create()
      let swiper = await driver.findComponent(ON.type('Swiper'));
      expect(swiper !== null).assertEqual(true)
      done();
    })
  })
}