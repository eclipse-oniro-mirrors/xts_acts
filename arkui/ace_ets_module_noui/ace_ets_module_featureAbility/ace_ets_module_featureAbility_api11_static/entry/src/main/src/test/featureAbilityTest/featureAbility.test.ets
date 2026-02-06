'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

interface optionsObj {
  uri: string
}

export default function featureAbilityStartAbilityJsunit() {
  describe('featureAbilityStartAbilityTest', () => {
    beforeAll(() => {
      console.info("featureAbilityStartAbilityJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.UIContext.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("featureAbilityStartAbilityJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/featureAbility/featureAbility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get featureAbility state success " + JSON.stringify(pages));
        if (!("featureAbility" == pages.name)) {
          console.info("get featureAbility state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push featureAbility page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("featureAbilityStartAbility after each called");
    });

    


    

    /**
     * @tc.number   testfeatureAbilityStartAbility_static_0001
     * @tc.name     testfeatureAbilityStartAbility_static_0001
     * @tc.desc     testfeatureAbilityStartAbility_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testfeatureAbilityStartAbility_static_0001', Level.LEVEL0, async  () => {
      console.info('featureAbilityStartAbility testfeatureAbilityStartAbility0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('startAbilityText');
      console.info("[testfeatureAbilityStartAbility0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("320.00vp");
      console.info("[testfeatureAbilityStartAbility0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });
  })
}
