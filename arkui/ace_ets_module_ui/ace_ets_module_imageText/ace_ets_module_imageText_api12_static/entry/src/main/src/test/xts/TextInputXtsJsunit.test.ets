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

export default function TextInputXtsJsunit() {
  describe('TextInputXtsJsunit', (): void => {
    beforeAll(() => {
      console.info("TextInputXtsJsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info('TextInputXtsJsunit beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/xts/TextInputXts',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputXts state pages:" + JSON.stringify(pages));
        if (!("TextInputXts" == pages.name)) {
          console.info("get TextInputXts pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push TextInputXts page error: ' + err);
      }
    })

    
    /**
     * @tc.number   TextInputXtsJsunit_static_0101
     * @tc.name     TextInputXtsJsunit_static_0101
     * @tc.desc     TextInputXtsJsunit_static_0101
     * @tc.level    Level.LEVEL0
     */
    it('TextInputXtsJsunit_static_0101',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputXtsJsunit_0103] START');
      let strJson = inspector.getInspectorByKey('key_textinput_textIndent');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputXtsJsunit_0101] obj is: ' + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('textIndent')).assertEqual('5.00vp');
      console.info('[TextInputXtsJsunit_0101] END');
      done();
    });

    
    /**
     * @tc.number   TextInputXtsJsunit_static_0102
     * @tc.name     TextInputXtsJsunit_static_0102
     * @tc.desc     TextInputXtsJsunit_static_0102
     * @tc.level    Level.LEVEL0
     */
    it('TextInputXtsJsunit_static_0102',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputXtsJsunit_0102] START');
      let strJson = inspector.getInspectorByKey('key_textinput_textOverflow');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputXtsJsunit_0102] obj is: ' + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual('TextOverflow.Clip');
      console.info('[TextInputXtsJsunit_0102] END');
      done();
    });
    
    /**
     * @tc.number   TextInputXtsJsunit_static_0103
     * @tc.name     TextInputXtsJsunit_static_0103
     * @tc.desc     TextInputXtsJsunit_static_0103
     * @tc.level    Level.LEVEL0
     */
    it('TextInputXtsJsunit_static_0103',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputXtsJsunit_0103] START');
      let strJson = inspector.getInspectorByKey('key_textinput_caretStyle');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputXtsJsunit_0103] obj is: ' + JSON.stringify(obj.getElement('$attrs')));
      let caretstyle_obj = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
      expect(caretstyle_obj.getString('width')).assertEqual('5.00vp');
      expect(caretstyle_obj.getString('color')).assertEqual('#F5F5F5F5');
      console.info('[TextInputXtsJsunit_0103] END');
      done();
    });
  })
}
