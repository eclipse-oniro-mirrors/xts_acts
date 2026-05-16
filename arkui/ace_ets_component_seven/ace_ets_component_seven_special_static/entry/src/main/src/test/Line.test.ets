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

export default function lineNeJsunit() {
  describe('lineNeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("lineNeTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/line',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get line state success " + JSON.stringify(pages));
        if (!("line" == pages.name)) {
          console.info("get line state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push line page error: " + err);
      }
    });

    
    
/**
     * @tc.number   testLineNe00071
     * @tc.name     testLineNe00071
     * @tc.desc     testLineNe00071
     * @tc.level    Level.LEVEL0
     */
it('testLineNe00071', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lineNe testLineNe00071 START');
      let strJson = inspector.getInspectorByKey('LineKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testLineNe00071] obj value :" + obj!.getElement('$attrs'));
      expect(obj!.getElement('$attrs').getArray('startPoint')[0].asDouble()).assertEqual(0);
      console.info('lineNe testLineNe00071 END');
      done();
    });

    
    
/**
     * @tc.number   testLineNe00072
     * @tc.name     testLineNe00072
     * @tc.desc     testLineNe00072
     * @tc.level    Level.LEVEL0
     */
it('testLineNe00072', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lineNe testLineNe00072 START');
      let strJson = inspector.getInspectorByKey('LineKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testLineNe00072] obj value :" + obj!.getElement('$attrs'));
      expect(obj!.getElement('$attrs').getArray('endPoint')[0].asDouble()).assertEqual(200);
      console.info('lineNe testLineNe00072 END');
      done();
    });
  })
}
