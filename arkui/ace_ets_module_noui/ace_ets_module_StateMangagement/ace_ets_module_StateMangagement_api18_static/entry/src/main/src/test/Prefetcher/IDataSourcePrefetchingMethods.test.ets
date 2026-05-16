'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
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

export default function IDataSourcePrefetchingMethods() {
  describe('IDataSourcePrefetchingMethods', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility");
      await UtilsTest.msSleep(1000)
      console.info("frameNodeApi IDataSourcePrefetchingMethods start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Prefetcher/IDataSourcePrefetchingMethods',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        routerInstance.pushUrl(options);
        await CommonFunc.sleep(4000);
      } catch (err) {
        console.error("push frameNodeApi page error:" + err);
      }
      console.info("beforeAll case");
    });

    beforeEach(async () => {

      console.info("frameNodeApi beforeEach end");
    });

    afterEach(() => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number IDataSourcePrefetchingPrefetch_0100
     * @tc.name   IDataSourcePrefetchingPrefetch_0100
     * @tc.desc   Test prefetch() method of IDataSourcePrefetching
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('IDataSourcePrefetchingPrefetch_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[IDataSourcePrefetchingPrefetch_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let prefetchBtn = await driver.findComponent(ON.id('ButtonPrefetch'));
      await CommonFunc.sleep(1000);
      await (prefetchBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PrefetchResultShow');
      await CommonFunc.sleep(1000);
      console.info("[IDataSourcePrefetchingPrefetch_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[IDataSourcePrefetchingPrefetch_0100] content: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let content = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(content.indexOf("success") !== -1).assertTrue();
      done();
    });

    /**
     * @tc.number IDataSourcePrefetchingCancel_0100
     * @tc.name   IDataSourcePrefetchingCancel_0100
     * @tc.desc   Test cancel() method of IDataSourcePrefetching
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('IDataSourcePrefetchingCancel_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[IDataSourcePrefetchingCancel_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let cancelBtn = await driver.findComponent(ON.id('ButtonCancel'));
      await CommonFunc.sleep(1000);
      await (cancelBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('CancelResultShow');
      await CommonFunc.sleep(1000);
      console.info("[IDataSourcePrefetchingCancel_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[IDataSourcePrefetchingCancel_0100] content: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let content = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(content.indexOf("success") !== -1).assertTrue();
      done();
    });
  })
}