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

export default function SliderBlockColorTest() {
  describe('sliderBlockColorTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeAll(() => {
      console.info("sliderBlockColorTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("sliderBlockColorTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get sliderBlockColorTest state pages:" + JSON.stringify(pages));
        if (!("sliderBlockColor" == pages.name)) {
          console.info("get  sliderBlockColorTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/slider/sliderBlockColor',
          })
        }
      } catch (err) {
        console.error("push SliderBlockColorTest page error:" + err);
      }
      console.info("SliderBlockColorTest foreEach end");
    });

    /**
     * @tc.number   SliderBlockColorTest_static_0100
     * @tc.name     SliderBlockColorTest_static_0100
     * @tc.desc     Test the blockColor interface
     * @tc.level    LEVEL2
     */
    it('SliderBlockColorTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'SliderBlockColorTest_static_0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('slider001');
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs').getString('linerGradientBlockColor');
      console.info('SliderBlockColorTest_static_0100 content:'+ obj);
      let colorStr = JSON.parseJsonElement(obj)[0].getString('color');
      let colorStr1 = JSON.parseJsonElement(obj)[1].getString('color');
      console.info('SliderBlockColorTest_static_0100 content:'+ JSON.stringify(colorStr));
      console.info('SliderBlockColorTest_static_0100 content:'+ JSON.stringify(colorStr1));
      expect(JSON.parseJsonElement(obj)[0].getString('color')).assertEqual('#FF0A0A0A');
      expect(JSON.parseJsonElement(obj)[0].getString('offset')).assertEqual('0.000000');
      expect(JSON.parseJsonElement(obj)[1].getString('color')).assertEqual('#FFFF0000');
      expect(JSON.parseJsonElement(obj)[1].getString('offset')).assertEqual('1.000000');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.number   SliderBlockColorTest_static_0200
     * @tc.name     SliderBlockColorTest_static_0200
     * @tc.desc     Test the blockColor interface
     * @tc.level    LEVEL2
     */
    it('SliderBlockColorTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'SliderBlockColorTest_static_0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('slider002');
      let obj = JSON.parseJsonElement(strJson);
      let colorStr = obj.getElement('$attrs').getString('linerGradientBlockColor');
      console.info('SliderBlockColorTest_static_0200 content:'+ JSON.stringify(colorStr));
      expect(colorStr).assertEqual('#FFFFC0CB');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.number   SliderBlockColorTest_static_0300
     * @tc.name     SliderBlockColorTest_static_0300
     * @tc.desc     Test the blockColor interface
     * @tc.level    LEVEL2
     */
    it('SliderBlockColorTest_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'SliderBlockColorTest_static_0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('slider003');
      let obj = JSON.parseJsonElement(strJson);
      let colorStr = obj.getElement('$attrs').getString('linerGradientBlockColor');
      console.info('SliderBlockColorTest_static_0300 content:'+ JSON.stringify(colorStr));
      expect(colorStr).assertEqual('#FFFFFFFF');
      console.info('[' + tagName + '] END============================');
      done();
    });
  });
}