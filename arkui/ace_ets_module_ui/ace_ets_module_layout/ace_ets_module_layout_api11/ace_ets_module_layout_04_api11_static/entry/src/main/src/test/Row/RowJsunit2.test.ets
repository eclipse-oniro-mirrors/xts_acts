'use static';
/**
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level} from "../../../../hypium/index"
import router from '@ohos.router';

import Utils from '../Utils.test';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function rowJsunit2() {
  describe('rowJsunit2', () => {
    beforeAll(() => {
      console.info("rowJsunit2 beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("rowJsunit2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/row2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get row state success " + "");
        if (!("row2" == pages.name)) {
          console.info("get row state success " + "");
          
          routerInstance.pushUrl(options);
          await Utils.sleep(4000);
          
        }
      } catch (err) {
        console.error("push row page error " + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("row after each called");
    });

    
    

/**
     * @tc.number   testRow_static_100
     * @tc.name     testRow_static_100
     * @tc.desc     testRow_static_100
     * @tc.level    Level.LEVEL0
     */
it('testRow_static_100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRow_static_100] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('Row');
     let obj = JSON.parseJsonElement(strJson);
     console.info("testRow_static_100 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.Center");
      console.info('testRow_static_100 END');
      done();
    });

    
    

/**
     * @tc.number   testRow_static_200
     * @tc.name     testRow_static_200
     * @tc.desc     testRow_static_200
     * @tc.level    Level.LEVEL0
     */
it('testRow_static_200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRow_static_200] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('Row');
     let obj = JSON.parseJsonElement(strJson);
     console.info("testRow_static_200 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('direction')).assertEqual("Direction.Auto");
      console.info('testRow_static_200 END');
      done();
    });

    
    

/**
     * @tc.number   testRow_static_300
     * @tc.name     testRow_static_300
     * @tc.desc     testRow_static_300
     * @tc.level    Level.LEVEL0
     */
it('testRow_static_300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRow_static_300] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('Row');
     let obj = JSON.parseJsonElement(strJson);
     console.info("testRow_static_300 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('width')).assertEqual("90.00%");
      console.info('testRow_static_300 END');
      done();
    });

    
    

/**
     * @tc.number   testRow_static_400
     * @tc.name     testRow_static_400
     * @tc.desc     testRow_static_400
     * @tc.level    Level.LEVEL0
     */
it('testRow_static_400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRow_static_400] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('Row');
     let obj = JSON.parseJsonElement(strJson);
     console.info("testRow_static_400 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('alignSelf')).assertEqual("ItemAlign.Auto");
      console.info('testRow_static_400 END');
      done();
    });

    
    

/**
     * @tc.number   testRow_static_500
     * @tc.name     testRow_static_500
     * @tc.desc     testRow_static_500
     * @tc.level    Level.LEVEL0
     */
it('testRow_static_500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRow_static_500] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('Row');
     let obj = JSON.parseJsonElement(strJson);
     console.info("testRow_static_500 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('height')).assertEqual("107.00vp");
      console.info('testRow_static_500 END');
      done();
    });

    
    

/**
     * @tc.number   testRow_static_600
     * @tc.name     testRow_static_600
     * @tc.desc     testRow_static_600
     * @tc.level    Level.LEVEL0
     */
it('testRow_static_600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRow_static_600] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('Row');
     let obj = JSON.parseJsonElement(strJson);
     console.info("testRow_static_600 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('borderStyle')).assertEqual("BorderStyle.Solid");
      console.info('testRow_static_600 END');
      done();
    });
  })
}