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
import router from '@ohos.router';
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function LoadingProgressContentModifier() {
  describe('LoadingProgressContentModifier', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info('LoadingProgressContentModifier beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/LoadingProgressContentModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LoadingProgressContentModifier state pages:" + JSON.stringify(pages));
        if (!("LoadingProgressContentModifier" == pages.name)) {
          console.info("get LoadingProgressContentModifier pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('[wll]pushUrl',options)
          // console.info("push LoadingProgressContentModifier page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push LoadingProgressContentModifier page error: ' + err);
      }

    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('LoadingProgressContentModifier after each called');
    });

    
    /**
     * @tc.number   LoadingProgressContentModifier_static_001
     * @tc.name     LoadingProgressContentModifier_static_001
     * @tc.desc     LoadingProgressContentModifier_static_001
     * @tc.level    Level.LEVEL1
     */
it('LoadingProgressContentModifier_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[LoadingProgressContentModifier_static_001] START');
      let strJson2 = inspector.getInspectorByKey('loadingProgressContentModifierKey01');
      await Utils.sleep(2000);
      let obj1 = JSON.parseJsonElement(strJson2);
      await Utils.sleep(2000);
      console.info('[LoadingProgressContentModifier_static_001] obj1 is: ' + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('config.enableLoading是：true');
      console.info('[LoadingProgressContentModifier_static_001] END');
      done();
    });
  })
}