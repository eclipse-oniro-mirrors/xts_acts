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
import { beforeEach, describe, expect, it, Level,beforeAll } from "../../../../hypium/index";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { $r } from '@ohos.arkui.component'
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

export default function TextfieldMultiTest() {
  describe('TextfieldMultiTest', () => {
    beforeAll(() => {
      console.info("TextfieldMultiTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("TextfieldMultiTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/TextfieldMulti',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get TextfieldMultiTest state pages:" + JSON.stringify(pages));
        if (!("TextfieldMulti" == pages.name)) {
          console.info("get TextfieldMultiTest pages.name:" + '');

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextfieldMultiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextfieldMultiTest page error:" + err);
      }
      console.info("TextfieldMultiTest beforeEach end");
    });


    /**
     * @tc.number   ArkUX_Text_Visual_static_0110
     * @tc.name     ArkUX_Text_Visual_static_0110
     * @tc.desc     ArkUX_Text_Visual_static_0110
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Text_Visual_static_0110', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Text_Visual_static_0110 START');
      try {
        await CommonFunc.sleep(500);
        let strJson = inspector.getInspectorByKey('ArkUX_Text_Visual_static_0110');
        console.info('ArkUX_Text_Visual_static_0110 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info("ArkUX_Text_Visual_static_0110 obj is: " + JSON.stringify(obj));
        let cancelButton  = JSON.parseJsonElement(obj.getElement('$attrs').getString('cancelButton'));
        let icon  = JSON.parseJsonElement(cancelButton.getString('icon'));
        let style  = cancelButton.getDouble('style');
        let size  = icon.getString('size');
        let color  = icon.getString('color');
        let src  = icon.getString('src');
        expect(style).assertEqual(0);
        expect(size).assertEqual("45.00vp");
        expect(typeof src).assertEqual("string");
        expect(color).assertEqual("#FF0000FF");
        console.info('ArkUX_Text_Visual_static_0110 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Text_Visual_static_0110 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
      * @tc.number   ArkUX_Text_Visual_static_0120
      * @tc.name     ArkUX_Text_Visual_static_0120
      * @tc.desc     ArkUX_Text_Visual_static_0120
      * @tc.level    Level.LEVEL1
      */
    it('ArkUX_Text_Visual_static_0120', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Text_Visual_static_0120 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Text_Visual_static_0120');
          console.info('ArkUX_Text_Visual_static_0120 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Text_Visual_static_0120 obj is: " + JSON.stringify(obj));
          let cancelButton  = JSON.parseJsonElement(obj.getElement('$attrs').getString('cancelButton'));
          let icon  =  JSON.parseJsonElement(cancelButton.getString('icon'));
          let style  = cancelButton.getDouble('style');
          let size  = icon.getString('size');
          let color  = icon.getString('color');
          let src  = icon.getString('src');
          expect(style).assertEqual(1);
          expect(size).assertEqual("60.00vp");
          expect(typeof src).assertEqual("string");
          expect(color).assertEqual("#FF008000");
          console.info('ArkUX_Text_Visual_static_0120 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Text_Visual_static_0120 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Text_Visual_static_0130
     * @tc.name     ArkUX_Text_Visual_static_0130
     * @tc.desc     ArkUX_Text_Visual_static_0130
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Text_Visual_static_0130', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Text_Visual_static_0130 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Text_Visual_static_0130');
          console.info('ArkUX_Text_Visual_static_0130 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Text_Visual_static_0130 obj is: " + JSON.stringify(obj));
          let cancelButton  = JSON.parseJsonElement(obj.getElement('$attrs').getString('cancelButton'));
          let icon  =  JSON.parseJsonElement(cancelButton.getString('icon'));
          let style  = cancelButton.getDouble('style');
          let size  = icon.getString('size');
          let color  = icon.getString('color');
          let src  = icon.getString('src');
          expect(style).assertEqual(2);
          expect(size).assertEqual("70.00vp");
          expect(typeof src).assertEqual("string");
          expect(color).assertEqual("#FFFFFFFF");
          console.info('ArkUX_Text_Visual_static_0130 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_static_0130 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Text_Visual_static_0140
     * @tc.name     ArkUX_Text_Visual_static_0140
     * @tc.desc     ArkUX_Text_Visual_static_0140
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Text_Visual_static_0140', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Text_Visual_static_0140 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Text_Visual_static_0140');
          console.info('ArkUX_Text_Visual_static_0140 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Text_Visual_static_0140 obj is: " + JSON.stringify(obj));
          let cancelButton  = JSON.parseJsonElement(obj.getElement('$attrs').getString('cancelButton'));
          let icon  =  JSON.parseJsonElement(cancelButton.getString('icon'));
          let style  = cancelButton.getDouble('style');
          let size  = icon.getString('size');
          let color  = icon.getString('color');
          let src  = icon.getString('src');
          expect(style).assertEqual(2);
          const uiContext = AppStorage.get<UIContext>('uiContext');
          const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
          let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_search_icon_height').id) as double
          console.info("[ArkUX_Text_Visual_static_0140] size: " +uiContext!.px2vp(resourceSize));
          expect(size).assertEqual(Math.round(uiContext!.px2vp(resourceSize))+".00vp");
          expect(typeof src).assertEqual("string");
          expect(color).assertEqual("#FF000000");
          console.info('ArkUX_Text_Visual_static_0140 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_static_0140 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}
