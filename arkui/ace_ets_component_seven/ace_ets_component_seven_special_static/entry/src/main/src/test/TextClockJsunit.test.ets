'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import router from '@ohos.router'
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { MessageManager, Callback } from '../../ets/MainAbility/utils/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'
import Utils from '../../ets/MainAbility/common/Utils';

export default function TextClockJsunit() {
  describe('TextClockJsunit', () => {
    beforeAll(() => {
        console.info("TextClockJsunit beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextClock beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textClockPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClock state pages: " + JSON.stringify(pages));
        if (!("textClockPage" == pages.name)) {
          console.info("get TextClock state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push TextClock page error: " + err);
        expect().assertFail();
      }
    });

  
    
    
/**
     * @tc.number   TextClock_static_0100
     * @tc.name     TextClock_static_0100
     * @tc.desc     TextClock_static_0100
     * @tc.level    Level.LEVEL0
     */
it('TextClock_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextClock_static_0100] START');
      let strJson = inspector.getInspectorByKey('TextClockKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0100] obj :" + obj.getElement('$attrs'));

      expect(obj.getElement('$attrs').getString('format')).assertEqual('hh:mm:ss');

      console.info('[TextClock_static_0100] END');
      done();
    });

   
    
    
/**
     * @tc.number   TextClock_static_0200
     * @tc.name     TextClock_static_0200
     * @tc.desc     TextClock_static_0200
     * @tc.level    Level.LEVEL0
     */
it('TextClock_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextClock_static_0200] START');
      let strJson = inspector.getInspectorByKey('TextClockKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0200] obj :" + obj.getElement('$attrs'));

      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FF123456');
      console.info('[TextClock_static_0200] END');
      done();
    });

  
    
    
/**
     * @tc.number   TextClock_static_0300
     * @tc.name     TextClock_static_0300
     * @tc.desc     TextClock_static_0300
     * @tc.level    Level.LEVEL0
     */
it('TextClock_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextClock_static_0300] START');
      let strJson = inspector.getInspectorByKey('TextClockKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0300] obj :" + obj.getElement('$attrs'));

      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('15.00fp');
      console.info('[TextClock_static_0400] END');
      done();
    });

   
    
    
/**
     * @tc.number   TextClock_static_0400
     * @tc.name     TextClock_static_0400
     * @tc.desc     TextClock_static_0400
     * @tc.level    Level.LEVEL0
     */
it('TextClock_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextClock_static_0400] START');
      let strJson = inspector.getInspectorByKey('TextClockKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0400] obj :" + obj.getElement('$attrs'));

      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');

      console.info('[TextClock_static_0400] END');
      done();
    });

   
    
    
/**
     * @tc.number   TextClock_static_0500
     * @tc.name     TextClock_static_0500
     * @tc.desc     TextClock_static_0500
     * @tc.level    Level.LEVEL0
     */
it('TextClock_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextClock_static_0500] START');
      let strJson = inspector.getInspectorByKey('TextClockKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0500] obj :" + obj.getElement('$attrs'));

      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      console.info('[TextClock_static_0500] END');
      done();
    });

   
    
    
/**
     * @tc.number   TextClock_static_0600
     * @tc.name     TextClock_static_0600
     * @tc.desc     TextClock_static_0600
     * @tc.level    Level.LEVEL0
     */
it('TextClock_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextClock_static_0600] START');
      let strJson = inspector.getInspectorByKey('TextClockKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0600] obj :" + obj.getElement('$attrs'));

      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('cursive');
      console.info('[TextClock_static_0600] END');
      done();
    });

  })
}
