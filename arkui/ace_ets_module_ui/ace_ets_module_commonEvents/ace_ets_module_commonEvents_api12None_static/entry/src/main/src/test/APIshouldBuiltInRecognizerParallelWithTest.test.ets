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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from './Util.test'
export default function APIshouldBuiltInRecognizerParallelWith() {
  describe('APIshouldBuiltInRecognizerParallelWith', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12None.static", "EntryAbility")

    });
    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/APIshouldBuiltInRecognizerParallelWith',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get APIshouldBuiltInRecognizerParallelWith state pages: " + JSON.stringify(pages));
        if (!("APIshouldBuiltInRecognizerParallelWith" == pages.name)) {
          console.info("get APIshouldBuiltInRecognizerParallelWith state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push APIshouldBuiltInRecognizerParallelWith success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIshouldBuiltInRecognizerParallelWith page error: " + err);
        expect().assertFail();
      }
      //done();
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("APIshouldBuiltInRecognizerParallelWith after each called");
    });

    
    

/**
     * @tc.number   APIshouldBuiltInRecognizerParallelWith_static_0100
     * @tc.name     APIshouldBuiltInRecognizerParallelWith_static_0100
     * @tc.desc     APIshouldBuiltInRecognizerParallelWith_static_0100
     * @tc.level    Level.LEVEL0
     */
it('APIshouldBuiltInRecognizerParallelWith_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APIshouldBuiltInRecognizerParallelWith_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('APIshouldBuiltInRecognizerParallelWith_Text01');
      let obj = JSON.parseJsonElement(strJson);
      console.info('APIshouldBuiltInRecognizerParallelWith_static_0100 obj',obj,obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('API_getTag');
      await CommonFunc.sleep(1000);
      console.info('[APIshouldBuiltInRecognizerParallelWith_static_0100] END');
      done();
    });
    
    

/**
     * @tc.number   APIshouldBuiltInRecognizerParallelWith_static_0200
     * @tc.name     APIshouldBuiltInRecognizerParallelWith_static_0200
     * @tc.desc     APIshouldBuiltInRecognizerParallelWith_static_0200
     * @tc.level    Level.LEVEL0
     */
it('APIshouldBuiltInRecognizerParallelWith_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APIshouldBuiltInRecognizerParallelWith_static_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('APIshouldBuiltInRecognizerParallelWith_Text02');
      let obj = JSON.parseJsonElement(strJson);
      console.info('APIshouldBuiltInRecognizerParallelWith_static_0200 obj',obj,obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[APIshouldBuiltInRecognizerParallelWith_static_0200] END');
      done();
    });
    
    

/**
     * @tc.number   APIshouldBuiltInRecognizerParallelWith_static_0300
     * @tc.name     APIshouldBuiltInRecognizerParallelWith_static_0300
     * @tc.desc     APIshouldBuiltInRecognizerParallelWith_static_0300
     * @tc.level    Level.LEVEL0
     */
it('APIshouldBuiltInRecognizerParallelWith_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APIshouldBuiltInRecognizerParallelWith_static_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('APIshouldBuiltInRecognizerParallelWith_Text03');
      let obj = JSON.parseJsonElement(strJson);
      console.info('APIshouldBuiltInRecognizerParallelWith_static_0300 obj',obj,obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('API_getEventTargetInfo');
      await CommonFunc.sleep(1000);
      console.info('[APIshouldBuiltInRecognizerParallelWith_static_0300] END');
      done();
    });
    
    

/**
     * @tc.number   APIshouldBuiltInRecognizerParallelWith_static_0400
     * @tc.name     APIshouldBuiltInRecognizerParallelWith_static_0400
     * @tc.desc     APIshouldBuiltInRecognizerParallelWith_static_0400
     * @tc.level    Level.LEVEL0
     */
it('APIshouldBuiltInRecognizerParallelWith_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APIshouldBuiltInRecognizerParallelWith_static_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('APIshouldBuiltInRecognizerParallelWith_Text04');
      let obj = JSON.parseJsonElement(strJson);
      console.info('APIshouldBuiltInRecognizerParallelWith_static_0400 obj',obj,obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('API_getPanGestureOptions');
      await CommonFunc.sleep(1000);
      console.info('[APIshouldBuiltInRecognizerParallelWith_static_0400] END');
      done();
    });
  })
}
