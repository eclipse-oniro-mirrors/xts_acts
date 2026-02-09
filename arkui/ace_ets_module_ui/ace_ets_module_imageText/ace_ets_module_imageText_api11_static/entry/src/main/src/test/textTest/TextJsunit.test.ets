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

import { afterEach, beforeEach, describe, expect,it, Level,beforeAll } from "../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
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
interface AA {
  type:string
  color: string
  style: string
}
interface BB{
  x:string
  y:string
}
function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(():void => {
      resolve('OK');
    }, time * 1000 as Int);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

export default function textJsunit() {
  describe('textTest', () => {
    beforeAll(() => {
      console.info("SpanTextShadowTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("SpanTextShadowTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/Text',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get SpanTextShadowTest state pages:" + JSON.stringify(pages));
        if (!("Text" == pages.name)) {
          console.info("get SpanTextShadowTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SpanTextShadowTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SpanTextShadowTest page error:" + err);
      }
      console.info("SpanTextShadowTest beforeEach end");
    });


    afterEach(async () => {
      await sleep(1);
      console.info("Text after each called");
    });

    
    /**
     * @tc.number   textGetInspectorByKey_static_010
     * @tc.name     textGetInspectorByKey_static_010
     * @tc.desc     textGetInspectorByKey_static_010
     * @tc.level    Level.LEVEL1
     */
    it('textGetInspectorByKey_static_010', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testGetInspectorByKey START');
      await sleep(3)
      let strJson = inspector.getInspectorByKey('Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd text component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('width')).assertEqual('200.00vp');
      expect(obj.getElement('$attrs').getString('padding')).assertEqual('5.00vp');
      expect(obj.getElement('$attrs').getString('margin')).assertEqual('10.00px');
      expect(obj.getElement('$attrs').getDouble('opacity')).assertEqual(1)
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.Center")

      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('markAnchor'))).assertEqual(JSON.stringify({
        x: "50.00vp", y: "50.00vp"
      } as BB))
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('offset'))).assertEqual(JSON.stringify({
        x: "50.00vp", y: "50.00vp"
      } as BB))
      expect(obj.getElement('$attrs').getDouble('flexGrow')).assertEqual(5)
      expect(obj.getElement('$attrs').getDouble('flexShrink')).assertEqual(2)
      expect(obj.getElement('$attrs').getString('alignSelf')).assertEqual("ItemAlign.Auto")
      expect(obj.getElement('$attrs').getString('borderStyle')).assertEqual("BorderStyle.Dashed")
      expect(obj.getElement('$attrs').getString('borderRadius')).assertEqual("10.00vp")
      expect(obj.getElement('$attrs').getString('borderWidth')).assertEqual("4.00px")
      expect(obj.getElement('$attrs').getString('borderColor')).assertEqual("#FF0000FF")
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual("#FFFFC0CB")
      expect(obj.getElement('$attrs').getBoolean('enabled')).assertEqual(false)
      expect(obj.getElement('$attrs').getDouble('zIndex')).assertEqual(1)
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FF000000")
      expect(obj.getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible")
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("15.00fp")
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual("FontWeight.Bold")
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual("FontStyle.Italic")
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual("sans-serif")
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.End")
      expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.Ellipsis")
      expect(obj.getElement('$attrs').getString('lineHeight')).assertEqual("15.00fp")
      expect(obj.getElement('$attrs').getString('baselineOffset')).assertEqual("0")
      expect(obj.getElement('$attrs').getString('maxLines')).assertEqual("2")
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual("TextCase.Normal")
      expect(obj.getElement('$attrs').getString('decoration')).assertEqual(JSON.stringify({
        type: "TextDecorationType.Underline", color: "#FFFF0000", style: "TextDecorationStyle.SOLID"
      } as AA))
      expect(obj.getElement('$attrs').getString('direction')).assertEqual("Direction.Auto")
      expect(obj.getElement('$attrs').getDouble('aspectRatio')).assertEqual(1)
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FF000000")
      console.info('cd textInspectorByKey END');
      done();
    });

    
    /**
     * @tc.number   textGetInspectorByKey_static_020
     * @tc.name     textGetInspectorByKey_static_020
     * @tc.desc     textGetInspectorByKey_static_020
     * @tc.level    Level.LEVEL1
     */
    it('textGetInspectorByKey_static_020', Level.LEVEL1, async (done: ()=>void) => {
      let strJson = inspector.getInspectorByKey('Text1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd text1 component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual("Direction.Ltr");
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.Start");
      expect(obj.getElement('$attrs').getString('alignSelf')).assertEqual("ItemAlign.Start");
      expect(obj.getElement('$attrs').getString('borderStyle')).assertEqual("BorderStyle.Dotted");
      expect(obj.getElement('$attrs').getBoolean('enabled')).assertEqual(true);
      expect(obj.getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual("FontWeight.Normal");
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Start");
      expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.Clip");
      expect(obj.getElement('$attrs').getString('decoration')).assertEqual(JSON.stringify({
        type: "TextDecorationType.LineThrough", color: "#FFFF0000", style: "TextDecorationStyle.SOLID"
      } as AA));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFFFFFFF");
      console.info('cd text1InspectorByKey END');
      done();
    });

    
    /**
     * @tc.number   textGetInspectorByKey_static_030
     * @tc.name     textGetInspectorByKey_static_030
     * @tc.desc     textGetInspectorByKey_static_030
     * @tc.level    Level.LEVEL1
     */
    it('textGetInspectorByKey_static_030', Level.LEVEL1, async (done: ()=>void) => {
      let strJson = inspector.getInspectorByKey('Text2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd text2 component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual("Direction.Rtl");
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd");
      expect(obj.getElement('$attrs').getString('alignSelf')).assertEqual("ItemAlign.Center");
      expect(obj.getElement('$attrs').getString('borderStyle')).assertEqual("BorderStyle.Solid");
      expect(obj.getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual("FontWeight.Bolder");
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual("TextCase.UpperCase");
      expect(obj.getElement('$attrs').getString('decoration')).assertEqual(JSON.stringify({
        type: "TextDecorationType.None", color: "#FFFF0000", style: "TextDecorationStyle.SOLID"
      } as AA));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FF0000FF");
      console.info('cd text2InspectorByKey END');
      done();
    });

    
    /**
     * @tc.number   textGetInspectorByKey_static_040
     * @tc.name     textGetInspectorByKey_static_040
     * @tc.desc     textGetInspectorByKey_static_040
     * @tc.level    Level.LEVEL1
     */
    it('textGetInspectorByKey_static_040', Level.LEVEL1, async (done: ()=>void) => {
      let strJson = inspector.getInspectorByKey('Text3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd text3 component obj is: " + JSON.stringify(obj));
      console.log("cd text3 align" + JSON.stringify(obj.getElement('$attrs').getString('align')));
      console.log("cd text3 alignSelf" + JSON.stringify(obj.getElement('$attrs').getString('alignSelf')));
      console.log("cd text3 fontWeight" + JSON.stringify(obj.getElement('$attrs').getString('fontWeight')));
      console.log("cd text3 decoration" + JSON.stringify(obj.getElement('$attrs').getString('decoration')));
      console.log("cd text3 fontColor" + JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.Top");
      expect(obj.getElement('$attrs').getString('alignSelf')).assertEqual("ItemAlign.End");
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual("FontWeight.Lighter");
      expect(obj.getElement('$attrs').getString('decoration')).assertEqual(JSON.stringify({
        type: "TextDecorationType.Overline", color: "#FFFF0000", style: "TextDecorationStyle.SOLID"
      } as AA));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FF808080");
      console.info('cd text3InspectorByKey END');
      done();
    });

    
    /**
     * @tc.number   textGetInspectorByKey_static_050
     * @tc.name     textGetInspectorByKey_static_050
     * @tc.desc     textGetInspectorByKey_static_050
     * @tc.level    Level.LEVEL1
     */
    it('textGetInspectorByKey_static_050', Level.LEVEL1, async (done: ()=>void) => {
      let strJson = inspector.getInspectorByKey('Text4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd text4 component obj is: " + JSON.stringify(obj));
      console.log("cd text4 align" + JSON.stringify(obj.getElement('$attrs').getString('align')));
      console.log("cd text4 alignSelf" + JSON.stringify(obj.getElement('$attrs').getString('alignSelf')));
      console.log("cd text4 fontWeight" + JSON.stringify(obj.getElement('$attrs').getString('fontWeight')));
      console.log("cd text4 fontColor" + JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      expect(obj.getElement('$attrs').getString('alignSelf')).assertEqual("ItemAlign.Baseline");
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual("FontWeight.Medium");
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFA52A2A");
      console.info('cd text4InspectorByKey END');
      done();
    });

    
    /**
     * @tc.number   textGetInspectorByKey_static_060
     * @tc.name     textGetInspectorByKey_static_060
     * @tc.desc     textGetInspectorByKey_static_060
     * @tc.level    Level.LEVEL1
     */
    it('textGetInspectorByKey_static_060', Level.LEVEL1, async (done: ()=>void) => {
      let strJson = inspector.getInspectorByKey('Text5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd text5 component obj is: " + JSON.stringify(obj));
      console.log("cd text5 align" + JSON.stringify(obj.getElement('$attrs').getString('align')));
      console.log("cd text5 alignSelf" + JSON.stringify(obj.getElement('$attrs').getString('alignSelf')));
      console.log("cd text5 fontWeight" + JSON.stringify(obj.getElement('$attrs').getString('fontWeight')));
      console.log("cd text5 fontColor" + JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.End");
      expect(obj.getElement('$attrs').getString('alignSelf')).assertEqual("ItemAlign.Stretch");
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual("FontWeight.Regular");
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FF808080");
      console.info('cd text5InspectorByKey END');
      done();
    });

    
    /**
     * @tc.number   textGetInspectorByKey_static_070
     * @tc.name     textGetInspectorByKey_static_070
     * @tc.desc     textGetInspectorByKey_static_070
     * @tc.level    Level.LEVEL1
     */
    it('textGetInspectorByKey_static_070', Level.LEVEL1, async (done: ()=>void) => {
      let strJson = inspector.getInspectorByKey('Text6');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd text6 component obj is: " + JSON.stringify(obj));
      console.log("cd text6 align" + JSON.stringify(obj.getElement('$attrs').getString('align')));
      console.log("cd text6 fontColor" + JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd");
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFFFA500");
      console.info('cd text6InspectorByKey END');
      done();
    });

    
    /**
     * @tc.number   textGetInspectorByKey_static_080
     * @tc.name     textGetInspectorByKey_static_080
     * @tc.desc     textGetInspectorByKey_static_080
     * @tc.level    Level.LEVEL1
     */
    it('textGetInspectorByKey_static_080', Level.LEVEL1, async (done: ()=>void) => {
      let strJson = inspector.getInspectorByKey('Text7');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd text7 component obj is: " + JSON.stringify(obj));
      console.log("cd text7 align" + JSON.stringify(obj.getElement('$attrs').getString('align')));
      console.log("cd text7 fontColor" + JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom");
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFFFFF00");
      console.info('cd text7InspectorByKey END');
      done();
    });

    
    /**
     * @tc.number   textGetInspectorByKey_static_090
     * @tc.name     textGetInspectorByKey_static_090
     * @tc.desc     textGetInspectorByKey_static_090
     * @tc.level    Level.LEVEL1
     */
    it('textGetInspectorByKey_static_090', Level.LEVEL1, async (done: ()=>void) => {
      let strJson = inspector.getInspectorByKey('Text8');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd text8 component obj is: " + JSON.stringify(obj));
      console.log("cd text8 align" + JSON.stringify(obj.getElement('$attrs').getString('align')));
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart");
      console.info('cd text8InspectorByKey END');
      done();
    });
  })
}
