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
import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
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


export default function TextInputTypeTest() {
  describe('TextInputTypeTest', () => {
    beforeAll(() => {
      console.info("TextInputTypeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputTypeTest state pages:" + JSON.stringify(pages));
        if (!("TextInputType" == pages.name)) {
          console.info("get TextInputTypeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputTypeTest page error:" + err);
      }
      console.info("TextInputTypeTest beforeEach end");
    }); 


    
    /**
     * @tc.number   TextInputTypeTest_static_0010
     * @tc.name     TextInputTypeTest_static_0010
     * @tc.desc     TextInputTypeTest_static_0010
     * @tc.level   Level.LEVEL0
     */
    it('TextInputTypeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputTypeTest_0010] START');
      let strJson = inspector.getInspectorByKey('TextInputType_URL');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputTypeTest_0010] TextInputType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.URL');
      console.info('[TextInputTypeTest_0010] END');
      done();
    });

    
    /**
     * @tc.number   TextInputTypeTest_static_0020
     * @tc.name     TextInputTypeTest_static_0020
     * @tc.desc     TextInputTypeTest_static_0020
     * @tc.level   Level.LEVEL0
     */
    it('TextInputTypeTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputTypeTest_0020] START');
      let strJson = inspector.getInspectorByKey('TextInputType_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputTypeTest_0020] TextInputType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Normal');
      console.info('[TextInputTypeTest_0020] END');
      done();
    });

    
    /**
     * @tc.number   TextInputTypeTest_static_0030
     * @tc.name     TextInputTypeTest_static_0030
     * @tc.desc     TextInputTypeTest_static_0030
     * @tc.level   Level.LEVEL0
     */
    it('TextInputTypeTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputTypeTest_0030] START');
      let strJson = inspector.getInspectorByKey('TextInputType_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputTypeTest_0030] TextInputType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Normal');
      console.info('[TextInputTypeTest_0030] END');
      done();
    });
  })
}