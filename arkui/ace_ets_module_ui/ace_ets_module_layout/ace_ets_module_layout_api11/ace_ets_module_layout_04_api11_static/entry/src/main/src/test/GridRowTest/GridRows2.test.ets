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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../hypium/index';
import router from '@ohos.router';

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, MouseButton,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
// import config from '@ohos.accessibility.config';
// import accessibility from '@ohos.accessibility';
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.layout.split04.static/EntryAbility';


export default function GridRows2() {
  describe('GridRows2', () => {
    beforeAll(() => {
      console.log('GridRows2 beforeAll')
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("GridRows2 beforeEach start");
      // config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      //   console.info('[GridRows2] enable success');
      // }).catch((err: object) => {
      //   console.error(`[GridRows2] failed to enable, ${err}`)
      // })
      console.info("GridRows2 beforeEach start 222")
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get GridRows2 state pages:" + "");
        if (!("GridRows2" == pages.name)) {
          console.info("get  GridRows2 pages.name:" + "");
          routerInstance.pushUrl({url:"MainAbility/pages/GridRow/GridRows2"})
          
          await CommonFunc.sleep(2000);
          console.info("push GridRows2 page result:" + "");
        }
      } catch (err) {
        console.error("push GridRows2 page error:" + err);
      }
      console.info("GridRows2 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GridRows2 after each called");
    });

/**
     * @tc.number   GridRows2_static_001
     * @tc.name     GridRows2_static_001
     * @tc.desc     GridRows2_static_001
     * @tc.level    Level.LEVEL0
     */
it('GridRows2_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridRows2_static_001] START');

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await (driver.findComponent(ON.id('GridRows2Bt1')) as Promise<Component>);
      await button_Bottom.click();
      await CommonFunc.sleep(1000);

      let grid = CommonFunc.getComponentRect('GridRows2');
      let row1 = CommonFunc.getComponentRect('GridRows2_1');
      let row2 = CommonFunc.getComponentRect('GridRows2_2');

      console.info("[GridRows2_static_001] GridRows2_1 is: " + JSON.stringify(row1) + 'GridRows2_5:' + JSON.stringify(row2) );
      console.info("[GridRows2_static_001] GridRows2_1 grid is: " + JSON.stringify(grid) );
      expect(Math.abs(Math.round(row2.left - row1.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(grid.bottom - row1.bottom)) <= 1).assertTrue();

      console.info('[GridRows2_static_001] END');
      done();
    });

/**
     * @tc.number   GridRows2_static_002
     * @tc.name     GridRows2_static_002
     * @tc.desc     GridRows2_static_002
     * @tc.level    Level.LEVEL0
     */
it('GridRows2_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridRows2_static_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('GridRows2Bt2'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let rel = CommonFunc.getComponentRect('GridRows2');

      await driver.mouseClick({x: Math.round(rel.left + Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) as Int, y: Math.round(rel.top + Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) as Int}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('GridRows2Text');
      await CommonFunc.sleep(200);
     let obj = JSON.parseJsonElement(strJson);
     console.info("[GridRows2_static_002] component obj is: " + JSON.stringify(obj));
     await CommonFunc.sleep(1000);
     expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      console.info('[GridRows2_static_002] END');
      done();
    });
  })
}
