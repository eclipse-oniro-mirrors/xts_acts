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
} from "../../../../hypium/index";
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

export default function ContentTypeTest() {
  describe('ContentTypeTest', () => {
    beforeAll(() => {
      console.info("ContentTypeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("ContentTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/ContentType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get ContentTypeTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ContentTypeTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ContentTypeTest page error:" + err);
      }
      console.info("ContentTypeTest beforeEach end");
    });


    
    
    


/**
     * @tc.number   ContentTypeTest_static_0010
     * @tc.name     ContentTypeTest_static_0010
     * @tc.desc     ContentTypeTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('ContentTypeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ContentTypeTest_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ContentType_USER_NAME');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ContentTypeTest_0010] contentType is: " +
      JSON.stringify(obj.getElement('$attrs').getString('contentType')));
      expect(obj.getElement('$attrs').getString('contentType')).assertEqual('TextContentType.USER_NAME');
      console.info('[ContentTypeTest_0010] END');
      done();
    });


    
    
    


/**
     * @tc.number   ContentTypeTest_static_0020
     * @tc.name     ContentTypeTest_static_0020
     * @tc.desc     ContentTypeTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('ContentTypeTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ContentTypeTest_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ContentType_NEW_PASSWORD');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ContentTypeTest_0020] contentType is: " +
      JSON.stringify(obj.getElement('$attrs').getString('contentType')));
      expect(obj.getElement('$attrs').getString('contentType')).assertEqual('TextContentType.NEW_PASSWORD');
      console.info('[ContentTypeTest_0020] END');
      done();
    });
  })
}