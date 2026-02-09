'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function makeObserved0140Test() {
  describe('makeObserved0140Test', () => {
    beforeAll(() => {
      console.info("makeObserved0140Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.nowear.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("makeObserved0140Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/makeObserved/makeObserved0140',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get makeObserved0140Test state pages:" + JSON.stringify(pages));
        if (!("makeObserved0140Test" == pages.name)) {
          console.info("get makeObserved0140Test pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push makeObserved0140Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push makeObserved0140Test page error:" + err);
      }
      console.info("makeObserved0140Test beforeEach end");
    });




    /**
     * @tc.number   makeObserved0140Test_01
     * @tc.name     makeObserved0140Test_01
     * @tc.desc     makeObserved0140Test_01
     * @tc.level    0
     */
it('makeObserved0140Test_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
  await CommonFunc.sleep(1000)

      console.info('makeObserved0140Test_static_01 START');

      let driver =  Driver.create()
      let textJson = inspector.getInspectorByKey('flowItem0')
      console.info("MR031[makeObserved0140Test_static_01] $rect: " + JSON.parseJsonElement(textJson).getString('$rect'));
      console.info("MR031[makeObserved0140Test_static_01] match: " + JSON.parseJsonElement(textJson).getString('$rect').match(new RegExp('\\[\\d+', 'g')));
      let initPostion = parseInt(JSON.parseJsonElement(textJson).getString('$rect').match(new RegExp('\\[\\d+', 'g'))![0]!.slice(1) as string)
      console.info("MR031[makeObserved0140Test_static_01]: " + JSON.parseJsonElement(textJson).getString('$rect').match(new RegExp('\\[\\d+', 'g'))![0]!.slice(1) as string);
      let testArr: testType[] = [
        {
          buttonKey: 'buttonPush',
          key: 'flowItem9',
          value: initPostion
        } as testType,
        {
          buttonKey: 'buttonSplice',
          key: 'flowItem1',
          value: initPostion
        } as testType,
        {
          buttonKey: 'buttonUpdate',
          key: 'flowItem3',
          value: initPostion
        } as testType,
      ]
      for (const item of testArr) {
        let button = await driver.findComponent(ON.id(item.buttonKey));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000)
        console.log('hhhhhhhhhh--')
        let textJson = inspector.getInspectorByKey(item.key)
        console.log('hhhhhhhhhh---------')
        let textJsonObj= JSON.parseJsonElement(textJson);
        console.info("MR031[makeObserved0140Test_static_01]: " + item.key + ' : ' + item.value);
        console.info("MR031[makeObserved0140Test_static_01]: " + textJsonObj!.getString('$rect'));
        console.info("MR031[makeObserved0140Test_static_01]: " + parseInt(textJsonObj!.getString('$rect').match(new RegExp('\\[\\d+', 'g'))![0]!.slice(1)));
        const result:double = parseInt(textJsonObj!.getString('$rect').match(new RegExp('\\[\\d+', 'g'))![0]!.slice(1))
        expect(result).assertLarger(item.value);
      }
      console.info('makeObserved0140Test_static_01 END');
      done()
    })

  })
}

interface testType {
  buttonKey: string,
  key: string,
  value: number
}

