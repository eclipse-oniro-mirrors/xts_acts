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

import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../hypium/index'
import router from '@ohos.router'
import Utils from '../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function loadingProgressJsunit() {
  describe('loadingProgress', () => {
    beforeAll(() => {
        console.info("loadingProgress beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("loadingProgress beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/loadingProgress',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get loadingProgress state pages: " + JSON.stringify(pages));
        if (!("checkBox" == pages.name)) {
          console.info("get loadingProgress state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push loadingProgress page error: " + err);
      }
    })

    
    
    
/**
     * @tc.number   ArkUX_Stage_loadingProgress_attrs_static_0100
     * @tc.name     ArkUX_Stage_loadingProgress_attrs_static_0100
     * @tc.desc     ArkUX_Stage_loadingProgress_attrs_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_loadingProgress_attrs_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_loadingProgress_attrs_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_loadingProgress_attrs_static_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_loadingProgress_attrs_static_0100 component obj is: " + JSON.stringify(obj));
          expect(obj.getElement('$attrs').getString('color')).assertEqual("#FF0000FF");
          console.info('ArkUX_Stage_loadingProgress_attrs_static_0100 END ');
        } catch (err) {
          console.info('ArkUX_Stage_loadingProgress_attrs_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

   
    
    
/**
     * @tc.number   ArkUX_Stage_loadingProgress_attrs_static_0101
     * @tc.name     ArkUX_Stage_loadingProgress_attrs_static_0101
     * @tc.desc     ArkUX_Stage_loadingProgress_attrs_static_0101
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_loadingProgress_attrs_static_0101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_loadingProgress_attrs_static_0101 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_loadingProgress_attrs_static_0101');
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_loadingProgress_attrs_static_0101 component obj is: " + JSON.stringify(obj));
          expect(obj.getElement('$attrs').getString('enableLoading')).assertEqual("true");
          console.info('ArkUX_Stage_loadingProgress_attrs_static_0101 END ');
        } catch (err) {
          console.info('ArkUX_Stage_loadingProgress_attrs_static_0101 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}
