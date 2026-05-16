'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  Level
} from '../../../../hypium/index'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function AttributeUpdaterAttribute() {
  describe('AttributeUpdaterAttribute', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.XNode.api20.static", "EntryAbility")
      await UtilsTest.msSleep(1000)
      console.info('frameNodeApi beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AttributeUpdaterAttribute/AttributeUpdaterAttribute',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        routerInstance.pushUrl(options);
        await CommonFunc.sleep(4000);
      } catch (err) {
        console.error('push frameNodeApi page error:' + err);
      }
      console.info('beforeAll case');
    });

    beforeEach(async () => {

      console.info('frameNodeApi beforeEach end');
    });

    afterEach(() => {
      console.info('afterEach case');
    });

    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.number AttributeUpdater_attribute_direct_update_0100
     * @tc.name   AttributeUpdater_attribute_direct_update_0100
     * @tc.desc   Verify AttributeUpdater's attribute getter for direct property update
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('AttributeUpdater_attribute_direct_update_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[AttributeUpdater_attribute_direct_update_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      // 获取Button组件初始属性
      let strJson = inspector.getInspectorByKey('btn_with_modifier');
      await CommonFunc.sleep(1000);
      console.info('[AttributeUpdater_attribute_direct_update_0100] initial $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundColor')));
      let setColor = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundColor'));
      expect(setColor).assertEqual('"#FFD5D5D5"');
      // 点击Button触发attribute更新
      let button = await driver.findComponent(ON.id('btn_with_modifier'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // 获取更新后的组件属性
      let strJson2 = inspector.getInspectorByKey('btn_with_modifier');
      await CommonFunc.sleep(1000);
      console.info('[AttributeUpdater_attribute_direct_update_0100] updated $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('backgroundColor')));
      let resultColor = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('backgroundColor'));
      expect(resultColor).not().assertEqual(setColor);;
      done();
    });
  })
}