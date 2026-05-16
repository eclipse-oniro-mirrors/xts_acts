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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
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
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SwiperApi() {
  describe('SwiperApi', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperApi beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperApi state pages:" + JSON.stringify(pages));
        if (!("SwiperApi" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({ url: "MainAbility/pages/Swiper/SwiperApi" })
          await CommonFunc.sleep(2000);
          console.info("push SwiperApi page result:");
        }
      } catch (err) {
        console.error("push SwiperApi page error:" + err);
      }
      console.info("SwiperApi foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperApi after each called");
    });

    

      
  
/**
     * @tc.number   SwiperApi_static_001
     * @tc.name     SwiperApi_static_001
     * @tc.desc     SwiperApi_static_001
     * @tc.level    Level.LEVEL0
     */
it('SwiperApi_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SwiperApi_static_001] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SwiperApi');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SwiperApi_static_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getString('$type')).assertEqual('Swiper');
      console.info('[SwiperApi_static_001] END');
      done();
    });

  })
}
