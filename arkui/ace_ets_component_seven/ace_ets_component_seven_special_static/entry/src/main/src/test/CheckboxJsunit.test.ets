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

export default function checkboxJsunit() {
  describe('checkboxJsunit', () => {
    beforeAll(() => {
      console.info("checkboxJsunit beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("checkboxJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkbox',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get checkBox state pages: " + JSON.stringify(pages));
        if (!("checkBox" == pages.name)) {
          console.info("get checkBox state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);;
          await Utils.sleep(2000);
          // console.info("push checkBox page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push checkBox page error: " + err);
      }
    })

   
    
    
/**
     * @tc.number   ArkUX_Stage_Checkbox_static_0100
     * @tc.name     ArkUX_Stage_Checkbox_static_0100
     * @tc.desc     ArkUX_Stage_Checkbox_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Checkbox_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Checkbox_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('Checkbox_0100');
          console.info("ArkUX_Stage_Checkbox_static_0100 component strJson is: " + strJson);
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Checkbox_static_0100 component obj is: " + JSON.stringify(obj));
          expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('mark')).getString('size')).assertEqual('50.00vp');
          console.info('ArkUX_Stage_Checkbox_static_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    
/**
     * @tc.number   ArkUX_Stage_Checkbox_static_0400
     * @tc.name     ArkUX_Stage_Checkbox_static_0400
     * @tc.desc     ArkUX_Stage_Checkbox_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Checkbox_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Checkbox_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('Checkbox_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Checkbox_static_0400 component obj is: " + JSON.stringify(obj));
          expect(obj.getElement('$attrs').getString('unselectedColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Checkbox_static_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    
    
/**
     * @tc.number   ArkUX_Stage_Checkbox_static_0300
     * @tc.name     ArkUX_Stage_Checkbox_static_0300
     * @tc.desc     ArkUX_Stage_Checkbox_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Checkbox_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Checkbox_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('Checkbox_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Checkbox_static_0300 component obj is: " + JSON.stringify(obj));

          expect(obj.getElement('$attrs').getString('select')).assertEqual("false");

          console.info('ArkUX_Stage_Checkbox_static_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

   
    
    
/**
     * @tc.number   ArkUX_Stage_Checkbox_attrs_static_0200
     * @tc.name     ArkUX_Stage_Checkbox_attrs_static_0200
     * @tc.desc     ArkUX_Stage_Checkbox_attrs_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Checkbox_attrs_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Checkbox_attrs_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('Checkbox_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Checkbox_static_attrs_0200 component obj is: " + JSON.stringify(obj));
          expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual("#FFED6F21");
          console.info('ArkUX_Stage_Checkbox_attrs_static_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_attrs_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}
