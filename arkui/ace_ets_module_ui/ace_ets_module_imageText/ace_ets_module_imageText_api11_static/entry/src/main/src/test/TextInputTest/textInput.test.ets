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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textInputOnEditChangeJsunit() {
  describe('textInputOnEditChangeTest', () => {

    beforeAll(() => {
      console.info("textInputOnEditChangeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textInputOnEditChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInput6',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textInputOnEditChangeTest state pages:" + JSON.stringify(pages));
        if (!("textInput6" == pages.name)) {
          console.info("get textInputOnEditChangeTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputOnEditChangeTest page error:" + err);
      }
      console.info("textInputOnEditChangeTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textInputOnEditChange after each called");
    });

    
    /**
     * @tc.number   testtextInputOnEditChange_static_0001
     * @tc.name     testtextInputOnEditChange_static_0001
     * @tc.desc     testtextInputOnEditChange_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('testtextInputOnEditChange_static_0001', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange_static_0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange_static_0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testtextInputOnEditChange_static_0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });

    
    /**
     * @tc.number   testtextInputOnEditChange_static_0002
     * @tc.name     testtextInputOnEditChange_static_0002
     * @tc.desc     testtextInputOnEditChange_static_0002
     * @tc.level    Level.LEVEL1
     */
    it('testtextInputOnEditChange_static_0002', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange_static_0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange_static_0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("70.00vp");
      console.info("[testtextInputOnEditChange_static_0002] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });

    
    /**
     * @tc.number   testtextInputOnEditChange_static_0003
     * @tc.name     testtextInputOnEditChange_static_0003
     * @tc.desc     testtextInputOnEditChange_static_0003
     * @tc.level    Level.LEVEL1
     */
    it('testtextInputOnEditChange_static_0003', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange_static_0003 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange_static_0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual("20.00fp");
      console.info("[testtextInputOnEditChange_static_0003] fontSize value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));

    });

    
    /**
     * @tc.number   testtextInputOnEditChange_static_0004
     * @tc.name     testtextInputOnEditChange_static_0004
     * @tc.desc     testtextInputOnEditChange_static_0004
     * @tc.level    Level.LEVEL1
     */
    it('testtextInputOnEditChange_static_0004', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange_static_0004 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange_static_0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info("[testtextInputOnEditChange_static_0004] opacity value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity'));

    });

    
    /**
     * @tc.number   testtextInputOnEditChange_static_0005
     * @tc.name     testtextInputOnEditChange_static_0005
     * @tc.desc     testtextInputOnEditChange_static_0005
     * @tc.level    Level.LEVEL1
     */
    it('testtextInputOnEditChange_static_0005', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange_static_0005 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange_static_0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      console.info("[testtextInputOnEditChange_static_0005] align value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('align'));

    });

    
    /**
     * @tc.number   testtextInputOnEditChange_static_0006
     * @tc.name     testtextInputOnEditChange_static_0006
     * @tc.desc     testtextInputOnEditChange_static_0006
     * @tc.level    Level.LEVEL1
     */
    it('testtextInputOnEditChange_static_0006', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange_static_0006 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange_static_0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      console.info("[testtextInputOnEditChange_static_0006] fontColor value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));

    });

    
    /**
     * @tc.number   testtextInputOnEditChange_static_0009
     * @tc.name     testtextInputOnEditChange_static_0009
     * @tc.desc     testtextInputOnEditChange_static_0009
     * @tc.level    Level.LEVEL1
     */
    it('testtextInputOnEditChange_static_0009', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange009 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange_static_0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      console.info("[testtextInputOnEditChange_static_0009] padding value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding'));

    });

    
    /**
     * @tc.number   testtextInputOnEditChange_static_0010
     * @tc.name     testtextInputOnEditChange_static_0010
     * @tc.desc     testtextInputOnEditChange_static_0010
     * @tc.level    Level.LEVEL1
     */
    it('testtextInputOnEditChange_static_0010', Level.LEVEL1, async () => {
      console.info('textInputOnEditChange testtextInputOnEditChange_static_0010 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onEditChangeText');
      console.info("[testtextInputOnEditChange_static_0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      console.info("[testtextInputOnEditChange_static_0010] textAlign value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'));

    });

    // /*
    //  * @tc.number   testtextInputCopyOption_static_0001
    //  * @tc.name     testtextInputCopyOption_static_0001
    //  * @tc.desc     testtextInputCopyOption_static_0001
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testtextInputCopyOption_static_0001', Level.LEVEL1, async () => {
    //   console.info('textInputCopyOption testtextInputCopyOption_static_0001 START');
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('textInputCopyOptionText');
    //   console.info("[testtextInputCopyOption_static_0001] component copyOption strJson:" + strJson);
    //   let obj = JSON.parseJsonElement(strJson);
    //   expect(obj.getString('$type')).assertEqual('TextInput');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.None");
    //   console.info("[testtextInputCopyOption_static_0001] copyOption value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('copyOption'));
    //
    // });

    /**
     * @tc.number   testtextInputShowPasswordIcon_static_0001
     * @tc.name     testtextInputShowPasswordIcon_static_0001
     * @tc.desc     testtextInputShowPasswordIcon_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('testtextInputShowPasswordIcon_static_0001', Level.LEVEL1, async () => {
      console.info('textInputShowPasswordIcon testtextInputShowPasswordIcon_static_0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('showPasswordIconText');
      console.info("[testtextInputShowPasswordIcon_static_0001] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('showPasswordIcon')).assertTrue();
      console.info("[testtextInputShowPasswordIcon_static_0001] showPasswordIcon value :" + JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('showPasswordIcon'));

    });
  })
}
