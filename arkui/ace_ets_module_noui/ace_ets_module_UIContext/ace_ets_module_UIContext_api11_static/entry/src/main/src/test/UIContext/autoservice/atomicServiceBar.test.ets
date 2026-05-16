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

import hilog from '@ohos.hilog';
import router from '@ohos.router';
import { UIContext, AtomicServiceBar, Router, KeyboardAvoidMode } from '@ohos.arkui.UIContext';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../../Util.test';
import inspector from '@ohos.arkui.inspector'
import window from "@ohos.window";
import { Nullable , FontStyle } from '@ohos.arkui.component'

export default function atomicServiceBarTest() {
  let uiContext = AppStorage.get<UIContext>('uiContext')
  describe('atomicServiceBarTest', () => {


    beforeAll(() => {
      console.info("atomicServiceBarTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.UIContext.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("atomicServiceBarTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/UIContext/arkuinode/arkui_node',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router" ) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get atomicServiceBarTest state pages:" + JSON.stringify(pages));
        if (!("arkui_node" == pages.name)) {
          console.info("get atomicServiceBarTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push atomicServiceBarTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push atomicServiceBarTest page error:" + err);
      }
      console.info("atomicServiceBarTest beforeEach end");
    });

    

    /**
     * @tc.number   ArkuiContext_static_0100
     * @tc.name     ArkuiContext_static_0100
     * @tc.desc     ArkuiContext_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkuiContext_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkuiContext_static_0100 START');
      setTimeout(()=>{
        // try{
        let uiContext = AppStorage.get<UIContext>('uiContext')
        console.log('++++++++++++++++1',uiContext)
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext!.getAtomicServiceBar(); //appDied
        console.log('++++++++++++++++2')
          await CommonFunc.sleep(2000);
          if (atomicServiceBar != undefined) {
              // support service
              hilog.info(0x0000, 'testTag', 'Get AtomServiceBar Successfully.');
              atomicServiceBar.setVisible(false);
              expect(true).assertTrue();
          } else {
            // no support AtomServiceBar
            console.log('++++++++++++++++3')
            expect(atomicServiceBar ==undefined).assertTrue();
          }
        // } catch(err) {
        //   expect().assertFail()
        //   console.info('ArkuiContext_static_0100  '+ JSON.stringify(err));
        // }
        done();
      },3500)
    });

    

    /**
     * @tc.number   ArkuiContext_static_0200
     * @tc.name     ArkuiContext_static_0200
     * @tc.desc     ArkuiContext_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkuiContext_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkuiContext_static_0200 START');
      setTimeout(()=>{
        try{
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext!.getAtomicServiceBar();
          await CommonFunc.sleep(2000);
          if (atomicServiceBar != undefined) {
            hilog.info(0x0000, 'testTag', 'Get AtomServiceBar Successfully.');
            atomicServiceBar.setBackgroundColor(0x88888888.toInt());
            expect(true).assertTrue();
          } else {
            // no support AtomServiceBar
            expect(atomicServiceBar ==undefined).assertTrue();
          }
        } catch(err) {
          expect().assertFail()
          console.info('ArkuiContext_static_0200  '+ JSON.stringify(err));
        }
        done();
      },3500)
    });

    

    /**
     * @tc.number   ArkuiContext_static_0300
     * @tc.name     ArkuiContext_static_0300
     * @tc.desc     ArkuiContext_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkuiContext_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkuiContext_static_0300 START');
      setTimeout(()=>{
        try{
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext!.getAtomicServiceBar();
          await CommonFunc.sleep(2000);
          if (atomicServiceBar != undefined) {
            hilog.info(0x0000, 'testTag', 'Get AtomServiceBar Successfully.');
            atomicServiceBar.setTitleContent('text2');
            expect(true).assertTrue();
          } else {
            // no support AtomServiceBar
            expect(atomicServiceBar ==undefined).assertTrue();
          }
        } catch(err) {
          expect().assertFail()
          console.info('ArkuiContext_static_0300  '+ JSON.stringify(err));
        }
        done();
      },500)
    });


    

    /**
     * @tc.number   ArkuiContext_static_0500
     * @tc.name     ArkuiContext_static_0500
     * @tc.desc     ArkuiContext_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkuiContext_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkuiContext_static_0500 START');
      setTimeout(()=>{
        try{
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext!.getAtomicServiceBar();
          await CommonFunc.sleep(2000);
          if (atomicServiceBar != undefined) {
            hilog.info(0x0000, 'testTag', 'Get AtomServiceBar Successfully.');
            atomicServiceBar.setTitleFontStyle(FontStyle.Normal);
            expect(true).assertTrue();
          } else {
            // no support AtomServiceBar
            expect(atomicServiceBar ==undefined).assertTrue();
          }

        } catch(err) {
          expect().assertFail()
          console.info('ArkuiContext_static_0500  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    

    /**
     * @tc.number   ArkuiContext_static_0600
     * @tc.name     ArkuiContext_static_0600
     * @tc.desc     ArkuiContext_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkuiContext_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkuiContext_static_0600 START');
      setTimeout(()=>{
        try{
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext!.getAtomicServiceBar();
          await CommonFunc.sleep(2000);
          if (atomicServiceBar != undefined) {
            hilog.info(0x0000, 'testTag', 'Get AtomServiceBar Successfully.');
            atomicServiceBar.setIconColor(0x12345678);
            expect(true).assertTrue();
          }  else {
            // no support AtomServiceBar
            expect(atomicServiceBar ==undefined).assertTrue();
          }
        } catch(err) {
          expect().assertFail()
          console.info('ArkuiContext_static_0600  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    

    /**
     * @tc.number   ArkuiContext_static_0700
     * @tc.name     ArkuiContext_static_0700
     * @tc.desc     ArkuiContext_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkuiContext_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkuiContext_static_0700 START');
      setTimeout(()=>{
        try{
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext!.getAtomicServiceBar();
          await CommonFunc.sleep(2000);
          if (atomicServiceBar != undefined) {
            hilog.info(0x0000, 'testTag', 'Get AtomServiceBar Successfully.');
            uiContext!.setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE);
            let keyboardAvoidMode:KeyboardAvoidMode = uiContext!.getKeyboardAvoidMode();
            expect(keyboardAvoidMode != null).assertTrue();
            uiContext!.setKeyboardAvoidMode(KeyboardAvoidMode.OFFSET);
            let keyboardAvoidMode2:KeyboardAvoidMode = uiContext!.getKeyboardAvoidMode();
            expect(keyboardAvoidMode2 != null).assertTrue();
          }  else {
            // no support AtomServiceBar
            expect(atomicServiceBar ==undefined).assertTrue();
          }

        } catch(err) {
          expect().assertFail()
          console.info('ArkuiContext_static_0700  '+ JSON.stringify(err));
        }
        done();
      },500)
    })
  })
}