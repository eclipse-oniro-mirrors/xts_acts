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
import { Driver, ON } from '@ohos.UiTest';
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


export default function TextAreaTypeTest() {
  describe('TextAreaTypeTest', () => {
    beforeAll(() => {
      console.info("TextAreaTypeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaTypeTest state pages:" + JSON.stringify(pages));
        if (!("TextAreaType" == pages.name)) {
          console.info("get TextAreaTypeTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaTypeTest page error:" + err);
      }
      console.info("TextAreaTypeTest beforeEach end");
    }); 


    
    /**
     * @tc.number   TextAreaTypeTest_static_0010
     * @tc.name     TextAreaTypeTest_static_0010
     * @tc.desc     TextAreaTypeTest_static_0010
     * @tc.level   Level.LEVEL0
     */
    it('TextAreaTypeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaTypeTest_0010] START');
      let strJson = inspector.getInspectorByKey('TextAreaType_NUMBER_DECIMAL');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaTypeTest_0010] TextAreaType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('TextAreaType.NUMBER_DECIMAL');
      console.info('[TextAreaTypeTest_0010] END');
      done();
    });

    
    /**
     * @tc.number   TextAreaTypeTest_static_0020
     * @tc.name     TextAreaTypeTest_static_0020
     * @tc.desc     TextAreaTypeTest_static_0020
     * @tc.level   Level.LEVEL0
     */
    it('TextAreaTypeTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaTypeTest_0020] START');
      let strJson = inspector.getInspectorByKey('TextAreaType_URL');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaTypeTest_0020] TextAreaType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('TextAreaType.URL');
      console.info('[TextAreaTypeTest_0020] END');
      done();
    });

    
    /**
     * @tc.number   TextAreaTypeTest_static_0030
     * @tc.name     TextAreaTypeTest_static_0030
     * @tc.desc     TextAreaTypeTest_static_0030
     * @tc.level   Level.LEVEL0
     */
    it('TextAreaTypeTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaTypeTest_0030] START');
      let strJson = inspector.getInspectorByKey('TextAreaType_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaTypeTest_0030] TextAreaType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('TextAreaType.NORMAL');
      console.info('[TextAreaTypeTest_0030] END');
      done();
    });

    
    /**
     * @tc.number   TextAreaTypeTest_static_0040
     * @tc.name     TextAreaTypeTest_static_0040
     * @tc.desc     TextAreaTypeTest_static_0040
     * @tc.level   Level.LEVEL0
     */
    it('TextAreaTypeTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaTypeTest_0040] START');
      let strJson = inspector.getInspectorByKey('TextAreaType_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaTypeTest_0040] TextAreaType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('TextAreaType.NORMAL');
      console.info('[TextAreaTypeTest_0040] END');
      done();
    });
  })
}