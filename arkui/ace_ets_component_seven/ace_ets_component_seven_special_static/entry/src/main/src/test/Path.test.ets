'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function pathNewTest() {
  describe('pathNewTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("pathNewTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/path',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get path state success " + JSON.stringify(pages));
        if (!("path" == pages.name)) {
          console.info("get path state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push path page error: " + err);
      }
    });

    
    
/**
     * @tc.number   testPathNe0004
     * @tc.name     testPathNe0004
     * @tc.desc     testPathNe0004
     * @tc.level    Level.LEVEL0
     */
it('testPathNe0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('pathNe testPathNe0004 START');
      let strJson = inspector.getInspectorByKey('PathKey1');
      console.info("[testPathNe0004] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPathNe0004] commands value :" + obj!.getElement('$attrs').getString('commands'));
      expect(obj!.getElement('$attrs').getString('commands')).assertEqual("M100 0 L0 100 L50 200 L150 200 L200 100 Z");
      console.info('pathNe testPathNe0004 END');
      done();
    });

  })
}
