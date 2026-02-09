'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  FontStyle,$r
} from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { MessageManagerBase } from '../../../ets/MainAbility/common/MessageManager2';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext=new UIContext()
export default function textStyleJsunit() {
  describe('textStyleTest', () => {

    beforeAll(() => {
      console.info("textStyleTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/textStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textStyleTest state pages:" + JSON.stringify(pages));
        if (!("textStyle" == pages.name)) {
          console.info("get textStyleTest pages.name:" + '');

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textStyleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textStyleTest page error:" + err);
      }
      console.info("textStyleTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textStyle after each called");
    });

    /**
     * @tc.number   testTextStyle_static_006
     * @tc.name     testTextStyle_static_006
     * @tc.desc     testTextStyle_static_006
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_006', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_006] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('fontSize');
      console.info("[testTextStyle_static_006] component strJson:" + strJson);
      console.info("[testTextStyle_static_006] fontSize: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));
	    console.info("[testTextStyle_static_006] fontSize: " + $r('sys.float.ohos_id_text_font_size'));
      let obj = JSON.parseJsonElement(strJson);
      const uiContext = AppStorage.get<UIContext>('uiContext');
      const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
      let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_font_size').id) as double
	    expect(obj.getElement('$attrs').getString('fontSize')).assertEqual(uiContext!.px2fp(resourceSize)+'.00fp');
    });

    /**
     * @tc.number   testTextStyle_static_007
     * @tc.name     testTextStyle_static_007
     * @tc.desc     testTextStyle_static_007
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_007', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_007] START');
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")?.notify({
          name: 'fontSize', value: 30
        });
      } catch (err) {
        console.log("[testTextStyle_static_007] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('fontSize');
      console.info("[testTextStyle_static_007] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_007] fontSize: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));
      const uiContext = AppStorage.get<UIContext>('uiContext');
      const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
      let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_font_size').id) as double
	    expect(obj.getElement('$attrs').getString('fontSize')).assertEqual(uiContext!.px2fp(resourceSize)+'.00fp');
    });

    
    /**
     * @tc.number   testTextStyle_static_008
     * @tc.name     testTextStyle_static_008
     * @tc.desc     testTextStyle_static_008
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_008', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_008] START');
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")?.notify({
          name: 'fontSize', value: 0x80000000
        });
      } catch (err) {
        console.log("[testTextStyle_static_008] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('fontSize');
      console.info("[testTextStyle_static_008] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_008] fontSize: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));
      const uiContext = AppStorage.get<UIContext>('uiContext');
      const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
      let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_font_size').id) as double
	    expect(obj.getElement('$attrs').getString('fontSize')).assertEqual(uiContext!.px2fp(resourceSize)+'.00fp');
    });

    
    /**
     * @tc.number   testTextStyle_static_009
     * @tc.name     testTextStyle_static_009
     * @tc.desc     testTextStyle_static_009
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_009', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_009] START');
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")?.notify({
          name: 'fontSize', value: 'error'
        });
        console.info("[testTextStyle_static_009] start to publish emit");
      } catch (err) {
        console.log("[testTextStyle_static_009] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('fontSize');
      console.info("[testTextStyle_static_009] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_009] fontSize: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));
      const uiContext = AppStorage.get<UIContext>('uiContext');
      const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
      let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_font_size').id) as double
	    expect(obj.getElement('$attrs').getString('fontSize')).assertEqual(uiContext!.px2fp(resourceSize)+'.00fp');
    });

    
    /**
     * @tc.number   testTextStyle_static_010
     * @tc.name     testTextStyle_static_010
     * @tc.desc     testTextStyle_static_010
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_010', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_010] START');
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")?.notify({
          name: 'fontSize', value: 0x7FFFFFFF
        });
      } catch (err) {
        console.log("[testTextStyle_static_010] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('fontSize');
      console.info("[testTextStyle_static_010] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_010] fontSize: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));
      const uiContext = AppStorage.get<UIContext>('uiContext');
      const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
      let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_font_size').id) as double
	    expect(obj.getElement('$attrs').getString('fontSize')).assertEqual(uiContext!.px2fp(resourceSize)+'.00fp');

    });

    
    /**
     * @tc.number   testTextStyle_static_011
     * @tc.name     testTextStyle_static_011
     * @tc.desc     testTextStyle_static_011
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_011', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_011] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('fontStyle');
      console.info("[testTextStyle_static_011] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_011] fontStyle: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontStyle'));
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');

    });

    
    /**
     * @tc.number   testTextStyle_static_012
     * @tc.name     testTextStyle_static_012
     * @tc.desc     testTextStyle_static_012
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_012', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_012] START');
      try {
        AppStorage.get<MessageManagerBase<FontStyle>>("messageManagerFontStyle")?.notify({
          name: 'fontStyle', value: FontStyle.Normal
        });
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.log("[testTextStyle_static_012] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('fontStyle');
      await CommonFunc.sleep(1000);
      console.info("[testTextStyle_static_012] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_012] fontStyle: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontStyle'));
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Normal');

    });

    
    /**
     * @tc.number   testTextStyle_static_013
     * @tc.name     testTextStyle_static_013
     * @tc.desc     testTextStyle_static_013
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_013', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_013] START');
      try {
        AppStorage.get<MessageManagerBase<FontStyle>>("messageManagerFontStyle")?.notify({
          name: 'fontStyle', value: 0x7FFFFFFF as FontStyle
        });
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.log("[testTextStyle_static_013] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('fontStyle');
      console.info("[testTextStyle_static_013] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[testTextStyle_static_013] fontStyle: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontStyle'));
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Normal');

    });

    
    // /*
    //  * @tc.number   testTextStyle_static_014
    //  * @tc.name     testTextStyle_static_014
    //  * @tc.desc     testTextStyle_static_014
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testTextStyle_static_014', Level.LEVEL1, async () => {
    //   console.info('[testTextStyle_static_014] START');
    //   try {
    //     AppStorage.get<MessageManagerBase<FontStyle>>("messageManagerFontStyle")?.notify({
    //       name: 'fontStyle', value: "error" as FontStyle
    //     });
    //   } catch (err) {
    //     console.log("[testTextStyle_static_014] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(3000);
    //   let strJson: string = inspector.getInspectorByKey('fontStyle');
    //   console.info("[testTextStyle_static_014] component strJson:" + strJson);
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("[testTextStyle_static_014] fontStyle: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontStyle'));
    //   expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Normal');
    //
    // });

    
    /**
     * @tc.number   testTextStyle_static_015
     * @tc.name     testTextStyle_static_015
     * @tc.desc     testTextStyle_static_015
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_015', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_015] START');
      try {
        AppStorage.get<MessageManagerBase<FontStyle>>("messageManagerFontStyle")?.notify({
          name: 'fontStyle', value: (0x80000000.toInt()) as FontStyle
        });
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.log("[testTextStyle_static_015] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('fontStyle');
      console.info("[testTextStyle_static_015] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_015] fontStyle: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontStyle'));
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Normal');

    });

    
    /**
     * @tc.number   testTextStyle_static_016
     * @tc.name     testTextStyle_static_016
     * @tc.desc     testTextStyle_static_016
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_016', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_016] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('fontWeight');
      console.info("[testTextStyle_static_016] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_016] fontWeight: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('700');

    });

    
    /**
     * @tc.number   testTextStyle_static_017
     * @tc.name     testTextStyle_static_017
     * @tc.desc     testTextStyle_static_017
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_017', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_017] START');
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")?.notify({
          name: 'fontWeight', value: 400
        });
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.log("[testTextStyle_static_017] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('fontWeight');
      console.info("[testTextStyle_static_017] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_017] fontWeight: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('400');

    });

    
    /**
     * @tc.number   testTextStyle_static_018
     * @tc.name     testTextStyle_static_018
     * @tc.desc     testTextStyle_static_018
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_018', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_018] START');
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")?.notify({
          name: 'fontWeight', value: "error"
        });
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.log("[testTextStyle_static_018] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('fontWeight');
      console.info("[testTextStyle_static_018] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_018] fontWeight: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('400');

    });

    
    /**
     * @tc.number   testTextStyle_static_019
     * @tc.name     testTextStyle_static_019
     * @tc.desc     testTextStyle_static_019
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_019', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_019] START');
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")?.notify({
          name: 'fontWeight', value: (0x80000000).toInt()
        });
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.log("[testTextStyle_static_019] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('fontWeight');
      console.info("[testTextStyle_static_019] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_019] fontWeight: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');

    });

    
    /**
     * @tc.number   testTextStyle_static_020
     * @tc.name     testTextStyle_static_020
     * @tc.desc     testTextStyle_static_020
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_020', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_020] START');
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")?.notify({
          name: 'fontWeight', value: 0x7FFFFFFF
        });
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.log("[testTextStyle_static_020] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('fontWeight');
      console.info("[testTextStyle_static_020] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_020] fontWeight: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');

    });

    
    /**
     * @tc.number   testTextStyle_static_021
     * @tc.name     testTextStyle_static_021
     * @tc.desc     testTextStyle_static_021
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_021', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_021] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('fontFamily');
      console.info("[testTextStyle_static_021] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_021] fontFamily: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFamily'));
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('sans-serif');

    });

    
    /**
     * @tc.number   testTextStyle_static_022
     * @tc.name     testTextStyle_static_022
     * @tc.desc     testTextStyle_static_022
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_022', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_022] START');
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")?.notify({
          name: 'fontFamily', value: 'Arial'
        });
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.log("[testTextStyle_static_022] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('fontFamily');
      console.info("[testTextStyle_static_022] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_022] fontFamily: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFamily'));
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('Arial');

    });

    
    /**
     * @tc.number   testTextStyle_static_023
     * @tc.name     testTextStyle_static_023
     * @tc.desc     testTextStyle_static_023
     * @tc.level    Level.LEVEL1
     */
    it('testTextStyle_static_023', Level.LEVEL1, async () => {
      console.info('[testTextStyle_static_023] START');
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManager")?.notify({
          name: 'fontFamily', value: 'error'
        });
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.log("[testTextStyle_static_023] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('fontFamily');
      console.info("[testTextStyle_static_023] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testTextStyle_static_023] fontFamily: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFamily'));
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('error');
    });
  });
}