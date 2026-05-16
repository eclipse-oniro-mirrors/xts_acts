/*
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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function swiperSwipeToIndexTest() {

  describe('SwiperSwipeToIndexTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    })

    /**
     * @tc.name   testSwiperChangeIndex006
     * @tc.number SUB_ARKUI_CAPI_SWIPER_TO_INDEX_0600
     * @tc.desc   testing onChange for swiper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperChangeIndex006', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'SwiperSwipeToIndexTest';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(5000);
      expect(Utils.getComponentInfoByKey('TestSwiperSwipeToIndex').$attrs.backgroundColor).assertEqual('#FF00FF00');
      done();
    });
  })
}
