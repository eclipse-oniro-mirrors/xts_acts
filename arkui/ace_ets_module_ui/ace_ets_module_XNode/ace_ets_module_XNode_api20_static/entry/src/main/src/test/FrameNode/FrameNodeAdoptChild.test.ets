'use static';
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
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

export default function FrameNodeAdoptChild() {
  describe('FrameNodeAdoptChild', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.XNode.api20.static", "EntryAbility")
      await UtilsTest.msSleep(1000);
      console.info('beforeAll case');
    });

    beforeEach(async () => {
      console.info('frameNodeApi beforeEach start');
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/FrameNode/FrameNodeAdoptChild',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.pushUrl(options);
        await CommonFunc.sleep(4000);
      } catch (err) {
        console.error('push frameNodeApi page error:' + err);
      }
      console.info('frameNodeApi beforeEach end');
    });

    afterEach(() => {
      console.info('afterEach case');
    });

    afterAll(async () => {
      console.info('afterAll case');
    });
    /**
     * @tc.number FrameNodeAdoptChild_0200
     * @tc.name   FrameNodeAdoptChild_0200
     * @tc.desc   Test FrameNode removeAdoptedChild functionality
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('FrameNodeAdoptChild_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[FrameNodeAdoptChild_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let removeBtn = await driver.findComponent(ON.id('ButtonRemoveAdoptedChild'));
      await CommonFunc.sleep(1000);
      await (removeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('adoptChildResult');
      await CommonFunc.sleep(1000);
      console.info('[FrameNodeAdoptChild_0200] content: ' +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));

      let content = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(content).assertEqual('"adoptChild success"');
      done();
    });
  })
}