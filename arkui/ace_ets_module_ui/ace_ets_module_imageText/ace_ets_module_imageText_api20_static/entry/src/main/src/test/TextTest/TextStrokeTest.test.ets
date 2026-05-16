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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';

export default function TextStrokeTest() {
  describe('TextStrokeTest', () => {
    beforeAll(() => {
      console.info("TextStrokeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api20.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("TextStrokeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextStrokeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextStrokeTest state success " + JSON.stringify(pages));
        routerInstance.replaceUrl(options);
        if (!("TextStrokeTest" == pages.name)) {
          console.info("get TextStrokeTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextStrokeTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextStrokeTest after each called");
    });

    
    /**
     * @tc.number   TextStrokeTest_static_0001
     * @tc.name     TextStrokeTest_static_0001
     * @tc.desc     TextStrokeTest_static_0001
     * @tc.level   Level.LEVEL3
     */
    it('TextStrokeTest_static_0001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('TextStrokeTest_static_0001 START');
      let getStroke = await driver.findComponent(ON.id('getStroke'))
      await CommonFunc.sleep(500);
      await (getStroke?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get<string>('TextInputStrokeWidth')).assertEqual('0.00px');
      expect(''+AppStorage.get<string>('TextInputStrokeColor')).assertEqual('#FFFFC0CB');
      expect(''+AppStorage.get<string>('TextAreaStrokeWidth')).assertEqual('0.00px');
      expect(''+AppStorage.get<string>('TextAreaStrokeColor')).assertEqual('#FFFFC0CB');
      expect(''+AppStorage.get<string>('SearchStrokeWidth')).assertEqual('0.00px');
      expect(''+AppStorage.get<string>('SearchStrokeColor')).assertEqual('#FFFFC0CB');
      AppStorage.delete('TextInputStrokeWidth')
      AppStorage.delete('TextInputStrokeColor')
      AppStorage.delete('TextAreaStrokeWidth')
      AppStorage.delete('TextAreaStrokeColor')
      AppStorage.delete('SearchStrokeWidth')
      AppStorage.delete('SearchStrokeColor')
      console.info("[TextStrokeTest_static_0001] end");
      done();
    });

    
    /**
     * @tc.number   TextStrokeTest_static_0002
     * @tc.name     TextStrokeTest_static_0002
     * @tc.desc     TextStrokeTest_static_0002
     * @tc.level   Level.LEVEL3
     */
    it('TextStrokeTest_static_0002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('TextStrokeTest_static_0002 START');
      let change = await driver.findComponent(ON.id('changeStroke'))
      await CommonFunc.sleep(500);
      await (change?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      let getStroke = await driver.findComponent(ON.id('getStroke'))
      await CommonFunc.sleep(500);
      await (getStroke?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get<string>('TextInputStrokeWidth')).assertEqual('500.00%');
      expect(''+AppStorage.get<string>('TextInputStrokeColor')).assertEqual('#FFFFC0CB');
      expect(''+AppStorage.get<string>('TextAreaStrokeWidth')).assertEqual('500.00%');
      expect(''+AppStorage.get<string>('TextAreaStrokeColor')).assertEqual('#FFFFC0CB');
      expect(''+AppStorage.get<string>('SearchStrokeWidth')).assertEqual('500.00%');
      expect(''+AppStorage.get<string>('SearchStrokeColor')).assertEqual('#FFFFC0CB');
      AppStorage.delete('TextInputStrokeWidth')
      AppStorage.delete('TextInputStrokeColor')
      AppStorage.delete('TextAreaStrokeWidth')
      AppStorage.delete('TextAreaStrokeColor')
      AppStorage.delete('SearchStrokeWidth')
      AppStorage.delete('SearchStrokeColor')
      console.info("[TextStrokeTest_static_0002] end");
      done();
    });

    
    /**
     * @tc.number   TextStrokeTest_static_0003
     * @tc.name     TextStrokeTest_static_0003
     * @tc.desc     TextStrokeTest_static_0003
     * @tc.level   Level.LEVEL3
     */
    it('TextStrokeTest_static_0003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('TextStrokeTest_static_0003 START');
      let change = await driver.findComponent(ON.id('changeStroke'))
      await CommonFunc.sleep(500);
      await (change?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      await (change?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      let getStroke = await driver.findComponent(ON.id('getStroke'))
      await CommonFunc.sleep(500);
      await (getStroke?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get<string>('TextInputStrokeWidth')).assertEqual('-500.00%');
      expect(''+AppStorage.get<string>('TextInputStrokeColor')).assertEqual('#FF00000A');
      expect(''+AppStorage.get<string>('TextAreaStrokeWidth')).assertEqual('-500.00%');
      expect(''+AppStorage.get<string>('TextAreaStrokeColor')).assertEqual('#FF00000A');
      expect(''+AppStorage.get<string>('SearchStrokeWidth')).assertEqual('-500.00%');
      expect(''+AppStorage.get<string>('SearchStrokeColor')).assertEqual('#FF00000A');
      AppStorage.delete('TextInputStrokeWidth')
      AppStorage.delete('TextInputStrokeColor')
      AppStorage.delete('TextAreaStrokeWidth')
      AppStorage.delete('TextAreaStrokeColor')
      AppStorage.delete('SearchStrokeWidth')
      AppStorage.delete('SearchStrokeColor')
      console.info("[TextStrokeTest_static_0003] end");
      done();
    });
  })
}