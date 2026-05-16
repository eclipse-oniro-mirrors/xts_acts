'use static';
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from './Utils.test';
import { UIContext } from '@ohos.arkui.UIContext';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';
interface Action {
  ACTION: boolean
}
export default function gridNestedScrollJsunit() {
  describe('grid_NestedScrollTest', () => {
    beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("gridNestedScroll beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gridNestedScroll',
      }

      try {
        const alphabetIndexer = AppStorage.get<Router>("router") as Router
        alphabetIndexer.clear();
        let pages = alphabetIndexer.getState();
        console.info("get gridNestedScroll state pages: " + JSON.stringify(pages));
        if (!("gridNestedScroll" == pages.name)) {
          console.info("get gridNestedScroll state pages.name: " + JSON.stringify(pages.name));
          alphabetIndexer.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error("push gridNestedScroll page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   ArkUI_Stage_gridNestedScrollStatic01
     * @tc.name     ArkUI_Stage_gridNestedScrollStatic01
     * @tc.desc     ArkUI_Stage_gridNestedScrollStatic01
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_gridNestedScrollStatic01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_Stage_gridNestedScrollStatic01] START');
      await UtilsTest.msSleep(2000)
      let webRect = Utils.getComponentRect('ColumnSize');
      console.info(`ArkUI_Stage_gridNestedScrollStatic01 get webRect is:` + JSON.stringify(webRect));
      let x = Math.floor(Utils.getRectHorizontalCenterX(webRect))
      let y = Math.floor(Utils.getRectVerticalCenterY(webRect))
      let driver = Driver.create();
      const uiContext = AppStorage.get<UIContext>('uiContext');
      await driver.swipe(Math.round(x) as int, Math.round(y + uiContext!.vp2px(60)) as int, Math.round(x) as int, Math.round(y - uiContext!.vp2px(60)) as int);
      console.info('[ArkUI_Stage_gridNestedScrollStatic01] driver.swipe end');
      try {
        let callBack = (backData: events_emitter.EventData) => {
          try {
            console.info(`ArkUI_Stage_gridNestedScrollStatic01 get result is:` + JSON.stringify(backData));
            expect(((backData?.data) as Action)?.ACTION).assertEqual(true)
            console.info(`ArkUI_Stage_gridNestedScrollStatic01 END`);
          } catch (err) {
            console.info(`ArkUI_Stage_gridNestedScrollStatic01 err:` + JSON.stringify(err));
          }
          done()
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 77001,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(innerEvent, callBack)
      } catch (err) {
        console.info(`ArkUI_Stage_gridNestedScrollStatic01 err:` + JSON.stringify(err));
      }
      console.info(`ArkUI_Stage_gridNestedScrollStatic01 sendre:` + JSON.stringify(inspector.sendEventByKey('gridNestedScrollOptionsScrollTestButton', 10, '')));
    });
  })
}
