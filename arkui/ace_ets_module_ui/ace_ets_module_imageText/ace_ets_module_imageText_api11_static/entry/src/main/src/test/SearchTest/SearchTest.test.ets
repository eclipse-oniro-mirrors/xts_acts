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

import { describe, afterEach, beforeEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import common from "@ohos.app.ability.common";
// import { resourceManager } from '@kit.LocalizationKit';
import { Resource, Color, CancelButtonStyle, $r } from '@ohos.arkui.component';
import { SliderExampleManager } from '../../../ets/MainAbility/pages/Search/SearchTest';
import { MessageManager, Callback, Message } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { MessageManagerBase } from '../../../ets/MainAbility/common/MessageManager2';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

let emitKey = "emitUserAgent";

function spliceColor(sysColor: Resource) {
  const abilityStageContext = AppStorage.get<UIContext>('uiContext') as UIContext;
  let resourceColor = abilityStageContext.getHostContext()?.resourceManager.getColorSync(sysColor.id)
  let newArgb: string = '#' + resourceColor?.toString(16).toUpperCase()
  return newArgb;
}

export default function search() {
  describe('ActsAceSearchTest', () => {
    beforeAll(() => {
      console.info("search beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("SearchModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get SearchModifierTest state pages: " + JSON.stringify(pages));
        if (!("SearchTest" == pages.name)) {
          console.info("get SearchModifierTest state pages.name: " + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push SearchModifierTest page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0100
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0100
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0100] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0100]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("2.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0200
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0200
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0200]: " + JSON.stringify(newJson));

      let caretWidthNumber:number = 10;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretWidthNumber', value: caretWidthNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0200] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      await CommonFunc.sleep(1000);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0200]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0300
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0300
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0300] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0300]: " + JSON.stringify(newJson));

      let caretWidthString = '15px';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretWidthString', value: caretWidthString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0300] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0300]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("15.00px");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0400
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0400
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0400] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0400]: " + JSON.stringify(newJson));

      let caretWidthString = '10fp';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretWidthString', value: caretWidthString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0400] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0400]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("10.00fp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0500
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0500
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0500] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0500]: " + JSON.stringify(newJson));

      let caretWidthString = '15lpx';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretWidthString', value: caretWidthString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0500] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0500]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("15.00lpx");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0600
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0600
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0600] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0600]: " + JSON.stringify(newJson));
      let caretWidthResource = $r('sys.float.ohos_id_text_margin_vertical');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager
      sliderExampleManager.message.notify({
        name: 'caretWidthResource', value: caretWidthResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0600]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual('2.00vp');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0700
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0700
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0700] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0700]: " + JSON.stringify(newJson));

      let caretWidthNumber:number = 0;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretWidthNumber', value: caretWidthNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0700] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0700]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("0.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0800
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0800
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0800] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0800]: " + JSON.stringify(newJson));

      let caretWidthNumber: number = -1.5;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretWidthNumber', value: caretWidthNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0800] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0800]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("2.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0900
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0900
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0900] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0900]: " + JSON.stringify(newJson));

      let caretWidthNumber: number = 100000;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretWidthNumber', value: caretWidthNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0900] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0900]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("100000.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0900] end");
      done();
    });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1000
    //  * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1000
    //  * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1000
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CaretStyle_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1000] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1000]: " + JSON.stringify(newJson));
    //
    //   let caretWidthNumber = null;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'caretWidthNumber', value: caretWidthNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CaretStyle_static_1000] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1000]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1000]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1000]: " +
    //   obj.getElement('$attrs').getElement('caretStyle').getString('width'));
    //   expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("2.00vp");
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1000] end");
    //   done();
    // });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1100
    //  * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1100
    //  * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1100
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CaretStyle_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1100] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1100]: " + JSON.stringify(newJson));
    //
    //   let caretWidthNumber = undefined;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'caretWidthNumber', value: caretWidthNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CaretStyle_static_1100] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1100]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1100]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1100]: " +
    //   obj.getElement('$attrs').getElement('caretStyle').getString('width'));
    //   expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("2.00vp");
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1100] end");
    //   done();
    // });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1200
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1200
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1200] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1200]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1200]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('color'))
        .assertEqual(objDefault.getElement('$attrs').getElement('caretStyle').getString('color'));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1300
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1300
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1300] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1300]: " + JSON.stringify(newJson));

      let caretColorNumber:number = 0xff0000;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretColorNumber', value: caretColorNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_1300] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1300]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1400
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1400
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1400] start");
      let newJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1400]: " + JSON.stringify(newJson));

      let caretColorColor = Color.Red;
      try {
        AppStorage.get<MessageManagerBase<Color>>("messageManagerColor")?.notify({
          name: 'caretColorColor', value: caretColorColor
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_1400] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1400]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1500
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1500
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1500] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1500]: " + JSON.stringify(newJson));

      let caretColorString = '#ff9a35';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretColorString', value: caretColorString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_1500] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1500]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('color')).assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1600
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1600
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1600] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1600]: " + JSON.stringify(newJson));

      let caretColorResource = $r('sys.color.ohos_id_color_connected');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager
      sliderExampleManager.message.notify({
        name: 'caretColorResource', value: caretColorResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      let strJson2 = inspector.getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1600]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('caretStyle').getString('color'));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1700
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1700
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1700] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1700]: " + JSON.stringify(newJson));

      let caretColorString = 'abcdefghijk';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretColorString', value: caretColorString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_1700] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1700]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('caretStyle').getString('color'));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1700] end");
      done();
    });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1800
    //  * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1800
    //  * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1800
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CaretStyle_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1800] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1800]: " + JSON.stringify(newJson));
    //
    //   let caretColorNumber:number = null;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'caretColorNumber', value: caretColorNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CaretStyle_static_1800] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1800]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1800]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1800]: " +
    //   obj.getElement('$attrs').getElement('caretStyle').getString('color'));
    //   expect(obj.getElement('$attrs').getElement('caretStyle').getString('color'))
    //     .assertEqual(obj2.getElement('$attrs').getElement('caretStyle').getString('color'));
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1800] end");
    //   done();
    // });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1900
    //  * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1900
    //  * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1900
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CaretStyle_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1900] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1900]: " + JSON.stringify(newJson));
    //
    //   let caretColorNumber:number = undefined;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'caretColorNumber', value: caretColorNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CaretStyle_static_1900] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1900]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1900]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1900]: " +
    //   obj.getElement('$attrs').getElement('caretStyle').getString('color'));
    //   expect(obj.getElement('$attrs').getElement('caretStyle').getString('color'))
    //     .assertEqual(obj2.getElement('$attrs').getElement('caretStyle').getString('color'));
    //   console.info("[ArkUI_Stage_Search_CaretStyle_static_1900] end");
    //   done();
    // });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2000
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2000
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000]: " + JSON.stringify(newJson));

      let caretWidthNumber:number = 10;
      let caretColorNumber:number = 0xff0000;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretColorNumber', value: caretColorNumber
        });
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretWidthNumber', value: caretWidthNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_2000] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2100
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2100
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2100] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2100]: " + JSON.stringify(newJson));

      let caretColorString = 'rgb(0, 0, 255)';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretColorString', value: caretColorString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_2100] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2100]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('color')).assertEqual("#FF0000FF");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2200
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2200
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2200] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2200]: " + JSON.stringify(newJson));

      let caretColorString = 'rgba(0, 255, 0, 0)';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'caretColorString', value: caretColorString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_2200] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2200]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('color')).assertEqual("#0000FF00");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2200] end");
      done();
    });

    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2300
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2300
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_2300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUI_Stage_Search_CaretStyle_static_2300 START');
      let strJson = inspector.getInspectorByKey('searchTestDefaultapp');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2300]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2300] end");
      done();
    });

    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2400
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2400
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUI_Stage_Search_CaretStyle_static_2400 START');
      let strJson = inspector.getInspectorByKey('searchTestDefaultapp');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2400]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2400] end");
      done();
    });

    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2500
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2500
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUI_Stage_Search_CaretStyle_static_2500 START');
      let strJson = inspector.getInspectorByKey('searchTestDefaultapp001');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2500]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("5.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2600
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2600
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_2600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUI_Stage_Search_CaretStyle_static_2600 START');
      let strJson = inspector.getInspectorByKey('searchTestDefaultapp002');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2600]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('width'));
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2700
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2700
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_static_2700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700] start");
      let newJson = inspector.getInspectorByKey('searchTestfontcaretcolor');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700]: " + JSON.stringify(newJson));

      let textColorNumber:number = 0xff0000;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'textColorNumber', value: textColorNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_2700] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestfontcaretcolor');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700]: " +
      obj.getElement('$attrs').getString('fontColor'));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700]: " +
      obj.getElement('$attrs').getElement('caretStyle').getString('color'));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFFF0000");

      let newJson1 = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700]: " + JSON.stringify(newJson1));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');
      let obj1 = JSON.parseJsonElement(newJson1);
      expect(obj.getElement('$attrs').getElement('caretStyle').getString('color'))
        .assertEqual(obj1.getElement('$attrs').getElement('caretStyle').getString('color'));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0100
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0100
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0100] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchIcon_0100]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchIcon_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0100]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('size'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('size'))
        .assertEqual(objDefault.getElement('$attrs').getElement('searchIcon').getString('size'));
      console.info("[ArkUI_Stage_Search_SearchIcon_0100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0200
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0200
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber:number = 26;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconSizeNumber', value: leftSearchIconSizeNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0200] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('size'));
      let result: number = 26;
      const uiContext = AppStorage.get<UIContext>('uiContext');
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + uiContext!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('size'))
        .assertEqual(uiContext!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0300
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0300
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0300] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + JSON.stringify(newJson));

      let leftSearchIconSizeString = '50px';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconSizeString', value: leftSearchIconSizeString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0300] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + JSON.stringify(strJson))
      const uiContext = AppStorage.get<UIContext>('uiContext');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('size'));
      let result: string = uiContext!.px2vp(50) > 32 ? uiContext!.vp2px(32).toFixed(2) + "px" : '50.00px';
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + result);
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('size')).assertEqual(result);
      console.info("[ArkUI_Stage_Search_SearchIcon_0300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0400
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0400
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0400] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + JSON.stringify(newJson));

      let leftSearchIconSizeString = '50fp';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconSizeString', value: leftSearchIconSizeString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0400] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + JSON.stringify(strJson))
      const uiContext = AppStorage.get<UIContext>('uiContext');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('size'));
      let result: number = 32;
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + uiContext!.fp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('size'))
        .assertEqual(uiContext!.fp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0500
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0500
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0500] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + JSON.stringify(newJson));

      let leftSearchIconSizeString = '50lpx';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconSizeString', value: leftSearchIconSizeString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0500] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      const uiContext = AppStorage.get<UIContext>('uiContext');
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('size'));
      let result =
        uiContext!.px2vp(uiContext!.lpx2px(50)) > 32 ? uiContext!.vp2px(32).toFixed(2) : uiContext!.lpx2px(50).toFixed(2);
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + result);
      expect(Math.abs(Number((obj.getElement('$attrs').getElement('searchIcon').getString('size')).slice(0, -3)) -
      Number(result)) <= 1).assertTrue();
      expect((obj.getElement('$attrs').getElement('searchIcon').getString('size')).slice(-2)).assertEqual("px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0600
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0600
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0600] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + JSON.stringify(newJson));

      let leftSearchIconSizeResource = $r('sys.float.ohos_id_text_paragraph_margin_m');
      try {
        AppStorage.get<MessageManagerBase<Resource>>("messageManagerResource")?.notify({
          name: 'leftSearchIconSizeResource', value: leftSearchIconSizeResource
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0600] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + JSON.stringify(strJson))
      const uiContext = AppStorage.get<UIContext>('uiContext');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('size'));
      let result: number = 16;
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + uiContext!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('size'))
        .assertEqual(uiContext!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0700
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0700
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0700] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber:number = 40;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconSizeNumber', value: leftSearchIconSizeNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(5000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + JSON.stringify(strJson))
      const uiContext = AppStorage.get<UIContext>('uiContext');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('size'));
      let result: number = 32;
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + uiContext!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('size'))
        .assertEqual(uiContext!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0800
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0800
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0800] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber:number = 0;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconSizeNumber', value: leftSearchIconSizeNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0800] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + JSON.stringify(strJson))
      const uiContext = AppStorage.get<UIContext>('uiContext');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('size'));
      let result: number = 0;
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + uiContext!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('size'))
        .assertEqual(uiContext!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0900
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0900
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0900] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0900]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber:number = -16;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconSizeNumber', value: leftSearchIconSizeNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0900] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0900]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('size'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('size'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getString('size'));
      console.info("[ArkUI_Stage_Search_SearchIcon_0900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1000
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1000
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1000] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber:number = 10000;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconSizeNumber', value: leftSearchIconSizeNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1000] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " + JSON.stringify(strJson));
      const uiContext = AppStorage.get<UIContext>('uiContext');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('size'));
      let result: number = 32;
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " + uiContext!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('size'))
        .assertEqual(uiContext!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_1000] end");
      done();
    });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1100
    //  * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1100
    //  * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1100
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_SearchIcon_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1100] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1100]: " + JSON.stringify(newJson));
    //
    //   let leftSearchIconSizeNumber:number = null;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'leftSearchIconSizeNumber', value: leftSearchIconSizeNumber
    //     });
    //     ;
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_SearchIcon_1100] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1100]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1100]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1100]: " +
    //   obj.getElement('$attrs').getElement('searchIcon').getString('size'));
    //   expect(obj.getElement('$attrs').getElement('searchIcon').getString('size'))
    //     .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getString('size'));
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1100] end");
    //   done();
    // });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1200
    //  * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1200
    //  * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1200
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_SearchIcon_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1200] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1200]: " + JSON.stringify(newJson));
    //
    //   let leftSearchIconSizeNumber:number = undefined;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'leftSearchIconSizeNumber', value: leftSearchIconSizeNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_SearchIcon_1200] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1200]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1200]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1200]: " +
    //   obj.getElement('$attrs').getElement('searchIcon').getString('size'));
    //   expect(obj.getElement('$attrs').getElement('searchIcon').getString('size'))
    //     .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getString('size'));
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1200] end");
    //   done();
    // });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1300
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1300
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1300] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchIcon_1300]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchIcon_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1300]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('color'));
      expect('' + obj.getElement('$attrs').getElement('searchIcon').getString('color'))
        .assertContain(spliceColor($r('sys.color.search_symbol_icon_color')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1400
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1400
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1400]: " + JSON.stringify(newJson));

      let leftSearchIconColorNumber:int = 0x00ff00;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconColorNumber', value: leftSearchIconColorNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1400] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_1400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1400]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('color'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('color')).assertEqual("#FF00FF00");
      console.info("[ArkUI_Stage_Search_SearchIcon_1400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1500
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1500
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1500] start");
      let newJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_SearchIcon_1500]: " + JSON.stringify(newJson));

      let leftSearchIconColorColor = Color.Red;
      try {
        AppStorage.get<MessageManagerBase<Color>>("messageManagerColor")?.notify({
          name: 'leftSearchIconColorColor', value: leftSearchIconColorColor
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1500] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_SearchIcon_1500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_1500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1500]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('color'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_SearchIcon_1500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1600
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1600
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1600] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_1600]: " + JSON.stringify(newJson));

      let leftSearchIconColorString = '#ff9a35';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconColorString', value: leftSearchIconColorString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1600] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_1600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_1600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1600]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('color'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('color')).assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_SearchIcon_1600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1700
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1700
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1700] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_1700]: " + JSON.stringify(newJson));

      let leftSearchIconColorResource = $r('sys.color.ohos_id_color_connected');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager;
      sliderExampleManager.message.notify({
        name: 'leftSearchIconColorResource', value: leftSearchIconColorResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      let strJson2 = inspector.getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_SearchIcon_1700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_1700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1700]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('color'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getString('color'));
      console.info("[ArkUI_Stage_Search_SearchIcon_1700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1800
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1800
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1800] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_1800]: " + JSON.stringify(newJson));

      let leftSearchIconColorString = 'abcdefghijk';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconColorString', value: leftSearchIconColorString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1800] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_1800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_1800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1800]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('color'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getString('color'));
      console.info("[ArkUI_Stage_Search_SearchIcon_1800] end");
      done();
    });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1900
    //  * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1900
    //  * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1900
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_SearchIcon_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1900] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1900]: " + JSON.stringify(newJson));
    //
    //   let leftSearchIconColorNumber:number = null;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'leftSearchIconColorNumber', value: leftSearchIconColorNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_SearchIcon_1900] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1900]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1900]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1900]: " +
    //   obj.getElement('$attrs').getElement('searchIcon').getString('color'));
    //   expect(obj.getElement('$attrs').getElement('searchIcon').getString('color'))
    //     .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getString('color'));
    //   console.info("[ArkUI_Stage_Search_SearchIcon_1900] end");
    //   done();
    // });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2000
    //  * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2000
    //  * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2000
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_SearchIcon_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_SearchIcon_2000] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_2000]: " + JSON.stringify(newJson));
    //
    //   let leftSearchIconColorNumber:number = undefined;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'leftSearchIconColorNumber', value: leftSearchIconColorNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_SearchIcon_2000] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_2000]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_SearchIcon_2000]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
    //   console.info("[ArkUI_Stage_Search_SearchIcon_2000]: " +
    //   obj.getElement('$attrs').getElement('searchIcon').getString('color'));
    //   expect(obj.getElement('$attrs').getElement('searchIcon').getString('color'))
    //     .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getString('color'));
    //   console.info("[ArkUI_Stage_Search_SearchIcon_2000] end");
    //   done();
    // });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2100
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2100
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2100] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber:number = 26;
      let leftSearchIconColorNumber:int = 0x00ff00;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconSizeNumber', value: leftSearchIconSizeNumber
        });
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'leftSearchIconColorNumber', value: leftSearchIconColorNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2100);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('size'));
      let result: number = 26;
      const uiContext = AppStorage.get<UIContext>('uiContext');
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + uiContext!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('size'))
        .assertEqual(uiContext!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('color'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('color')).assertEqual("#FF00FF00");
      console.info("[ArkUI_Stage_Search_SearchIcon_2100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2200
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2200
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2200] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchIcon_2200]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getDouble('src')).assertEqual(983081);
      console.info("[ArkUI_Stage_Search_SearchIcon_2200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2300
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2300
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_2300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2300] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2300]: " + JSON.stringify(newJson));

      let searchSrcPath = 'common/icon2.svg';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchSrcPath', value: searchSrcPath
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2300] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2300]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('src'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('src')).assertEqual('common/icon2.svg');
      console.info("[ArkUI_Stage_Search_SearchIcon_2300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2400
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2400
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2400]: " + JSON.stringify(newJson));

      let searchSrcPath = 'common/icon2.jpg';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchSrcPath', value: searchSrcPath
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2400] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2400]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('src'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('src')).assertEqual('common/icon2.jpg');
      console.info("[ArkUI_Stage_Search_SearchIcon_2400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2500
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2500
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2500] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2500]: " + JSON.stringify(newJson));

      let searchSrcPath = 'common/icon2.png';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchSrcPath', value: searchSrcPath
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2500] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2500]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('src'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('src')).assertEqual('common/icon2.png');
      console.info("[ArkUI_Stage_Search_SearchIcon_2500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2600
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2600
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_2600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2600] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_2600]: " + JSON.stringify(newJson));

      let searchSrcPathResource = $r('sys.media.ohos_app_icon');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager
      sliderExampleManager.message.notify({
        name: 'searchSrcPathResource', value: searchSrcPathResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_2600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2600]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('src'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('src'))
        .assertEqual('resource:///125829858.png');
      console.info("[ArkUI_Stage_Search_SearchIcon_2600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2700
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2700
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_2700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2700] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2700]: " + JSON.stringify(newJson));

      let searchSrcPath = 'abc/def/ghi.jkl';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchSrcPath', value: searchSrcPath
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2700] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2700]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('src'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('src')).assertEqual('abc/def/ghi.jkl');
      console.info("[ArkUI_Stage_Search_SearchIcon_2700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2800
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2800
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_static_2800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2800] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2800]: " + JSON.stringify(newJson));

      let searchSrcPath = '';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchSrcPath', value: searchSrcPath
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2800] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2800]: " +
      obj.getElement('$attrs').getElement('searchIcon').getString('src'));
      expect(obj.getElement('$attrs').getElement('searchIcon').getString('src'))
        .assertEqual('resource:///ohos_search.svg');
      console.info("[ArkUI_Stage_Search_SearchIcon_2800] end");
      done();
    });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2900
    //  * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2900
    //  * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2900
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_SearchIcon_static_2900', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_SearchIcon_2900] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_2900]: " + JSON.stringify(newJson));
    //
    //   let searchSrcPath = null;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'searchSrcPath', value: searchSrcPath
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_SearchIcon_2900] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_2900]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("[ArkUI_Stage_Search_SearchIcon_2900]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
    //   console.info("[ArkUI_Stage_Search_SearchIcon_2900]: " +
    //   obj.getElement('$attrs').getElement('searchIcon').getString('src'));
    //   expect(obj.getElement('$attrs').getElement('searchIcon').getString('src'))
    //     .assertEqual('resource:///ohos_search.svg');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_2900] end");
    //   done();
    // });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_SearchIcon_static_3000
    //  * @tc.name     ArkUI_Stage_Search_SearchIcon_static_3000
    //  * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_3000
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_SearchIcon_static_3000', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_SearchIcon_3000] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_3000]: " + JSON.stringify(newJson));
    //
    //   let searchSrcPath = undefined;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'searchSrcPath', value: searchSrcPath
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_SearchIcon_3000] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_3000]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("[ArkUI_Stage_Search_SearchIcon_3000]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
    //   console.info("[ArkUI_Stage_Search_SearchIcon_3000]: " +
    //   obj.getElement('$attrs').getElement('searchIcon').getString('src'));
    //   expect(obj.getElement('$attrs').getElement('searchIcon').getString('src'))
    //     .assertEqual('resource:///ohos_search.svg');
    //   console.info("[ArkUI_Stage_Search_SearchIcon_3000] end");
    //   done();
    // });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0100
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0100
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0100] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CancelButton_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0100]: " +
      obj.getElement('$attrs').getElement('cancelButton').getString('style'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getString('style'))
        .assertEqual("CancelButtonStyle.INPUT");
      console.info("[ArkUI_Stage_Search_CancelButton_0100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0200
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0200
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0200]: " + JSON.stringify(newJson));

      let rightButtonStyleParam = CancelButtonStyle.CONSTANT;
      try {
        AppStorage.get<MessageManagerBase<CancelButtonStyle>>("messageManager_CancelButtonStyle")?.notify({
          name: 'rightButtonStyleParam', value: rightButtonStyleParam
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_0200] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0200]: " +
      obj.getElement('$attrs').getElement('cancelButton').getString('style'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getString('style'))
        .assertEqual("CancelButtonStyle.CONSTANT");
      console.info("[ArkUI_Stage_Search_CancelButton_0200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0300
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0300
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0300] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0300]: " + JSON.stringify(newJson));

      let rightButtonStyleParam = CancelButtonStyle.INVISIBLE;
      try {
        AppStorage.get<MessageManagerBase<CancelButtonStyle>>("messageManager_CancelButtonStyle")?.notify({
          name: 'rightButtonStyleParam', value: rightButtonStyleParam
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_0300] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0300]: " +
      obj.getElement('$attrs').getElement('cancelButton').getString('style'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getString('style'))
        .assertEqual("CancelButtonStyle.INVISIBLE");
      console.info("[ArkUI_Stage_Search_CancelButton_0300] end");
      done();
    });

    // /**
    //  * @tc.number ArkUI_Stage_Search_CancelButton_0400
    //  * @tc.name Tests the cancelButton property of the search component
    //  * @tc.desc Set the value of cancelButton.style as null
    //  */
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CancelButton_static_0400
    //  * @tc.name     ArkUI_Stage_Search_CancelButton_static_0400
    //  * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0400
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CancelButton_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CancelButton_0400] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_0400]: " + JSON.stringify(newJson));
    //
    //   let rightButtonStyleParam = -1;
    //   try {
    //     AppStorage.get<MessageManagerBase<CancelButtonStyle>>("messageManager_CancelButtonStyle")?.notify({
    //       name: 'rightButtonStyleParam', value: rightButtonStyleParam
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CancelButton_0400] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_0400]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("[ArkUI_Stage_Search_CancelButton_0400]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
    //   console.info("[ArkUI_Stage_Search_CancelButton_0400]: " +
    //   obj.getElement('$attrs').getElement('cancelButton').getString('style'));
    //   expect(obj.getElement('$attrs').getElement('cancelButton').getString('style'))
    //     .assertEqual("CancelButtonStyle.INPUT");
    //   console.info("[ArkUI_Stage_Search_CancelButton_0400] end");
    //   done();
    // });

    // /**
    //  * @tc.number ArkUI_Stage_Search_CancelButton_0500
    //  * @tc.name Tests the cancelButton property of the search component
    //  * @tc.desc Set the value of cancelButton.style as undefined
    //  */
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CancelButton_static_0500
    //  * @tc.name     ArkUI_Stage_Search_CancelButton_static_0500
    //  * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0500
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CancelButton_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CancelButton_0500] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_0500]: " + JSON.stringify(newJson));
    //
    //   let rightButtonStyleParam = -1;
    //   try {
    //     AppStorage.get<MessageManagerBase<CancelButtonStyle>>("messageManager_CancelButtonStyle")?.notify({
    //       name: 'rightButtonStyleParam', value: rightButtonStyleParam
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CancelButton_0500] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_0500]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("[ArkUI_Stage_Search_CancelButton_0500]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
    //   console.info("[ArkUI_Stage_Search_CancelButton_0500]: " +
    //   obj.getElement('$attrs').getElement('cancelButton').getString('style'));
    //   expect(obj.getElement('$attrs').getElement('cancelButton').getString('style'))
    //     .assertEqual("CancelButtonStyle.INPUT");
    //   console.info("[ArkUI_Stage_Search_CancelButton_0500] end");
    //   done();
    // });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0600
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0600
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0600] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CancelButton_0600]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_CancelButton_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0600]: " +obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'))
        .assertEqual(objDefault.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'));
      console.info("[ArkUI_Stage_Search_CancelButton_0600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0700
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0700
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0700] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber:number = 26;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconSizeNumber', value: rightCancelIconSizeNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_0700] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " +obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size'));
      let result: number = 26;
      const uiContext = AppStorage.get<UIContext>('uiContext');
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " + uiContext!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'))
        .assertEqual(uiContext!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_0700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0800
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0800
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0800] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " + JSON.stringify(newJson));

      let rightCancelIconSizeString = '50px';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconSizeString', value: rightCancelIconSizeString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_0800] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " +obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size'));
      const uiContext = AppStorage.get<UIContext>('uiContext');
      let result: string = uiContext!.px2vp(50) > 32 ? uiContext!.vp2px(32).toFixed(2) + "px" : '50.00px';
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " + result);
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'))
        .assertEqual(result);
      console.info("[ArkUI_Stage_Search_CancelButton_0800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0900
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0900
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0900] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " + JSON.stringify(newJson));

      let rightCancelIconSizeString = '50fp';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconSizeString', value: rightCancelIconSizeString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_0900] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " +obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size'));
      let result: number = 32;
      const uiContext = AppStorage.get<UIContext>('uiContext');
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " + uiContext!.fp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'))
        .assertEqual(uiContext!.fp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_0900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1000
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1000
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1000] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " + JSON.stringify(newJson));

      let rightCancelIconSizeString = '50lpx';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconSizeString', value: rightCancelIconSizeString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_1000] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      const uiContext = AppStorage.get<UIContext>('uiContext');
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " +obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size'));
      let result =
        uiContext!.px2vp(uiContext!.lpx2px(50)) > 32 ? uiContext!.vp2px(32).toFixed(2) : uiContext!.lpx2px(50).toFixed(2);
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " + result);
      expect(Math.abs(Number((obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size')).slice(0, -3)) - Number(result)) <= 1).assertTrue();
      expect((obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size')).slice(-2))
        .assertEqual("px");
      console.info("[ArkUI_Stage_Search_CancelButton_1000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1100
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1100
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1100] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " + JSON.stringify(newJson));

      let rightCancelIconSizeResource = $r('sys.float.ohos_id_text_paragraph_margin_m');
      try {
        AppStorage.get<MessageManagerBase<Resource>>("messageManagerResource")?.notify({
          name: 'rightCancelIconSizeResource', value: rightCancelIconSizeResource
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_1100] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " +obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size'));
      let result: number = 16;
      const uiContext = AppStorage.get<UIContext>('uiContext');
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " + uiContext!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'))
        .assertEqual(uiContext!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_1100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1200
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1200
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber:number = 40;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconSizeNumber', value: rightCancelIconSizeNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(5000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " +obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size'));
      let result: number = 32;
      const uiContext = AppStorage.get<UIContext>('uiContext');
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " + uiContext!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'))
        .assertEqual(uiContext!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_1200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1300
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1300
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1300] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1300]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber:number = 16;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconSizeNumber', value: rightCancelIconSizeNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_1300] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1300]: " +obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'))
        .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'));
      console.info("[ArkUI_Stage_Search_CancelButton_1300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1400
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1400
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1400]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber:number = -16;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconSizeNumber', value: rightCancelIconSizeNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_1400] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_1400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1400]: " +obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'))
        .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'));
      console.info("[ArkUI_Stage_Search_CancelButton_1400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1500
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1500
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1500] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber:number = 10000;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconSizeNumber', value: rightCancelIconSizeNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_1500] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " +obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size'));
      let result: number = 32;
      const uiContext = AppStorage.get<UIContext>('uiContext');
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " + uiContext!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'))
        .assertEqual(uiContext!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_1500] end");
      done();
    });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CancelButton_static_1600
    //  * @tc.name     ArkUI_Stage_Search_CancelButton_static_1600
    //  * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1600
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CancelButton_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CancelButton_1600] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_1600]: " + JSON.stringify(newJson));
    //
    //   let rightCancelIconSizeNumber:number = null;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'rightCancelIconSizeNumber', value: rightCancelIconSizeNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CancelButton_1600] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_CancelButton_1600]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_CancelButton_1600]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
    //   console.info("[ArkUI_Stage_Search_CancelButton_1600]: " +obj.getElement('$attrs')
    //     .getElement('cancelButton')
    //     .getElement('icon')
    //     .getString('size'));
    //   expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'))
    //     .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'));
    //   console.info("[ArkUI_Stage_Search_CancelButton_1600] end");
    //   done();
    // });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CancelButton_static_1700
    //  * @tc.name     ArkUI_Stage_Search_CancelButton_static_1700
    //  * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1700
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CancelButton_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CancelButton_1700] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_1700]: " + JSON.stringify(newJson));
    //
    //   let rightCancelIconSizeNumber:number = undefined;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'rightCancelIconSizeNumber', value: rightCancelIconSizeNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CancelButton_1700] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_CancelButton_1700]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_CancelButton_1700]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
    //   console.info("[ArkUI_Stage_Search_CancelButton_1700]: " +obj.getElement('$attrs')
    //     .getElement('cancelButton')
    //     .getElement('icon')
    //     .getString('size'));
    //   expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'))
    //     .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'));
    //   console.info("[ArkUI_Stage_Search_CancelButton_1700] end");
    //   done();
    // });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1800
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1800
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1800] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CancelButton_1800]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_CancelButton_1800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1800]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('color'));
      expect('' + obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'))
        .assertContain(spliceColor($r('sys.color.search_symbol_icon_color')));
      console.info("[ArkUI_Stage_Search_CancelButton_1800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1900
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1900
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1900] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1900]: " + JSON.stringify(newJson));

      let rightCancelIconColorNumber:number = 0x00ff00;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconColorNumber', value: rightCancelIconColorNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_1900] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1900]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('color'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'))
        .assertEqual("#FF00FF00");
      console.info("[ArkUI_Stage_Search_CancelButton_1900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2000
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2000
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2000] start");
      let newJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CancelButton_2000]: " + JSON.stringify(newJson));

      let rightCancelIconColorColor = Color.Red;
      try {
        AppStorage.get<MessageManagerBase<Color>>("messageManagerColor")?.notify({
          name: 'rightCancelIconColorColor', value: rightCancelIconColorColor
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_2000] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CancelButton_2000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2000]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('color'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'))
        .assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CancelButton_2000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2100
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2100
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2100] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_2100]: " + JSON.stringify(newJson));

      let rightCancelIconColorString = '#ff9a35';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconColorString', value: rightCancelIconColorString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_2100] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_2100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2100]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('color'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'))
        .assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_CancelButton_2100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2200
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2200
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2200] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_2200]: " + JSON.stringify(newJson));

      let rightCancelIconColorResource = $r('sys.color.ohos_id_color_connected');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager
      sliderExampleManager.message.notify({
        name: 'rightCancelIconColorResource', value: rightCancelIconColorResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      let strJson2 = inspector.getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_CancelButton_2200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_2200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2200]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('color'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'));
      console.info("[ArkUI_Stage_Search_CancelButton_2200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2300
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2300
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_2300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2300] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_2300]: " + JSON.stringify(newJson));

      let rightCancelIconColorString = 'abcdefghijk';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconColorString', value: rightCancelIconColorString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_2300] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_2300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_2300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2300]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('color'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'));
      console.info("[ArkUI_Stage_Search_CancelButton_2300] end");
      done();
    });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CancelButton_static_2400
    //  * @tc.name     ArkUI_Stage_Search_CancelButton_static_2400
    //  * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2400
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CancelButton_static_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CancelButton_2400] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_2400]: " + JSON.stringify(newJson));
    //
    //   let rightCancelIconColorNumber:number = null;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'rightCancelIconColorNumber', value: rightCancelIconColorNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CancelButton_2400] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_CancelButton_2400]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_CancelButton_2400]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
    //   console.info("[ArkUI_Stage_Search_CancelButton_2400]: " + obj.getElement('$attrs')
    //     .getElement('cancelButton')
    //     .getElement('icon')
    //     .getString('color'));
    //   expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'))
    //     .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'));
    //   console.info("[ArkUI_Stage_Search_CancelButton_2400] end");
    //   done();
    // });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CancelButton_static_2500
    //  * @tc.name     ArkUI_Stage_Search_CancelButton_static_2500
    //  * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2500
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CancelButton_static_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CancelButton_2500] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_2500]: " + JSON.stringify(newJson));
    //
    //   let rightCancelIconColorNumber:number = undefined;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'rightCancelIconColorNumber', value: rightCancelIconColorNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CancelButton_2500] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_CancelButton_2500]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_CancelButton_2500]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
    //   console.info("[ArkUI_Stage_Search_CancelButton_2500]: " + obj.getElement('$attrs')
    //     .getElement('cancelButton')
    //     .getElement('icon')
    //     .getString('color'));
    //   expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'))
    //     .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'));
    //   console.info("[ArkUI_Stage_Search_CancelButton_2500] end");
    //   done();
    // });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2600
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2600
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_2600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2600] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber:number = 26;
      let rightCancelIconColorNumber:number = 0x00ff00;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconSizeNumber', value: rightCancelIconSizeNumber
        });
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightCancelIconColorNumber', value: rightCancelIconColorNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_2600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2700);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " +obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size'));
      let result: number = 26;
      const uiContext = AppStorage.get<UIContext>('uiContext');
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + uiContext!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size'))
        .assertEqual(uiContext!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('color'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('color'))
        .assertEqual("#FF00FF00");
      console.info("[ArkUI_Stage_Search_CancelButton_2600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2700
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2700
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_2700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2700] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CancelButton_2700]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2700]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getDouble('src'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getDouble('src')).assertEqual(983126);
      console.info("[ArkUI_Stage_Search_CancelButton_2700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2800
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2800
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_2800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2800] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2800]: " + JSON.stringify(newJson));

      let rightIconSrcPath = 'common/icon2.svg';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightIconSrcPath', value: rightIconSrcPath
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_2800] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2800]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('src'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('src'))
        .assertEqual('common/icon2.svg');
      console.info("[ArkUI_Stage_Search_CancelButton_2800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2900
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2900
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_2900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2900] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2900]: " + JSON.stringify(newJson));

      let rightIconSrcPath = 'common/icon2.jpg';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightIconSrcPath', value: rightIconSrcPath
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_2900] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2900]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('src'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('src'))
        .assertEqual('common/icon2.jpg');
      console.info("[ArkUI_Stage_Search_CancelButton_2900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_3000
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_3000
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_3000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_3000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_3000] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3000]: " + JSON.stringify(newJson));

      let rightIconSrcPath = 'common/icon2.png';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightIconSrcPath', value: rightIconSrcPath
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_3000] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_3000]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('src'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('src'))
        .assertEqual('common/icon2.png');
      console.info("[ArkUI_Stage_Search_CancelButton_3000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_3100
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_3100
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_3100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_3100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_3100] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_3100]: " + JSON.stringify(newJson));

      let rightIconSrcPathResource = $r('sys.media.ohos_app_icon');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager
      sliderExampleManager.message.notify({
        name: 'rightIconSrcPathResource', value: rightIconSrcPathResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_3100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_3100]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('src'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('src'))
        .assertEqual('resource:///125829858.png');
      console.info("[ArkUI_Stage_Search_CancelButton_3100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_3200
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_3200
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_3200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_static_3200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_3200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3200]: " + JSON.stringify(newJson));

      let rightIconSrcPath = 'abc/def/ghi.jkl';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'rightIconSrcPath', value: rightIconSrcPath
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_CancelButton_3200] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_3200]: " + obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('src'));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('src'))
        .assertEqual('abc/def/ghi.jkl');
      console.info("[ArkUI_Stage_Search_CancelButton_3200] end");
      done();
    });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CancelButton_static_3300
    //  * @tc.name     ArkUI_Stage_Search_CancelButton_static_3300
    //  * @tc.desc     ArkUI_Stage_Search_CancelButton_static_3300
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CancelButton_static_3300', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CancelButton_3300] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_3300]: " + JSON.stringify(newJson));
    //
    //   let rightIconSrcPath = '';
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'rightIconSrcPath', value: rightIconSrcPath
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CancelButton_3300] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_3300]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("[ArkUI_Stage_Search_CancelButton_3300]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
    //   console.info("[ArkUI_Stage_Search_CancelButton_3300]: " + obj.getElement('$attrs')
    //     .getElement('cancelButton')
    //     .getElement('icon')
    //     .getString('src'));
    //   expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('src'))
    //     .assertEqual('resource:///ohos_close.svg');
    //   console.info("[ArkUI_Stage_Search_CancelButton_3300] end");
    //   done();
    // });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CancelButton_static_3400
    //  * @tc.name     ArkUI_Stage_Search_CancelButton_static_3400
    //  * @tc.desc     ArkUI_Stage_Search_CancelButton_static_3400
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CancelButton_static_3400', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CancelButton_3400] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_3400]: " + JSON.stringify(newJson));
    //
    //   let rightIconSrcPath = null;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'rightIconSrcPath', value: rightIconSrcPath
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CancelButton_3400] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_3400]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("[ArkUI_Stage_Search_CancelButton_3400]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
    //   console.info("[ArkUI_Stage_Search_CancelButton_3400]: " + obj.getElement('$attrs')
    //     .getElement('cancelButton')
    //     .getElement('icon')
    //     .getString('src'));
    //   expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('src'))
    //     .assertEqual('resource:///ohos_close.svg');
    //   console.info("[ArkUI_Stage_Search_CancelButton_3400] end");
    //   done();
    // });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_CancelButton_static_3500
    //  * @tc.name     ArkUI_Stage_Search_CancelButton_static_3500
    //  * @tc.desc     ArkUI_Stage_Search_CancelButton_static_3500
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_CancelButton_static_3500', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_CancelButton_3500] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_3500]: " + JSON.stringify(newJson));
    //
    //   let rightIconSrcPath = undefined;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'rightIconSrcPath', value: rightIconSrcPath
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_CancelButton_3500] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_CancelButton_3500]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("[ArkUI_Stage_Search_CancelButton_3500]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
    //   console.info("[ArkUI_Stage_Search_CancelButton_3500]: " + obj.getElement('$attrs')
    //     .getElement('cancelButton')
    //     .getElement('icon')
    //     .getString('src'));
    //   expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('src'))
    //     .assertEqual('resource:///ohos_close.svg');
    //   console.info("[ArkUI_Stage_Search_CancelButton_3500] end");
    //   done();
    // });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0100
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0100
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0100] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchButton_0100]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchButton_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0100]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      console.log("=================================== fontSize1 " + obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      console.log("=================================== fontSize2 " + objDefault.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'))
        .assertEqual(objDefault.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      console.info("[ArkUI_Stage_Search_SearchButton_0100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0200
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0200
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0200] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0200]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '20vp';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontSizeString', value: searchButtonFontSizeString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_0200] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0200]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize')).assertEqual("20.00vp");
      console.info("[ArkUI_Stage_Search_SearchButton_0200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0300
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0300
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0300] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0300]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '40vp';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontSizeString', value: searchButtonFontSizeString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_0300] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0300]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize')).assertEqual("40.00vp");
      console.info("[ArkUI_Stage_Search_SearchButton_0300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0400
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0400
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_0400]: " + JSON.stringify(newJson));

      let searchButtonFontSizeNumber:number = 20;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontSizeNumber', value: searchButtonFontSizeNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_0400] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0400]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize')).assertEqual('20.00fp');
      console.info("[ArkUI_Stage_Search_SearchButton_0400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0500
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0500
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0500] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0500]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '40px';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontSizeString', value: searchButtonFontSizeString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_0500] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0500]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize')).assertEqual("40.00px");
      console.info("[ArkUI_Stage_Search_SearchButton_0500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0600
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0600
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0600] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0600]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '40lpx';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontSizeString', value: searchButtonFontSizeString
        });
        await CommonFunc.sleep(2000);
        console.info("[ArkUI_Stage_Search_SearchButton_0600] start to publish emit");
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_0600] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0600]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize')).assertEqual("40.00lpx");
      console.info("[ArkUI_Stage_Search_SearchButton_0600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0700
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0700
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0700] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchButton_0700]: " + JSON.stringify(newJson));

      let searchButtonFontSizeResource = $r('sys.float.ohos_id_text_paragraph_margin_m');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager;
      sliderExampleManager.message.notify({
        name: 'searchButtonFontSizeResource', value: searchButtonFontSizeResource
      } as Message);
      await CommonFunc.sleep(5000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchButton_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0700]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize')).assertEqual('16.00vp');
      console.info("[ArkUI_Stage_Search_SearchButton_0700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0800
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0800
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0800] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0800]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '0vp';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontSizeString', value: searchButtonFontSizeString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_0800] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0800]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize')).assertEqual("0.00vp");
      console.info("[ArkUI_Stage_Search_SearchButton_0800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0900
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0900
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0900] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0900]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '800vp';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontSizeString', value: searchButtonFontSizeString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_0900] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0900]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize')).assertEqual("800.00vp");
      console.info("[ArkUI_Stage_Search_SearchButton_0900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1000
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1000
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1000] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1000]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '-14vp';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontSizeString', value: searchButtonFontSizeString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_1000] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      const uiContext = AppStorage.get<UIContext>('uiContext');
      console.info("[ArkUI_Stage_Search_SearchButton_1000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1000]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
      let resourceSize = context?.resourceManager.getDouble($r('sys.float.Body_M').id) as double
      console.info("[TextInputPageJsunit_0200] size: " + uiContext!.px2fp(resourceSize));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'))
        .assertEqual('' + Math.round(uiContext!.px2fp(resourceSize)) + '.00fp');
      console.info("[ArkUI_Stage_Search_SearchButton_1000] end");
      done();
    });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_SearchButton_static_1100
    //  * @tc.name     ArkUI_Stage_Search_SearchButton_static_1100
    //  * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1100
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_SearchButton_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_SearchButton_1100] start");
    //   let newJson = inspector.getInspectorByKey('searchTestString');
    //   console.info("[ArkUI_Stage_Search_SearchButton_1100]: " + JSON.stringify(newJson));
    //
    //   let searchButtonFontSizeString = null;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'searchButtonFontSizeString', value: searchButtonFontSizeString
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_SearchButton_1100] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestString');
    //   console.info("[ArkUI_Stage_Search_SearchButton_1100]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   const uiContext = AppStorage.get<UIContext>('uiContext');
    //   // const abilityStageContext =
    //   //   AppStorage.get<common.AbilityStageContext>('stageContext') as common.AbilityStageContext;
    //   console.info("[ArkUI_Stage_Search_SearchButton_1100]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
    //   console.info("[ArkUI_Stage_Search_SearchButton_1100]: " +
    //   obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
    //   // let resourceSize = abilityStageContext.resourceManager.getNumber($r('sys.float.Body_M').id)
    //   // console.info("[TextInputPageJsunit_0200] size: " + uiContext!.px2fp(resourceSize));
    //   // expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'))
    //   //   .assertEqual('' + Math.round(uiContext!.px2fp(resourceSize)) + '.00fp');
    //   console.info("[ArkUI_Stage_Search_SearchButton_1100] end");
    //   done();
    // });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_SearchButton_static_1200
    //  * @tc.name     ArkUI_Stage_Search_SearchButton_static_1200
    //  * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1200
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_SearchButton_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_SearchButton_1200] start");
    //   let newJson = inspector.getInspectorByKey('searchTestString');
    //   console.info("[ArkUI_Stage_Search_SearchButton_1200]: " + JSON.stringify(newJson));
    //
    //   let searchButtonFontSizeString = undefined;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'searchButtonFontSizeString', value: searchButtonFontSizeString
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_SearchButton_1200] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //   const uiContext = AppStorage.get<UIContext>('uiContext');
    //   // const abilityStageContext =
    //   //   AppStorage.get<common.AbilityStageContext>('stageContext') as common.AbilityStageContext;
    //   let strJson = inspector.getInspectorByKey('searchTestString');
    //   console.info("[ArkUI_Stage_Search_SearchButton_1200]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("[ArkUI_Stage_Search_SearchButton_1200]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
    //   console.info("[ArkUI_Stage_Search_SearchButton_1200]: " +
    //   obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
    //   // let resourceSize = abilityStageContext.resourceManager.getNumber($r('sys.float.Body_M').id)
    //   // console.info("[TextInputPageJsunit_0200] size: " + uiContext!.px2fp(resourceSize));
    //   // expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'))
    //   //   .assertEqual('' + Math.round(uiContext!.px2fp(resourceSize)) + '.00fp');
    //   console.info("[ArkUI_Stage_Search_SearchButton_1200] end");
    //   done();
    // });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1300
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1300
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1300] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchButton_1300]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchButton_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1300]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
        .assertEqual(objDefault.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'));
      console.info("[ArkUI_Stage_Search_SearchButton_1300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1400
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1400
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_1400]: " + JSON.stringify(newJson));

      let searchButtonFontColorNumber:number = 0xff0000;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontColorNumber', value: searchButtonFontColorNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_1400] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_1400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1400]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
        .assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_SearchButton_1400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1500
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1500
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1500] start");
      let newJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_SearchButton_1500]: " + JSON.stringify(newJson));

      let searchButtonFontColorColor = Color.Blue;
      try {
        AppStorage.get<MessageManagerBase<Color>>("messageManagerColor")?.notify({
          name: 'searchButtonFontColorColor', value: searchButtonFontColorColor
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_1500] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_SearchButton_1500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_1500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1500]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
        .assertEqual("#FF0000FF");
      console.info("[ArkUI_Stage_Search_SearchButton_1500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1600
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1600
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1600] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1600]: " + JSON.stringify(newJson));

      let searchButtonFontColorString = '#ff9a35';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontColorString', value: searchButtonFontColorString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_1600] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_1600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1600]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
        .assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_SearchButton_1600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1700
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1700
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1700] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchButton_1700]: " + JSON.stringify(newJson));

      let searchButtonFontColorResource = $r('sys.color.ohos_id_color_connected');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager;
      sliderExampleManager.message.notify({
        name: 'searchButtonFontColorResource', value: searchButtonFontColorResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      let strJson2 = inspector.getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_SearchButton_1700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchButton_1700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1700]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'));
      console.info("[ArkUI_Stage_Search_SearchButton_1700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1800
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1800
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1800] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1800]: " + JSON.stringify(newJson));

      let searchButtonFontColorString = 'abcdefghijk';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontColorString', value: searchButtonFontColorString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_1800] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchButton_1800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchButton_1800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1800]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'));
      console.info("[ArkUI_Stage_Search_SearchButton_1800] end");
      done();
    });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_SearchButton_static_1900
    //  * @tc.name     ArkUI_Stage_Search_SearchButton_static_1900
    //  * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1900
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_SearchButton_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_SearchButton_1900] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_SearchButton_1900]: " + JSON.stringify(newJson));
    //
    //   let searchButtonFontColorNumber:number = null;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'searchButtonFontColorNumber', value: searchButtonFontColorNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_SearchButton_1900] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_SearchButton_1900]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_SearchButton_1900]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
    //   console.info("[ArkUI_Stage_Search_SearchButton_1900]: " +
    //   obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
    //   expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
    //     .assertEqual(obj2.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'));
    //   console.info("[ArkUI_Stage_Search_SearchButton_1900] end");
    //   done();
    // });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_SearchButton_static_2000
    //  * @tc.name     ArkUI_Stage_Search_SearchButton_static_2000
    //  * @tc.desc     ArkUI_Stage_Search_SearchButton_static_2000
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_SearchButton_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_SearchButton_2000] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_SearchButton_2000]: " + JSON.stringify(newJson));
    //
    //   let searchButtonFontColorNumber:number = undefined;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'searchButtonFontColorNumber', value: searchButtonFontColorNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_SearchButton_2000] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_SearchButton_2000]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_SearchButton_2000]: " +
    //   JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
    //   console.info("[ArkUI_Stage_Search_SearchButton_2000]: " +
    //   obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
    //   expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
    //     .assertEqual(obj2.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'));
    //   console.info("[ArkUI_Stage_Search_SearchButton_2000] end");
    //   done();
    // });

    
    /**
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_2100
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_2100
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_2100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_2100] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " + JSON.stringify(newJson));

      let searchButtonFontSizeNumber:number = 20;
      let searchButtonFontColorNumber:number = 0xff0000;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontSizeNumber', value: searchButtonFontSizeNumber
        });
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'searchButtonFontColorNumber', value: searchButtonFontColorNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_SearchButton_2100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2100);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize'));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontSize')).assertEqual("20.00fp");
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " +
      obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getString('fontColor'))
        .assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_SearchButton_2100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0100
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0100
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0100] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      let newJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_FontColor_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let obj2 = JSON.parseJsonElement(newJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0100]: " +
      obj.getElement('$attrs').getString('fontColor'));
      expect(obj.getElement('$attrs').getString('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getString('fontColor'));
      console.info("[ArkUI_Stage_Search_FontColor_0100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0200
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0200
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_FontColor_0200]: " + JSON.stringify(newJson));

      let textColorNumber:number = 0xff0000;
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'textColorNumber', value: textColorNumber
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_FontColor_0200] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_FontColor_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_FontColor_0200]: " +
      obj.getElement('$attrs').getString('fontColor'));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_FontColor_0200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0300
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0300
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0300] start");
      let newJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_FontColor_0300]: " + JSON.stringify(newJson));

      let textColorColor = Color.Red;
      try {
        AppStorage.get<MessageManagerBase<Color>>("messageManagerColor")?.notify({
          name: 'textColorColor', value: textColorColor
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_FontColor_0300] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_FontColor_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_FontColor_0300]: " +
      obj.getElement('$attrs').getString('fontColor'));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_FontColor_0300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0400
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0400
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0400] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_FontColor_0400]: " + JSON.stringify(newJson));

      let textColorString = '#ff9a35';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'textColorString', value: textColorString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_FontColor_0400] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_FontColor_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_FontColor_0400]: " +
      obj.getElement('$attrs').getString('fontColor'));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_FontColor_0400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0500
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0500
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0500] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_FontColor_0500]: " + JSON.stringify(newJson));

      let textColorResource = $r('sys.color.ohos_id_color_connected');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager;
      sliderExampleManager.message.notify({
        name: 'textColorResource', value: textColorResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      let strJson2 = inspector.getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_FontColor_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0500]: " +
      obj.getElement('$attrs').getString('fontColor'));
      expect(obj.getElement('$attrs').getString('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getString('fontColor'));
      console.info("[ArkUI_Stage_Search_FontColor_0500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0600
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0600
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0600] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_FontColor_0600]: " + JSON.stringify(newJson));

      let textColorString = 'abcdefghijk';
      try {
        AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
          name: 'textColorString', value: textColorString
        });
        await CommonFunc.sleep(2000);
      } catch (err: Error) {
        console.log("[ArkUI_Stage_Search_FontColor_0600] change component data error: " + err.message);
      }

      let strJson = inspector.getInspectorByKey('searchTestString');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_FontColor_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0600]: " +
      obj.getElement('$attrs').getString('fontColor'));
      expect(obj.getElement('$attrs').getString('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getString('fontColor'));
      console.info("[ArkUI_Stage_Search_FontColor_0600] end");
      done();
    });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_FontColor_static_0700
    //  * @tc.name     ArkUI_Stage_Search_FontColor_static_0700
    //  * @tc.desc     ArkUI_Stage_Search_FontColor_static_0700
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_FontColor_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_FontColor_0700] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_FontColor_0700]: " + JSON.stringify(newJson));
    //
    //   let textColorNumber:number = null;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'textColorNumber', value: textColorNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_FontColor_0700] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_FontColor_0700]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_FontColor_0700]: " +
    //   obj.getElement('$attrs').getString('fontColor'));
    //   expect(obj.getElement('$attrs').getString('fontColor'))
    //     .assertEqual(obj2.getElement('$attrs').getString('fontColor'));
    //   console.info("[ArkUI_Stage_Search_FontColor_0700] end");
    //   done();
    // });

    
    // /*
    //  * @tc.number   ArkUI_Stage_Search_FontColor_static_0800
    //  * @tc.name     ArkUI_Stage_Search_FontColor_static_0800
    //  * @tc.desc     ArkUI_Stage_Search_FontColor_static_0800
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_Search_FontColor_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Search_FontColor_0800] start");
    //   let newJson = inspector.getInspectorByKey('searchTestNumber');
    //   console.info("[ArkUI_Stage_Search_FontColor_0800]: " + JSON.stringify(newJson));
    //
    //   let textColorNumber:number = undefined;
    //   try {
    //     AppStorage.get<MessageManagerBase<number|int|string>>("messageManagerBase")?.notify({
    //       name: 'textColorNumber', value: textColorNumber
    //     });
    //     await CommonFunc.sleep(2000);
    //   } catch (err: Error) {
    //     console.log("[ArkUI_Stage_Search_FontColor_0800] change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //
    //   let strJson = inspector.getInspectorByKey('searchTestNumber');
    //   let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
    //   console.info("[ArkUI_Stage_Search_FontColor_0800]: " + JSON.stringify(strJson))
    //   let obj = JSON.parseJsonElement(strJson);
    //   let obj2 = JSON.parseJsonElement(strJson2);
    //   console.info("[ArkUI_Stage_Search_FontColor_0800]: " +
    //   obj.getElement('$attrs').getString('fontColor'));
    //   expect(obj.getElement('$attrs').getString('fontColor'))
    //     .assertEqual(obj2.getElement('$attrs').getString('fontColor'));
    //   console.info("[ArkUI_Stage_Search_FontColor_0800] end");
    //   done();
    // });
  })
}
