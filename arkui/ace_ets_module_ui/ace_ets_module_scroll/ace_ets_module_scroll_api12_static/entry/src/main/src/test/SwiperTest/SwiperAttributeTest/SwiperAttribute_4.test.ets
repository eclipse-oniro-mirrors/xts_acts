'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import text from "@ohos.graphics.text"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SwiperAttribute_4() {
  describe('SwiperAttribute_4', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperAttribute_4 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperAttribute_4 state pages:" + JSON.stringify(pages));
        if (!("SwiperAttribute_4" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperAttribute_4"
          })
          await UtilsTest.msSleep(2000)
        }
      } catch (err) {
        console.error("push SwiperAttribute_4 page error:" + err);
      }
      console.info("SwiperAttribute_4 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperAttribute_4 after each called");
    });

    
      
  
/**
     * @tc.number   SwiperAttribute_static_0020
     * @tc.name     SwiperAttribute_static_0020
     * @tc.desc     SwiperAttribute_static_0020
     * @tc.level    Level.LEVEL0
     */
it('SwiperAttribute_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SwiperAttribute_static_0020] START');

      let firstColumnRect = CommonFunc.getComponentRectOnScreen('swiperAttribute_401');
      let fTop = firstColumnRect.top;
      let fRight = firstColumnRect.right;
      let fLeft = firstColumnRect.left;
      let fBottom = firstColumnRect.bottom;
      console.info("SwiperAttribute_static_0020 first column rect is " + fLeft + " --" + fRight + "--" + fTop + "--" +
        fBottom);

      let firstTextRect = CommonFunc.getComponentRectOnScreen('swiperAttribute_4Text01');
      let ftTop = firstTextRect.top;
      let ftRight = firstTextRect.right;
      let ftLeft = firstTextRect.left;
      let ftBottom = firstTextRect.bottom;
      console.info("SwiperAttribute_static_0020 first column text rect is " + ftLeft + " --" + ftRight + "--" + ftTop +
        "--" +
        ftBottom);

      let rect = CommonFunc.getComponentRectOnScreen('swiperAttribute_4')
      console.info("SwiperAttribute_static_0020 swiper rect is " + rect.left + " --" + rect.right + "--" + rect.top +
        "--" +
      rect.bottom);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      expect(uiContext.px2vp(Math.abs(Math.round(rect.top - fTop))) - 20 <= 1).assertTrue();
      expect(uiContext.px2vp(Math.abs(Math.round(rect.right - fRight))) - 20 <= 1).assertTrue();
      expect(uiContext.px2vp(Math.abs(Math.round(rect.left - fLeft))) - 20 <= 1).assertTrue();
      expect(uiContext.px2vp(Math.abs(Math.round(rect.bottom - fBottom))) - 20 <= 1).assertTrue();

      expect(Math.abs(Math.round(ftTop - fTop)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ftRight - fRight)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ftLeft - fLeft)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ftBottom - fBottom)) <= 1).assertTrue();

      let driver = Driver.create()
      for (let i = 2; i <= 6; i++) {
        await driver.swipe(
          (Number.parseInt(`${(rect.right - rect.left) * 0.8 + rect.left}`)).toInt(),
          (Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`)).toInt(),
          (Number.parseInt(`${(rect.right - rect.left) * 0.1 + rect.left}`)).toInt(),
          (Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`)).toInt(),
          1000);
        await CommonFunc.sleep(1000);
        let columnRect = CommonFunc.getComponentRectOnScreen('swiperAttribute_40' + i);
        expect(Math.abs(Math.round(columnRect.top - rect.top)) <= 1).assertTrue();
        expect(Math.abs(Math.round(columnRect.right - rect.right)) <= 1).assertTrue();
        expect(Math.abs(Math.round(columnRect.left - rect.left)) <= 1).assertTrue();
        expect(Math.abs(Math.round(columnRect.bottom - rect.bottom)) <= 1).assertTrue();
      }

      console.info('[SwiperAttribute_static_0020] END');
      done();
    });

  })
}
