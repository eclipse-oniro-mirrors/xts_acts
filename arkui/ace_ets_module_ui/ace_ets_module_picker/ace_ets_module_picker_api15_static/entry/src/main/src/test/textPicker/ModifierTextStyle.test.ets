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

import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';


export default function ModifierTextStyleTest() {
  describe('ModifierTextStyleTest', () => {

    beforeAll(() => {
      console.info("ModifierTextStyleTest beforeAll start");
      await UtilsTest.startAbility("com.open.harmony.picker.api15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/modifierTextStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ModifierTextStyleTest state success ' + JSON.stringify(pages));
        if (!('modifierTextStyle' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
          await UtilsTest.msSleep(2000)
          
        }
      } catch (err) {
        console.error('push ModifierTextStyleTest page error ' + JSON.stringify(err));
      }
    });
    
    
    
    
    /**
     * @tc.number   ModifierTextStyleTest_static_0100
     * @tc.name     ModifierTextStyleTest_static_0100
     * @tc.desc     ModifierTextStyleTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ModifierTextStyleTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('ModifierTextStyleTest_static_0100 start');
      let strJson = inspector.getInspectorByKey('modifierDefaultTextStyle');
      console.info('[ModifierTextStyleTest_static_0100]:' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ModifierTextStyleTest_static_0100 obj $attrs]:' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.info('[ModifierTextStyleTest_static_0100 obj $attrs.defaultTextStyle]:' + JSON.stringify(obj.getElement('$attrs').getElement('defaultTextStyle')));
      console.info('[ModifierTextStyleTest_static_0100 obj $attrs.defaultTextStyle.minFontSize:' + obj.getElement('$attrs').getElement('defaultTextStyle').getString('minFontSize'));
      console.info('[ModifierTextStyleTest_static_0100 obj $attrs.defaultTextStyle.maxFontSize:' + obj.getElement('$attrs').getElement('defaultTextStyle').getString('maxFontSize'));
      console.info('[ModifierTextStyleTest_static_0100 obj $attrs.defaultTextStyle.overflow:' + obj.getElement('$attrs').getElement('defaultTextStyle').getString('overflow'));
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('minFontSize')).assertEqual('28.00fp');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('maxFontSize')).assertEqual('18.00fp');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
      await CommonFunc.sleep(1000);
      console.info('[ModifierTextStyleTest_static_0100] END');
      done();
    });
  })
}
