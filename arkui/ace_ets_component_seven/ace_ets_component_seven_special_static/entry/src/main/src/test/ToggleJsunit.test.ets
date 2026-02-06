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
import Utils from '../../ets/MainAbility/common/Utils';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { MessageManager, Callback } from '../../ets/MainAbility/common/MessageManager';

export default function toggleJsunit() {
  describe('ToggleJsunit', () => {
    beforeAll(() => {
      console.info("ToggleJsunit beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Toggle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/toggle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Toggle state pages: " + JSON.stringify(pages));
        if (!("toggle" == pages.name)) {
          console.info("get Toggle state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push Toggle page error: " + err);
        expect().assertFail();
      }
    });

    
    
/**
     * @tc.number   ToggleJsunit001
     * @tc.name     ToggleJsunit001
     * @tc.desc     ToggleJsunit001
     * @tc.level    Level.LEVEL0
     */
it('ToggleJsunit001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ToggleJsunit001] START');
      let strJson = inspector.getInspectorByKey('toggleCheckbox');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ToggleJsunit001] obj: " + JSON.stringify(obj!.getElement('$attrs')));

      expect(obj!.getElement('$attrs').getString('selectedColor')).assertEqual('#FF0000FF');
      console.info('[ToggleJsunit001] END');
      done();
    });

    
    
/**
     * @tc.number   ToggleJsunit002
     * @tc.name     ToggleJsunit002
     * @tc.desc     ToggleJsunit002
     * @tc.level    Level.LEVEL0
     */
it('ToggleJsunit002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ToggleJsunit002] START');
      let strJson = inspector.getInspectorByKey('toggleCheckbox');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ToggleJsunit002] obj: " + JSON.stringify(obj!.getElement('$attrs')));

      expect(obj!.getElement('$attrs').getString('switchPointColor')).assertEqual('#FF008000');
      console.info('[ToggleJsunit002] END');
      done();
    });
    
  })
}