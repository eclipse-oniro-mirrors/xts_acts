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

import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import Utils from "../../../ets/MainAbility/common/Utils";
import hilog from '@ohos.hilog'
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function selectOnSelectJsunit() {
  describe('selectOnSelectTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/select3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get select state pages:" + JSON.stringify(pages));
        if (!("select3" == pages.name)) {
          console.info("get select pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push select page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push select page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("selectOnSelect after each called");
    });


    
    /**
     * @tc.number   testselectOnSelect_static_0001
     * @tc.name     testselectOnSelect_static_0001
     * @tc.desc     testselectOnSelect_static_0001
     * @tc.level    Level.LEVEL1
     */
it('testselectOnSelect_static_0001', Level.LEVEL1, async () => {
      console.info('selectOnSelect testselectOnSelect_static_0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Select');
      console.info("[testselectOnSelect_static_0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type').asString()).assertEqual('Select');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected')).assertEqual("2");
      console.info("[testselectOnSelect_static_0001] selected value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected'));

    });


    
    /**
     * @tc.number   testselectOnSelect_static_0002
     * @tc.name     testselectOnSelect_static_0002
     * @tc.desc     testselectOnSelect_static_0002
     * @tc.level    Level.LEVEL1
     */
it('testselectOnSelect_static_0002', Level.LEVEL1, async () => {
      console.info('selectOnSelect testselectOnSelect_static_0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Select');
      console.info("[testselectOnSelect_static_0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type').asString()).assertEqual('Select');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual("TTT");
      console.info("[testselectOnSelect_static_0002] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });
  })
}
