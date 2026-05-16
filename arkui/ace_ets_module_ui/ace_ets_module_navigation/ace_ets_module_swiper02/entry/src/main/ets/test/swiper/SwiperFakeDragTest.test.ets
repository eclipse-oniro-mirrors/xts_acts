/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import RectValue from '../../MainAbility/common/Rect';
import router from '@ohos.router';

export default function SwiperFakeDragTest() {
  describe('SwiperFakeDragTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperFakeDragTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/swiper/SwiperFakeDragTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperFakeDragTest state pages:" + JSON.stringify(pages));
        if (!("SwiperFakeDragTest" == pages.name)) {
          console.info("get SwiperFakeDragTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SwiperFakeDragTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperFakeDragTest page error:" + err);
      }
      console.info("SwiperFakeDragTest beforeEach end");
      done();
    });


    /**
     * @tc.name   SwiperFakeDragTest_0100
     * @tc.number SwiperFakeDragTest_0100
     * @tc.desc   Test SwiperController
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SwiperFakeDragTest_0100', Level.LEVEL0, async () => {
      console.info('[SwiperFakeDragTest_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let driver = await Driver.create()
        let list: RectValue = CommonFunc.getComponentRect('swiper1');
        await CommonFunc.sleep(1000);
        await driver.swipe(Math.round(list.left + (list.right - list.left) / 2),
          Math.round(list.top + (list.bottom - list.top) / 2),
          Math.round(list.left + (list.right - list.left) / 4),
          Math.round(list.top + (list.bottom - list.top) / 2));
        await CommonFunc.sleep(1000);
        let isFakeDraggingFlag: boolean | undefined = AppStorage.get('isFakeDraggingFlag');
        expect(isFakeDraggingFlag == false).assertTrue();
        AppStorage.delete('isFakeDraggingFlag');
        let fakeDragByFlag: boolean | undefined = AppStorage.get('fakeDragByFlag');
        expect(fakeDragByFlag == false).assertTrue();
        AppStorage.delete('fakeDragByFlag');
        let stopFakeDragFlag: boolean | undefined = AppStorage.get('stopFakeDragFlag');
        expect(stopFakeDragFlag == false).assertTrue();
        AppStorage.delete('stopFakeDragFlag');
        console.info('[SwiperFakeDragTest_0100] END');
      } catch (error) {
        console.info('[SwiperFakeDragTest_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SwiperFakeDragTest_0200
     * @tc.number SwiperFakeDragTest_0200
     * @tc.desc   Test SwiperController
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SwiperFakeDragTest_0200', Level.LEVEL0, async () => {
      console.info('[SwiperFakeDragTest_0200] START');
      try {
        // 验证页面加载成功且方法能正常调用
        await CommonFunc.sleep(1000);
        let driver = await Driver.create()
        let list: RectValue = CommonFunc.getComponentRect('swiper2');
        console.info('[SwiperFakeDragTest_0200] list');
        await CommonFunc.sleep(1000);
        await driver.swipe(Math.round(list.left + (list.right - list.left) * 0.8),
          Math.round(list.top + (list.bottom - list.top) / 2),
          Math.round(list.left + (list.right - list.left) * 0.2),
          Math.round(list.top + (list.bottom - list.top) / 2));
        await CommonFunc.sleep(2000);
        console.info('[SwiperFakeDragTest_0200] swipe');
        let isFakeDraggingFlag: boolean | undefined = AppStorage.get('isFakeDraggingFlag');
        console.info('[SwiperFakeDragTest_0200] isFakeDraggingFlag is ', isFakeDraggingFlag);
        expect(isFakeDraggingFlag == false).assertTrue();
        AppStorage.delete('isFakeDraggingFlag');
        let startFakeDragFlag: boolean | undefined = AppStorage.get('startFakeDragFlag');
        console.info('[SwiperFakeDragTest_0200] startFakeDragFlag is ', startFakeDragFlag);
        expect(startFakeDragFlag == true).assertTrue();
        AppStorage.delete('startFakeDragFlag');
        let fakeDragByFlag: boolean | undefined = AppStorage.get('fakeDragByFlag');
        console.info('[SwiperFakeDragTest_0200] fakeDragByFlag is ', fakeDragByFlag);
        expect(fakeDragByFlag == true).assertTrue();
        AppStorage.delete('fakeDragByFlag');
        let stopFakeDragFlag: boolean | undefined = AppStorage.get('stopFakeDragFlag');
        console.info('[SwiperFakeDragTest_0200] stopFakeDragFlag is ', stopFakeDragFlag);
        expect(stopFakeDragFlag == true).assertTrue();
        AppStorage.delete('stopFakeDragFlag');
        console.info('[SwiperFakeDragTest_0200] END');
      } catch (error) {
        console.info('[SwiperFakeDragTest_0200] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })

  })
}
