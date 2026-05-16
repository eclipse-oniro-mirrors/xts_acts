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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, afterAll } from '../../../../hypium/index'
import router from '@ohos.router'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, Component, ON } from '@ohos.UiTest'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest, startAbility } from '../Util.test';

export default function ListSwipeTest() {
  const SUITE: string = 'ListSwipe'
  const waitUiReadyMs: number = 1500

  describe('ListSwipeTest', () => {
    beforeAll(() => {
      console.info("ListSwipeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.scroll16.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListSwipe",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages: router.RouterState = router.getState();
        if (!("ListSwipe" == pages.name)) {
          router.pushUrl(options)
          await sleep(1000)
        }
      } catch (err: Error) {
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
      await driver.delayMs(waitUiReadyMs.toInt())
      // 3.swipe item to left
      let baseKey: string = 'MyList1_ListItem0'
      let strJson: string = inspector.getInspectorByKey(baseKey);
      const winLeft = AppStorage.get<number>("winLeft") as number
      const winTop = AppStorage.get<number>("winTop") as number
      console.info("xyb: windowRect Left: " + winLeft + ',' + "windowRect Top: " + winTop);
      let rectCenter: number[] = getRectCenter(JSON.parseJsonElement(strJson).getString('$rect'))
      await driver.swipe((Math.round(winLeft + rectCenter[0] + (rectCenter[3] - rectCenter[2]) / 4)).toInt()
        , (Math.round(winTop + rectCenter[1])).toInt(), 0, (Math.round(winTop + rectCenter[1])).toInt())

      await sleep(8000) // wait for ui update
      console.info('get getInspectorByKey swipe0100')
      let strJson2: string = inspector.getInspectorByKey('swipe0100')
      console.info('ArkUI_List_Swipe_static_0100 text: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2)))
      expect(JSON.parseJsonElement(strJson2).getString('$type')).assertEqual('Text')
      console.info("obj2.$attrs.content: " + JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'))
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
      await driver.delayMs(waitUiReadyMs.toInt())

      let baseKey: string = 'MyList2_ListItem0'
      let strJson: string = inspector.getInspectorByKey(baseKey);
      const winLeft = AppStorage.get<number>("winLeft") as number
      const winTop = AppStorage.get<number>("winTop") as number
      console.info("windowRect Left: " + winLeft + ',' + "windowRect Top: " + winTop);
      // 2.swipe right
      let rectCenter: number[] = getRectCenter(JSON.parseJsonElement(strJson).getString('$rect'))
      await driver.swipe((Math.round(winLeft + rectCenter[0] - (rectCenter[3] - rectCenter[2]) / 4)).toInt(),
        (Math.round(winTop + rectCenter[1])).toInt(),
        (Math.round(winLeft + rectCenter[0] + (rectCenter[3] - rectCenter[2]) / 4)).toInt(),
        (Math.round(winTop + rectCenter[1])).toInt())


      await sleep(8000) // wait for ui update
      console.info('get getInspectorByKey swipe0300')
      let strJson2: string = inspector.getInspectorByKey('swipe0300')
      console.info('ArkUI_List_Swipe_static_0300 text: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2)))
      expect(JSON.parseJsonElement(strJson2).getString('$type')).assertEqual('Text')
      console.info("obj2.$attrs.content: " + JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'))
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
      await driver.delayMs(waitUiReadyMs.toInt())

      // 2.trigger button click, expect state change COLLAPSED and onFinish be called
      inspector.sendEventByKey('MyList2CloseButton', 10, 'null')
      await sleep(8000) // wait for ui update
      let strJson2: string = inspector.getInspectorByKey('swipe0400')
      console.info('ArkUI_List_Swipe_static_0400 text: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2)))
      expect(JSON.parseJsonElement(strJson2).getString('$type')).assertEqual('Text')
      console.info("obj2.$attrs.content: " + JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'))
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
      await driver.delayMs(waitUiReadyMs.toInt())
      // 2.swipe item to left
      let baseKey: string = 'MyList1_ListItem1'
      let strJson: string = inspector.getInspectorByKey(baseKey);
      let rectCenter: number[] = getRectCenter(JSON.parseJsonElement(strJson).getString('$rect'))
      const winLeft = AppStorage.get<number>("winLeft") as number
      const winTop = AppStorage.get<number>("winTop") as number
      console.info("windowRect Left: " + winLeft + ',' + "windowRect Top: " + winTop);
      await driver.swipe((Math.round(winLeft + rectCenter[0] + (rectCenter[3] - rectCenter[2]) / 4)).toInt(),
        (Math.round(winTop + rectCenter[1])).toInt(),
        0, (Math.round(winTop + rectCenter[1])).toInt())
      await sleep(8000) // wait for ui update
      let strJson2: string = inspector.getInspectorByKey('swipe0500')

      console.info('ArkUI_List_Swipe_static_0500 text: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2)))
      expect(JSON.parseJsonElement(strJson2).getString('$type')).assertEqual('Text')
      console.info("obj2.$attrs.content: " + JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'))
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('swipe end')
      console.info(`${SUITE} ${CASE} END`);
      done()
    });
  })
}

async function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
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
  const uiContext = AppStorage.get<UIContext>('uiContext')!;
  return [
    uiContext.px2vp(Number.parseFloat(rtn[0].trim()) +
      (Number.parseFloat(rtn[2].trim()) - Number.parseFloat(rtn[0].trim())) / 2),
    uiContext.px2vp(Number.parseFloat(rtn[1].trim()) +
      (Number.parseFloat(rtn[3].trim()) - Number.parseFloat(rtn[1].trim())) / 2),
  ]
}