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

import events_emitter from '@ohos.events.emitter';
import { Color,$r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType } from '../../../../hypium/index';
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
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function SliderTest() {
  describe('SliderTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeAll(() => {
      console.info("SliderTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("SliderTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SliderTest state pages:" + JSON.stringify(pages));
        if (!("slider" == pages.name)) {
          console.info("get  SliderTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/slider/slider',
          })
        }
      } catch (err) {
        console.error("push SliderTest page error:" + err);
      }
      console.info("SliderTest foreEach end");
    });

    /**
     * @tc.number   SliderTest_static_0100
     * @tc.name     SliderTest_static_0100
     * @tc.desc     Test the prefix and suffix interface
     * @tc.level    LEVEL2
     */
    it('SliderTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'SliderTest_static_0100';
      console.info('[' + tagName + '] START============================');
      let preStr = inspector.getInspectorByKey("buildTest1");
      let preObj = JSON.parseJsonElement(preStr).getElement('$attrs').getString('content');
      console.info('SliderTest_static_0100 prefix content:'+ JSON.stringify(preObj));
      expect(preObj).assertEqual('message1');
      let sufStr = inspector.getInspectorByKey("buildTest2");
      let sufObj = JSON.parseJsonElement(sufStr).getElement('$attrs').getString('content');
      console.info('SliderTest_static_0100 suffix content:'+ JSON.stringify(sufObj));
      expect(sufObj).assertEqual('');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.number   SliderTest_static_0200
     * @tc.name     SliderTest_static_0200
     * @tc.desc     Test the prefix and suffix interface
     * @tc.level    LEVEL2
     */
    it('SliderTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'SliderTest_static_0200';
      console.info('[' + tagName + '] START============================');
      let preStr = inspector.getInspectorByKey("buildTest3");
      let preObj = JSON.parseJsonElement(preStr).getElement('$attrs').getString('content');
      console.info('SliderTest_static_0100 prefix content:'+ JSON.stringify(preObj));
      expect(preObj).assertEqual('😎😌👨‍👩‍👦‍👦👨👨‍👩‍👦‍👦👁‍🗨123');
      let sufStr = inspector.getInspectorByKey("buildTest4");
      let sufObj = JSON.parseJsonElement(sufStr).getElement('$attrs').getString('content');
      console.info('SliderTest_static_0100 suffix content:'+ JSON.stringify(sufObj));
      expect(sufObj).assertEqual('12');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.number   SliderTest_static_0300
     * @tc.name     SliderTest_static_0300
     * @tc.desc     Test the prefix and suffix interface
     * @tc.level    LEVEL2
     */
    it('SliderTest_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'SliderTest_static_0300';
      console.info('[' + tagName + '] START============================');
      let preStr = inspector.getInspectorByKey("buildTest5");
      let preObj = JSON.parseJsonElement(preStr).getElement('$attrs').getString('content');
      console.info('SliderTest_static_0100 prefix content:'+ JSON.stringify(preObj));
      expect(preObj).assertEqual('message5');
      let sufStr = inspector.getInspectorByKey("buildTest6");
      let sufObj = JSON.parseJsonElement(sufStr).getElement('$attrs').getString('content');
      console.info('SliderTest_static_0100 suffix content:'+ JSON.stringify(sufObj));
      expect(sufObj).assertEqual('message6');
      console.info('[' + tagName + '] END============================');
      done();
    });
  });
}