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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(():void => {
      resolve('OK');
    }, time * 1000 as Int);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

export default function textAreaJsunit() {

  describe('textAreaTest', () => {

    beforeAll(() => {
      console.info("textAreaTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextArea',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textAreaTest state pages:" + JSON.stringify(pages));
        if (!("TextArea" == pages.name)) {
          console.info("get textAreaTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textAreaTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaTest page error:" + err);
      }
      console.info("textAreaTest beforeEach end");
    });


    /**
     * run after testcase
     */
    afterEach(async () => {
    });

    
    /**
     * @tc.number   testTextArea_static_010
     * @tc.name     testTextArea_static_010
     * @tc.desc     testTextArea_static_010
     * @tc.level    Level.LEVEL1
     */
    it('testTextArea_static_010', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextArea_static_010 START');
      let strJson = inspector.getInspectorByKey('textArea1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textArea1] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('TextArea')
      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FFC0C0C0')
      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FFC0C0C0')
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start')
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start')
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FF000000')
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('40.00fp')
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bold')
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFF0000')
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('cursive')
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic')
      console.info('testTextArea_static_010 End');
      done();
    });

    
    /**
     * @tc.number   testTextArea_static_020
     * @tc.name     testTextArea_static_020
     * @tc.desc     testTextArea_static_020
     * @tc.level    Level.LEVEL1
     */
    it('testTextArea_static_020', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextArea_static_020 START');
      let strJson = inspector.getInspectorByKey('textArea2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textArea2] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('TextArea')
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Center')
      console.info('testTextArea_static_020 End');
      done();
    });

    
    /**
     * @tc.number   testTextArea_static_030
     * @tc.name     testTextArea_static_030
     * @tc.desc     testTextArea_static_030
     * @tc.level    Level.LEVEL1
     */
    it('testTextArea_static_030', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextArea_static_030 START');
      let strJson = inspector.getInspectorByKey('textArea3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textArea3] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('TextArea')
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.End')
      console.info('testTextArea_static_030 End');
      done();
    });
  })
}
