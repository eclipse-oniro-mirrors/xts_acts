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

function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("sleep")
    }, time.toInt())
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function listItemJsunit() {
  describe('listItemTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListItem',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get ListItem state success " + JSON.stringify(pages));
        if (!("ListItem" == pages.name)) {
          console.info("get ListItem state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          // console.info("push ListItem page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListItem page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async (): Promise<void> => {
      await sleep(1)
      console.info("ListItem after each called");
    });


    
    /**
     * @tc.number   listItemTest_static_001
     * @tc.name     listItemTest_static_001
     * @tc.desc     listItemTest_static_001
     * @tc.level    Level.LEVEL1
     */
it('listItemTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('++++++++++++++++ ListItem TestCase 1 START ++++++++++++++++');
      await sleep(1)
      let strJson = inspector.getInspectorByKey('listitem');
      console.log('xyb: ' + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('ListItem')
      console.log(JSON.parseJsonElement(strJson).getString('$type'))
      console.log('ListItem1‘s sticky is ' + JSON.parseJsonElement(strJson).getElement('$attrs').getString('sticky'))
      console.log('ListItem1‘s editable is ' +
      JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('editable'))
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sticky')).assertEqual('Sticky.None')
      console.info('++++++++++++++++ ListItem TestCase 1 End ++++++++++++++++');
      done();
    });


    
    /**
     * @tc.number   listItemTest_static_002
     * @tc.name     listItemTest_static_002
     * @tc.desc     listItemTest_static_002
     * @tc.level    Level.LEVEL1
     */
it('listItemTest_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('++++++++++++++++ ListItem TestCase 2 START ++++++++++++++++');
      let strJson = inspector.getInspectorByKey('listitem2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("get inspector value is: " + JSON.stringifyJsonElement(obj));
      console.log(JSON.stringifyJsonElement(obj.getElement('$type')))
      expect(obj.getString('$type')).assertEqual('ListItem')
      console.log(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')))
      console.log('ListItem2‘s sticky is ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sticky')))
      console.log('ListItem2‘s editable is ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('editable')))
      await sleep(1)
      // 废弃 sticky
      // expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sticky')).assertEqual('Sticky.Normal')
      console.info('++++++++++++++++ ListItem TestCase 2 End ++++++++++++++++');
      done();
    });


    
    /**
     * @tc.number   listItemTest_static_003
     * @tc.name     listItemTest_static_003
     * @tc.desc     listItemTest_static_003
     * @tc.level    Level.LEVEL1
     */
it('listItemTest_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('++++++++++++++++ ListItem TestCase 3 START ++++++++++++++++');
      let strJson = inspector.getInspectorByKey('listitem3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("get inspector value is: " + JSON.stringifyJsonElement(obj));
      console.log(JSON.stringifyJsonElement(obj.getElement('$type')))
      expect(obj.getString('$type')).assertEqual('ListItem')
      console.log(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')))
      console.log('ListItem3‘s sticky is ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sticky')))
      console.log('ListItem3‘s editable is ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('editable')))
      await sleep(1)
      // 废弃 sticky
      // expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sticky')).assertEqual('Sticky.Opacity')
      console.info('++++++++++++++++ ListItem TestCase 3 End ++++++++++++++++');
      done();
    });


    
    /**
     * @tc.number   listItemTest_static_004
     * @tc.name     listItemTest_static_004
     * @tc.desc     listItemTest_static_004
     * @tc.level    Level.LEVEL1
     */
it('listItemTest_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('++++++++++++++++ ListItem TestCase 4 START ++++++++++++++++');
      let strJson = inspector.getInspectorByKey('listitem4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("get inspector value is: " + JSON.stringifyJsonElement(obj));
      console.log(JSON.stringifyJsonElement(obj.getElement('$type')))
      expect(obj.getString('$type')).assertEqual('ListItem')
      console.log(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')))
      console.log('ListItem4‘s sticky is ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sticky')))
      console.log('ListItem4‘s editable is ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('editable')))
      await sleep(1)
      // 废弃 sticky
      // expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sticky')).assertEqual('Sticky.Opacity')
      console.info('++++++++++++++++ ListItem TestCase 4 End ++++++++++++++++');
      done();
    });
  })
}
