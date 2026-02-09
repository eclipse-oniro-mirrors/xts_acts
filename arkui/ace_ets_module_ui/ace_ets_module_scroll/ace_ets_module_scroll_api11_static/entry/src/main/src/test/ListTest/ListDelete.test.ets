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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';

// import config from '@ohos.accessibility.config'
// import accessibility from '@ohos.accessibility';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ListDeleteTest() {

  const SUITE: string = 'ListDelete'

  describe('ListDeleteTest', () => {

    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {

      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListDelete",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !('ListDelete' == pages.name)) {
          router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });

    /*
     *tc.number ArkUI_List_Delete_static_0100
     *tc.name   Set swipeAction.end by CustomBuilder
     *tc.desc   Set swipeAction.end by CustomBuilder and edgeEffect is SwipeEdgeEffect.None
     */

    
    /**
     * @tc.number   ArkUI_List_Delete_static_0100
     * @tc.name     ArkUI_List_Delete_static_0100
     * @tc.desc     ArkUI_List_Delete_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Delete_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_List_Delete_static_0100'
      console.info(`${SUITE} ${CASE} START`);
      await sleep(2000);
      let baseKey: string = 'MyList1_ListItem0'
      let strJson: string = inspector.getInspectorByKey(baseKey);
      console.info("the rect json is " + strJson);

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startDeleteAreaDistance'))
        .assertEqual("0.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('endDeleteAreaDistance'))
        .assertEqual("0.00vp");

      let rectCenter: number[] = getRectCenter(JSON.parseJsonElement(strJson).getString('$rect'))
      let driver: Driver = Driver.create()
      const winLeft: number = AppStorage.get<number>("winLeft") as number
      const winTop: number = AppStorage.get<number>("winTop") as number
      console.info("windowRect Left: " + winLeft + ',' + "windowRect Top: " + winTop);
      await driver.swipe((Math.round(rectCenter[0] + winLeft)).toInt(), (Math.round(rectCenter[1] + winTop)).toInt(),
        0, (Math.round(rectCenter[1]) + winTop).toInt())
      await sleep(3000);
      let strJsonButtonDel: string = inspector.getInspectorByKey(baseKey + '_Button_Del');

      expect(JSON.parseJsonElement(strJsonButtonDel).getElement('$attrs').getString('visibility'))
        .assertEqual("Visibility.Visible");
      let strJsonButtonSet: string = inspector.getInspectorByKey(baseKey + '_Button_Set');

      expect(JSON.parseJsonElement(strJsonButtonSet).getElement('$attrs').getString('visibility'))
        .assertEqual("Visibility.Visible");

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_List_Delete_static_0200
     *tc.name   Set swipeAction.start by CustomBuilder
     *tc.desc   Set swipeAction.start by CustomBuilder and edgeEffect is SwipeEdgeEffect.None
     */

    
    /**
     * @tc.number   ArkUI_List_Delete_static_0200
     * @tc.name     ArkUI_List_Delete_static_0200
     * @tc.desc     ArkUI_List_Delete_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Delete_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_List_Delete_static_0200'
      console.info(`${SUITE} ${CASE} START`);

      let baseKey: string = 'MyList2_ListItem0'
      let strJson: string = inspector.getInspectorByKey(baseKey);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startDeleteAreaDistance'))
        .assertEqual("0.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('endDeleteAreaDistance'))
        .assertEqual("0.00vp");

      let rectCenter: number[] = getRectCenter(JSON.parseJsonElement(strJson).getString('$rect'))
      let driver: Driver = Driver.create()
      const winLeft: number = AppStorage.get<number>("winLeft") as number
      const winTop: number = AppStorage.get<number>("winTop") as number
      console.info("windowRect Left: " + winLeft + ',' + "windowRect Top: " + winTop);
      await driver.swipe((Math.round(winLeft + rectCenter[0] - (rectCenter[3] - rectCenter[2]) / 4)).toInt(),
        (Math.round(rectCenter[1] + winTop)).toInt(),
        (Math.round(winLeft + rectCenter[0] + (rectCenter[3] - rectCenter[2]) / 4)).toInt(),
        (Math.round(rectCenter[1] + winTop)).toInt())
      await sleep(3000);
      let strJsonButtonDel: string = inspector.getInspectorByKey(baseKey + '_Button_Del');
      expect(JSON.parseJsonElement(strJsonButtonDel).getElement('$attrs').getString('visibility'))
        .assertEqual("Visibility.Visible");
      let strJsonButtonSet: string = inspector.getInspectorByKey(baseKey + '_Button_Set');

      expect(JSON.parseJsonElement(strJsonButtonSet).getElement('$attrs').getString('visibility'))
        .assertEqual("Visibility.Visible");

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_List_Delete_static_0500
     *tc.name   Set swipeAction.end by SwipeActionItem
     *tc.desc   Set swipeAction.end by SwipeActionItem and edgeEffect is SwipeEdgeEffect.Spring
     */

    
    /**
     * @tc.number   ArkUI_List_Delete_static_0500
     * @tc.name     ArkUI_List_Delete_static_0500
     * @tc.desc     ArkUI_List_Delete_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Delete_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_List_Delete_static_0500'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(1000)
      const winLeft: number = AppStorage.get<number>("winLeft") as number
      const winTop: number = AppStorage.get<number>("winTop") as number
      console.info("windowRect Left: " + winLeft + ',' + "windowRect Top: " + winTop);
      let baseKey: string = 'MyList5_ListItem0'
      let strJson: string = inspector.getInspectorByKey(baseKey);

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startDeleteAreaDistance'))
        .assertEqual("0.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('endDeleteAreaDistance'))
        .assertEqual("5.00vp");

      let rectCenter: number[] = getRectCenter(JSON.parseJsonElement(strJson).getString('$rect'))
      await driver.swipe((Math.round(winLeft + rectCenter[0] + (rectCenter[3] - rectCenter[2]) / 4)).toInt(),
        (Math.round(winTop + rectCenter[1])).toInt(),
        0, (Math.round(winTop + rectCenter[1])).toInt())
      await sleep(3000);
      let strJson2: string = inspector.getInspectorByKey('MyList5ListItemOnDeleteH');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual("action trigger");
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  })
}

async function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("sleep")
    }, time.toInt())
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

function getRectCenter(rect: string) {
  let regexp: RegExp = new RegExp('\\[', 'g');
  let rtn: string[] = rect.replace(regexp, '').replace(regexp, '').split(',')
  return [
    Number.parseFloat(rtn[0].trim()) + (Number.parseFloat(rtn[2].trim()) - Number.parseFloat(rtn[0].trim())) / 2,
    Number.parseFloat(rtn[1].trim()) + (Number.parseFloat(rtn[3].trim()) - Number.parseFloat(rtn[1].trim())) / 2,
    Number.parseFloat(rtn[0].trim()),
    Number.parseFloat(rtn[2].trim()),
  ]
}

function getRectCenterVp(rect: string) {
  let regexp: RegExp = new RegExp('\\[', 'g');
  let rtn = rect.replace(regexp, '').replace(regexp, '').split(',')
  const uiContext = new UIContext()
  return [
    uiContext.px2vp(Number.parseFloat(rtn[0].trim()) +
      (Number.parseFloat(rtn[2].trim()) - Number.parseFloat(rtn[0].trim())) / 2),
    uiContext.px2vp(Number.parseFloat(rtn[1].trim()) +
      (Number.parseFloat(rtn[3].trim()) - Number.parseFloat(rtn[1].trim())) / 2),
  ]
}