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
import { $r, Color } from '@ohos.arkui.component'
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function alphabetIndexerJsunit() {


  describe('alphabetIndexerTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'pages/AlphabetIndexer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlphabetIndexer state success " + JSON.stringify(pages));
        if (!("AlphabetIndexer" == pages.name)) {
          console.info("get AlphabetIndexer state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err: Error) {
        console.error("push AlphabetIndexer page error " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("AlphabetIndexer after each called");
    });


    
    /**
     * @tc.number   alphabetIndexerTest_static_001
     * @tc.name     alphabetIndexerTest_static_001
     * @tc.desc     alphabetIndexerTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('alphabetIndexerTest_static_001', Level.LEVEL0, async () => {
      console.info('AlphabetIndexerTest001 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      console.info('AlphabetIndexerTest001 END');
    });


    
    /**
     * @tc.number   alphabetIndexerTest_static_002
     * @tc.name     alphabetIndexerTest_static_002
     * @tc.desc     alphabetIndexerTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('alphabetIndexerTest_static_002', Level.LEVEL0, async () => {
      try {
        console.info('AlphabetIndexerTest002 START');
        let strJson = inspector.getInspectorByKey('alphabetIndexer1');
        let obj = JSON.parseJsonElement(strJson);
        console.info("component obj is: " + JSON.stringify(obj));
        console.info('AlphabetIndexerTest002 END');
      } catch (error) {
        expect().assertFail();
      }
    });
  })
}
