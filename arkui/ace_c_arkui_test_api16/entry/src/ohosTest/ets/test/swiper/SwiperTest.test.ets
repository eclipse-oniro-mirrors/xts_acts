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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function swiperTest(){

  describe('swiperTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0100
     * @tc.name       : swiperAutoPlayTest001
     * @tc.desc       : testing Swiper AutoPlay
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('swiperAutoPlayTest001', 0, async (done: Function) => {
      console.info('swiperAutoPlayTest001 START');
      let PAGE_TAG = 'SwiperAutoPlayTest';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('SwiperAutoPlay');
      await Utils.sleep(1000)
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.autoPlay).assertEqual('true');
      expect(obj.$attrs.stopWhenTouched).assertEqual('true');

      let button1 = await driver.findComponent(ON.id('onClick1'));
      await button1.click();
      await Utils.sleep(1000);
      strJson = getInspectorByKey('SwiperAutoPlay');
      await Utils.sleep(1000)
      obj = JSON.parse(strJson);
      expect(obj.$attrs.autoPlay).assertEqual('false');
      expect(obj.$attrs.stopWhenTouched).assertEqual('true');
      done();
    });
  })
}