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

import { afterEach, beforeEach, describe, expect, it, beforeAll,Level } from '../../../../hypium/index';
import router from '@ohos.router';

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

export default function flexJsunit() {
  describe('flexTest', () => {
    beforeAll(() => {
      console.info("flexTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Flex',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await UtilsTest.msSleep(1000)
        let pages = routerInstance.getState();
        console.info("get Flex state success " + "");
        if (!("Flex" == pages.name)) {
          console.info("get Flex state success " + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000)
        }
      } catch (err) {
        console.error("push Flex page error " + JSON.stringify(err));
      }
      await UtilsTest.msSleep(2000)
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000)
      console.info("Flex after each called");
    });
    
    
    

/**
     * @tc.number   testFlex010_static_01
     * @tc.name     testFlex010_static_01
     * @tc.desc     testFlex010_static_01
     * @tc.level    Level.LEVEL0
     */
it('testFlex010_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testFlex010_static_01 START');
      let strJson = inspector.getInspectorByKey('flex');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getString('$type')).assertEqual('Flex');
     console.info("yr Flex0 type: " + JSON.stringify(obj.getString('$type')));
     expect(obj.getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Column');
     console.log("yr flex0 obj.$attrs.constructor.direction-'FlexDirection.Column':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('direction')));
     expect(obj.getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
     console.log("yr flex0 obj.$attrs.constructor.wrap-'FlexWrap.NoWrap':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('wrap')));
     expect(obj.getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Center');
     console.log("yr flex0 obj.$attrs.constructor.alignItems-'FlexWrap.NoWrap':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('alignItems')));
     console.log("yr flex0 obj.$attrs.constructor.justifyContent-'FlexAlign.Center':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('justifyContent')));
     expect(obj.getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Start");
     console.log("yr flex0 obj.$attrs.constructor.alignContent-'FlexAlign.Start':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('alignContent')));
      console.info('testFlex010_static_01 END');
      done();
    });

    
    
    

/**
     * @tc.number   testFlex020_static_02
     * @tc.name     testFlex020_static_02
     * @tc.desc     testFlex020_static_02
     * @tc.level    Level.LEVEL0
     */
it('testFlex020_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testFlex020_static_02 START');
      let strJson = inspector.getInspectorByKey('flex1');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
     console.log("yr flex1 direction-'FlexDirection.Row':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('direction')));
     expect(obj.getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');
     console.log("yr flex1 wrap-'FlexWrap.Wrap':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('wrap')));
     console.log("yr flex1 alignItems-'ItemAlign.Start':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('alignItems')));
     expect(obj.getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
     console.log("yr flex1 justifyContent-'FlexAlign.Start':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('justifyContent')));
     expect(obj.getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Center");
     console.log("yr flex1 obj.$attrs.constructor.alignContent-'FlexAlign.Center':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('alignContent')));
      console.info('testFlex020_static_02 END');
      done();
    });

    
    
    

/**
     * @tc.number   testFlex030_static_03
     * @tc.name     testFlex030_static_03
     * @tc.desc     testFlex030_static_03
     * @tc.level    Level.LEVEL0
     */
it('testFlex030_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new Flex2 START');
      let strJson = inspector.getInspectorByKey('flex2');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.RowReverse');
     console.log("yr flex2 direction-'FlexDirection.RowReverse':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('direction')));
     console.log("yr flex1 alignItems-'ItemAlign.Start':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('alignItems')));
     expect(obj.getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.End');
     console.log("yr flex2 justifyContent-'FlexAlign.End':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('justifyContent')));
     expect(obj.getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.End");
     console.log("yr flex2 alignContent-'FlexAlign.End':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('alignContent')));
      console.info('new Flex2 END');
      done();
    });

    
    
    

/**
     * @tc.number   testFlex040_static_04
     * @tc.name     testFlex040_static_04
     * @tc.desc     testFlex040_static_04
     * @tc.level    Level.LEVEL0
     */
it('testFlex040_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testFlex040_static_04 START');
      let strJson = inspector.getInspectorByKey('flex3');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     console.log("yr flex3 direction-'FlexDirection.ColumnReverse':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('direction')));
     expect(obj.getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceBetween');
     console.log("yr flex3 justifyContent-'FlexAlign.SpaceBetween':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('justifyContent')));
      console.info('testFlex040_static_04 END');
      done();
    });

    
    
    

/**
     * @tc.number   testFlex050_static_05
     * @tc.name     testFlex050_static_05
     * @tc.desc     testFlex050_static_05
     * @tc.level    Level.LEVEL0
     */
it('testFlex050_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testFlex050_static_05 START');
      let strJson = inspector.getInspectorByKey('flex4');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceEvenly');
     console.log("yr flex4 obj.$attrs.justifyContent-'FlexAlign.SpaceEvenly':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('justifyContent')));
     expect(obj.getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.SpaceEvenly");
     console.log("yr flex4 obj.$attrs.constructor.alignContent-'FlexAlign.SpaceEvenly':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('alignContent')));
      console.info('testFlex050_static_05 END');
      done();
    });

    
    
    

/**
     * @tc.number   testFlex060_static_06
     * @tc.name     testFlex060_static_06
     * @tc.desc     testFlex060_static_06
     * @tc.level    Level.LEVEL0
     */
it('testFlex060_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testFlex060_static_06 START');
      let strJson = inspector.getInspectorByKey('flex5');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceAround');
     console.log("yr flex5 obj.$attrs.constructor.justifyContent-'FlexAlign.SpaceAround':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('justifyContent')));
     expect(obj.getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.SpaceAround");
     console.log("yr flex5 obj.$attrs.constructor.alignContent-'FlexAlign.SpaceAround':" + JSON.stringify(obj.getElement('$attrs').getElement('constructor').getString('alignContent')));
      console.info('testFlex060_static_06 END');
      done();
    });
  })
}
