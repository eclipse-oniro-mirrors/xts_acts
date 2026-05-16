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

import { LineCapStyle } from '@ohos.arkui.component'
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

export default function dividerJsunit() {
  describe('dividerTest', () => {
    beforeAll(() => {
      console.info("dividerTest beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("dividerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Divider/Divider',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get divider state success " + "");
        if (!("Divider" == pages.name)) {
          console.info("get divider state success " + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000)
        }
      } catch (err) {
        console.error("push divider page error " + JSON.stringify(err));
      }
      await UtilsTest.msSleep(1000)
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000)
      console.info("Divider after each called");
    });

/**
     * @tc.number   testDividerGetInspectorByKey010_static_01
     * @tc.name     testDividerGetInspectorByKey010_static_01
     * @tc.desc     testDividerGetInspectorByKey010_static_01
     * @tc.level    Level.LEVEL0
     */
it('testDividerGetInspectorByKey010_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDividerGetInspectorByKey010_static_01 START');
      let strJson = inspector.getInspectorByKey('divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("cd divider component obj is: " + JSON.stringify(obj));
     console.log("cd divider type" + JSON.stringify(obj.getString('$type')));
     console.log("cd divider color" + JSON.stringify(obj.getElement('$attrs').getString('color')));
     expect(obj.getString('$type')).assertEqual('Divider')
     expect(obj.getElement('$attrs').getString('color')).assertEqual('#FFFF0000')
     console.info(" divider component obj is: " + JSON.stringify(obj));
     console.log("cd divider strokeWidth" + JSON.stringify(obj.getElement('$attrs').getString('strokeWidth')));
     console.log("cd divider vertical" + JSON.stringify(obj.getElement('$attrs').getString('vertical')));
     console.log("cd divider lineCap" + JSON.stringify(obj.getElement('$attrs').getString('lineCap')));
     expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual("7.00vp")
     expect(obj.getElement('$attrs').getString('vertical')).assertEqual('true')
     expect((obj.getElement('$attrs').getString('lineCap')) == 'LineCapStyle.Square')
      console.info('testDividerGetInspectorByKey010_static_01 END');
      done();
    });

/**
     * @tc.number   testDividerGetInspectorByKey020_static_02
     * @tc.name     testDividerGetInspectorByKey020_static_02
     * @tc.desc     testDividerGetInspectorByKey020_static_02
     * @tc.level    Level.LEVEL0
     */
it('testDividerGetInspectorByKey020_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('divider1');
     let obj = JSON.parseJsonElement(strJson);
     console.info(" divider1 component obj is: " + JSON.stringify(obj));
     console.log("cd divider1 vertical" + JSON.stringify(obj.getElement('$attrs').getString('vertical')));
     console.log("cd divider1 lineCap" + JSON.stringify(obj.getElement('$attrs').getString('lineCap')));
     expect(obj.getElement('$attrs').getString('vertical')).assertEqual('false');
     expect((obj.getElement('$attrs').getString('lineCap')) == 'LineCapStyle.Round');
      console.info('testDividerGetInspectorByKey020_static_02 END');
      done();
    });

/**
     * @tc.number   testDividerGetInspectorByKey030_static_03
     * @tc.name     testDividerGetInspectorByKey030_static_03
     * @tc.desc     testDividerGetInspectorByKey030_static_03
     * @tc.level    Level.LEVEL0
     */
it('testDividerGetInspectorByKey030_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
  try{
    let strJson = inspector.getInspectorByKey('divider2');
     let obj = JSON.parseJsonElement(strJson);
     console.info(" divider2 component obj is: " + JSON.stringify(obj));
     console.log("cd divider2 lineCap" + JSON.stringify(obj.getElement('$attrs').getString('lineCap')));
     expect((obj.getElement('$attrs').getString('lineCap')) == 'LineCapStyle.Square')
      console.info('testDividerGetInspectorByKey030_static_03 END');
      done();
  }
  catch(err) {
    expect().assertFail();
  }
  
    });
  })
}
