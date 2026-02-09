'use static';
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

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function selectNodeTest() {
  describe('selectNodeTest', () => {
    beforeAll(() => {
      console.info("selectNodeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('selectNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/selectNode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get selectNode state pages: ' + JSON.stringify(pages));
        if (!('selectNode' == pages.name)) {
          console.info('get selectNode pages.name: ' + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push selectNode page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('selectNode beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('selectNode after each called');
    })
   
    
    
/**
     * @tc.number   selectNode_static_0100
     * @tc.name     selectNode_static_0100
     * @tc.desc     selectNode_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('selectNode_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectNode0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_Select_001');
      console.info('[' + tagName + '] Search is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew).getString('$type')));
      expect(JSON.parseJsonElement(strJsonNew).getString('$type')).assertEqual('Select');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
