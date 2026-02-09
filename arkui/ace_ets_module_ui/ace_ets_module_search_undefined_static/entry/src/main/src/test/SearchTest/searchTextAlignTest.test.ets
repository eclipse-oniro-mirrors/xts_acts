'use static'
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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component, Driver, ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';


export default function SearchTextAlignTest() {
  describe('SearchTextAlignTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.search.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('SearchTextAlignTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchTextAlign',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get SearchTextAlignTest state pages:' + JSON.stringify(pages));
        if (!('SearchTextAlignTest' == pages.name)) {
          console.info('get SearchTextAlignTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push SearchTextAlignTest page error:' + err);
      }
      console.info('SearchTextAlignTest beforeEach end');
    });

    /**
     * @tc.number    SearchTextAlignTest_static_0100
     * @tc.name      SearchTextAlignTest_static_0100
     * @tc.desc      SearchTextAlignTest_static_0100
     * @tc.level     Level.LEVEL2
     */
    it('SearchTextAlignTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTextAlignTest_static_0100] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();

      let strJson = inspector.getInspectorByKey('isTextAlign');
      console.info('jk,search true value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textAlign')));
      let searchValue1 = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textAlign');
      expect(searchValue1.asString()).assertEqual('TextAlign.Center');

      let isTextAlignButton = await driver.findComponent(ON.id('isTextAlignButton')) as Component;
      await isTextAlignButton.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('isTextAlign');
      console.info('jk,search undefined value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('textAlign')));
      let searchValue2 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('textAlign');
      expect(searchValue2.asString()).assertEqual('TextAlign.Start');
      console.info('[SearchTextAlignTest_static_0100] END');
      done();
    });


  })
}