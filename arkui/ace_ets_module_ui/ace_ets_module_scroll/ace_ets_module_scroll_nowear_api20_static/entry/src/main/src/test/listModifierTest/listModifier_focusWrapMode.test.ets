/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, afterEach, TestType } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../common/Common';
import Utils from '../common/Utils';
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

export default function listModifier_focusWrapMode() {
  describe('listModifier_focusWrapMode', () => {

    beforeAll(async() => {
      console.info('textPickerAlignment beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility')
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('TextPickerPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/listModifier/List_focusWrapMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextPickerPage state pages:' + JSON.stringify(pages));
        if (!('listModifier_focusWrapMode' == pages.name)) {
          console.info('get TextPickerPage pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          // let result = await routerInstance.replaceUrl(options);
          await Utils.sleep(2500);
          // console.info('push TextPickerPage page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerPage page error:' + err);
      }
      console.info('TextPickerPage beforeEach end');
    });

    /**
     * @tc.number   listModifier_focusWrapMode_static_001
     * @tc.name     listModifier_focusWrapMode_static_001
     * @tc.desc     listModifier_focusWrapMode_static_001
     * @tc.level    Level.LEVEL0
     */
    it('listModifier_focusWrapMode_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('list1');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.log(`listModifier_focusWrapMode_static_001 obj : ${strJson}`)
      let obj1 :string = obj.getElement('$attrs').getString('focusWrapMode');
      console.log(`listModifier_focusWrapMode_static_001 obj1 : ${obj1}`)
      expect(obj1).assertEqual('DEFAULT');
      done();
    });
  })
}

