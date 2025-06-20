/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@system.router';
import { UIContext, AtomicServiceBar, KeyboardAvoidMode } from '@ohos.arkui.UIContext';

import window from "@ohos.window";

export default function atomicServiceBarTest() {

  let windowStage: window.WindowStage = globalThis.windowStage;
  let uiContext: UIContext;
  describe('atomicServiceBarTest', () => {

    beforeAll(() => {
      console.info("atomicServiceBar beforeEach start");
      windowStage.loadContent('MainAbility/pages/UIContext/arkuinode/arkui_node', (err, data) => {
        uiContext = windowStage.getMainWindowSync().getUIContext();
        if (uiContext != null) {
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext.getAtomicServiceBar();
          if (atomicServiceBar != undefined) {
            hilog.info(0x0000, 'testTag', 'Get AtomServiceBar Successfully.');
            atomicServiceBar.setVisible(false);
          } else {
            hilog.error(0x0000, 'testTag', 'Get AtomicServiceBar failed.');
          }
        }
      });

    })
    beforeEach(async (done: Function) => {
      console.info("atomicServiceBar beforeEach start");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_ARKUICONTEXT_001
     * @tc.name      ArkuiContext_0100
     * @tc.desc      test setVisible interface
     */
    it('ArkuiContext_0100', 0, async (done: Function) => {
      console.info('ArkuiContext_0100 START');
      setTimeout(()=>{
        try{
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext.getAtomicServiceBar();
          if (atomicServiceBar != undefined) {
              // support service 
              hilog.info(0x0000, 'testTag', 'Get AtomServiceBar Successfully.');
              atomicServiceBar.setVisible(false);
              expect(true).assertTrue();
          } else {
            // no support AtomServiceBar
            expect(atomicServiceBar ==undefined).assertTrue();
          }
        } catch(err) {
          expect().assertFail()
          console.info('ArkuiContext_0100  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    /**
     * @tc.number    SUB_ARKUI_ARKUICONTEXT_002
     * @tc.name      ArkuiContext_0200
     * @tc.desc      test setBackgroundColor interface
     */
    it('ArkuiContext_0200', 0, async (done: Function) => {
      console.info('ArkuiContext_0200 START');
      setTimeout(()=>{
        try{
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext.getAtomicServiceBar();
          if (atomicServiceBar != undefined) {
            hilog.info(0x0000, 'testTag', 'Get AtomServiceBar Successfully.');
            atomicServiceBar.setBackgroundColor(0x88888888);
            expect(true).assertTrue();
          } else {
            // no support AtomServiceBar
            expect(atomicServiceBar ==undefined).assertTrue();
          }
        } catch(err) {
          expect().assertFail()
          console.info('ArkuiContext_0200  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    /**
     * @tc.number    SUB_ARKUI_ARKUICONTEXT_003
     * @tc.name      ArkuiContext_0300
     * @tc.desc      test setTitleContent interface
     */
    it('ArkuiContext_0300', 0, async (done: Function) => {
      console.info('ArkuiContext_0300 START');
      setTimeout(()=>{
        try{
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext.getAtomicServiceBar();
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
          console.info('ArkuiContext_0300  '+ JSON.stringify(err));
        }
        done();
      },500)
    });


    /**
     * @tc.number    SUB_ARKUI_ARKUICONTEXT_005
     * @tc.name      ArkuiContext_0500
     * @tc.desc      test setTitleFontStyle interface
     */
    it('ArkuiContext_0500', 0, async (done: Function) => {
      console.info('ArkuiContext_0500 START');
      setTimeout(()=>{
        try{
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext.getAtomicServiceBar();
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
          console.info('ArkuiContext_0500  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    /**
     * @tc.number    SUB_ARKUI_ARKUICONTEXT_006
     * @tc.name      ArkuiContext_0600
     * @tc.desc      test setIconColor interface
     */
    it('ArkuiContext_0600', 0, async (done: Function) => {
      console.info('ArkuiContext_0600 START');
      setTimeout(()=>{
        try{
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext.getAtomicServiceBar();
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
          console.info('ArkuiContext_0600  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    /**
     * @tc.number    SUB_ARKUI_ARKUICONTEXT_007
     * @tc.name      ArkuiContext_0700
     * @tc.desc      test getKeyboardAvoidMode interface
     */
    it('ArkuiContext_0700', 0, async (done: Function) => {
      console.info('ArkuiContext_0700 START');
      setTimeout(()=>{
        try{
          let atomicServiceBar: Nullable<AtomicServiceBar> = uiContext.getAtomicServiceBar();
          if (atomicServiceBar != undefined) {
            hilog.info(0x0000, 'testTag', 'Get AtomServiceBar Successfully.');
            uiContext.setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE);
            let keyboardAvoidMode:KeyboardAvoidMode = uiContext.getKeyboardAvoidMode();
            expect(keyboardAvoidMode != null).assertTrue();
            uiContext.setKeyboardAvoidMode(KeyboardAvoidMode.OFFSET);
            let keyboardAvoidMode2:KeyboardAvoidMode = uiContext.getKeyboardAvoidMode();
            expect(keyboardAvoidMode2 != null).assertTrue();
          }  else {
            // no support AtomServiceBar
            expect(atomicServiceBar ==undefined).assertTrue();
          }

        } catch(err) {
          expect().assertFail()
          console.info('ArkuiContext_0700  '+ JSON.stringify(err));
        }
        done();
      },500)
    })
  })
}