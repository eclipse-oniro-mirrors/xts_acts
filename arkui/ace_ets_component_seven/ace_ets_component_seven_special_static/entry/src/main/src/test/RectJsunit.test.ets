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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function rectJsunit() {
  describe('ActsAcerectTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("ActsAcerectTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/rect',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get rect state success " + JSON.stringify(pages));
        if (!("rect" == pages.name)) {
          console.info("get rect state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push rect page error: " + err);
      }
    });

    
    
/**
     * @tc.number   testrect_radiusHeight_static_01
     * @tc.name     testrect_radiusHeight_static_01
     * @tc.desc     testrect_radiusHeight_static_01
     * @tc.level    Level.LEVEL0
     */
it('testrect_radiusHeight_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testrect_radiusHeight] START');
      let strJson = inspector.getInspectorByKey('Rect1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testrect_radiusHeight] obj is : " + JSON.stringify(obj!.getElement('$attrs')));
      let strJson1 = inspector.getInspectorByKey('Rect11');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testrect_radiusHeight] obj1 is : " + JSON.stringify(obj1!.getElement('$attrs')));
      //json返回值与设置值不统一，所以使用与原生返回做对比验证
      expect(obj!.getElement('$attrs').getDouble('radiusHeight')).assertEqual(obj1!.getElement('$attrs').getDouble('radiusHeight'));

      console.info('[testrect_radiusHeight] END');
      done();
    });

    
    
/**
     * @tc.number   testrect_radius_static_02
     * @tc.name     testrect_radius_static_02
     * @tc.desc     testrect_radius_static_02
     * @tc.level    Level.LEVEL0
     */
it('testrect_radius_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testrect_radius] START');
      let strJson = inspector.getInspectorByKey('Rect2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testrect_radius] obj2 is : " + JSON.stringify(obj!.getElement('$attrs')));
      let strJson1 = inspector.getInspectorByKey('Rect22');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testrect_radius] obj22 is : " + JSON.stringify(obj1!.getElement('$attrs')));
      console.info("[testrect_radius] obj radius is : " + JSON.stringifyJsonElement(obj!.getElement('$attrs').getElement('radius')));
      console.info("[testrect_radius] obj1 radius is : " + JSON.stringifyJsonElement(obj1!.getElement('$attrs').getElement('radius')));
      //json返回值与设置值不统一，所以使用与原生返回做对比验证
      expect(obj!.getElement('$attrs').getBoolean('radius')).assertEqual(obj1!.getElement('$attrs').getBoolean('radius'));
      console.info('[testrect_radius] END');
      done();
    });

    
    
/**
     * @tc.number   testrect_radiusWidth_static_03
     * @tc.name     testrect_radiusWidth_static_03
     * @tc.desc     testrect_radiusWidth_static_03
     * @tc.level    Level.LEVEL0
     */
it('testrect_radiusWidth_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testrect_radiusWidth] START');
      let strJson = inspector.getInspectorByKey('Rect3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testrect_radiusWidth] obj is : " + JSON.stringify(obj!.getElement('$attrs')));
      let strJson1 = inspector.getInspectorByKey('Rect33');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testrect_radiusWidth] obj1 is : " + JSON.stringify(obj1!.getElement('$attrs')));

      //json返回值与设置值不统一，所以使用与原生返回做对比验证
      expect(obj!.getElement('$attrs').getDouble('radiusWidth')).assertEqual(obj1.getElement('$attrs').getDouble('radiusWidth'));
      console.info('[testrect_radiusWidth] END');
      done();
    });

  })
}
