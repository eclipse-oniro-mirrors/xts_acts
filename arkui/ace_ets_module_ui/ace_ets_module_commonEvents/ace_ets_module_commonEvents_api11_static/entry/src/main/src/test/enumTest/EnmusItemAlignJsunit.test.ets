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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function enmusItemAlignJsunit() {
  describe('enumsItemAlign', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("enumsItemAligntions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/enum/enumsItemAlign",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get enumsItemAligntions state pages:" + JSON.stringify(pages));
        if (!("enumsItemAlign" == pages.name)) {
          console.info("get enumsItemAligntions pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push enumsItemAligntions page error:" + err);
      }
      console.info("enumsItemAligntions beforeEach end");
    });


    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('[ afterEach ] ===================enumsFlexItemTest test after each called===================');
    });

    
    
/**
     * @tc.number   enumsItemAlignTest_static_0100
     * @tc.name     enumsItemAlignTest_static_0100
     * @tc.desc     enumsItemAlignTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('enumsItemAlignTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('enumsItemAlignTest_0100 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('itemAlign');
      await Utils.sleep(1000);
      console.info("enumsItemAlignTest_0100 component strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getElement("constructor").getString('alignItems'))
        .assertEqual('ItemAlign.Auto');
      console.info('enumsItemAlignTest_0100 END');
      done();
    });
  })
}
