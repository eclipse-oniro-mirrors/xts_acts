/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { ComponentContent, LengthMetrics, ColorMetrics} from '@ohos.arkui.node';
import { BusinessError } from '@ohos.base';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
import { resourceManager } from '@kit.LocalizationKit';

interface optionsObj {
  uri: string
}

function spliceColor(sysColor: Resource) {
  let resourceColor = getContext().resourceManager.getColorSync(sysColor.id)
  let newArgb: string = '#' + resourceColor.toString(16).toUpperCase()
  return newArgb;
}

function hexWithNoAlpha(hex: string): string {
    // 确保十六进制字符串以 '#' 开头，并且长度为 8
    if (!/^#[0-9A-Fa-f]{8}$/.test(hex)) {
        throw new Error('Invalid hex color string');
    }

    // 提取 RGB 分量
    const r = parseInt(hex.slice(3, 5), 16);
    const g = parseInt(hex.slice(5, 7), 16);
    const b = parseInt(hex.slice(7, 9), 16);
    return `#${r.toString(16).padStart(2, '0')}${g.toString(16).padStart(2, '0')}${b.toString(16).padStart(2, '0')}`;
}

export default function ArcListDemo() {
    describe('ArcList', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(async (done: Function) => {
            console.info("search_caret beforeEach start");
            let options: optionsObj = {
                uri: 'MainAbility/pages/ArcList/ArcList',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get ArcListPage state pages: " + JSON.stringify(pages));
                if (!("ArcList" == pages.name)) {
                    console.info("get ArcList state pages.name: " + JSON.stringify(pages.name));
                    let result = await router.push(options);
                    await CommonFunc.sleep(2000);
                    console.info("push ArcList page result: " + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push ArcList page error: " + err);
                expect().assertFail();
            }
            done();
        });
        afterEach(async () => {
            console.info("afterEach case");
        });

        afterAll(async () => {
            console.info("afterAll case");
        });
		
		
    /* *
    * @tc.number: ArkUX_Stage_ArcList_ComponentTest_0100
    * @tc.name  : testArkListComponent.
    * @tc.desc  : Test default value for testing the arclist component.
    * @tc.level : Level 1
    * @tc.size  : MediumTest
    * @tc.type  : Function
    */
    it('ArkUX_Stage_ArcList_ComponentTest_0100', 0, async (done: Function) => {
      console.info('[ArkUX_Stage_ArcList_ComponentTest_0100] START');
      let strJson = getInspectorByKey('arclistdefault');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0100] digitalCrownSensitivity: " + JSON.stringify(obj.$attrs.digitalCrownSensitivity));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0100] space: " + JSON.stringify(obj.$attrs.space));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0100] initialIndex: " + JSON.stringify(obj.$attrs.initialIndex));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0100] scrollBar: " + JSON.stringify(obj.$attrs.scrollBar));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0100] scrollBarWidth: " + JSON.stringify(obj.$attrs.scrollBarWidth));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0100] scrollBarColor: " + JSON.stringify(obj.$attrs.scrollBarColor));
	
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0100] cachedCount: " + JSON.stringify(obj.$attrs.cachedCount));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0100] chainAnimation: " + JSON.stringify(obj.$attrs.chainAnimation));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0100] enableScrollInteraction: " + JSON.stringify(obj.$attrs.enableScrollInteraction));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0100] fadingEdge: " + JSON.stringify(obj.$attrs.fadingEdge));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0100] friction: " + JSON.stringify(obj.$attrs.friction));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0100] flingSpeedLimit: " + JSON.stringify(obj.$attrs.flingSpeedLimit));

      expect(obj.$attrs.space).assertEqual('0.00vp');
      expect(obj.$attrs.initialIndex).assertEqual('0');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Auto');
      expect(obj.$attrs.scrollBarWidth).assertEqual('4.00vp');
	  expect(hexWithNoAlpha(obj.$attrs.scrollBarColor)).assertEqual(hexWithNoAlpha(spliceColor($r('sys.color.ohos_id_color_foreground'))));
      expect(obj.$attrs.cachedCount).assertEqual('0');
      expect(obj.$attrs.chainAnimation).assertEqual(false);
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      expect(obj.$attrs.fadingEdge).assertEqual(false);
      expect(obj.$attrs.friction).assertEqual(0.800000011920929);
      expect(obj.$attrs.flingSpeedLimit).assertEqual('9000.00vp');
      console.info('[ArkUX_Stage_ArcList_ComponentTest_0100] END');
      done();
    });

    /* *
    * @tc.number: ArkUX_Stage_ArcList_ComponentTest_0200
    * @tc.name  : testArkListComponent.
    * @tc.desc  : Test default value for testing the arclist component.
    * @tc.level : Level 1
    * @tc.size  : MediumTest
    * @tc.type  : Function
    */
    it('ArkUX_Stage_ArcList_ComponentTest_0200', 0, async (done: Function) => {
      console.info('[ArkUX_Stage_ArcList_ComponentTest_0200] START');
      let strJson = getInspectorByKey('arclist01');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0200] digitalCrownSensitivity: " + JSON.stringify(obj.$attrs.digitalCrownSensitivity));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0200] space: " + JSON.stringify(obj.$attrs.space));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0200] initialIndex: " + JSON.stringify(obj.$attrs.initialIndex));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0200] scrollBar: " + JSON.stringify(obj.$attrs.scrollBar));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0200] scrollBarWidth: " + JSON.stringify(obj.$attrs.scrollBarWidth));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0200] scrollBarColor: " + JSON.stringify(obj.$attrs.scrollBarColor));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0200] cachedCount: " + JSON.stringify(obj.$attrs.cachedCount));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0200] chainAnimation: " + JSON.stringify(obj.$attrs.chainAnimation));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0200] enableScrollInteraction: " + JSON.stringify(obj.$attrs.enableScrollInteraction));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0200] fadingEdge: " + JSON.stringify(obj.$attrs.fadingEdge));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0200] friction: " + JSON.stringify(obj.$attrs.friction));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0200] flingSpeedLimit: " + JSON.stringify(obj.$attrs.flingSpeedLimit));

      expect(obj.$attrs.space).assertEqual('20.00px');
      expect(obj.$attrs.initialIndex).assertEqual('5');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.On');
      expect(obj.$attrs.scrollBarWidth).assertEqual('5.00vp');
      expect(obj.$attrs.scrollBarColor).assertEqual('#FF000000');
      expect(obj.$attrs.cachedCount).assertEqual('1');
      expect(obj.$attrs.chainAnimation).assertEqual(true);
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      expect(obj.$attrs.fadingEdge).assertEqual(true);
      expect(obj.$attrs.friction).assertEqual(0.6);
      expect(obj.$attrs.flingSpeedLimit).assertEqual('5.00vp');
      console.info('[ArkUX_Stage_ArcList_ComponentTest_0200] END');
      done();
    });

    /* *
    * @tc.number: ArkUX_Stage_ArcList_ComponentTest_0300
    * @tc.name  : testArkListComponent.
    * @tc.desc  : Test default value for testing the arclist component.
    * @tc.level : Level 1
    * @tc.size  : MediumTest
    * @tc.type  : Function
    */
    it('ArkUX_Stage_ArcList_ComponentTest_0300', 0, async (done: Function) => {
      console.info('[ArkUX_Stage_ArcList_ComponentTest_0300] START');
      let strJson = getInspectorByKey('arclist02');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0300] digitalCrownSensitivity: " + JSON.stringify(obj.$attrs.digitalCrownSensitivity));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0300] space: " + JSON.stringify(obj.$attrs.space));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0300] initialIndex: " + JSON.stringify(obj.$attrs.initialIndex));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0300] scrollBar: " + JSON.stringify(obj.$attrs.scrollBar));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0300] scrollBarWidth: " + JSON.stringify(obj.$attrs.scrollBarWidth));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0300] scrollBarColor: " + JSON.stringify(obj.$attrs.scrollBarColor));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0300] cachedCount: " + JSON.stringify(obj.$attrs.cachedCount));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0300] chainAnimation: " + JSON.stringify(obj.$attrs.chainAnimation));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0300] enableScrollInteraction: " + JSON.stringify(obj.$attrs.enableScrollInteraction));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0300] fadingEdge: " + JSON.stringify(obj.$attrs.fadingEdge));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0300] friction: " + JSON.stringify(obj.$attrs.friction));
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0300] flingSpeedLimit: " + JSON.stringify(obj.$attrs.flingSpeedLimit));

      expect(obj.$attrs.space).assertEqual('0.00px');
      expect(obj.$attrs.initialIndex).assertEqual('0');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Auto');
      expect(obj.$attrs.scrollBarWidth).assertEqual('4.00vp');
      expect(obj.$attrs.scrollBarColor).assertEqual('#FF000000');
      expect(obj.$attrs.cachedCount).assertEqual('1');
      expect(obj.$attrs.chainAnimation).assertEqual(false);
      expect(obj.$attrs.enableScrollInteraction).assertEqual(false);
      expect(obj.$attrs.fadingEdge).assertEqual(false);
      expect(obj.$attrs.friction).assertEqual(0.800000011920929);
      expect(obj.$attrs.flingSpeedLimit).assertEqual('9000.00vp');
      console.info('[ArkUX_Stage_ArcList_ComponentTest_0300] END');
      done();
    });
	
	
    /* *
    * @tc.number: ArkUX_Stage_ArcList_ComponentTest_0400
    * @tc.name  : testArkListComponent.
    * @tc.desc  : Test default value for testing the arclist component.
    * @tc.level : Level 1
    * @tc.size  : MediumTest
    * @tc.type  : Function
    */
    it('ArkUX_Stage_ArcList_ComponentTest_0400', 0, async (done: Function) => {
      // Verify the functions of the arclist component
      console.info('[ArkUX_Stage_ArcList_ComponentTest_0400] START');
      
      // Verify onScroll function of arclist component
      let gridTop = CommonFunc.getComponentRect('arclist03');
      let top = gridTop.top
      let gridBottom = CommonFunc.getComponentRect('arclist03');
      let bottom = gridBottom.bottom
      let gridRight = CommonFunc.getComponentRect('arclist03');
      let right = gridRight.right
      let left = gridRight.left;
      let driver = await UiDriver.create()
      console.info("windowRect Left: " + globalThis.winLeft + ',' + "windowRect Top: " + globalThis.winTop);
      await driver.swipe(Math.round(globalThis.winLeft + left + (right - left)/2), Math.round(globalThis.winTop + top + (bottom - top)/2), Math.round(globalThis.winLeft + left + (right - left)/2 - vp2px(4)), Math.round(globalThis.winTop + top + (bottom - top)/2));
      await CommonFunc.sleep(1000);
      
      let onScrollIndexText = await driver.findComponent(BY.key('onScrollIndexText'));
      let text1 = await onScrollIndexText.getText();
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0400] onScrollIndexText: " + text1);
      expect(text1).assertEqual('onScrollIndex:succ');

      // Verify the functions of onReachStart
      await CommonFunc.sleep(200);
      let onReachStartText = await driver.findComponent(BY.key('onReachStartText'));
      let text2 = await onReachStartText.getText();
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0400] onReachStartText: " + text2);
      expect(text2).assertEqual('onReachStart:succ');

	  
      // Verify the functions of onScrollStart
      await CommonFunc.sleep(200);
      let onScrollStartText = await driver.findComponent(BY.key('onScrollStartText'));
      let text4 = await onScrollStartText.getText();
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0400] onScrollStartText: " + text4);
      expect(text4).assertEqual('onScrollStart');

	  
      // Verify the functions of onWillScroll
      await CommonFunc.sleep(200);
      let onWillScrollText = await driver.findComponent(BY.key('onWillScrollText'));
      let text6 = await onWillScrollText.getText();
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0400] onWillScrollText: " + text6);
      expect(text6).assertEqual('onWillScroll');
	  
	  
      // Verify the functions of onDidScroll
      await CommonFunc.sleep(200);
      let onDidScrollText = await driver.findComponent(BY.key('onDidScrollText'));
      let text7 = await onDidScrollText.getText();
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0400] onDidScrollText: " + text7);
      expect(text7).assertEqual('onDidScroll');
	  
	  
	  
      // Verify the functions of onScrollStop
      await CommonFunc.sleep(200);
      let onScrollStopText = await driver.findComponent(BY.key('onScrollStopText'));
      let text5 = await onScrollStopText.getText();
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0400] onScrollStopText: " + text5);
      expect(text5).assertEqual('onScrollStop');

      // Verify the functions of onReachEnd
      await driver.swipe(Math.round(globalThis.winLeft + left + (right - left)/2), Math.round(globalThis.winTop + top + (bottom - top)/2), Math.round(globalThis.winLeft + left + (right - left)/2 - vp2px(4)), Math.round(globalThis.winTop + top + (bottom - top)/2));
      await driver.swipe(Math.round(globalThis.winLeft + left + (right - left)/2), Math.round(globalThis.winTop + top + (bottom - top)/2), Math.round(globalThis.winLeft + left + (right - left)/2 - vp2px(4)), Math.round(globalThis.winTop + top + (bottom - top)/2));
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(globalThis.winLeft + left + (right - left)/2), Math.round(globalThis.winTop + top + (bottom - top)/2), Math.round(globalThis.winLeft + left + (right - left)/2 - vp2px(4)), Math.round(globalThis.winTop + top + (bottom - top)/2));
      await driver.swipe(Math.round(globalThis.winLeft + left + (right - left)/2), Math.round(globalThis.winTop + top + (bottom - top)/2), Math.round(globalThis.winLeft + left + (right - left)/2 - vp2px(4)), Math.round(globalThis.winTop + top + (bottom - top)/2));
      await driver.swipe(Math.round(globalThis.winLeft + left + (right - left)/2), Math.round(globalThis.winTop + top + (bottom - top)/2), Math.round(globalThis.winLeft + left + (right - left)/2 - vp2px(4)), Math.round(globalThis.winTop + top + (bottom - top)/2));
      await CommonFunc.sleep(1000);
      let onReachEndText = await driver.findComponent(BY.key('onReachEndText'));
      let text= await onReachEndText.getText();
      console.info("[ArkUX_Stage_ArcList_ComponentTest_0400] onReachEndText: " + text);
      expect(text).assertEqual('onReachEnd:succ');
      console.info('[ArkUX_Stage_ArcList_ComponentTest_0400] END');
      done();
    });
  })
}
