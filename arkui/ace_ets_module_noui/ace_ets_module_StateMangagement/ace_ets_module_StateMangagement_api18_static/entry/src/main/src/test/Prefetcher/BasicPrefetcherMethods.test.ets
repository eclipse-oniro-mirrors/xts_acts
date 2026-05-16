'use static'
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

export default function BasicPrefetcherMethods() {
  describe('BasicPrefetcherMethods', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility");
      await UtilsTest.msSleep(1000)
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Prefetcher/BasicPrefetcherMethods',
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
      console.info("frameNodeApi beforeEach start");
    });

    afterEach(() => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number BasicPrefetcherSetDataSource_0100
     * @tc.name   BasicPrefetcherSetDataSource_0100
     * @tc.desc   Test setDataSource() method of BasicPrefetcher
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BasicPrefetcherSetDataSource_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[BasicPrefetcherSetDataSource_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let setDataSourceBtn = await driver.findComponent(ON.id('ButtonSetDataSource'));
      await CommonFunc.sleep(1000);
      await (setDataSourceBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SetDataSourceResultShow');
      await CommonFunc.sleep(1000);
      console.info("[BasicPrefetcherSetDataSource_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[BasicPrefetcherSetDataSource_0100] content: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let content = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(content.indexOf("success") !== -1).assertTrue();
      done();
    });

    /**
     * @tc.number BasicPrefetcherVisibleAreaChanged_0100
     * @tc.name   BasicPrefetcherVisibleAreaChanged_0100
     * @tc.desc   Test visibleAreaChanged() method of BasicPrefetcher
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BasicPrefetcherVisibleAreaChanged_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[BasicPrefetcherVisibleAreaChanged_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let visibleAreaChangedBtn = await driver.findComponent(ON.id('ButtonVisibleAreaChanged'));
      await CommonFunc.sleep(1000);
      await (visibleAreaChangedBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('VisibleAreaChangedResultShow');
      await CommonFunc.sleep(1000);
      console.info("[BasicPrefetcherVisibleAreaChanged_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[BasicPrefetcherVisibleAreaChanged_0100] content: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let content = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(content.indexOf("0,5") !== -1).assertTrue();
      done();
    });
  })
}