/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import windowNdkTest from 'libentry.so';

export default function windowNdk() {
  describe('windowNdk', () => {
    let windowStage:window.WindowStage;
    let Tag = 'ActsWindowNdkTest';
    let WindowClass:window.Window;
    let windowId:number;
    beforeAll(async() => {
      windowStage = AppStorage.get("windowStage") as window.WindowStage;
      console.log(`${Tag}:beforeAll start... `);
      WindowClass = await windowStage.getMainWindow();
      windowId = WindowClass.getWindowProperties().id;
      console.log(`${Tag}:windowId:${windowId} `);
    })
    beforeEach(() => {
      console.log(`${Tag}:beforeEach start... `);
    })
    afterEach(() => {
      console.log(`${Tag}:afterEach start... `);
    })
    afterAll(() => {
      console.log(`${Tag}:afterAll start... `);
    })


    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0100
     * @tc.name      : test_OH_NativeWindowManager_RegisterKeyEventFilter
     * @tc.desc      : test_OH_NativeWindowManager_RegisterKeyEventFilter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_OH_NativeWindowManager_RegisterKeyEventFilter', 0, async (done:Function) => {
        console.info(`${Tag}: test_OH_NativeWindowManager_RegisterKeyEventFilter RegisterKeyEventFilter windowId: ${windowId}`);
        let a = windowNdkTest.filterKeyCode(windowId,2070);
        console.info(`${Tag}: test_OH_NativeWindowManager_RegisterKeyEventFilter RegisterKeyEventFilter: ${a}`);
        if(a==2000){
          console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);
          expect(true).assertTrue();
          done();
        }else
          if (a==0){
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0200
     * @tc.name      : test_OH_NativeWindowManager_UnregisterKeyEventFilter
     * @tc.desc      : test_OH_NativeWindowManager_UnregisterKeyEventFilter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_OH_NativeWindowManager_UnregisterKeyEventFilter', 0, async (done:Function) => {
      let a = windowNdkTest.unFilterKeyCode(windowId);
      console.info(`${Tag}: test_OH_NativeWindowManager_UnregisterKeyEventFilter unRegisterKeyEventFilter windowId: ${windowId}`);
      console.info(`${Tag}: test_OH_NativeWindowManager_UnregisterKeyEventFilter unRegisterKeyEventFilter: ${a}`);
      if(a==2000){
        console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);
        expect(true).assertTrue();
        done();
      }else if (a==0){
        expect(true).assertTrue();
        done();
      }else{
        expect(false).assertTrue();
        done();
      }

    })
  })
}