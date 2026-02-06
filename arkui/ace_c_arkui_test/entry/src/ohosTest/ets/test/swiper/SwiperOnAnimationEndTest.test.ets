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

export default function swiperOnAnimationEndTest() {

  describe('SwiperOnAnimationEndTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SWIPER_EVENT_ON_ANIMATION_END_0100
     * @tc.name: testSwiperOnAnimationEnd001
     * @tc.desc: testing onAnimationEnd for swiper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSwiperOnAnimationEnd001', Level.LEVEL1, async (done: Function) => {
        let PAGE_TAG = 'SwiperOnAnimationEndTest';
        await Utils.pushPage(`swiper/${PAGE_TAG}`);
        let driver = Driver.create();
        let component = await driver.findComponent(ON.id("SwiperOnAnimationEnd"));
        let point = await component.getBounds();
        await driver.drag(point.right, point.top + 20, point.left, point.top + 20, 2000);
        await Utils.sleep(1000);
        expect(Utils.getComponentInfoByKey('SwiperOnAnimationEnd').$attrs.backgroundColor).assertEqual('#FF00FF00');
        done();
    });
  })
}
