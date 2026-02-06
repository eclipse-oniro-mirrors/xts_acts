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

import { LengthConstrain } from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function List_lanes() {

  describe('List_lanes', () => {
    beforeAll(() => {
      console.log("List_lanes beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("List_lanes beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListChange/List_lanes',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get List_lanes state pages:" + JSON.stringify(pages));
        if (!("List_lanes" == pages.name)) {
          console.info("get List_lanes state pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push List_lanes page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_lanes beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_lanes after each called");
    });

    
    
    



/**
     * @tc.number   testListLanesToTwo_static
     * @tc.name     testListLanesToTwo_static
     * @tc.desc     testListLanesToTwo_static
     * @tc.level    Level.LEVEL0
     */
it('testListLanesToTwo_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testListLanesToTwo START');
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'addLanes', value: 2
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('List_lanes_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let List_lanes_011: RectValue = CommonFunc.getComponentRect('List_lanes_011');
      let List_lanes_012: RectValue = CommonFunc.getComponentRect('List_lanes_012');
      let List_lanes_013: RectValue = CommonFunc.getComponentRect('List_lanes_013');
      let List_lanes_014: RectValue = CommonFunc.getComponentRect('List_lanes_014');
      let List_lanes_01: RectValue = CommonFunc.getComponentRect('List_lanes_01');
      expect(Math.abs(List_lanes_011.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(List_lanes_012.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_013.top - List_lanes_011.bottom) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_014.top - List_lanes_012.bottom) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

      expect(Math.abs(List_lanes_011.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(List_lanes_013.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(Math.round((List_lanes_012.left - List_lanes_011.right) * 10) / 10 - Math.round(UIContext.resolveUIContext()!.vp2px(75) * 10) / 10) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round((List_lanes_014.left - List_lanes_013.right) * 10) / 10 - Math.round(UIContext.resolveUIContext()!.vp2px(75) * 10) / 10) <= 1)
        .assertTrue();

      expect(Math.abs(Math.floor((List_lanes_011.right - List_lanes_011.left) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_012.right - List_lanes_012.left) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_013.right - List_lanes_013.left) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_014.right - List_lanes_014.left) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(Math.floor((List_lanes_011.bottom - List_lanes_011.top) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_012.bottom - List_lanes_012.top) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_013.bottom - List_lanes_013.top) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_014.bottom - List_lanes_014.top) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(100, 120, 100, 0);
      await CommonFunc.sleep(1000);
      let List_lanes_024: RectValue = CommonFunc.getComponentRect('List_lanes_013');
      expect(Math.abs(Math.floor((List_lanes_024.top - List_lanes_01.top) - UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
      console.info('testListLanesToTwo END');
      done();
    });
    
    
    



/**
     * @tc.number   testListLanesToRange01_static
     * @tc.name     testListLanesToRange01_static
     * @tc.desc     testListLanesToRange01_static
     * @tc.level    Level.LEVEL0
     */
it('testListLanesToRange01_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testListLanesToRange01 START');
      AppStorage.get<MessageManager<LengthConstrain>>('messageManager')?.notify({
        name: 'addLanes', value: {
          minLength: 100, maxLength: 150
        }
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('List_lanes_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let List_lanes_011: RectValue = CommonFunc.getComponentRect('List_lanes_011');
      let List_lanes_012: RectValue = CommonFunc.getComponentRect('List_lanes_012');
      let List_lanes_013: RectValue = CommonFunc.getComponentRect('List_lanes_013');
      let List_lanes_014: RectValue = CommonFunc.getComponentRect('List_lanes_014');
      let List_lanes_01: RectValue = CommonFunc.getComponentRect('List_lanes_01');
      expect(Math.abs(List_lanes_011.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(List_lanes_012.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(List_lanes_013.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(List_lanes_014.top - List_lanes_011.bottom - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

      expect(Math.abs(List_lanes_011.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(List_lanes_014.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(Math.round((List_lanes_012.left - List_lanes_011.right) -(UIContext.resolveUIContext()!.vp2px(50 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round((List_lanes_013.left - List_lanes_012.right) -(UIContext.resolveUIContext()!.vp2px(50 / 3)))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(List_lanes_011.right - List_lanes_011.left) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_012.right - List_lanes_012.left) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_013.right - List_lanes_013.left) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_014.right - List_lanes_014.left) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(Math.round(List_lanes_011.bottom - List_lanes_011.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_012.bottom - List_lanes_012.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_013.bottom - List_lanes_013.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_014.bottom - List_lanes_014.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(100, 120, 100, 0);
      await CommonFunc.sleep(1000);
      let List_lanes_024: RectValue = CommonFunc.getComponentRect('List_lanes_014');
      expect(Math.abs(List_lanes_024.top - List_lanes_01.top - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
      console.info('testListLanesToRange01 END');
      done();
    });
    
    
    



/**
     * @tc.number   testListLanesToRange02_static
     * @tc.name     testListLanesToRange02_static
     * @tc.desc     testListLanesToRange02_static
     * @tc.level    Level.LEVEL0
     */
it('testListLanesToRange02_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testListLanesToRange02 START');
      AppStorage.get<MessageManager<LengthConstrain>>('messageManager')?.notify({
        name: 'addLanes', value: {
          minLength: 150, maxLength: 200
        }
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('List_lanes_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let List_lanes_011: RectValue = CommonFunc.getComponentRect('List_lanes_011');
      let List_lanes_012: RectValue = CommonFunc.getComponentRect('List_lanes_012');
      let List_lanes_013: RectValue = CommonFunc.getComponentRect('List_lanes_013');
      let List_lanes_014: RectValue = CommonFunc.getComponentRect('List_lanes_014');
      let List_lanes_01: RectValue = CommonFunc.getComponentRect('List_lanes_01');
      expect(Math.abs(List_lanes_011.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(List_lanes_012.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_013.top - List_lanes_011.bottom) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_014.top - List_lanes_012.bottom) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

      expect(Math.abs(List_lanes_011.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(List_lanes_013.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(Math.round((List_lanes_012.left - List_lanes_011.right) * 10) / 10 - Math.round(UIContext.resolveUIContext()!.vp2px(75) * 10) / 10) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round((List_lanes_014.left - List_lanes_013.right) * 10) / 10 - Math.round(UIContext.resolveUIContext()!.vp2px(75) * 10) / 10) <= 1)
        .assertTrue();

      expect(Math.abs(Math.floor((List_lanes_011.right - List_lanes_011.left) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_012.right - List_lanes_012.left) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_013.right - List_lanes_013.left) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_014.right - List_lanes_014.left) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(Math.floor((List_lanes_011.bottom - List_lanes_011.top) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_012.bottom - List_lanes_012.top) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_013.bottom - List_lanes_013.top) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_014.bottom - List_lanes_014.top) - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(100, 120, 100, 0);
      await CommonFunc.sleep(1000);
      let List_lanes_024: RectValue = CommonFunc.getComponentRect('List_lanes_013');
      expect(Math.abs(Math.floor((List_lanes_024.top - List_lanes_01.top) - UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
      console.info('testListLanesToRange02 END');
      done();
    });
  })
}