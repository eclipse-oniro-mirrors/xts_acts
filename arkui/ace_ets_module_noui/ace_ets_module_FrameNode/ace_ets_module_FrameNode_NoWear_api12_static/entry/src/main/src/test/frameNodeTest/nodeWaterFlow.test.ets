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
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach, afterAll } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function nodeWaterFlow() {
  describe('nodeWaterFlow', () => {
    beforeAll(() => {
      console.info("nodeWaterFlow beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.FrameNodeNoWear.api12.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("nodeWaterFlow beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/nodeWaterFlow',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get nodeWaterFlow state pages: " + JSON.stringify(pages));
        if (!("nodeWaterFlow" == pages.name)) {
          console.info("get nodeWaterFlow state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push nodeWaterFlow page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" nodeWaterFlow after each called");
    });

    


    

    /**
     * @tc.number   nodeWaterFlow_static_0100
     * @tc.name     nodeWaterFlow_static_0100
     * @tc.desc     nodeWaterFlow_static_0100
     * @tc.level    Level.LEVEL0
     */
it('nodeWaterFlow_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('nodeWaterFlow_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        let button = await driver.findComponent(ON.type('WaterFlow'));
        await CommonFunc.sleep(1000);
        let type1 = await button!.getType();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('waterFlow_node');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[nodeWaterFlow_0100] component obj is: " + JSON.stringify(obj));
        expect(obj.getString('$type')).assertEqual(type1);
        console.info('[nodeWaterFlow_0100] END');
      }
      done();
    });

    


    

    /**
     * @tc.number   nodeWaterFlow_static_0200
     * @tc.name     nodeWaterFlow_static_0200
     * @tc.desc     nodeWaterFlow_static_0200
     * @tc.level    Level.LEVEL0
     */
it('nodeWaterFlow_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('nodeWaterFlow_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        let button = await driver.findComponent(ON.type('FlowItem'));
        let type2 = await button!.getType();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('flowItem_node');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[nodeWaterFlow_0200] component obj is: " + JSON.stringify(obj));
        expect(obj.getString('$type')).assertEqual(type2);
        console.info('[nodeWaterFlow_0200] END');
      }
      done();
    });

  })
}