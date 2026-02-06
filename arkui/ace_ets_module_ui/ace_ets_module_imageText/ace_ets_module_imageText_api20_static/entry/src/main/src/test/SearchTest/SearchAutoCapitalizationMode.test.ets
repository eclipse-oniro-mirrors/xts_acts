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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';

export default function SearchAutoCapitalizationModeTest() {
  describe('SearchAutoCapitalizationModeTest', () => {
    beforeAll(() => {
      console.info("SearchAutoCapitalizationModeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api20.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("SearchAutoCapitalizationModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchAutoCapitalizationMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchAutoCapitalizationModeTest state success " + JSON.stringify(pages));
        routerInstance.replaceUrl(options);
        if (!("SearchAutoCapitalizationMode" == pages.name)) {
          console.info("get SearchAutoCapitalizationModeTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchAutoCapitalizationModeTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SearchAutoCapitalizationModeTest after each called");
    });

    
    /**
     * @tc.number   SearchAutoCapitalizationModeTest_static_0010
     * @tc.name     SearchAutoCapitalizationModeTest_static_0010
     * @tc.desc     SearchAutoCapitalizationModeTest_static_0010
     * @tc.level   Level.LEVEL2
     */
    it('SearchAutoCapitalizationModeTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchAutoCapitalizationModeTest_static_0010] START');
      let strJson = inspector.getInspectorByKey('Search_AutoCapitalizationMode_NONE');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchAutoCapitalizationModeTest_static_0010] Search: ' +
        JSON.stringify(obj.getElement('$attrs').getString('autoCapitalizationMode')));
      expect(obj.getElement('$attrs').getString('autoCapitalizationMode')).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[SearchAutoCapitalizationModeTest_static_0010] END");
      done();
    });

    
    /**
     * @tc.number   SearchAutoCapitalizationModeTest_static_0020
     * @tc.name     SearchAutoCapitalizationModeTest_static_0020
     * @tc.desc     SearchAutoCapitalizationModeTest_static_0020
     * @tc.level   Level.LEVEL2
     */
    it('SearchAutoCapitalizationModeTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchAutoCapitalizationModeTest_static_0020] START');
      let strJson = inspector.getInspectorByKey('Search_AutoCapitalizationMode_WORDS');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchAutoCapitalizationModeTest_static_0020] Search: ' +
        JSON.stringify(obj.getElement('$attrs').getString('autoCapitalizationMode')));
      expect(obj.getElement('$attrs').getString('autoCapitalizationMode')).assertEqual('AutoCapitalizationMode.WORDS');
      console.info("[SearchAutoCapitalizationModeTest_static_0020] END");
      done();
    });

    
    /**
     * @tc.number   SearchAutoCapitalizationModeTest_static_0030
     * @tc.name     SearchAutoCapitalizationModeTest_static_0030
     * @tc.desc     SearchAutoCapitalizationModeTest_static_0030
     * @tc.level   Level.LEVEL2
     */
    it('SearchAutoCapitalizationModeTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchAutoCapitalizationModeTest_static_0030] START');
      let strJson = inspector.getInspectorByKey('Search_AutoCapitalizationMode_SENTENCES');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchAutoCapitalizationModeTest_static_0030] Search: ' +
      JSON.stringify(obj.getElement('$attrs').getString('autoCapitalizationMode')));
      expect(obj.getElement('$attrs').getString('autoCapitalizationMode')).assertEqual('AutoCapitalizationMode.SENTENCES');
      console.info("[SearchAutoCapitalizationModeTest_static_0030] END");
      done();
    });

    
    /**
     * @tc.number   SearchAutoCapitalizationModeTest_static_0040
     * @tc.name     SearchAutoCapitalizationModeTest_static_0040
     * @tc.desc     SearchAutoCapitalizationModeTest_static_0040
     * @tc.level   Level.LEVEL2
     */
    it('SearchAutoCapitalizationModeTest_static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchAutoCapitalizationModeTest_static_0040] START');
      let strJson = inspector.getInspectorByKey('Search_AutoCapitalizationMode_ALL_CHARACTERS');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchAutoCapitalizationModeTest_static_0040] Search: ' +
      JSON.stringify(obj.getElement('$attrs').getString('autoCapitalizationMode')));
      expect(obj.getElement('$attrs').getString('autoCapitalizationMode')).assertEqual('AutoCapitalizationMode.ALL_CHARACTERS');
      console.info("[SearchAutoCapitalizationModeTest_static_0040] END");
      done();
    });

    
    /**
     * @tc.number   SearchAutoCapitalizationModeTest_static_0050
     * @tc.name     SearchAutoCapitalizationModeTest_static_0050
     * @tc.desc     SearchAutoCapitalizationModeTest_static_0050
     * @tc.level   Level.LEVEL2
     */
    it('SearchAutoCapitalizationModeTest_static_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchAutoCapitalizationModeTest_static_0050] START');
      let strJson = inspector.getInspectorByKey('Search_AutoCapitalizationMode_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchAutoCapitalizationModeTest_static_0050] Search: ' +
        JSON.stringify(obj.getElement('$attrs').getString('autoCapitalizationMode')));
      expect(obj.getElement('$attrs').getString('autoCapitalizationMode')).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[SearchAutoCapitalizationModeTest_static_0050] END");
      done();
    });

    
    /**
     * @tc.number   SearchAutoCapitalizationModeTest_static_0060
     * @tc.name     SearchAutoCapitalizationModeTest_static_0060
     * @tc.desc     SearchAutoCapitalizationModeTest_static_0060
     * @tc.level   Level.LEVEL2
     */
    it('SearchAutoCapitalizationModeTest_static_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchAutoCapitalizationModeTest_static_0060] START');
      let strJson = inspector.getInspectorByKey('Search_AutoCapitalizationMode_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchAutoCapitalizationModeTest_static_0060] Search: ' +
        JSON.stringify(obj.getElement('$attrs').getString('autoCapitalizationMode')));
      expect(obj.getElement('$attrs').getString('autoCapitalizationMode')).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[SearchAutoCapitalizationModeTest_static_0060] END");
      done();
    });

    
    /**
     * @tc.number   SearchAutoCapitalizationModeTest_static_0070
     * @tc.name     SearchAutoCapitalizationModeTest_static_0070
     * @tc.desc     SearchAutoCapitalizationModeTest_static_0070
     * @tc.level   Level.LEVEL2
     */
    it('SearchAutoCapitalizationModeTest_static_0070', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchAutoCapitalizationModeTest_static_0070] START');
      let strJson = inspector.getInspectorByKey('Search_AutoCapitalizationMode_0');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchAutoCapitalizationModeTest_static_0070] Search: ' +
        JSON.stringify(obj.getElement('$attrs').getString('autoCapitalizationMode')));
      expect(obj.getElement('$attrs').getString('autoCapitalizationMode')).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[SearchAutoCapitalizationModeTest_static_0070] END");
      done();
    });
  })
}