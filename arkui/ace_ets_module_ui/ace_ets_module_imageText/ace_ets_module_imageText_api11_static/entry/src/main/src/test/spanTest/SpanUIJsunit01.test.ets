'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { afterEach, beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium/index';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback, Message } from '../../../ets/MainAbility/common/MessageManager';
import { SpanExampleManager } from '../../../ets/MainAbility/pages/span/spanUI';
import { TextCase, TextDecorationType, Color } from '@ohos.arkui.component';
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

const waitUiReadyMs = 1000;

export default function spanUIJsunit() {
  describe('spanUIJsunit', () => {
    beforeAll(() => {
      console.info("spanUIJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("spanUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/span/spanUI',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get spanUIJsunit state pages:" + JSON.stringify(pages));
        if (!("spanUI" == pages.name)) {
          console.info("get spanUIJsunit state pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push spanUIJsunit success" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push spanUIJsunit page error:" + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   spanUIJsunit_static_0100
     * @tc.name     spanUIJsunit_static_0100
     * @tc.desc     spanUIJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('spanUIJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      // get the sapn component and test attribute
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0100 component obj is:' + obj.getElement('$attrs').getString('content') + "--" +
      obj.getElement('$attrs').getElement('textCase') + "---" + obj.getElement('$attrs').getElement('letterSpacing') +
        "--" + obj.getElement('$attrs').getElement('fontSize') + "--" +
      obj.getElement('$attrs').getString('decoration'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('I am Underline-span');
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.Normal');
      expect(obj.getElement('$attrs').getString('letterSpacing')).assertEqual('10.00fp');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('12.00fp');
      expect(obj.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.Underline","color":"#FFFFCCEE",' +
          '"style":"TextDecorationStyle.SOLID"}');
      console.info('spanUIJsunit_static_0100 END');
      done();
    });

    /**
     * @tc.number   spanUIJsunit_static_0200
     * @tc.name     spanUIJsunit_static_0200
     * @tc.desc     spanUIJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('spanUIJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0200 START');
      await CommonFunc.sleep(1000);
      // modify the content and textCase attribute normal value  dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager") as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'content', value: 'I am test'
      })
      await CommonFunc.sleep(300);
      spanExampleManager.message.notify({
        name: 'textCase', value: TextCase.LowerCase
      })
      await CommonFunc.sleep(300);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0200 component obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('I am test');
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.LowerCase');
      done();
    });

    /**
     * @tc.number   spanUIJsunit_static_0300
     * @tc.name     spanUIJsunit_static_0300
     * @tc.desc     spanUIJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('spanUIJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0300 START');
      await CommonFunc.sleep(1000);
      // modify the values attribute enum textCase value of span dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager") as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'textCase', value: TextCase.UpperCase
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0300 component obj is: ' + obj.getElement('$attrs').getElement('textCase'));
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.UpperCase');
      done();
    });

    // /*
    //  * @tc.number   spanUIJsunit_static_0400
    //  * @tc.name     spanUIJsunit_static_0400
    //  * @tc.desc     spanUIJsunit_static_0400
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('spanUIJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('spanUIJsunit_static_0400 START');
    //   await CommonFunc.sleep(1000);
    //   // modify the values illegal attribute enum textCase value of span dynamically
    //   const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager") as SpanExampleManager
    //   spanExampleManager.message.notify({
    //     name: 'textCase', value: 5  // 没有 TextCase 5
    //   })
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('testSpan');
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info('spanUIJsunit_static_0400 component obj is: ' + obj.getElement('$attrs').getElement('textCase'));
    //   expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.UpperCase');
    //   done();
    // });

    /**
     * @tc.number   spanUIJsunit_static_0500
     * @tc.name     spanUIJsunit_static_0500
     * @tc.desc     spanUIJsunit_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('spanUIJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0500 START');
      await CommonFunc.sleep(1000);
      // modify the normal values letter space and fontSize of span dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager") as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'fontSize', value: 20
      })
      await CommonFunc.sleep(300);
      spanExampleManager.message.notify({
        name: 'letterSpacing', value: 25
      })
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0500 component obj is: ' + obj.getElement('$attrs').getElement('letterSpacing') +
        "----" + obj.getElement('$attrs').getElement('fontSize'));
      expect(obj.getElement('$attrs').getString('letterSpacing')).assertEqual('25.00fp');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
      done();
    });

    /**
     * @tc.number   spanUIJsunit_static_0600
     * @tc.name     spanUIJsunit_static_0600
     * @tc.desc     spanUIJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('spanUIJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0600 START');
      await CommonFunc.sleep(1000);
      // modify the values decoration attribute  of span dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager") as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'type', value: TextDecorationType.None
      })
      await CommonFunc.sleep(300);
      spanExampleManager.message.notify({
        name: 'color', value: '#FFAACC'
      })
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0600 component obj is: ' + obj.getElement('$attrs').getString('decoration'));
      expect(obj.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.None","color":"#FFFFAACC",' +
          '"style":"TextDecorationStyle.SOLID"}');
      done();
    });

    /**
     * @tc.number   spanUIJsunit_static_0700
     * @tc.name     spanUIJsunit_static_0700
     * @tc.desc     spanUIJsunit_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('spanUIJsunit_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0700 START');
      await CommonFunc.sleep(1000);
      // modify the values decoration attribute  of span dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager") as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'type', value: TextDecorationType.Overline
      })
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0700 component obj is: ' + obj.getElement('$attrs').getString('decoration'));
      expect(obj.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.Overline","color":"#FFFFAACC",' +
          '"style":"TextDecorationStyle.SOLID"}');
      spanExampleManager.message.notify({
        name: 'type', value: TextDecorationType.LineThrough
      })
      await CommonFunc.sleep(300);
      let strJson2 = inspector.getInspectorByKey('testSpan');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('spanUIJsunit_static_0700 component obj2 is: ' + obj2.getElement('$attrs').getString('decoration'));
      expect(obj2.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.LineThrough","color":"#FFFFAACC",' +
          '"style":"TextDecorationStyle.SOLID"}');
      done();
    });

    /**
     * @tc.number   spanUIJsunit_static_0800
     * @tc.name     spanUIJsunit_static_0800
     * @tc.desc     spanUIJsunit_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('spanUIJsunit_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0800 START');
      await CommonFunc.sleep(1000);
      // modify the values decoration attribute  of span dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager") as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'color', value: Color.Green
      })
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0800 component obj is: ' + obj.getElement('$attrs').getString('decoration'));
      expect(obj.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.LineThrough","color":"#FF008000",' +
          '"style":"TextDecorationStyle.SOLID"}');
      spanExampleManager.message.notify({
        name: 'color', value: 'rgb(238, 130, 238)'
      })
      await CommonFunc.sleep(300);
      let strJson2 = inspector.getInspectorByKey('testSpan');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('spanUIJsunit_static_0800 component obj2 is: ' + obj2.getElement('$attrs').getString('decoration'));
      expect(obj2.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.LineThrough","color":"#FFEE82EE",' +
          '"style":"TextDecorationStyle.SOLID"}');
      done();
    });

    // /*
    //  * @tc.number   spanUIJsunit_static_0900
    //  * @tc.name     spanUIJsunit_static_0900
    //  * @tc.desc     spanUIJsunit_static_0900
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('spanUIJsunit_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('spanUIJsunit_static_0900 START');
    //   await CommonFunc.sleep(1000);
    //   // modify the values decoration attribute  of span illegal dynamically
    //   const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager") as SpanExampleManager
    //   spanExampleManager.message.notify({
    //     name: 'type', value: 8 //枚举没有8
    //   })
    //   await CommonFunc.sleep(300);
    //   spanExampleManager.message.notify({
    //     name: 'color', value: '#FCC'
    //   })
    //   await CommonFunc.sleep(300);
    //   let strJson = inspector.getInspectorByKey('testSpan');
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info('spanUIJsunit_static_0900 component obj is: ' + obj.getElement('$attrs').getString('decoration'));
    //   expect(obj.getElement('$attrs').getString('decoration'))
    //     .assertEqual('{"type":"TextDecorationType.None","color":"#FFFFCCCC",' +
    //       '"style":"TextDecorationStyle.SOLID"}');
    //   done();
    // });
  })
}