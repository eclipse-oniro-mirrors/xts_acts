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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../TextInput/Utils';
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

export default function textInputUnderlineColorTest() {
  describe('textInputUnderlineColorTest', () =>{
    beforeAll(() => {
      console.info("textInputUnderlineColorTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textInputUnderlineColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/textInputUnderlineColor",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textInputUnderlineColorTest state pages:" + JSON.stringify(pages));
        if (!("textInputUnderlineColor" == pages.name)) {
          console.info("get textInputUnderlineColorTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputUnderlineColorTest page error:" + err);
      }
      console.info("textInputUnderlineColorTest beforeEach end");
    }); 


    afterEach(async () =>{
      await Utils.sleep(1000);
      console.info("TextInputUnderlineColor after each called");
    })

    
    /**
     * @tc.number   textInputUnderlineColor_static_0100
     * @tc.name     textInputUnderlineColor_static_0100
     * @tc.desc     textInputUnderlineColor_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('textInputUnderlineColor_static_0100', Level.LEVEL0, async  (done: () => void): Promise<void> =>{
      let tagName = 'textInputUnderlineColor_0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = inspector.getInspectorByKey('key_TextInput_UnderlineColor_001');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] TextInput underlineColor is: ' + JSON.stringify(obj.getElement('$attrs').getString('underlineColor')));
      let underlineColor = JSON.parseJsonElement(obj.getElement('$attrs').getString('underlineColor'));

      expect(underlineColor.getString('normal')).assertEqual('#FF0000FF');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textInputUnderlineColor_static_0200
     * @tc.name     textInputUnderlineColor_static_0200
     * @tc.desc     textInputUnderlineColor_static_0200
     * @tc.level   Level.LEVEL0
     */
    it('textInputUnderlineColor_static_0200', Level.LEVEL0, async  (done: () => void): Promise<void> =>{
      let tagName = 'textInputUnderlineColor_0200';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = inspector.getInspectorByKey('key_TextInput_UnderlineColor_002');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] TextInput underlineColor is: ' + JSON.stringify(obj.getElement('$attrs').getString('underlineColor')));
      let underlineColor = JSON.parseJsonElement(obj.getElement('$attrs').getString('underlineColor'));

      expect(underlineColor.getString('disable')).assertEqual('#FFFF0000');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textInputUnderlineColor_static_0300
     * @tc.name     textInputUnderlineColor_static_0300
     * @tc.desc     textInputUnderlineColor_static_0300
     * @tc.level   Level.LEVEL0
     */
    it('textInputUnderlineColor_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      let tagName = 'textInputUnderlineColor_0300';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = inspector.getInspectorByKey('key_TextInput_UnderlineColor_003');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] TextInput underlineColor is: ' + JSON.stringify(obj.getElement('$attrs').getString('underlineColor')));
      let underlineColor = JSON.parseJsonElement(obj.getElement('$attrs').getString('underlineColor'));

      expect(underlineColor.getString('typing')).assertEqual('#FFFF0000');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textInputUnderlineColor_static_0400
     * @tc.name     textInputUnderlineColor_static_0400
     * @tc.desc     textInputUnderlineColor_static_0400
     * @tc.level   Level.LEVEL0
     */
    it('textInputUnderlineColor_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      let tagName = 'ArkUI_textInputUnderlineColor_0400';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = inspector.getInspectorByKey('key_TextInput_UnderlineColor_004');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] TextInput underlineColor is: ' + JSON.stringify(obj.getElement('$attrs').getString('underlineColor')));
      let underlineColor = JSON.parseJsonElement(obj.getElement('$attrs').getString('underlineColor'));

      expect(underlineColor.getString('error')).assertEqual('#FFFF0000');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}