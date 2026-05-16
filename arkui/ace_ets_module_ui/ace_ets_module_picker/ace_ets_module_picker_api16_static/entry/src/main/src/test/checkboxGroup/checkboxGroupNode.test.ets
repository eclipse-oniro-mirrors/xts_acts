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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'

export default function checkboxGroupNodeTest() {
  describe('checkboxGroupNodeTest', () => {
    beforeAll(() => {
      console.info("checkboxGroupNodeTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.picker.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("checkboxGroupNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/checkboxGroup/checkboxGroupNode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get checkboxGroupNodeTest state pages:" + JSON.stringify(pages));
        if (!("checkboxGroupNode" == pages.name)) {
          console.info("get checkboxGroupNodeTest pages.name:" + '');
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push checkboxGroupNodeTest page error:" + err);
      }
      console.info("checkboxGroupNodeTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('checkboxGroupNode after each called');
    })
   
    
    


/**
     * @tc.number   checkboxGroupNode_static_0100
     * @tc.name     checkboxGroupNode_static_0100
     * @tc.desc     checkboxGroupNode_static_0100
     * @tc.level    Level.LEVEL1
     */
it('checkboxGroupNode_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {


      let tagName = 'checkboxGroupNode_static_0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_checkboxGroup_001');
      console.info('[' + tagName + '] Search is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew).getString('$type')));
      expect(JSON.parseJsonElement(strJsonNew).getString('$type')).assertEqual('CheckboxGroup');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
