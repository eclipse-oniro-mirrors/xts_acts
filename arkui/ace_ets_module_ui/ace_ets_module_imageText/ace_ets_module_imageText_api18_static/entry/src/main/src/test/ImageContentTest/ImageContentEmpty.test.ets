'use static';
/**
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
import { describe, beforeEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector'
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function ImageContentEmptyTest() {
  describe('ImageContentEmptyTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info('ImageContentEmptyTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageContent/ImageContentEmpty',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info('get ImageContentEmptyTest state pages:' + JSON.stringify(pages));
        if (!('ImageContentEmpty' == pages.name)) {
          console.info('get ImageContentEmptyTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push ImageContentEmptyTest page error:' + err);
      }
      console.info('ImageContentEmptyTest beforeEach end');
    });
    
    
    /**
     * @tc.number   ImageContentEmptyTest_static_001
     * @tc.name     ImageContentEmptyTest_static_001
     * @tc.desc     ImageContentEmptyTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('ImageContentEmptyTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('ImageContentEmptyTest_001 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('image');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info("[ImageContentEmptyTest_001] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('src')).assertEqual('');
      console.info('[ImageContentEmptyTest_001] END');
      done();
    });
  })
}
