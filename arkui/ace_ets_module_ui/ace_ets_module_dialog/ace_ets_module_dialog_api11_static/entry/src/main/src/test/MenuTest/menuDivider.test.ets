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
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

function sleep(time: int) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function menuDividerTest() {
  describe('ActsMenuDividerTest', () => {
    beforeAll(() => {
      console.info("ActsMenuDividerTest beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("ActsMenuDividerTest  beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/menuDivider",
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get menuDivider state pages: " + JSON.stringify(pages));
        if (!("menuDivider" == pages.name)) {
          console.info("get menuDivider state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance .pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push menuDivider success: " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push menuDivider page error " + JSON.stringify(err));
      }
      await sleep(2000)

    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0001
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0001
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0001
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0001] START');

      let myJson = inspector.getInspectorByKey('menuItemDividerText');
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0001] component obj1 is:${JSON.stringify(myJson)}`);
      await sleep(200);
      let obj1 = JSON.parseJsonElement(myJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0001] component obj1 is:${JSON.stringify(obj1)}`);
      await sleep(1000);

      expect(obj1.getElement('$attrs').getElement('itemDivider').getString('strokeWidth')).assertEqual('1.50vp');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0001] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0002
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0002
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0002
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0200] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0002] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('color')).assertEqual('#FFFFC0CB');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0002] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0003
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0003
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0003
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0003] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0003] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('startMargin')).assertEqual('2.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0003] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0004
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0004
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0004
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0004] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0004] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('endMargin')).assertEqual('2.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0004] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0005
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0005
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0005
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0005] START');

      let myJson = inspector.getInspectorByKey('menuItemDividerText1');
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0005] component obj1 is:${JSON.stringify(myJson)}`);
      await sleep(200);
      let obj1 = JSON.parseJsonElement(myJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0005] component obj1 is:${JSON.stringify(obj1)}`);
      await sleep(1000);

      expect(obj1.getElement('$attrs').getElement('itemDivider').getString('strokeWidth')).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0005] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0006
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0006
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0006
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0006] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0006] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('color')).assertEqual('#00000000');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0006] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0007
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0007
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0007
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0007', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0007] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0007] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('startMargin')).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0007] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0008
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0008
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0008
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0008', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0012] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0008] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('endMargin')).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0008] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0009
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0009
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0009
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0009', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[menuItemDivider_static_0100] START');

      let myJson = inspector.getInspectorByKey('menuItemDividerText1');
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0005] component obj1 is:${JSON.stringify(myJson)}`);
      await sleep(200);
      let obj1 = JSON.parseJsonElement(myJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0009] component obj1 is:${JSON.stringify(obj1)}`);
      await sleep(1000);

      expect(obj1.getElement('$attrs').getElement('itemDivider').getString('strokeWidth')).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0009] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0010
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0010
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0010
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0010] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0010] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('color')).assertEqual('#00000000');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0010] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0011
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0011
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0011
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0011', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0011] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0011] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('startMargin')).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0011] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0012
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0012
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0012
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0012', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0012] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0012] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('endMargin')).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0012] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemDivider_static_0013
     * @tc.name     ArkUX_Stage_Menu_menuItemDivider_static_0013
     * @tc.desc     ArkUX_Stage_Menu_menuItemDivider_static_0013
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemDivider_static_0013', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0013] START');

      let strJson = inspector.getInspectorByKey('menuItemDividerText3');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_static_0013] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('color')).assertEqual('#FF000000');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_static_0013] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_001
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_001
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_001
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_001] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_static_001] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('strokeWidth')).assertEqual('50.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_001] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0002
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0002
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0002
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0002] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0002] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('color')).assertEqual('#FF0000FF');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0002] END');
      done();
    })


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0003
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0003
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0003
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0003] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0003] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('startMargin')).assertEqual('2.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0003] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0004
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0004
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0004
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0004] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0004] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('endMargin')).assertEqual('2.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0004] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0005
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0005
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0005
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0005] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_static_0005] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('strokeWidth'))
        .assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0005] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0006
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0006
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0006
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0006] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0006] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('color')).assertEqual('#00000001');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0006] END');
      done();
    })


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0007
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0007
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0007
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0007', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_006] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0007] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('startMargin'))
        .assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0007] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0008
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0008
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0008
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0008', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_007] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0008] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('endMargin')).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0008] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0009
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0009
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0009
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0009', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0009] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_static_0009] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('strokeWidth'))
        .assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0009] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0010
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0010
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0010
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0010] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0010] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('color')).assertEqual('#00000001');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0010] END');
      done();
    })


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0011
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0011
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0011
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0011', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0011] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0011] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('startMargin'))
        .assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0011] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0012
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0012
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0012
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0012', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0013] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0012] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('endMargin')).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0012] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0013
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0013
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0013
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0013', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0013] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText3');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_static_0013] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('color')).assertEqual('#FF000000');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0013] END');
      done();
    })


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0014
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0014
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0014
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0014', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0014] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_static_0014] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.getElement('$attrs').getString('subMenuExpandingMode')).assertEqual('SubMenuExpandingMode.SIDE');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0014] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0015
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0015
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0015
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0015', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0015] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_static_0015] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.getElement('$attrs').getString('subMenuExpandingMode')).assertEqual('SubMenuExpandingMode.EMBEDDED');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0015] END');
      done();
    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_menuItemGroupDivider_static_0016
     * @tc.name     ArkUX_Stage_Menu_menuItemGroupDivider_static_0016
     * @tc.desc     ArkUX_Stage_Menu_menuItemGroupDivider_static_0016
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_menuItemGroupDivider_static_0016', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0016] START');

      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_static_0016] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.getElement('$attrs').getString('subMenuExpandingMode')).assertEqual('SubMenuExpandingMode.STACK');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_static_0016] END');
      done();
    });

  })
}