'use static';
/*
 * Copyright (c)  Device Co., Ltd.
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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../hypium/index"
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
import { RecordData } from '@ohos.base';

let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
interface ItemN {
  itemNumber: number
}
export default function scrollEnablePagingJsunit() {
  describe('scroll_enablePagingTest', () => {

    beforeAll(() => {
      console.info("scrollEnablePaging beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("scrollEnablePaging beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scrollEnablePaging",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get scrollEnablePaging state pages:" + JSON.stringify(pages));
        if (pages == null || !("scrollEnablePaging" == pages.name)) {
          console.info("get scrollEnablePaging pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push scrollEnablePaging page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollEnablePaging page error:" + err);
      }
      console.info("scrollEnablePaging beforeEach end");
    });

    
    
    /**
     * @tc.number   ArkUI_Stage_scrollEnablePaging_static_01
     * @tc.name     ArkUI_Stage_scrollEnablePaging_static_01
     * @tc.desc     ArkUI_Stage_scrollEnablePaging_static_01
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_scrollEnablePaging_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_Stage_scrollEnablePaging_static_01] START');
      await UtilsTest.msSleep(2000)
      let scrollRect = Utils.getComponentRect('ScrollTest');
      console.info(`ArkUI_Stage_scrollEnablePaging_static_01 get scrollRect is:` + JSON.stringify(scrollRect));
      let x = Utils.getRectHorizontalCenterX(scrollRect)
      let y = Utils.getRectVerticalCenterY(scrollRect)
      let driver = Driver.create();
      await driver.swipe(Math.floor(x) as int, Math.floor(scrollRect.bottom) - 50 as int, Math.floor(x) as int, (Math.floor(scrollRect.top) + 50)  as int);
      console.info('[ArkUI_Stage_scrollEnablePaging_static_01] driver.swipe end');
     await UtilsTest.msSleep(2000)
      try {
        let callBack = (backData: events_emitter.EventData) => {
          try {
            console.info(`ArkUI_Stage_scrollEnablePaging_static_01 get result is:` + JSON.stringify(backData));
            const data = backData.data as Record<String,RecordData>
            expect(data['itemNumber'] as int).assertEqual(7)
            console.info(`ArkUI_Stage_scrollEnablePaging_static_01 END`);
          } catch (err) {
            console.info(`ArkUI_Stage_scrollEnablePaging_static_01 err:` + JSON.stringify(err));
          }
          done()
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 79002,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(innerEvent, callBack)
      } catch (err) {
        console.info(`ArkUI_Stage_scrollEnablePaging_static_01 err:` + JSON.stringify(err));
      }
      await driver.click(x as int , y as int);
    });
  })
}
