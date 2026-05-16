'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { Color,$r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../common/Common';
import { startAbility, UtilsTest } from '../Util.test.ets';

import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function WaterFlowColumnsTemplateTest() {
  describe('WaterFlowColumnsTemplateTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeAll(async (): Promise<void> => {
      console.info('WaterFlowColumnsTemplateTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility')
    });
    beforeEach(async (): Promise<void> => {
      console.info('WaterFlowColumnsTemplateTest beforeEach start');
      try {
        console.info('get WaterFlowColumnsTemplateTest state pages:1');
        const routerInstance = AppStorage.get<Router>('router') as Router
        console.info('get WaterFlowColumnsTemplateTest state pages:2');
        routerInstance.clear();
        console.info('get WaterFlowColumnsTemplateTest state pages:3');
        let pages = routerInstance.getState();
        console.info('get WaterFlowColumnsTemplateTest state pages:' + JSON.stringify(pages));
        if (!('waterFlowColumnsTemplate' == pages.name)) {
          console.info('get  WaterFlowColumnsTemplateTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl({
            url: 'MainAbility/pages/WaterFlow/waterFlowColumnsTemplate',
          })
        }
      } catch (err) {
        console.error('push ScrollColumnsTemplateTest page error:' + err);
      }
      console.info('ScrollColumnsTemplateTest foreEach end');
    });

    /**
     * @tc.number   ScrollColumnsTemplate_static_0100
     * @tc.name     ScrollColumnsTemplate_static_0100
     * @tc.desc     ScrollColumnsTemplate_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('ScrollColumnsTemplate_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollColumnsTemplate_static_0100';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('columnsTemplate_001');
      let obj = JSON.parseJsonElement(strJson);
      let columnsTemplateStr = obj.getElement('$attrs').getString('columnsTemplate');
      console.info('[ScrollColumnsTemplate_static_0100] ColumnsTemplate obj is: ' + columnsTemplateStr);
      expect(columnsTemplateStr).assertEqual('1fr 2fr 1fr');
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   ScrollColumnsTemplate_static_0200
     * @tc.name     ScrollColumnsTemplate_static_0200
     * @tc.desc     ScrollColumnsTemplate_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('ScrollColumnsTemplate_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollColumnsTemplate_static_0200';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('columnsTemplate_002');
      let obj = JSON.parseJsonElement(strJson);
      let columnsTemplateStr = obj.getElement('$attrs').getString('columnsTemplate');
      console.info('[ScrollColumnsTemplate_static_0200] ColumnsTemplate obj is: ' + columnsTemplateStr);
      expect(columnsTemplateStr).assertEqual('');
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   ScrollColumnsTemplate_static_0300
     * @tc.name     ScrollColumnsTemplate_static_0300
     * @tc.desc     ScrollColumnsTemplate_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('ScrollColumnsTemplate_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollColumnsTemplate_static_0300';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('columnsTemplate_003');
      let obj = JSON.parseJsonElement(strJson);
      let columnsTemplateStr = obj.getElement('$attrs').getString('columnsTemplate');
      console.info('[ScrollColumnsTemplate_static_0300] ColumnsTemplate obj is: ' + columnsTemplateStr);
      expect(columnsTemplateStr).assertEqual('');
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   ScrollColumnsTemplate_static_0400
     * @tc.name     ScrollColumnsTemplate_static_0400
     * @tc.desc     ScrollColumnsTemplate_static_0400
     * @tc.level    Level.LEVEL2
     */
    it('ScrollColumnsTemplate_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollColumnsTemplate_static_0400';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('columnsTemplate_004');
      let obj = JSON.parseJsonElement(strJson);
      let columnsTemplateStr = obj.getElement('$attrs').getString('itemFillPolicy');
      console.info('[ScrollColumnsTemplate_static_0400] ColumnsTemplate obj is: ' + columnsTemplateStr);
      expect(columnsTemplateStr).assertEqual('PresetFillType.BREAKPOINT_SM2MD3LG5');
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   ScrollColumnsTemplate_static_0500
     * @tc.name     ScrollColumnsTemplate_static_0500
     * @tc.desc     ScrollColumnsTemplate_static_0500
     * @tc.level    Level.LEVEL2
     */
    it('ScrollColumnsTemplate_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollColumnsTemplate_static_0500';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('columnsTemplate_005');
      let obj = JSON.parseJsonElement(strJson);
      let columnsTemplateStr = obj.getElement('$attrs').getString('itemFillPolicy');
      console.info('[ScrollColumnsTemplate_static_0500] ColumnsTemplate obj is: ' + columnsTemplateStr);
      expect(columnsTemplateStr).assertEqual('PresetFillType.BREAKPOINT_SM1MD2LG3');
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   ScrollColumnsTemplate_static_0600
     * @tc.name     ScrollColumnsTemplate_static_0600
     * @tc.desc     ScrollColumnsTemplate_static_0600
     * @tc.level    Level.LEVEL2
     */
    it('ScrollColumnsTemplate_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollColumnsTemplate_static_0600';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('columnsTemplate_006');
      let obj = JSON.parseJsonElement(strJson);
      let columnsTemplateStr = obj.getElement('$attrs').getString('itemFillPolicy');
      console.info('[ScrollColumnsTemplate_static_0600] ColumnsTemplate obj is: ' + columnsTemplateStr);
      expect(columnsTemplateStr).assertEqual('PresetFillType.BREAKPOINT_DEFAULT');
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

  })
}
