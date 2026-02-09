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

import router from '@ohos.router';
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

function sleep(time: int) : Promise<int>  {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, time)
    })
  }

export default function linkJsunit() {


  describe('linkTest_static_', () => {

    beforeAll(() => {
      console.info("linkTest_static_ beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement01.api11.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("linkTest_static_ beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Link/Link',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get linkTest_static_ state pages:" + JSON.stringify(pages));
        if (!("linkTest_static_" == pages.name)) {
          console.info("get linkTest_static_ pages.name:" + JSON.stringify(pages.name));
          //let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push linkTest_static_ page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push linkTest_static_ page error:" + err);
      }
      console.info("linkTest_static_ beforeEach end");
    });


    afterEach(async () => {
      await sleep(1)
      console.info("Link after each called");
    });

    
    
/**
     * @tc.number   linkTest_static_001
     * @tc.name     linkTest_static_001
     * @tc.desc     linkTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('linkTest_static_001', Level.LEVEL0, async () => {
      console.info('linkTest_static_001 START');
      await sleep(1)
      let strJson = inspector.getInspectorByKey('Button');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Button');
      console.log(JSON.stringify(obj.getString('$type')))
      console.info("yr link0 type: " + JSON.stringify(obj.getString('$type')));
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stateEffect')).assertEqual('false');
      console.log("yr link0 stateEffect-'false'" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stateEffect')))
      console.info('linkTest_static_001 END');
    });

    
    
/**
     * @tc.number   linkTest_static_002
     * @tc.name     linkTest_static_002
     * @tc.desc     linkTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('linkTest_static_002', Level.LEVEL0, async () => {
      console.info('linkTest_static_002 START');
      let strJson = inspector.getInspectorByKey('Button1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stateEffect')).assertEqual('false');
      console.log("yr link1 stateEffect-'false'" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stateEffect')))
      console.info('linkTest_static_002 END');
    });
  })
}
