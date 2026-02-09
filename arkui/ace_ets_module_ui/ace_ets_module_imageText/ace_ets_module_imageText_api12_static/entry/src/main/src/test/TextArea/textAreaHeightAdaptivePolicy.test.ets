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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textAreaHeightAdaptivePolicyTest() {
  describe('textAreaHeightAdaptivePolicyTest', () => {
    beforeAll(() => {
      console.info("textAreaHeightAdaptivePolicyTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaHeightAdaptivePolicyTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaHeightAdaptivePolicy",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaHeightAdaptivePolicyTest state pages:" + JSON.stringify(pages));
        if (!("textAreaHeightAdaptivePolicy" == pages.name)) {
          console.info("get textAreaHeightAdaptivePolicyTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaHeightAdaptivePolicyTest page error:" + err);
      }
      console.info("textAreaHeightAdaptivePolicyTest beforeEach end");
    }); 


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaHeightAdaptivePolicy after each called");
    })

    
    /**
     * @tc.number   textAreaHeightAdaptivePolicy_static_0100
     * @tc.name     textAreaHeightAdaptivePolicy_static_0100
     * @tc.desc     textAreaHeightAdaptivePolicy_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('textAreaHeightAdaptivePolicy_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'textAreaHeightAdaptivePolicy0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_textArea_heightAdaptivePolicy_001');
      console.info('[' + tagName + '] TextArea heightAdaptivePolicy is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('heightAdaptivePolicy')));
      expect(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getString('heightAdaptivePolicy'))
        .assertEqual("TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST")
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textAreaHeightAdaptivePolicy_static_0200
     * @tc.name     textAreaHeightAdaptivePolicy_static_0200
     * @tc.desc     textAreaHeightAdaptivePolicy_static_0200
     * @tc.level   Level.LEVEL0
     */
    it('textAreaHeightAdaptivePolicy_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'textAreaHeightAdaptivePolicy0200';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_textArea_heightAdaptivePolicy_002');
      console.info('[' + tagName + '] TextArea heightAdaptivePolicy is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('heightAdaptivePolicy')));
      expect(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getString('heightAdaptivePolicy')).assertEqual("TextHeightAdaptivePolicy.MAX_LINES_FIRST")
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textAreaHeightAdaptivePolicy_static_0300
     * @tc.name     textAreaHeightAdaptivePolicy_static_0300
     * @tc.desc     textAreaHeightAdaptivePolicy_static_0300
     * @tc.level   Level.LEVEL0
     */
    it('textAreaHeightAdaptivePolicy_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'textAreaHeightAdaptivePolicy0300';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_textArea_heightAdaptivePolicy_003');
      console.info('[' + tagName + '] TextArea heightAdaptivePolicy is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('heightAdaptivePolicy')));
      expect(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getString('heightAdaptivePolicy'))
        .assertEqual("TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST")
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
