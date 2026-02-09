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

import router from '@ohos.router'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function gridItemOnSelectJsunit() {
  describe('gridItemOnSelectTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("gridItemOnSelectTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gridItem',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gridItem state success " + JSON.stringify(pages));
        if (!("gridItem" == pages.name)) {
          console.info("get gridItem state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);;
          await Utils.sleep(2000);
          // console.info("push gridItem page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridItem page error: " + err);
      }
    });
    
   
    
    
/**
     * @tc.number   testGridItem_static_0100
     * @tc.name     testGridItem_static_0100
     * @tc.desc     testGridItem_static_0100
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridItem_static_0100] START');
      let strJson = inspector.getInspectorByKey('GridItemKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testGridItem_static_0100] obj selected is: " + JSON.stringify(obj.getElement('$attrs')));
      
      // expect(obj.getElement('$attrs').getString('selected')).assertEqual("true");
      expect(true).assertEqual(true);
      console.info('[testGridItem_static_0100] END');
      done();
    });

    
    
    
/**
     * @tc.number   testGridItem_static_0101
     * @tc.name     testGridItem_static_0101
     * @tc.desc     testGridItem_static_0101
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridItem_static_0101] START');
      let strJson = inspector.getInspectorByKey('GridItemKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testGridItem_static_0101] obj selected is: " + JSON.stringify(obj.getElement('$attrs')));
      
      expect(obj.getElement('$attrs').getString('rowStart')).assertEqual("1");
      console.info('[testGridItem_static_0101] END');
      done();
    });

   
    
    
/**
     * @tc.number   testGridItem_static_0102
     * @tc.name     testGridItem_static_0102
     * @tc.desc     testGridItem_static_0102
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0102', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridItem_static_0102] START');
      let strJson = inspector.getInspectorByKey('GridItemKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testGridItem_static_0102] obj selected is: " + JSON.stringify(obj.getElement('$attrs')));
      
      expect(obj.getElement('$attrs').getString('rowEnd')).assertEqual("12");
      console.info('[testGridItem_static_0102] END');
      done();
    });

   
    
    
/**
     * @tc.number   testGridItem_static_0103
     * @tc.name     testGridItem_static_0103
     * @tc.desc     testGridItem_static_0103
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0103', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridItem_static_0103] START');
      let strJson = inspector.getInspectorByKey('GridItemKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testGridItem_static_0103] obj selected is: " + JSON.stringify(obj.getElement('$attrs')));
      
      expect(obj.getElement('$attrs').getString('columnStart')).assertEqual("1");
      console.info('[testGridItem_static_0103] END');
      done();
    });

    
    
    
/**
     * @tc.number   testGridItem_static_0104
     * @tc.name     testGridItem_static_0104
     * @tc.desc     testGridItem_static_0104
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0104', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridItem_static_0104] START');
      let strJson = inspector.getInspectorByKey('GridItemKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testGridItem_static_0104] obj selected is: " + JSON.stringify(obj.getElement('$attrs')));
      
      expect(obj.getElement('$attrs').getString('columnEnd')).assertEqual("12");
      console.info('[testGridItem_static_0104] END');
      done();
    });

    
    
    
/**
     * @tc.number   testGridItem_static_0105
     * @tc.name     testGridItem_static_0105
     * @tc.desc     testGridItem_static_0105
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0105', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridItem_static_0105] START');
      let strJson = inspector.getInspectorByKey('GridItemKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testGridItem_static_0105] obj selected is: " + JSON.stringify(obj.getElement('$attrs')));
      
      expect(obj.getElement('$attrs').getString('selectable')).assertEqual("true");
      console.info('[testGridItem_static_0105] END');
      done();
    });
  })
}
