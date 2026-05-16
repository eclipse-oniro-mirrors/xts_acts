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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils'
import App, { ScreenOnVisibleOptions } from '@system.app';


export default function systemAppJsunit() {
  describe('appInfoTest_four_9', () => {

    



/**
     * @tc.number   systemAppTest_static_0100
     * @tc.name     systemAppTest_static_0100
     * @tc.desc     systemAppTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('systemAppTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('systemAppTest_0100 START');
      let a = App.getInfo(); //app Died
      console.log('systemAppTest_0100 END' + JSON.stringify(a));
      if (a != null) {
        expect(a.appID == "com.open.harmony.acetestfour").assertTrue();
        console.info('systemAppTest_0100 END');
      } else {
        expect().assertFail();
      }
      done();
    });
    
    



/**
     * @tc.number   systemAppTest_static_0200
     * @tc.name     systemAppTest_static_0200
     * @tc.desc     systemAppTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('systemAppTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('systemAppTest_0200 START');
      let a = App.getInfo();
      console.log('systemAppTest_0200 END' + JSON.stringify(a));
      if (a != null) {
        expect(a.appName == "$string:entry_MainAbility").assertTrue();
      } else {
        expect().assertFail();
      }
      console.info('systemAppTest_0200 END');
      done();
    });
    
    



/**
     * @tc.number   systemAppTest_static_0300
     * @tc.name     systemAppTest_static_0300
     * @tc.desc     systemAppTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('systemAppTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('systemAppTest_0300 START');
      let a = App.getInfo();
      console.log('systemAppTest_0300 END' + JSON.stringify(a));
      if (a != null) {
        expect(a.versionName == "1.0.0").assertTrue();
      } else {
        expect().assertFail();
      }
      console.info('systemAppTest_0300 END');
      done();
    });
    
    



/**
     * @tc.number   systemAppTest_static_0400
     * @tc.name     systemAppTest_static_0400
     * @tc.desc     systemAppTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('systemAppTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('systemAppTest_0400 START');
      try {
        App.requestFullWindow({
          duration: 2000
        });
      } catch (err) {
        expect().assertFail();
        console.log("systemAppTest_0400 error: " + err);
      }
      console.info('systemAppTest_0400 END');
      done();
    });
    
    



/**
     * @tc.number   systemAppTest_static_0500
     * @tc.name     systemAppTest_static_0500
     * @tc.desc     systemAppTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('systemAppTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('systemAppTest_0500 START');
      try {
        let visible: ScreenOnVisibleOptions = {
          visible: true
        };
        App.screenOnVisible(visible);
      } catch (err) {
        expect().assertFail();
        console.log("systemAppTest_0500 error: " + err);
      }
      console.info('systemAppTest_0500 END');
      done();
    });
  
    

    
    
/**
     * @tc.number   systemAppTest_static_0600
     * @tc.name     systemAppTest_static_0600
     * @tc.desc     systemAppTest_static_0600
     * @tc.level    Level.LEVEL0
     */
it('systemAppTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('systemAppTest_0600 START');
      try {
        let a = 100;
        App.setImageCacheCount(a);
      }catch(Error) {
          expect().assertFail();
      }
      console.info('systemAppTest_0600 END');
      done();
      

    });

    

    
    
/**
     * @tc.number   systemAppTest_static_0700
     * @tc.name     systemAppTest_static_0700
     * @tc.desc     systemAppTest_static_0700
     * @tc.level    Level.LEVEL0
     */
it('systemAppTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('systemAppTest_0700 START');
      try {
        let a = 104857600;
        App.setImageRawDataCacheSize(a);
      }catch(Error) {
          expect().assertFail();
      }
      console.info('systemAppTest_0700 END');
      done();
    });

    

    
    
/**
     * @tc.number   systemAppTest_static_0800
     * @tc.name     systemAppTest_static_0800
     * @tc.desc     systemAppTest_static_0800
     * @tc.level    Level.LEVEL0
     */
it('systemAppTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('systemAppTest_0800 START');
      try {
        let a = 1048;
        App.setImageFileCacheSize(a);
      }catch(Error) {
          expect().assertFail();
      }
      console.info('systemAppTest_0800 END');
      done();
    });

    

    
    
/**
     * @tc.number   systemAppTest_static_0900
     * @tc.name     systemAppTest_static_0900
     * @tc.desc     systemAppTest_static_0900
     * @tc.level    Level.LEVEL0
     */
it('systemAppTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('systemAppTest_0900 START');
      try {
        App.terminate();
      }catch(Error) {
          expect().assertFail();
      }
      console.info('systemAppTest_0900 END');
      done();
    });
  })
}