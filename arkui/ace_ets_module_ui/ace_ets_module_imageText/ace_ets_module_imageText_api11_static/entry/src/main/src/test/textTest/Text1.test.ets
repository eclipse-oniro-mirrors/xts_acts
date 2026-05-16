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

export default function textMinFontSizeJsunit() {
  describe('textMinFontSizeTest', () => {


    beforeAll(() => {
      console.info("textMinFontSizeTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textMinFontSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/text6',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textMinFontSizeTest state pages:" + JSON.stringify(pages));
        if (!("text6" == pages.name)) {
          console.info("get textMinFontSizeTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textMinFontSizeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textMinFontSizeTest page error:" + err);
      }
      console.info("textMinFontSizeTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textMinFontSize after each called");
    });

    
    /**
     * @tc.number   testtextMinFontSize_static_0001
     * @tc.name     testtextMinFontSize_static_0001
     * @tc.desc     testtextMinFontSize_static_0001
     * @tc.level    Level.LEVEL2
     */
    it('testtextMinFontSize_static_0001', Level.LEVEL2, async () => {
      console.info('textMinFontSize testtextMinFontSize_static_0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize_static_0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testtextMinFontSize_static_0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });

    
    /**
     * @tc.number   testtextMinFontSize_static_0002
     * @tc.name     testtextMinFontSize_static_0002
     * @tc.desc     testtextMinFontSize_static_0002
     * @tc.level    Level.LEVEL2
     */
    it('testtextMinFontSize_static_0002', Level.LEVEL2, async () => {
      console.info('textMinFontSize testtextMinFontSize_static_0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize_static_0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("70.00vp");
      // console.info("[testtextMinFontSize_static_0002] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });

    
    /**
     * @tc.number   testtextMinFontSize_static_0003
     * @tc.name     testtextMinFontSize_static_0003
     * @tc.desc     testtextMinFontSize_static_0003
     * @tc.level    Level.LEVEL2
     */
    it('testtextMinFontSize_static_0003', Level.LEVEL2, async () => {
      console.info('textMinFontSize testtextMinFontSize_static_0003 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize_static_0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("30.00px");
      // console.info("[testtextMinFontSize_static_0003] fontSize value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));

    });

    
    /**
     * @tc.number   testtextMinFontSize_static_0004
     * @tc.name     testtextMinFontSize_static_0004
     * @tc.desc     testtextMinFontSize_static_0004
     * @tc.level    Level.LEVEL2
     */
    it('testtextMinFontSize_static_0004', Level.LEVEL2, async () => {
      console.info('textMinFontSize testtextMinFontSize_static_0004 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize_static_0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getInteger('opacity')).assertEqual(1);
      // console.info("[testtextMinFontSize_static_0004] opacity value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('opacity'));

    });

    
    /**
     * @tc.number   testtextMinFontSize_static_0005
     * @tc.name     testtextMinFontSize_static_0005
     * @tc.desc     testtextMinFontSize_static_0005
     * @tc.level    Level.LEVEL2
     */
    it('testtextMinFontSize_static_0005', Level.LEVEL2, async () => {
      console.info('textMinFontSize testtextMinFontSize_static_0005 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize_static_0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      // console.info("[testtextMinFontSize_static_0005] align value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('align'));

    });

    
    /**
     * @tc.number   testtextMinFontSize_static_0006
     * @tc.name     testtextMinFontSize_static_0006
     * @tc.desc     testtextMinFontSize_static_0006
     * @tc.level    Level.LEVEL2
     */
    it('testtextMinFontSize_static_0006', Level.LEVEL2, async () => {
      console.info('textMinFontSize testtextMinFontSize_static_0006 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize_static_0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      // console.info("[testtextMinFontSize_static_0006] fontColor value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
    });

    
    /**
     * @tc.number   testtextMinFontSize_static_0007
     * @tc.name     testtextMinFontSize_static_0007
     * @tc.desc     testtextMinFontSize_static_0007
     * @tc.level    Level.LEVEL2
     */
    it('testtextMinFontSize_static_0007', Level.LEVEL2, async () => {
      console.info('textMinFontSize testtextMinFontSize_static_0007 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize_static_0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('lineHeight')).assertEqual("25.00fp");
      console.info("[testtextMinFontSize_static_0007] lineHeight value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight'));
    });

    
    /**
     * @tc.number   testtextMinFontSize_static_0009
     * @tc.name     testtextMinFontSize_static_0009
     * @tc.desc     testtextMinFontSize_static_0009
     * @tc.level    Level.LEVEL2
     */
    it('testtextMinFontSize_static_0009', Level.LEVEL2, async () => {
      console.info('textMinFontSize testtextMinFontSize009 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize_static_0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      console.info("[testtextMinFontSize_static_0009] padding value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding'));

    });

    
    /**
     * @tc.number   testtextMinFontSize_static_0010
     * @tc.name     testtextMinFontSize_static_0010
     * @tc.desc     testtextMinFontSize_static_0010
     * @tc.level    Level.LEVEL2
     */
    it('testtextMinFontSize_static_0010', Level.LEVEL2, async () => {
      console.info('textMinFontSize testtextMinFontSize_static_0010 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize_static_0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      console.info("[testtextMinFontSize_static_0010] textAlign value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'));

    });

    
    /**
     * @tc.number   testtextMinFontSize_static_0011
     * @tc.name     testtextMinFontSize_static_0011
     * @tc.desc     testtextMinFontSize_static_0011
     * @tc.level    Level.LEVEL2
     */
    it('testtextMinFontSize_static_0011', Level.LEVEL2, async () => {
      console.info('textMinFontSize testtextMinFontSize_static_0011 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize_static_0011] component minFontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('minFontSize')).assertEqual("50.00px");
      console.info("[testtextMinFontSize_static_0011] minFontSize value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('minFontSize'));

    });

    
    /**
     * @tc.number   testtextCopyOptionText_static_0001
     * @tc.name     testtextCopyOptionText_static_0001
     * @tc.desc     testtextCopyOptionText_static_0001
     * @tc.level    Level.LEVEL2
     */
    it('testtextCopyOptionText_static_0001', Level.LEVEL2, async () => {
      console.info('textMinFontSize testtextCopyOptionText_static_0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('copyOptionText');
      console.info("[testtextCopyOptionText_static_0001] component copyOption strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.None");
      console.info("[testtextCopyOptionText_static_0001] copyOption value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('copyOption'));

    });
  })
}
