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

import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
import { TextCase } from '@ohos.arkui.component';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { MessageManagerBase, CallbackBase } from '../../../ets/MainAbility/common/MessageManager2';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function span3Jsunit() {
  describe('span3Jsunit', () => {
    beforeAll(() => {
      console.info("span3Jsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/span/span3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get span state success " + JSON.stringify(pages));
        if (!("span3" == pages.name)) {
          console.info("get span success " + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push span page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("span after each called");
    });

    /**
     * @tc.number   testSpan_static_001
     * @tc.name     testSpan_static_001
     * @tc.desc     testSpan_static_001
     * @tc.level    Level.LEVEL1
     */
    it('testSpan_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSpan001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('decoration');
      console.info("[testSpan001] component strJson:" + strJson);
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).getString('type'))
        .assertEqual('TextDecorationType.None');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).getString('color'))
        .assertEqual('#FFFF0000');
      done();
    });

    /**
     * @tc.number   testSpan_static_002
     * @tc.name     testSpan_static_002
     * @tc.desc     testSpan_static_002
     * @tc.level    Level.LEVEL1
     */
    it('testSpan_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSpan002] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('decoration');
      console.info("[testSpan002] component strJson:" + strJson);

      console.info("[testSpan002] textCase:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textCase'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textCase')).assertEqual('TextCase.Normal');
      done();
    });

    /**
     * @tc.number   testSpan_static_003
     * @tc.name     testSpan_static_003
     * @tc.desc     testSpan_static_003
     * @tc.level    Level.LEVEL1
     */
    it('testSpan_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSpan003] START');
      try {
        const message: MessageManagerBase<TextCase|undefined> = AppStorage.get<MessageManagerBase<TextCase|undefined>>("messageManagerTextCase")!
        message.notify({name:'textCaseValue',value:TextCase.UpperCase});
      } catch (err) {
        console.log("[testSpan003] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('decoration');
      console.info("[testSpan003] component strJson:" + strJson);

      console.info("[testSpan003] textCase:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textCase'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textCase'))
        .assertEqual('TextCase.UpperCase');
      done();
    });

    /**
     * @tc.number   testSpan_static_004
     * @tc.name     testSpan_static_004
     * @tc.desc     testSpan_static_004
     * @tc.level    Level.LEVEL1
     */
    it('testSpan_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSpan004] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('fontColor');
      console.info("[testSpan004] component strJson:" + strJson);

      console.info("[testSpan004] fontColor:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual('#FFCCCCCC');
      done();
    });

    /**
     * @tc.number   testSpan_static_005
     * @tc.name     testSpan_static_005
     * @tc.desc     testSpan_static_005
     * @tc.level    Level.LEVEL1
     */
    it('testSpan_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSpan005] START');
      try {
        const message: MessageManagerBase<string> = AppStorage.get<MessageManagerBase<string>>("messageManagerColor")!
        message.notify({name:'fontColorValue',value:'#FF000990'});
      } catch (err) {
        console.log("[testSpan005] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('fontColor');
      console.info("[testSpan005] component strJson:" + strJson);

      console.info("[testSpan005] fontColor:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual('#FF000990');
      done();
    });

    // /*
    //  * @tc.number   testSpan_static_006
    //  * @tc.name     testSpan_static_006
    //  * @tc.desc     testSpan_static_006
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testSpan_static_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('[testSpan006] START');
    //   try {
    //     const message: MessageManagerBase<TextCase|undefined> = AppStorage.get<MessageManagerBase<TextCase|undefined>>("messageManagerTextCase")!
    //     message.notify({name:'textCaseValue',value:undefined});
    //   } catch (err) {
    //     console.log("[testSpan006] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('decoration');
    //   console.info("[testSpan006] component strJson:" + strJson);
    //
    //   console.info("[testSpan006] textCase:" + JSON.parseJsonElement(strJson));
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textCase'))
    //     .assertEqual('TextCase.UpperCase');
    //   done();
    // });

    // /*
    //  * @tc.number   testSpan_static_007
    //  * @tc.name     testSpan_static_007
    //  * @tc.desc     testSpan_static_007
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testSpan_static_007', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('[testSpan007] START');
    //   try {
    //     const message: MessageManagerBase<TextCase> = AppStorage.get<MessageManagerBase<TextCase>>("messageManagerTextCase")!
    //     message.notify({name:'textCaseValue',value:-1});
    //   } catch (err) {
    //     console.log("[testSpan007] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('decoration');
    //   console.info("[testSpan007] component strJson:" + strJson);
    //
    //   console.info("[testSpan007] textCase:" + JSON.parseJsonElement(strJson));
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textCase'))
    //     .assertEqual('TextCase.UpperCase');
    //   done();
    // });
  })
}