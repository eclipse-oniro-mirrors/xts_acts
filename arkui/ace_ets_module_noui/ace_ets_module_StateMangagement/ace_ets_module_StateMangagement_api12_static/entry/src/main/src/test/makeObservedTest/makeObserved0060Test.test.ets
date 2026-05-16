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
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
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

export default function makeObserved0060Test() {
  describe('makeObserved0060Test', () => {

    beforeAll(() => {
      console.info("makeObserved0060Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("makeObserved0060Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/makeObserved/makeObserved0060',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get makeObserved0060Test state pages:" + JSON.stringify(pages));
        if (!("makeObserved0060Test" == pages.name)) {
          console.info("get makeObserved0060Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push makeObserved0060Test page error:" + err);
      }
      console.info("makeObserved0060Test beforeEach end");
    });



     
    
    /**
     * @tc.number   makeObserved0060Test_static_01
     * @tc.name     makeObserved0060Test_static_01
     * @tc.desc     makeObserved0060Test_static_01
     * @tc.level    Level.LEVEL0
     */
it('makeObserved0060Test_static_01', Level.LEVEL0, async (done: ()=>void) => {
      console.info('makeObserved0060Test_static_01 START');
      let testArr: testType[] = [
        {
          buttonKey:'makeObserved0060textA',
          key:'makeObserved0060textA',
          value: 'id: 21'
        },
        {
          buttonKey:'makeObserved0060textB',
          key:'makeObserved0060textB',
          value: 'age: 21'
        },
        {
          buttonKey:'makeObserved0060buttonC',
          key:'makeObserved0060textC',
          value: 'Computed age+id: 200 20'
        },
      ]
      let driver =  Driver.create()
      for (const item of testArr) {
        let button = await driver.findComponent(ON.id(item.buttonKey));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000)
        let textJson = inspector.getInspectorByKey(item.key)
        let textJsonObj = JSON.parseJsonElement(textJson);
        console.info("MR031[makeObserved0060Test_static_01]: " + item.key +' : '+ item.value);
        expect(textJsonObj.getElement('$attrs').getString('content')).assertEqual(item.value);
      }
      console.info('makeObserved0060Test_static_01 END');
      done()
    })

  })
}

interface testType {
  buttonKey: string,
  key: string,
  value: string
}

