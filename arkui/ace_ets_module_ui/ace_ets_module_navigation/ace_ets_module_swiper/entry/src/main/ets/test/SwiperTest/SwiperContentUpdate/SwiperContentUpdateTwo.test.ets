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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { SwiperContentInfo } from '@kit.ArkUI';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/utils/Common';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function SwiperContentUpdateTwo() {
  describe('SwiperContentUpdateTwo', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperContentUpdateTwo beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperContentUpdateTwo state pages:" + JSON.stringify(pages));
        if (!("SwiperContentUpdateTwo" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperContentUpdate/SwiperContentUpdateTwo'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperContentUpdateTwo page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperContentUpdateTwo page error:" + err);
      }
      console.info("SwiperContentUpdateTwo foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperContentUpdateTwo after each called");
    });

    /**
     * @tc.number SwiperContentUpdateTwo_0100
     * @tc.name SwiperContentUpdateTwo_0100
     * @tc.desc test onSwiperContentUpdate with observer.ObserverOptions
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SwiperContentUpdateTwo_0100', Level.LEVEL1, async (done: Function) => {
      console.info("SwiperContentUpdateTwo_0100 START");
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.text('on'));
      await button.click();
      console.info("SwiperContentUpdateTwo_0100 button click");
      let swiperList = CommonFunc.getComponentRectOnScreen('swiperId');
      let top = swiperList.top;
      let right = swiperList.right;
      let left = swiperList.left;
      let bottom = swiperList.bottom;
      let height = bottom -top;
      let width = right - left;
      console.info("SwiperContentUpdateTwo_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.swipe(Math.round(left + width*0.3),Math.round(top + height/2),Math.round(right - vp2px(20)),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let value: SwiperContentInfo = AppStorage.get('swiperContentInfo') as SwiperContentInfo
      expect(value?.id === 'swiperId').assertTrue();
      AppStorage.delete('swiperContentInfo')
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.text('off'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let value2: SwiperContentInfo | undefined = AppStorage.get('swiperContentInfo');
      expect(value2 == undefined).assertTrue();
      console.info('SwiperContentUpdateTwo_0100 END');
      done();
    });
  })
}