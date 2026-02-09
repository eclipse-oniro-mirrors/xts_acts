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
import { SwiperContentInfo, SwiperItemInfo } from '@kit.ArkUI';
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

export default function SwiperContentUpdateOne() {
  describe('SwiperContentUpdateOne', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperContentUpdateOne beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperContentUpdateOne state pages:" + JSON.stringify(pages));
        if (!("SwiperContentUpdateOne" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperContentUpdate/SwiperContentUpdateOne'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperContentUpdateOne page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperContentUpdateOne page error:" + err);
      }
      console.info("SwiperContentUpdateOne foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperContentUpdateOne after each called");
    });

    /**
     * @tc.number SwiperContentUpdateOne_0100
     * @tc.name SwiperContentUpdateOne_0100
     * @tc.desc test onSwiperContentUpdate
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SwiperContentUpdateOne_0100', Level.LEVEL1, async (done: Function) => {
      console.info("SwiperContentUpdateOne_0100 START");
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.text('on'));
      await button.click();
      console.info("SwiperContentUpdateOne_0100 button click");
      let swiperList = CommonFunc.getComponentRectOnScreen('swiperId');
      let top = swiperList.top;
      let right = swiperList.right;
      let left = swiperList.left;
      let bottom = swiperList.bottom;
      let height = bottom -top;
      let width = right - left;
      console.info("SwiperContentUpdateOne_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.swipe(Math.round(left + width*0.3),Math.round(top + height/2),Math.round(right - vp2px(20)),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let value: SwiperContentInfo = AppStorage.get('swiperContentInfo') as SwiperContentInfo
      expect(Object.keys(value).includes('id') && Object.keys(value).includes('uniqueId') && Object.keys(value).includes('swiperItemInfos')).assertTrue();
      let swiperItemInfos: Array<SwiperItemInfo> = value?.swiperItemInfos;
      let uniqueId: number = swiperItemInfos[0]?.uniqueId;
      let index: number = swiperItemInfos[0]?.index;
      expect(typeof uniqueId == 'number' && typeof index == 'number').assertTrue();
      AppStorage.delete('swiperContentInfo')
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.text('off'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let value2: SwiperContentInfo | undefined = AppStorage.get('swiperContentInfo');
      expect(value2 == undefined).assertTrue();
      console.info('SwiperContentUpdateOne_0100 END');
      done();
    });
  })
}