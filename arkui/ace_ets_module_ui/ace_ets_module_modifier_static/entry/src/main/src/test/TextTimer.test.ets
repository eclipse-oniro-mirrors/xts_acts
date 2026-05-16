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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';

export default function textTimer() {
  describe('textTimerTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("textTimerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textTimer',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textTimer state pages: " + JSON.stringify(pages));
        if (!("textTimer" == pages.name)) {
          console.info("get textTimer state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push textTimer page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   textTimerJsunit_static_0100
     * @tc.name     textTimerJsunit_static_0100
     * @tc.desc     textTimerJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0100 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0100] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
      console.info('textTimerJsunit_static_0100 END');
      done();
    });

    
    
    /**
     * @tc.number   textTimerJsunit_static_0200
     * @tc.name     textTimerJsunit_static_0200
     * @tc.desc     textTimerJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0200 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0200] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFC0CB');
      console.info('textTimerJsunit_static_0200 END');
      done();
    });

    
    
    /**
     * @tc.number   textTimerJsunit_static_0300
     * @tc.name     textTimerJsunit_static_0300
     * @tc.desc     textTimerJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0300 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0300] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('format')).assertEqual('mm:ss.SS');
      console.info('textTimerJsunit_static_0300 END');
      done();
    });

    
    
    /**
     * @tc.number   textTimerJsunit_static_0400
     * @tc.name     textTimerJsunit_static_0400
     * @tc.desc     textTimerJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0400 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0400] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('textTimerJsunit_static_0400 END');
      done();
    });

    
    
    /**
     * @tc.number   textTimerJsunit_static_0500
     * @tc.name     textTimerJsunit_static_0500
     * @tc.desc     textTimerJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0500 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0500] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      console.info('textTimerJsunit_static_0500 END');
      done();
    });

    
    
    /**
     * @tc.number   textTimerJsunit_static_0600
     * @tc.name     textTimerJsunit_static_0600
     * @tc.desc     textTimerJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0600 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0600] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('cursive');
      console.info('textTimerJsunit_static_0600 END');
      done();
    });
    
    
    /**
     * @tc.number   textTimerJsunit_static_0601
     * @tc.name     textTimerJsunit_static_0601
     * @tc.desc     textTimerJsunit_static_0601
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0601', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0601 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)
      let strJsonNew = inspector.getInspectorByKey('TextTimerKey1'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTimerJsunit_static_0601 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontSize')).assertEqual('5.00fp'); //
      console.info('textTimerJsunit_static_0601 END');
      done();
    });
  })
}
