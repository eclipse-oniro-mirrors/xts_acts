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

import { describe, beforeEach, afterEach, it, expect, Level, beforeAll} from "../../../hypium/index"
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import CommonFunc from '../../ets/MainAbility/common/Common';

let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

interface Action {
  ACTION: boolean
}
export default function scrollNestedScrollJsunit() {
  describe('scroll_nestedScrollTest', () => {

    beforeAll(() => {
      console.info("scrollNestedScroll beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("scrollNestedScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scrollNestedScroll",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get scrollNestedScroll state pages:" + JSON.stringify(pages));
        if (pages == null || !("scrollNestedScroll" == pages.name)) {
          console.info("get scrollNestedScroll pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push scrollNestedScroll page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollNestedScroll page error:" + err);
      }
      console.info("scrollNestedScroll beforeEach end");
    });

    
    
    /**
     * @tc.number   ArkUI_Stage_scrollNestedScroll_static_01
     * @tc.name     ArkUI_Stage_scrollNestedScroll_static_01
     * @tc.desc     ArkUI_Stage_scrollNestedScroll_static_01
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_scrollNestedScroll_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_Stage_scrollNestedScroll_static_01] START');
     await UtilsTest.msSleep(2000)
      let webRect = Utils.getComponentRect('ColumnSize');
      console.info(`ArkUI_Stage_scrollNestedScroll_static_01 get webRect is:` + JSON.stringify(webRect));
      let x = Math.floor(Utils.getRectHorizontalCenterX(webRect))
      let y = Math.floor(Utils.getRectVerticalCenterY(webRect))
      let driver = Driver.create();
      const uiContext = AppStorage.get<UIContext>('uiContext');
      await driver.swipe(Math.round(x) as int, Math.round(y + uiContext!.vp2px(60)) as int, Math.round(x) as int, Math.round(y - uiContext!.vp2px(60)) as int);
      console.info('[ArkUI_Stage_scrollNestedScroll_static_01] driver.swipe end');
      try {
        let callBack = (backData: events_emitter.EventData) => {
          try {
            console.info(`ArkUI_Stage_scrollNestedScroll_static_01 get result is:` + JSON.stringify(backData));
            expect(((backData?.data) as Action)?.ACTION).assertEqual(true)
            console.info(`ArkUI_Stage_scrollNestedScroll_static_01 END`);
          } catch (err) {
            console.info(`ArkUI_Stage_scrollNestedScroll_static_01 err:` + JSON.stringify(err));
          }
          done()
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 77004,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(innerEvent, callBack)
      } catch (err) {
        console.info(`ArkUI_Stage_scrollNestedScroll_static_01 err:` + JSON.stringify(err));
      }
      console.info(`ArkUI_Stage_scrollNestedScroll_static_01 sendre:` + JSON.stringify(inspector.sendEventByKey('scrollNestedScrollOptionsScrollTestButton', 10, '')));
    });
  })
}
