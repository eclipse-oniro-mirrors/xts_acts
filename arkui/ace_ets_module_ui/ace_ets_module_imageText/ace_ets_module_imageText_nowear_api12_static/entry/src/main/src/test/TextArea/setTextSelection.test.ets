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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function setTextSelection() {
  describe('setTextSelection', () : void=> {
    beforeAll(() => {
      console.info("setTextSelection beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("setTextSelection beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get setTextSelection state pages:" + "");
        if (!("setTextSelection" == pages.name)) {
          console.info("get  Context pages.name:" + '');
          routerInstance.pushUrl({
            url: "MainAbility/pages/TextArea/setTextSelection"
          })
          await CommonFunc.sleep(2000);
          //console.info("push setTextSelection page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setTextSelection page error:" + err);
      }
      console.info("setTextSelection foreEach end");
    });

    
    
/**
     * @tc.number   setTextSelection_static_0100
     * @tc.name     setTextSelection_static_0100
     * @tc.desc     setTextSelection_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('setTextSelection_static_0100', Level.LEVEL1, async (done: ()=>void) => {//AppStorage.setOrCrea("textAreaStart")注释
      console.info('setTextSelection_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let textArea = await driver.findComponent(ON.id('textArea'));
      await CommonFunc.sleep(500);
      await (textArea?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let but = await driver.findComponent(ON.id('but1'));
        console.log('=========================================== ' + but)
        await CommonFunc.sleep(500);
        await but!.click()
        await CommonFunc.sleep(500);
        expect("" + AppStorage.get<int>('textAreaStart')).assertEqual("0");
        expect("" + AppStorage.get<int>('textAreaEnd')).assertEqual("0");
        let textInput = await driver.findComponent(ON.id('textInput'));
        await CommonFunc.sleep(500);
        await (textInput?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        await but!.click()
        await CommonFunc.sleep(500);
        expect("" + AppStorage.get<int>('textInputStart')).assertEqual("0");
        expect("" + AppStorage.get<int>('textInputEnd')).assertEqual("0");

      AppStorage.delete('textAreaStart');
      AppStorage.delete('textAreaEnd');
      AppStorage.delete('textInputStart');
      AppStorage.delete('textInputEnd');
      console.info('setTextSelection_0100 END');
      done();
    });

    
    
/**
     * @tc.number   setTextSelection_static_0200
     * @tc.name     setTextSelection_static_0200
     * @tc.desc     setTextSelection_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('setTextSelection_static_0200', Level.LEVEL1, async (done: ()=>void) => {//AppStorage.setOrCrea("textAreaStart")注释
      console.info('setTextSelection_0200 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);


        let textArea = await driver.findComponent(ON.id('textArea'));
        await CommonFunc.sleep(500);
        await (textArea?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let but = await driver.findComponent(ON.id('but2'));
        await CommonFunc.sleep(500);
        await (but?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        expect('' + AppStorage.get<int>('textAreaStart')).assertEqual("0");
        expect('' + AppStorage.get<int>('textAreaEnd')).assertEqual("3");
        let textInput = await driver.findComponent(ON.id('textInput'));
        await CommonFunc.sleep(500);
        await (textInput?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        await (but?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        expect('' + AppStorage.get<int>('textInputStart')).assertEqual("0");
        expect('' + AppStorage.get<int>('textInputEnd')).assertEqual("3");

      AppStorage.delete('textAreaStart');
      AppStorage.delete('textAreaEnd');
      AppStorage.delete('textInputStart');
      AppStorage.delete('textInputEnd');
      console.info('setTextSelection_0200 END');
      done();
    });

    
    
// /*
//      * @tc.number   setTextSelection_static_0300
//      * @tc.name     setTextSelection_static_0300
//      * @tc.desc     setTextSelection_static_0300
//      * @tc.level    Level.LEVEL1
//      */
//     it('setTextSelection_static_0300', Level.LEVEL1, async (done: ()=>void) => {//AppStorage.setOrCrea("textAreaStart")注释
//       console.info('setTextSelection_0300 START');
//       let driver =  Driver.create()
//       await CommonFunc.sleep(1000);
//
//
//         let textArea = await driver.findComponent(ON.id('textArea'));
//         await CommonFunc.sleep(500);
//         await (textArea?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         let but = await driver.findComponent(ON.id('but3'));
//         await CommonFunc.sleep(500);
//         await (but?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         expect('' + AppStorage.get<int>('textAreaStart')).assertEqual("0");
//         expect('' + AppStorage.get<int>('textAreaEnd')).assertEqual("0");
//         let textInput = await driver.findComponent(ON.id('textInput'));
//         await CommonFunc.sleep(500);
//         await (textInput?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         await (but?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         expect('' + AppStorage.get<int>('textInputStart')).assertEqual("0");
//         expect('' + AppStorage.get<int>('textInputEnd')).assertEqual("0");
//         await (but?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         if (AppStorage.get<number>("winLeft") == 0) {
//           await driver.assertComponentExist(ON.text('全选'));
//         }
//
//
//       AppStorage.delete('textAreaStart');
//       AppStorage.delete('textAreaEnd');
//       AppStorage.delete('textInputStart');
//       AppStorage.delete('textInputEnd');
//       console.info('setTextSelection_0300 END');
//       done();
//     });
//
//
//
//
// /*
//      * @tc.number   setTextSelection_static_0400
//      * @tc.name     setTextSelection_static_0400
//      * @tc.desc     setTextSelection_static_0400
//      * @tc.level    Level.LEVEL1
//      */
//     it('setTextSelection_static_0400', Level.LEVEL1, async (done: ()=>void) => {//AppStorage.setOrCrea("textAreaStart")注释
//       console.info('setTextSelection_0400 START');
//       let driver =  Driver.create()
//       await CommonFunc.sleep(1000);
//
//
//         let textArea = await driver.findComponent(ON.id('textArea'));
//         await CommonFunc.sleep(500);
//         await (textArea?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         let but = await driver.findComponent(ON.id('but4'));
//         await CommonFunc.sleep(500);
//         await (but?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         expect('' + AppStorage.get<int>('textAreaStart')).assertEqual("0");
//         expect('' + AppStorage.get<int>('textAreaEnd')).assertEqual("0");
//         let textInput = await driver.findComponent(ON.id('textInput'));
//         await CommonFunc.sleep(500);
//         await (textInput?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         await (but?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         expect('' + AppStorage.get<int>('textInputStart')).assertEqual("0");
//         expect('' + AppStorage.get<int>('textInputEnd')).assertEqual("0");
//
//       AppStorage.delete('textAreaStart');
//       AppStorage.delete('textAreaEnd');
//       AppStorage.delete('textInputStart');
//       AppStorage.delete('textInputEnd');
//       console.info('setTextSelection_0400 END');
//       done();
//     });
//
//
//
// /*
//      * @tc.number   setTextSelection_static_0500
//      * @tc.name     setTextSelection_static_0500
//      * @tc.desc     setTextSelection_static_0500
//      * @tc.level    Level.LEVEL1
//      */
//     it('setTextSelection_static_0500', Level.LEVEL1, async (done: ()=>void) => {//AppStorage.setOrCrea("textAreaStart")注释
//       console.info('setTextSelection_0500 START');
//       let driver =  Driver.create()
//       await CommonFunc.sleep(1000);
//
//
//         let textArea = await driver.findComponent(ON.id('textArea'));
//         await CommonFunc.sleep(500);
//         await (textArea?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         let but = await driver.findComponent(ON.id('but5'));
//         await CommonFunc.sleep(500);
//         await (but?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         expect('' + AppStorage.get<int>('textAreaStart')).assertEqual("0");
//         expect('' + AppStorage.get<int>('textAreaEnd')).assertEqual("4");
//         let textInput = await driver.findComponent(ON.id('textInput'));
//         await CommonFunc.sleep(500);
//         await (textInput?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         await (but?.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         expect('' + AppStorage.get<int>('textInputStart')).assertEqual("0");
//         expect('' + AppStorage.get<int>('textInputEnd')).assertEqual("4");
//
//       AppStorage.delete('textAreaStart');
//       AppStorage.delete('textAreaEnd');
//       AppStorage.delete('textInputStart');
//       AppStorage.delete('textInputEnd');
//       console.info('setTextSelection_0500 END');
//       done();
//     });
  })
}