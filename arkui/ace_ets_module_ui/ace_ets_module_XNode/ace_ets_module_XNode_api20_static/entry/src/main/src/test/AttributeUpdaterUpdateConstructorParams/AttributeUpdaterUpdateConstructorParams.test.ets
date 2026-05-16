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

export default function AttributeUpdaterUpdateConstructorParams() {
  describe('AttributeUpdaterUpdateConstructorParams', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.XNode.api20.static", "EntryAbility")
      await UtilsTest.msSleep(1000)
      console.info('frameNodeApi beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AttributeUpdaterUpdateConstructorParams/AttributeUpdaterUpdateConstructorParams',
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
      console.info('frameNodeApi beforeEach end');
    });

    beforeEach(async () => {
      console.info('beforeAll case');
    });

    afterEach(() => {
      console.info('afterEach case');
    });

    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.number AttributeUpdater_updateConstructorParams_0100
     * @tc.name   AttributeUpdater_updateConstructorParams_0100
     * @tc.desc   Verify AttributeUpdater's updateConstructorParams method for Text component
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('AttributeUpdater_updateConstructorParams_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[AttributeUpdater_updateConstructorParams_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      // 获取Text组件初始内容
      let strJson = inspector.getInspectorByKey('text_update_constructor_params');
      await CommonFunc.sleep(1000);
      console.info('[AttributeUpdater_updateConstructorParams_0100] initial $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));

      // 断言初始文本内容
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getElement('content')))
        .assertEqual('"Initialize"');

      // 点击Text组件触发updateConstructorParams
      let text = await driver.findComponent(ON.id('text_update_constructor_params'));
      await (text?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // 获取更新后的Text组件内容
      let strJson2 = inspector.getInspectorByKey('text_update_constructor_params');
      await CommonFunc.sleep(1000);
      console.info('[AttributeUpdater_updateConstructorParams_0100] updated $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs')));

      // 断言文本内容已更新
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2)
        .getElement('$attrs').getElement('content')))
        .assertEqual('"Updated"');
      done();
    });
  })
}