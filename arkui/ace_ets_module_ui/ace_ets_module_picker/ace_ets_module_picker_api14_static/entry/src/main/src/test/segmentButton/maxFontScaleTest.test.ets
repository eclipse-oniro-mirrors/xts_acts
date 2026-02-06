'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size,afterEach, TestType } from '../../../../hypium/index';
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

export default function maxFontScaleTest() {
  describe('maxFontScaleTest', () => {

    beforeAll(() => {
      console.info("TextPickerTextStyle beforeAll start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('maxFontScaleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButton/maxFontScaleTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get maxFontScaleTest state pages:' + JSON.stringify(pages));
        if (!('maxFontScaleTest' == pages.name)) {
          console.info('get maxFontScaleTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push maxFontScaleTest page error:' + err); 
      }
      console.info('maxFontScaleTest beforeEach end');
    });
    afterEach(async () => {
    });

    
    
    
    
    /**
     * @tc.number   maxFontScaleTest_static_0100
     * @tc.name     maxFontScaleTest_static_0100
     * @tc.desc     maxFontScaleTest_static_0100
     * @tc.level    Level.LEVEL3
     */
it('maxFontScaleTest_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {

     console.info('[maxFontScaleTest_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text = inspector.getInspectorByKey('text');
      console.info("[maxFontScaleTest_static_0100] JSON.parseJsonElement(text) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(text)));
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('maxFontScale: 2');
      console.info('[maxFontScaleTest_static_0100] END');
      done();
    });
  })
}