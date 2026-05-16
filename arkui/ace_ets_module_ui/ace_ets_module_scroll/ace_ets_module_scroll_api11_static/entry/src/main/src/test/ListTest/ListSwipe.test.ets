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

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ListSwipeTest() {
  const SUITE: string = 'ListSwipe'
  const waitUiReadyMs: int = 1500


  describe('ListSwipeTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListSwipe",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("ListSwipe" == pages.name)) {
          router.replaceUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });


    
    /**
     * @tc.number   ArkUI_List_Swipe_static_0100
     * @tc.name     ArkUI_List_Swipe_static_0100
     * @tc.desc     ArkUI_List_Swipe_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Swipe_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_List_Swipe_static_0100'
      console.info(`${SUITE} ${CASE} START`);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      // 3.swipe item to left
      let baseKey: string = 'MyList1_ListItem0'
      let strJson: string = inspector.getInspectorByKey(baseKey);
      const winLeft: number = AppStorage.get<number>("winLeft") as number
      const winTop: number = AppStorage.get<number>("winTop") as number
      console.info("windowRect Left: " + winLeft + ',' + "windowRect Top: " + winTop);
      let rectCenter: number[] = getRectCenter(JSON.parseJsonElement(strJson).getString('$rect'))
      await driver.swipe((Math.round(winLeft + rectCenter[0] + (rectCenter[3] - rectCenter[2]) / 4)).toInt(),
        (Math.round(winTop + rectCenter[1])).toInt(),
        0, (Math.round(winTop + rectCenter[1])).toInt())
      await sleep(3000) // wait for ui update
      console.info('get getInspectorByKey swipe0100')
      let strJson2: string = inspector.getInspectorByKey('swipe0100')
      console.info('ArkUI_List_Swipe_static_0100 text: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2)))
      expect(JSON.parseJsonElement(strJson2).getString('$type')).assertEqual('Text')
      console.info("obj2.$attrs.content: " + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('end EXPANDED')
      console.info(`${SUITE} ${CASE} END`);
      done()
    });


    
    /**
     * @tc.number   ArkUI_List_Swipe_static_0300
     * @tc.name     ArkUI_List_Swipe_static_0300
     * @tc.desc     ArkUI_List_Swipe_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Swipe_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_List_Swipe_static_0300'
      console.info(`${SUITE} ${CASE} START`);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      let baseKey: string = 'MyList2_ListItem0'
      let strJson: string = inspector.getInspectorByKey(baseKey);
      const winLeft: number = AppStorage.get<number>("winLeft") as number
      const winTop: number = AppStorage.get<number>("winTop") as number
      console.info("windowRect Left: " + winLeft + ',' + "windowRect Top: " + winTop);
      // 2.swipe right
      let rectCenter: number[] = getRectCenter(JSON.parseJsonElement(strJson).getString('$rect'))
      await driver.swipe((Math.round(winLeft + rectCenter[0])).toInt(),
        (Math.round(winTop + rectCenter[1])).toInt(),
        (Math.round(winLeft + rectCenter[0] + (rectCenter[3] - rectCenter[2]) / 4)).toInt(),
        (Math.round(winTop + rectCenter[1])).toInt())

      await sleep(3000) // wait for ui update
      console.info('get getInspectorByKey swipe0300')
      let strJson2: string = inspector.getInspectorByKey('swipe0300')
      console.info('ArkUI_List_Swipe_static_0300 text: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2)))
      expect(JSON.parseJsonElement(strJson2).getString('$type')).assertEqual('Text')
      console.info("obj2.$attrs.content: " + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('EXPANDED')
      console.info(`${SUITE} ${CASE} END`);
      done()
    });


    
    /**
     * @tc.number   ArkUI_List_Swipe_static_0400
     * @tc.name     ArkUI_List_Swipe_static_0400
     * @tc.desc     ArkUI_List_Swipe_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Swipe_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_List_Swipe_static_0400'
      console.info(`${SUITE} ${CASE} START`);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      // 2.trigger button click, expect state change COLLAPSED and onFinish be called
      inspector.sendEventByKey('MyList2CloseButton', 10, '')
      await sleep(3000) // wait for ui update
      let strJson2: string = inspector.getInspectorByKey('swipe0400')
      console.info('ArkUI_List_Swipe_static_0400 text: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2)))
      expect(JSON.parseJsonElement(strJson2).getString('$type')).assertEqual('Text')
      console.info("obj2.$attrs.content: " + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('onFinish')
      console.info(`${SUITE} ${CASE} END`);
      done()
    });


    
    /**
     * @tc.number   ArkUI_List_Swipe_static_0500
     * @tc.name     ArkUI_List_Swipe_static_0500
     * @tc.desc     ArkUI_List_Swipe_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Swipe_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_List_Swipe_static_0500'
      console.info(`${SUITE} ${CASE} START`);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      // 2.swipe item to left
      let baseKey: string = 'MyList1_ListItem1'
      let strJson: string = inspector.getInspectorByKey(baseKey);
      let rectCenter: number[] = getRectCenter(JSON.parseJsonElement(strJson).getString('$rect'))
      const winLeft: number = AppStorage.get<number>("winLeft") as number
      const winTop: number = AppStorage.get<number>("winTop") as number
      console.info("windowRect Left: " + winLeft + ',' + "windowRect Top: " + winTop);
      await driver.swipe((Math.round(winLeft + rectCenter[0] + (rectCenter[3] - rectCenter[2]) / 4)).toInt(),
        (Math.round(winTop + rectCenter[1])).toInt(),
        0, (Math.round(winTop + rectCenter[1])).toInt())
      await sleep(8000) // wait for ui update
      let strJson2: string = inspector.getInspectorByKey('swipe0500')

      console.info('ArkUI_List_Swipe_static_0500 text: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2)))
      expect(JSON.parseJsonElement(strJson2).getString('$type')).assertEqual('Text')
      console.info("obj2.$attrs.content: " + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('swipe end')
      console.info(`${SUITE} ${CASE} END`);
      done()
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
  let rtn = rect.replace(regexp, '').replace(regexp, '').split(',')
  return [
    Number.parseFloat(rtn[0].trim()) + (Number.parseFloat(rtn[2].trim()) - Number.parseFloat(rtn[0].trim())) / 2,
    Number.parseFloat(rtn[1].trim()) + (Number.parseFloat(rtn[3].trim()) - Number.parseFloat(rtn[1].trim())) / 2,
    Number.parseFloat(rtn[0].trim()),
    Number.parseFloat(rtn[2].trim()),
  ]
}

function getRectCenterVp(rect: string) {
  let regexp: RegExp = new RegExp('\\[', 'g');
  let rtn: string[] = rect.replace(regexp, '').replace(regexp, '').split(',')
  const uiContext = new UIContext()
  return [
    uiContext.px2vp(Number.parseFloat(rtn[0].trim()) +
      (Number.parseFloat(rtn[2].trim()) - Number.parseFloat(rtn[0].trim())) / 2),
    uiContext.px2vp(Number.parseFloat(rtn[1].trim()) +
      (Number.parseFloat(rtn[3].trim()) - Number.parseFloat(rtn[1].trim())) / 2),
  ]
}