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


export default function textAreaOnCutJsunit() {
  describe('textAreaOnCutJsunit', () => {
    beforeAll(() => {
      console.info("textAreaOnCutJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textArea_bottom beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textArea6",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textArea_bottom state pages:" + JSON.stringify(pages));
        if (!("textArea6" == pages.name)) {
          console.info("get textArea_bottom pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textArea_bottom page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textArea_bottom page error:" + err);
      }
      console.info("textArea_bottom beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaOnCut after each called");
    });

    
    /**
     * @tc.number   testtextAreaOnCut_static_0001
     * @tc.name     testtextAreaOnCut_static_0001
     * @tc.desc     testtextAreaOnCut_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('testtextAreaOnCut_static_0001', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0001 START');
      await CommonFunc.sleep(2000);
      console.info("[testtextAreaOnCut0001] component width strJson: start");
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00vp");
      // console.info("[testtextAreaOnCut0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    /**
     * @tc.number   testtextAreaOnCut_static_0002
     * @tc.name     testtextAreaOnCut_static_0002
     * @tc.desc     testtextAreaOnCut_static_0002
     * @tc.level    Level.LEVEL1
     */
    it('testtextAreaOnCut_static_0002', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut_static_0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut_static_0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("70.00vp");
      // console.info("[testtextAreaOnCut_static_0002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    /**
     * @tc.number   testtextAreaOnCut_static_0003
     * @tc.name     testtextAreaOnCut_static_0003
     * @tc.desc     testtextAreaOnCut_static_0003
     * @tc.level    Level.LEVEL1
     */
    it('testtextAreaOnCut_static_0003', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut_static_0003 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut_static_0003] component fontSize strJson:" + strJson);
       let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("20.00fp");
      // console.info("[testtextAreaOnCut_static_0003] fontSize value :" + obj.getElement('$attrs').getString('fontSize'));

    });

    
    /**
     * @tc.number   testtextAreaOnCut_static_0004
     * @tc.name     testtextAreaOnCut_static_0004
     * @tc.desc     testtextAreaOnCut_static_0004
     * @tc.level    Level.LEVEL1
     */
    it('testtextAreaOnCut_static_0004', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut_static_0004 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut_static_0004] component opacity strJson:" + strJson);
       let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getDouble('opacity')).assertEqual(1);
      // console.info("[testtextAreaOnCut_static_0004] opacity value :" + obj.getElement('$attrs').getString('opacity'));

    });

    
    /**
     * @tc.number   testtextAreaOnCut_static_0005
     * @tc.name     testtextAreaOnCut_static_0005
     * @tc.desc     testtextAreaOnCut_static_0005
     * @tc.level    Level.LEVEL1
     */
    it('testtextAreaOnCut_static_0005', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut_static_0005 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut_static_0005] component align strJson:" + strJson);
       let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      // console.info("[testtextAreaOnCut_static_0005] align value :" + obj.getElement('$attrs').getString('align'));

    });

    
    /**
     * @tc.number   testtextAreaOnCut_static_0006
     * @tc.name     testtextAreaOnCut_static_0006
     * @tc.desc     testtextAreaOnCut_static_0006
     * @tc.level    Level.LEVEL1
     */
    it('testtextAreaOnCut_static_0006', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut_static_0006 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut_static_0006] component fontColor strJson:" + strJson);
       let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      // console.info("[testtextAreaOnCut_static_0006] fontColor value :" + obj.getElement('$attrs').getString('fontColor'));

    });

    
    /**
     * @tc.number   testtextAreaOnCut_static_0009
     * @tc.name     testtextAreaOnCut_static_0009
     * @tc.desc     testtextAreaOnCut_static_0009
     * @tc.level    Level.LEVEL1
     */
    it('testtextAreaOnCut_static_0009', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut009 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut_static_0009] component padding strJson:" + strJson);
       let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      // console.info("[testtextAreaOnCut_static_0009] padding value :" + obj.getElement('$attrs').getString('padding'));

    });

    
    /**
     * @tc.number   testtextAreaOnCut_static_0010
     * @tc.name     testtextAreaOnCut_static_0010
     * @tc.desc     testtextAreaOnCut_static_0010
     * @tc.level    Level.LEVEL1
     */
    it('testtextAreaOnCut_static_0010', Level.LEVEL1, async () => {
      console.info('textAreaOnCut testtextAreaOnCut_static_0010 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut_static_0010] component textAlign strJson:" + strJson);
       let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      // console.info("[testtextAreaOnCut_static_0010] textAlign value :" + obj.getElement('$attrs').getString('textAlign'));

    });

    // /*
    //  * @tc.number   testtextAreaCopyOption_static_0011
    //  * @tc.name     testtextAreaCopyOption_static_0011
    //  * @tc.desc     testtextAreaCopyOption_static_0011
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testtextAreaCopyOption_static_0011', Level.LEVEL1, async () => {  undefined 用例
    //   console.info('textAreaCopyOption testtextAreaCopyOption_static_0011 START');
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('textAreaCopyOptionText');
    //   console.info("[testtextAreaCopyOption_static_0011] component copyOption strJson:" + strJson);
    //    let obj = JSON.parseJsonElement(strJson);
    //   expect(obj.getString('$type')).assertEqual('TextArea');
    //   expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.None');
    //   // console.info("[testtextAreaCopyOption_static_0011] copyOption value :" + obj.getElement('$attrs').getString('copyOption'));
    //
    // });
  })
}
