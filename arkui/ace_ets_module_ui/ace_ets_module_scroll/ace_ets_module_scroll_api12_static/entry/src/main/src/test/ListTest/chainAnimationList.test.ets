'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector'
import events_emitter from '@ohos.events.emitter';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function chainAnimationList() {
  describe('chainAnimationList', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("chainAnimationList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/chainAnimationList",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get chainAnimationList state pages:" + JSON.stringify(pages));
        if (!("chainAnimationList" == pages.name)) {
          console.info("get chainAnimationList pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push chainAnimationList page error:" + err);
      }
      console.info("chainAnimationList beforeEach end");
    });


    
    /**
     * @tc.number   chainAnimationList_static_0100
     * @tc.name     chainAnimationList_static_0100
     * @tc.desc     chainAnimationList_static_0100
     * @tc.level    Level.LEVEL0
     */
it('chainAnimationList_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[chainAnimationList_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let strJson = inspector.getInspectorByKey('list_chain');
      console.info("[chainAnimationList_static_0100] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[chainAnimationList_static_0100] cachedCount: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedCount')));
      console.info("[chainAnimationList_static_0100] scrollBar: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollBar')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      expect(Number((JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('friction')).toFixed(1)))
        .assertEqual(0.6);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('cachedCount')).assertEqual('2');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBar')).assertEqual("BarState.Auto");
      await driver.assertComponentExist(ON.text('1'));

      let strJson2 = inspector.getInspectorByKey('listItem_sticky');
      console.info("[chainAnimationList_static_0100] component obj2 is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2)));
      console.info("[chainAnimationList_static_0100] sticky: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('sticky')));
      console.info("[chainAnimationList_static_0100] editable: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('editable')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson2).getString('$type')).assertEqual('ListItem');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('sticky')).assertEqual("Sticky.None");
      console.info('[chainAnimationList_static_0100] END');
      done();
    });
  })
}
