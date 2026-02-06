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

export default function listJsunit1() {

  describe('list1Test', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List1',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get List state success " + JSON.stringify(pages));
        if (!("List1" == pages.name)) {
          console.info("get List state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          // console.info("push List page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async (): Promise<void> => {
      await sleep(1)
      console.info("List after each called");
    });


    
    /**
     * @tc.number   listTest_static_001
     * @tc.name     listTest_static_001
     * @tc.desc     listTest_static_001
     * @tc.level    Level.LEVEL1
     */
it('listTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('++++++++++++++++ List TestCase 1 START ++++++++++++++++');
      await sleep(1)
      let strJson = inspector.getInspectorByKey('list');
      let obj = JSON.parseJsonElement(strJson);
      console.info("get inspector value is: " + JSON.stringifyJsonElement(obj));
      console.log(JSON.stringifyJsonElement(obj.getElement('$type')))
      expect(obj.getString('$type')).assertEqual('List')
      console.log('List‘s space is ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('space')))
      console.log('List‘s initialIndex is ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('initialIndex')))
      console.log('List‘s listDirection is ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('listDirection')))
      console.log('List‘s divider is ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider')))
      console.log('List‘s edgeEffect is ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffect')))
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('initialIndex')).assertEqual('0')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('listDirection'))
        .assertEqual('Axis.Vertical')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('edgeEffect'))
        .assertEqual('EdgeEffect.None')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('editMode')).assertEqual(false)
      console.info('++++++++++++++++ List TestCase 1 End ++++++++++++++++');
      done();
    });
  })
}
