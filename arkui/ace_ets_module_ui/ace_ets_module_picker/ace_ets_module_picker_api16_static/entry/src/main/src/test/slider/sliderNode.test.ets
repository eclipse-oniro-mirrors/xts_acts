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

export default function sliderNodeTest() {
  describe('sliderNodeTest', () => {
    beforeAll(() => {
      console.info("sliderNodeTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.picker.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("sliderNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/slider/sliderNode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get sliderNodeTest state pages:" + JSON.stringify(pages));
        if (!("sliderNode" == pages.name)) {
          console.info("get sliderNodeTest pages.name:" + '');
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push sliderNodeTest page error:" + err);
      }
      console.info("sliderNodeTest beforeEach end");
    }); 


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('sliderNode after each called');
    })
   
    
    


/**
     * @tc.number   sliderNode_static_0100
     * @tc.name     sliderNode_static_0100
     * @tc.desc     sliderNode_static_0100
     * @tc.level    Level.LEVEL1
     */
it('sliderNode_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
   // 受注释代码影响

      let tagName = 'sliderNode_static_0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_Slider_001');
      console.info('[' + tagName + '] Search is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew).getString('$type')));
      expect(JSON.parseJsonElement(strJsonNew).getString('$type')).assertEqual('Slider');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
