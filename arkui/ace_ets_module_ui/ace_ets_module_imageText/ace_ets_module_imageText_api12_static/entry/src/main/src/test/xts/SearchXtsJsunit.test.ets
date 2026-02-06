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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function SearchXtsJsunit() {
  describe('SearchXtsJsunit', (): void => {
    beforeAll(() => {
      console.info("SearchXtsJsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info('SearchXtsJsunit beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/xts/SearchXts',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchXts state pages:" + JSON.stringify(pages));
        if (!("SearchXts" == pages.name)) {
          console.info("get SearchXts pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push SearchXts page error: ' + err);
      }
    })

    
    /**
     * @tc.number   SearchXtsJsunit_static_0101
     * @tc.name     SearchXtsJsunit_static_0101
     * @tc.desc     SearchXtsJsunit_static_0101
     * @tc.level    Level.LEVEL0
     */
    it('SearchXtsJsunit_static_0101',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchXtsJsunit_0101] START');
      let strJson = inspector.getInspectorByKey('key_search_inputFilter');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchXtsJsunit_0101] inputFilter ========== : ' + JSON.stringify(obj.getElement('$attrs').getString('inputFilter')));
      expect(obj.getElement('$attrs').getString('inputFilter')).assertEqual('2');
      console.info('[SearchXtsJsunit_0101] END');
      done();
    });

    
    /**
     * @tc.number   SearchXtsJsunit_static_0102
     * @tc.name     SearchXtsJsunit_static_0102
     * @tc.desc     SearchXtsJsunit_static_0102
     * @tc.level    Level.LEVEL0
     */
    it('SearchXtsJsunit_static_0102',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchXtsJsunit_0102] START');
      let strJson = inspector.getInspectorByKey('key_search_selectedBackgroundColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchXtsJsunit_0102] obj is: ' + JSON.stringify(obj.getElement('$attrs')));
      console.info('[SearchJsunit_0102] selectedBackgroundColor ========== : ' + JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
      expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual('#F5F5F5F5');
      console.info('[SearchXtsJsunit_0102] END');
      done();
    });

    
    /**
     * @tc.number   SearchXtsJsunit_static_0103
     * @tc.name     SearchXtsJsunit_static_0103
     * @tc.desc     SearchXtsJsunit_static_0103
     * @tc.level    Level.LEVEL0
     */
    it('SearchXtsJsunit_static_0103',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchXtsJsunit_0103] START');
      let strJson = inspector.getInspectorByKey('key_search_textIndent');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchXtsJsunit_0103] obj is: ' + JSON.stringify(obj.getElement('$attrs')));
      console.info('[SearchXtsJsunit_0103] textIndent ========== : ' + JSON.stringify(obj.getElement('$attrs').getString('textIndent')));
      expect(obj.getElement('$attrs').getString('textIndent')).assertEqual('5.00vp');
      console.info('[SearchXtsJsunit_0103] END');
      done();
    });

    
    /**
     * @tc.number   SearchXtsTest_static_0105
     * @tc.name     SearchXtsTest_static_0105
     * @tc.desc     SearchXtsTest_static_0105
     * @tc.level    Level.LEVEL0
     */
    it('SearchXtsTest_static_0105',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SearchXtsTest_0105 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('key_search_onEditChange'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('key_search_onEditChange_text1');
      let Obj = JSON.parseJsonElement(text1);
      expect(Obj.getElement('$attrs').getString('content')).assertEqual('onEditChange');
      console.info('SearchXtsTest_0105 END');
      done();
    });

  })
}
