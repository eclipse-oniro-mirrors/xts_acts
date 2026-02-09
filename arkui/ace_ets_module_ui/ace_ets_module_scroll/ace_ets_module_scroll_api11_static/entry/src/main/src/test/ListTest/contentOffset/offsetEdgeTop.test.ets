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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test'
import events_emitter from '@ohos.events.emitter';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function offsetEdgeTop() {
  describe('offsetEdgeTop', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("offsetEdgeTop beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/contentOffset/offsetEdgeTop",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get offsetEdgeTop state pages:" + JSON.stringify(pages));
        if (!("offsetEdgeTop" == pages.name)) {
          console.info("get offsetEdgeTop pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push offsetEdgeTop page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push offsetEdgeTop page error:" + err);
      }
      console.info("offsetEdgeTop beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("offsetEdgeTop after each called");
    });


    
    /**
     * @tc.number   offsetEdgeTop_static_0100
     * @tc.name     offsetEdgeTop_static_0100
     * @tc.desc     offsetEdgeTop_static_0100
     * @tc.level    Level.LEVEL1
     */
it('offsetEdgeTop_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[offsetEdgeTop_static_0100] START');
      let swiperList = CommonFunc.getComponentRectOnScreen('edge_endOffset_top');
      let top = swiperList.top;
      let right = swiperList.right;
      let left = swiperList.left;
      let bottom = swiperList.bottom;
      console.info("offsetEdgeTop value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width / 2)).toInt(), (Math.round(top + height * 0.8)).toInt(),
        (Math.round(left + width / 2)).toInt(),
        (Math.round(top + height * 0.2)).toInt());
      await CommonFunc.sleep(3000);

      let btn: Component = await driver.findComponent(ON.id('offset_scrollEdge_top')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let list = CommonFunc.getComponentRectOnScreen('edge_endOffset_top');
      let listItem = CommonFunc.getComponentRectOnScreen('edge_endOffset_top_0');
      console.info('[offsetEdgeTop_static_0100] list.top: ' + list.top);
      console.info('[offsetEdgeTop_static_0100] listItem.top: ' + listItem.top);
      await CommonFunc.sleep(1000);
      const uiContext = AppStorage.get<UIContext>('uiContext');
      expect(Math.abs(Math.round(listItem.top - list.top) - Math.round(uiContext!.vp2px(10))) <= 1).assertTrue();
      console.info('[offsetEdgeTop_static_0100] END');
      done();
    });
  })
}
