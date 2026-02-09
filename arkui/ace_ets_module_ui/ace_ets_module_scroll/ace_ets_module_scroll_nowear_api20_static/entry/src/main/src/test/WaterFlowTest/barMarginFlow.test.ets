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
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium'
import events_emitter from '@ohos.events.emitter';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function barMarginFlow() {
  describe('barMarginFlow', () => {
    beforeAll(() => {
      console.info("ActsAceCalendarPickerTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api20.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("barMarginFlow beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/barMarginFlow",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get barMarginFlow state pages:" + JSON.stringify(pages));
        if (!("barMarginFlow" == pages.name)) {
          console.info("get barMarginFlow pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push barMarginFlow page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push barMarginFlow page error:" + err);
      }
      console.info("barMarginFlow beforeEach end");
    });



    
    // 接口未交付 断言失败 注释
    /**
     * @tc.number   barMarginFlow_static_0100
     * @tc.name     barMarginFlow_static_0100
     * @tc.desc     barMarginFlow_static_0100
     * @tc.level    Level.LEVEL0
     */
it('barMarginFlow_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[barMarginFlow_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('flow_bar_margin');
      console.info("[barMarginFlow_0100] $type: " + JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("[barMarginFlow_0100] $attrs: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[barMarginFlow_0100] scrollBarMargin: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollBarMargin')));
      // console.info("[barMarginFlow_0100] start: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollBarMargin').getString('start')));
      // console.info("[barMarginFlow_0100] end: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollBarMargin').getString('end')));
      expect(JSON.parseJsonElement(strJson).getElement('$type').asString()).assertEqual("WaterFlow");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarMargin')).assertEqual("ScrollBarMargin start: 40.00px, end: 20.00vp");
      console.info('[barMarginFlow_0100] END');
      done();
    });
  })
}
