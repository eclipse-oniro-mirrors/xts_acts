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

export default function idKeyJsunit() {
  describe('idKeyJsunit', () => {
    beforeAll(() => {
      console.info("idKeyJsunit beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("idKey beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/idKey',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get idkey state pages: " + JSON.stringify(pages));
        if (!("idKey" == pages.name)) {
          console.info("get idkey state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push idkey page error: " + err);
      }
    });

    beforeEach(async () => {
      await Utils.sleep(100);
      console.info("idkey before each called");
    })

    
    
/**
     * @tc.number   idkey0001_static
     * @tc.name     idkey0001_static
     * @tc.desc     idkey0001_static
     * @tc.level    Level.LEVEL0
     */
it('idkey0001_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[idkey0001_static] START');
      await Utils.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('testid');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[idkey0001_static] component idkey0001 is: " + JSON.stringify(objNew!.getElement('$attrs')));
      expect(strJsonNew == null).assertFalse()
      done();
    });

    
    
/**
     * @tc.number   idkey0002_static
     * @tc.name     idkey0002_static
     * @tc.desc     idkey0002_static
     * @tc.level    Level.LEVEL0
     */
it('idkey0002_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[idkey0002_static] START');
      await Utils.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('testkey');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[idkey0002_static] component idkey0002 is: " + JSON.stringify(objNew!.getElement('$attrs')));
      expect(strJsonNew == null).assertFalse()
      done();
    });
  })
}