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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { startAbility, UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function nodeTypeGrid() {
  describe('nodeTypeGrid', () => {
    beforeAll(() => {
      console.info("nodeTypeGrid beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("nodeTypeGrid beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/nodeTypeGrid',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get nodeTypeGrid state pages: " + JSON.stringify(pages));
        if (!("nodeTypeGrid" == pages.name)) {
          console.info("get nodeTypeGrid state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push nodeTypeGrid page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" nodeTypeGrid after each called");
    });


    
    /**
     * @tc.number   nodeTypeGrid_static_0100
     * @tc.name     nodeTypeGrid_static_0100
     * @tc.desc     nodeTypeGrid_static_0100
     * @tc.level    Level.LEVEL0
     */
it('nodeTypeGrid_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('nodeTypeGrid_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.type('Grid'));
      let type1 = await (button?.getType() as Promise<string>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('grid_node');
      console.info("[nodeTypeGrid_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual(type1);
      console.info('[nodeTypeGrid_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   nodeTypeGrid_static_0200
     * @tc.name     nodeTypeGrid_static_0200
     * @tc.desc     nodeTypeGrid_static_0200
     * @tc.level    Level.LEVEL0
     */
it('nodeTypeGrid_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('nodeTypeGrid_static_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('gridItem_node');
      console.info("[nodeTypeGrid_static_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('GridItem');
      console.info('[nodeTypeGrid_static_0200] END');
      done();
    });

  })
}