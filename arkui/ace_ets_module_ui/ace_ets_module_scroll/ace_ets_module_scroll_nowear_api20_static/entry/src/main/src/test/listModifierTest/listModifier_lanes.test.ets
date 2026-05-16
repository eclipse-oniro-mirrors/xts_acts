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

export default function listModifier_lanes() {
  describe('listModifier_lanes', () => {

    beforeAll(async() => {
      console.info('listModifier_lanes beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility')
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('listModifier_lanes beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/listModifier/listModifier_lanes',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get listModifier_lanes state pages:' + JSON.stringify(pages));
        if (!('listModifier_lanes' == pages.name)) {
          console.info('get listModifier_lanes pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          // let result = await routerInstance.replaceUrl(options);
          await Utils.sleep(2500);
          // console.info('push listModifier_lanes page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push listModifier_lanes page error:' + err);
      }
      console.info('listModifier_lanes beforeEach end');
    });

    /**
     * @tc.number   listModifier_lanes_static_002
     * @tc.name     listModifier_lanes_static_002
     * @tc.desc     listModifier_lanes_static_002
     * @tc.level    Level.LEVEL0
     */
    it('listModifier_lanes_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('list2');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.log(`listModifier_lanes_static_002 obj : ${strJson}`)
      let obj1 :string = obj.getElement('$attrs').getString('lanes');
      console.log(`listModifier_lanes_static_002 obj1 : ${obj1}`)
      expect(obj1).assertEqual('2');
      done();
    });

    /**
     * @tc.number   listModifier_lanes_static_003
     * @tc.name     listModifier_lanes_static_003
     * @tc.desc     listModifier_lanes_static_003
     * @tc.level    Level.LEVEL0
     */
    it('listModifier_lanes_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('list3');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.log(`listModifier_lanes_static_003 obj : ${strJson}`)
      let obj1 :string = obj.getElement('$attrs').getString('lanes');
      console.log(`listModifier_lanes_static_003 obj1 : ${obj1}`)
      expect(obj1).assertEqual('3');
      done();
    });
  })
}