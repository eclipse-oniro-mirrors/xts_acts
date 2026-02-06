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
import { beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector'
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ImageOnErrorTest() {
  describe('ImageOnErrorTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info('ImageOnErrorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageError/ImageOnError',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info('get ImageOnErrorTest state pages:' + JSON.stringify(pages));
        if (!('ImageOnError' == pages.name)) {
          console.info('get ImageOnErrorTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push ImageOnErrorTest page error:' + err);
      }
      console.info('ImageOnErrorTest beforeEach end');
    });


    /**
         * @tc.number   ImageOnErrorTest_static_001
         * @tc.name     ImageOnErrorTest_static_001
         * @tc.desc     ImageOnErrorTest_static_001
         * @tc.level    Level.LEVEL0
         */
    it('ImageOnErrorTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageOnErrorTest_001 START');
      Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('image');
      let obj = JSON.parseJsonElement(strJson);
      Utils.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('componentWidth');
      let obj1 = JSON.parseJsonElement(strJson1);
      Utils.sleep(1000);
      console.info("[ImageOnErrorTest_001] obj.getElement('$attrs').getString('width') is: " + JSON.stringify(obj.getElement('$attrs').getString('width')));
      console.info("[ImageOnErrorTest_001] UIContext.resolveUIContext()!.vp2px(obj1.getElement('$attrs').getString('content')) is: " + UIContext.resolveUIContext()!.px2vp(parseFloat(obj1.getElement('$attrs').getString('content'))));
      let componentWidth = Math.round(UIContext.resolveUIContext()!.px2vp(parseFloat(obj1.getElement('$attrs').getString('content')))) + '.00vp'
      expect(obj.getElement('$attrs').getString('width')).assertEqual(componentWidth);
      let strJson2 = inspector.getInspectorByKey('componentHeight');
      let obj2 = JSON.parseJsonElement(strJson2);
      await Utils.sleep(1000);
      console.info("[ImageOnErrorTest_001] obj.getElement('$attrs').getString('height') is: " + JSON.stringify(obj.getElement('$attrs').getString('height')));
      console.info("[ImageOnErrorTest_001] UIContext.resolveUIContext()!.vp2px(parseFloat(obj2.getElement('$attrs').getString('content'))) is: " + UIContext.resolveUIContext()!.px2vp(parseFloat(obj2.getElement('$attrs').getString('content'))));
      let componentHeight = Math.round(UIContext.resolveUIContext()!.px2vp(parseFloat(obj2.getElement('$attrs').getString('content')))) + '.00vp'
      expect(obj.getElement('$attrs').getString('height')).assertEqual(componentHeight);
      console.info('[ImageOnErrorTest_001] END');
      done();
    });
  })
}
