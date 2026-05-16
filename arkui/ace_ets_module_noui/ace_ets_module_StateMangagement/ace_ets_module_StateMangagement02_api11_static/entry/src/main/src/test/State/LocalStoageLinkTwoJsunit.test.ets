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
import events_emitter from '@ohos.events.emitter'
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

export default function LocalStoageLinkTwoJsunit() {
  describe('LocalStoageLinkTwoJsunit', () => {
    beforeAll(() => {
      console.info("LocalStoageLinkTwoJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("LocalStoageLinkTwoJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/LocalStoageLinkTwo',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LocalStoageLinkTwoJsunit state pages:" + JSON.stringify(pages));
        if (!("LocalStoageLinkTwo" == pages.name)) {
          console.info("get LocalStoageLinkTwoJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push LocalStoageLinkTwoJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStoageLinkTwoJsunit page error:" + err);
      }
      console.info("LocalStoageLinkTwoJsunit beforeEach end");
    });

    /**
     * @tc.number   LocalStoageLinkTwoJsunit_static_0100
     * @tc.name     LocalStoageLinkTwoJsunit_static_0100
     * @tc.desc     LocalStoageLinkTwoJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('LocalStoageLinkTwoJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[LocalStoageLinkTwoJsunit_static_0100] START');
      let strJson1 = inspector.getInspectorByKey('text_getValue2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LocalStoageLinkTwoJsunit_static_0100] obj1 is: " + JSON.stringify(obj1));

      expect(obj1.getElement('$attrs').getString('content'))
        .assertEqual('Prop1:{"value":6}, Prop2:1, Prop3:true, Prop4:abc, Prop5:1, Prop6:{"value":66}, Prop7:[{"value":66},{"value":67}], Prop8:[1,2], Prop9:[true,false], Prop10:["abc","efd"], Prop11:[1,2], Prop12:[{"value":66},{"value":67}]')
      console.info('[LocalStoageLinkTwoJsunit_static_0100] END');
      done();
    })
  })
}
