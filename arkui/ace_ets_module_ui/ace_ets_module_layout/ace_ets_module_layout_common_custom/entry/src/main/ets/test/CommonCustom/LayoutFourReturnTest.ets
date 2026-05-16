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

import { ExtraRegionPosition } from '@kit.ArkUI'
import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function LayoutFourReturnTest() {
  describe('LayoutFourReturnTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LayoutFourReturnTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonCustom/LayoutFourReturn',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LayoutFourReturn state pages:" + JSON.stringify(pages));
        if (!("ButtonAlignTest" == pages.name)) {
          console.info("get LayoutFourReturn pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LayoutFourReturn page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LayoutFourReturn page error:" + err);
      }
      console.info("LayoutFourReturn beforeEach end");
      done();
    });
    afterEach(async () => {
    });

     /**
      * @tc.name   LayoutFourReturnTest_0100
      * @tc.number SUB_ARKUI_API_LayoutFourReturnTest_0100
      * @tc.desc   CommonCustomAPI
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('LayoutFourReturnTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[LayoutFourReturnTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      expect(ExtraRegionPosition.BOTTOM).assertEqual(2);
      expect(PixelRoundMode.PIXEL_ROUND_ON_LAYOUT_FINISH).assertEqual(0);
      expect(PixelRoundMode.PIXEL_ROUND_AFTER_MEASURE).assertEqual(1);
      expect(LocalizedBarrierDirection.TOP).assertEqual(2);
      
      console.info('[LayoutFourReturnTest_0100] END');
      done();
    });

  })
}