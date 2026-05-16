'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Rect
} from '@ohos.UiTest';
import RectValue from '../../ets/MainAbility/common/Rect'
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from './Util.test';
import Utils from "../../ets/MainAbility/common/Utils";
import accessibility from '@ohos.accessibility';
import Utils from '../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';
import { UIContext } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

export default function waterFlowNestedScrollJsunit() {
  describe('waterFlow_NestedScrollTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.open.harmony.modifiernowear.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("waterFlowNestedScroll beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/waterFlowNestedScroll',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get waterFlowNestedScroll state pages:" + JSON.stringify(pages));
        if (!("waterFlowNestedScroll" == pages.name)) {
          console.info("get waterFlowNestedScroll pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push waterFlowNestedScroll page error: " + err);
      }
    });


    
    /**
     * @tc.number   ArkUI_Stage_waterFlowNestedScroll01_static
     * @tc.name     ArkUI_Stage_waterFlowNestedScroll01_static
     * @tc.desc     ArkUI_Stage_waterFlowNestedScroll01_static
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_waterFlowNestedScroll01_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_Stage_waterFlowNestedScroll01] START');
      await Utils.sleep(2000)
      let webRect: RectValue = Utils.getComponentRect('ColumnSize') as RectValue;
      console.info(`ArkUI_Stage_waterFlowNestedScroll01 get webRect is:` + JSON.stringify(webRect));
      let x = Math.floor(Utils.getRectHorizontalCenterX(webRect))
      let y = Math.floor(Utils.getRectVerticalCenterY(webRect))
      let driver = Driver.create();
      await driver.swipe(Math.round(x).toInt(), Math.round(y + UIContext.resolveUIContext()!.vp2px(60)).toInt(), Math.round(x).toInt(), Math.round(y - UIContext.resolveUIContext()!.vp2px(60)).toInt());
      console.info('[ArkUI_Stage_waterFlowNestedScroll01] driver.swipe end');
      try {
        let callBack: (backData: events_emitter.EventData) => void = (backData: events_emitter.EventData) => {
          try {
            console.info(`ArkUI_Stage_waterFlowNestedScroll01 get result is:` + JSON.stringify(backData));
            expect(((backData.data) as Record<String,RecordData>)?.['ACTION']).assertEqual(true)
            console.info(`ArkUI_Stage_waterFlowNestedScroll01 END`);
          } catch (err) {
            console.info(`ArkUI_Stage_waterFlowNestedScroll01 err:` + JSON.stringify(err));
          }
          done()
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 77003,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(innerEvent, callBack)
      } catch (err) {
        console.info(`ArkUI_Stage_waterFlowNestedScroll01 err:` + JSON.stringify(err));
      }
      console.info(`ArkUI_Stage_waterFlowNestedScroll01 sendre:` +
      JSON.stringify(inspector.sendEventByKey('waterflowNestedScrollOptionsScrollTestButton', 10, '')));
    });
  })
}
