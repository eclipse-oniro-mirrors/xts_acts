'use static';
/*
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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(():void => {
      resolve("ok")
    }, time * 1000 as Int);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

export default function spanJsunit() {
  describe('SpanTest', () => {
    beforeAll(() => {
      console.info("spanJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/span/Span',
      }
       try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Span state success " + JSON.stringify(pages));
        if (!("Span" == pages.name)) {
          console.info("get Span state success " + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Span page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Span page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async (): Promise<void> => {
      await sleep(1);
      console.info("Span after each called");
    });
    
    /**
     * @tc.number   testGetSpanAttr_static_010
     * @tc.name     testGetSpanAttr_static_010
     * @tc.desc     testGetSpanAttr_static_010
     * @tc.level    Level.LEVEL1
     */
    it('testGetSpanAttr_static_010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetSpanAttr1 START');
      let strJson = inspector.getInspectorByKey('span1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringifyJsonElement(obj));

      console.info("span1 decoration" + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('decoration')));
      console.info("span1 textCase" + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('textCase')));
      console.info("span1 content" + obj.getElement('$attrs').getString('content'));
      console.info("span1 fontSize" + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontSize')));
      console.info("span1 letterSpacing" +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('letterSpacing')));
      expect(obj.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.LineThrough","color":"#FFFF0000",' +
          '"style":"TextDecorationStyle.SOLID"}');
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.UpperCase');
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Test Span demo');
      console.info('testGetSpanAttr1 END');
      done();
    });

    
    /**
     * @tc.number   testGetSpanAttr_static_020
     * @tc.name     testGetSpanAttr_static_020
     * @tc.desc     testGetSpanAttr_static_020
     * @tc.level    Level.LEVEL1
     */
    it('testGetSpanAttr_static_020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetSpanAttr2 START');
      let strJson = inspector.getInspectorByKey('span2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("span2 textCase" + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('textCase')));
      console.info("span2 content" + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.LowerCase');
      expect(obj.getElement('$attrs').getString('content')).assertEqual('The second test Span demo');
      console.info('testGetSpanAttr2 END');
      done();
    });

    
    /**
     * @tc.number   testGetSpanAttr_static_030
     * @tc.name     testGetSpanAttr_static_030
     * @tc.desc     testGetSpanAttr_static_030
     * @tc.level    Level.LEVEL1
     */
    it('testGetSpanAttr_static_030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetSpanAttr3 START');
      let strJson = inspector.getInspectorByKey('span3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("span3 textCase" + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('textCase')));
      console.info("span3 content" + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.Normal');
      expect(obj.getElement('$attrs').getString('content')).assertEqual('The third test Span demo');
      console.info('testGetSpanAttr3 END');
      done();
    });
  })
}
