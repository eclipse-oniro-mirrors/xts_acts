'use static';
/**
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function SearchTypeTest() {
  describe('SearchTypeTest', (): void => {
    beforeAll(() => {
      console.info("SearchTypeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("SearchTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get SearchTypeTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get SearchTypeTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchTypeTest page error:" + err);
      }
      console.info("SearchTypeTest beforeEach end");
    });


    
    
    


/**
     * @tc.number   SearchTypeTest_static_0010
     * @tc.name     SearchTypeTest_static_0010
     * @tc.desc     SearchTypeTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('SearchTypeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTypeTest_0010] START');
      let strJson = inspector.getInspectorByKey('SearchType_NUMBER_DECIMAL');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchTypeTest_0010] SearchType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('SearchType.NUMBER_DECIMAL');
      console.info('[SearchTypeTest_0010] END');
      done();
    });


    
    
    


/**
     * @tc.number   SearchTypeTest_static_0020
     * @tc.name     SearchTypeTest_static_0020
     * @tc.desc     SearchTypeTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('SearchTypeTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTypeTest_0020] START');
      let strJson: string = inspector.getInspectorByKey('SearchType_URL');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchTypeTest_0020] SearchType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('SearchType.URL');
      console.info('[SearchTypeTest_0020] END');
      done();
    });


    
    
    


/**
     * @tc.number   SearchTypeTest_static_0030
     * @tc.name     SearchTypeTest_static_0030
     * @tc.desc     SearchTypeTest_static_0030
     * @tc.level    Level.LEVEL0
     */
it('SearchTypeTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTypeTest_0030] START');
      let strJson: string = inspector.getInspectorByKey('SearchType_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchTypeTest_0030] SearchType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeTest_0030] END');
      done();
    });


    
    
    


/**
     * @tc.number   SearchTypeTest_static_0040
     * @tc.name     SearchTypeTest_static_0040
     * @tc.desc     SearchTypeTest_static_0040
     * @tc.level    Level.LEVEL0
     */
it('SearchTypeTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTypeTest_0040] START');
      let strJson: string = inspector.getInspectorByKey('SearchType_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchTypeTest_0040] SearchType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeTest_0040] END');
      done();
    });
  })
}