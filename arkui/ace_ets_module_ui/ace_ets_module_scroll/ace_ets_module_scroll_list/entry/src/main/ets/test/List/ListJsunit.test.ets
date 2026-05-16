/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import GlobalContext from '../../MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function ListJsunit() {
  describe('ListJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ListJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/listPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListJsunit state pages: " + JSON.stringify(pages));
        if (!("listPage" == pages.name)) {
          console.info("get ListJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ListJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ListJsunit_0100
     * @tc.number ListJsunit_0100
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0100',  Level.LEVEL0, async (done: Function) => {
      // Get the information of the List component
      console.info('[ListJsunit_0100] START');
      await CommonFunc.sleep(5000);
      let strJson = getInspectorByKey('list');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ListJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ListJsunit_0100] space: " + JSON.stringify(obj.$attrs.space));
      console.info("[ListJsunit_0100] initialIndex: " + JSON.stringify(obj.$attrs.initialIndex));
      console.info("[ListJsunit_0100] listDirection: " + JSON.stringify(obj.$attrs.listDirection));
      console.info("[ListJsunit_0100] strokeWidth: " + JSON.stringify(obj.$attrs.divider.strokeWidth));
      console.info("[ListJsunit_0100] color: " + JSON.stringify(obj.$attrs.divider.color));
      console.info("[ListJsunit_0100] startMargin: " + JSON.stringify(obj.$attrs.divider.startMargin));
      console.info("[ListJsunit_0100] endMargin: " + JSON.stringify(obj.$attrs.divider.endMargin));
      console.info("[ListJsunit_0100] scrollBar: " + JSON.stringify(obj.$attrs.scrollBar));
      console.info("[ListJsunit_0100] cachedCount: " + JSON.stringify(obj.$attrs.cachedCount));
      console.info("[ListJsunit_0100] edgeEffect: " + JSON.stringify(obj.$attrs.edgeEffect));
      console.info("[ListJsunit_0100] lanes: " + JSON.stringify(obj.$attrs.lanes));
      console.info("[ListJsunit_0100] chainAnimation: " + JSON.stringify(obj.$attrs.chainAnimation));
      console.info("[ListJsunit_0100] multiSelectable: " + JSON.stringify(obj.$attrs.multiSelectable));
      console.info("[ListJsunit_0100] alignListItem: " + JSON.stringify(obj.$attrs.alignListItem));
      console.info("[ListJsunit_0100] sticky: " + JSON.stringify(obj.$attrs.sticky));
      console.info("[ListJsunit_0100] lanes: " + JSON.stringify(obj.$attrs.lanes));
      expect(obj.$attrs.space).assertEqual('20.00vp');
      expect(obj.$attrs.initialIndex).assertEqual('0');
      expect(obj.$attrs.listDirection).assertEqual('Axis.Vertical');
      expect(obj.$attrs.divider.strokeWidth).assertEqual('2.00vp');
      expect(obj.$attrs.divider.color).assertEqual('#FF0000FF');
      expect(obj.$attrs.divider.startMargin).assertEqual('3.00vp');
      expect(obj.$attrs.divider.endMargin).assertEqual('2.00vp');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Off');
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.cachedCount).assertEqual('1');
      expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.Spring');
      expect(obj.$attrs.lanes).assertEqual('1');
      expect(obj.$attrs.chainAnimation).assertEqual(false);
      expect(obj.$attrs.multiSelectable).assertEqual(false);
      expect(obj.$attrs.sticky).assertEqual('StickyStyle.None');
      expect(obj.$attrs.alignListItem).assertEqual('ListItemAlign.End');
      console.info('[ListJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0600
     * @tc.number ListJsunit_0600
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0600',  Level.LEVEL0, async (done: Function) => {
      // Verify the Vertical layout of List components
      console.info('[ListJsunit_0600] START');
      let listItem1 = CommonFunc.getComponentRect('0');
      let left1 = listItem1.left
      let listItem2 = CommonFunc.getComponentRect('1');
      let left2 = listItem2.left
      await CommonFunc.sleep(1000);
      expect(left1).assertEqual(left2);
      console.info('[ListJsunit_0600] END');
      done();
    });
    
    /**
     * @tc.name   ListJsunit_0200
     * @tc.number ListJsunit_0200
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0200',  Level.LEVEL0, async (done: Function) => {
      // Verify the functions of the List component
      console.info('[ListJsunit_0200] START');

      // Verify onScroll function of List component
      let gridTop = CommonFunc.getComponentRect('list');
      let top = gridTop.top
      let gridBottom = CommonFunc.getComponentRect('list');
      let bottom = gridBottom.bottom
      let gridRight = CommonFunc.getComponentRect('list');
      let right = gridRight.right
      let left = gridRight.left;
      let driver = await UiDriver.create()
      console.info("windowRect Left: " + globalThis.winLeft + ',' + "windowRect Top: " + globalThis.winTop);
      await driver.swipe(Math.round(globalThis.winLeft + left + (right - left)/2), Math.round(globalThis.winTop + top + (bottom - top)/2), Math.round(globalThis.winLeft + left + (right - left)/2 - vp2px(4)), Math.round(globalThis.winTop + top + (bottom - top)/2));
      await CommonFunc.sleep(1000);

      let onScrollText = await driver.findComponent(BY.key('onScrollText'));
      let text1 = await onScrollText.getText();
      console.info("[ListJsunit_0200] onScrollText: " + text1);
      expect(text1).assertEqual('onScroll');

      // Verify the functions of onReachStart
      await CommonFunc.sleep(200);
      let onReachStartText = await driver.findComponent(BY.key('onReachStartText'));
      let text2 = await onReachStartText.getText();
      console.info("[ListJsunit_0200] onReachStartText: " + text2);
      expect(text2).assertEqual('onReachStart:succ');

      // Verify the functions of onScrollFrameBegin
      await CommonFunc.sleep(200);
      let onScrollBeginText = await driver.findComponent(BY.key('onScrollBeginText'));
      let text3 = await onScrollBeginText.getText();
      console.info("[ListJsunit_0200] onScrollBeginText: " + text3);
      expect(text3).assertEqual('onScrollBegin');

      // Verify the functions of onScrollStart
      await CommonFunc.sleep(200);
      let onScrollStartText = await driver.findComponent(BY.key('onScrollStartText'));
      let text4 = await onScrollStartText.getText();
      console.info("[ListJsunit_0200] onScrollStartText: " + text4);
      expect(text4).assertEqual('onScrollStart');

      // Verify the functions of onScrollStop
      await CommonFunc.sleep(200);
      let onScrollStopText = await driver.findComponent(BY.key('onScrollStopText'));
      let text5 = await onScrollStopText.getText();
      console.info("[ListJsunit_0200] onScrollStopText: " + text5);
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
      console.info("[ListJsunit_0200] onReachEndText: " + text);
      expect(text).assertEqual('onReachEnd');
      console.info('[ListJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0300
     * @tc.number ListJsunit_0300
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0300',  Level.LEVEL0, async (done: Function) => {
      // Modify the properties of component List
      console.info('[ListJsunit_0300] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({name:'space',value:25})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({name:'initialIndex',value:1})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<Axis>('value').message.notify({name:'listDirection',value:Axis.Horizontal})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({name:'strokeWidth',value:3})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<Color>('value').message.notify({name:'dividerColor',value:Color.Black})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({name:'startMargin',value:5})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({name:'endMargin',value:4})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<BarState>('value').message.notify({name:'scrollBar',value:BarState.On})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({name:'cachedCount',value:2})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<EdgeEffect>('value').message.notify({name:'edgeEffect',value:EdgeEffect.Fade})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<boolean>('value').message.notify({name:'chainAnimation',value:true})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({name:'lanes',value:5})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<boolean>('value').message.notify({name:'multiSelectable',value:true})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<ListItemAlign>('value').message.notify({name:'alignListItem',value:ListItemAlign.Start})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<StickyStyle>('value').message.notify({name:'sticky',value:StickyStyle.None})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the List component
      let strJson = getInspectorByKey('list');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ListJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ListJsunit_0300] space: " + JSON.stringify(obj.$attrs.space));
      console.info("[ListJsunit_0300] initialIndex: " + JSON.stringify(obj.$attrs.initialIndex));
      console.info("[ListJsunit_0300] listDirection: " + JSON.stringify(obj.$attrs.listDirection));
      console.info("[ListJsunit_0300] strokeWidth: " + JSON.stringify(obj.$attrs.divider.strokeWidth));
      console.info("[ListJsunit_0300] color: " + JSON.stringify(obj.$attrs.divider.color));
      console.info("[ListJsunit_0300] startMargin: " + JSON.stringify(obj.$attrs.divider.startMargin));
      console.info("[ListJsunit_0300] endMargin: " + JSON.stringify(obj.$attrs.divider.endMargin));
      console.info("[ListJsunit_0300] scrollBar: " + JSON.stringify(obj.$attrs.scrollBar));
      console.info("[ListJsunit_0300] cachedCount: " + JSON.stringify(obj.$attrs.cachedCount));
      console.info("[ListJsunit_0300] edgeEffect: " + JSON.stringify(obj.$attrs.edgeEffect));
      console.info("[ListJsunit_0300] lanes: " + JSON.stringify(obj.$attrs.lanes));
      console.info("[ListJsunit_0300] chainAnimation: " + JSON.stringify(obj.$attrs.chainAnimation));
      console.info("[ListJsunit_0300] multiSelectable: " + JSON.stringify(obj.$attrs.multiSelectable));
      console.info("[ListJsunit_0300] alignListItem: " + JSON.stringify(obj.$attrs.alignListItem));
      console.info("[ListJsunit_0300] sticky: " + JSON.stringify(obj.$attrs.sticky));
      expect(obj.$attrs.space).assertEqual('25.00vp');
      expect(obj.$attrs.initialIndex).assertEqual('1');
      expect(obj.$attrs.listDirection).assertEqual('Axis.Horizontal');
      expect(obj.$attrs.divider.strokeWidth).assertEqual('3.00vp');
      expect(obj.$attrs.divider.color).assertEqual('#FF000000');
      expect(obj.$attrs.divider.startMargin).assertEqual('5.00vp');
      expect(obj.$attrs.divider.endMargin).assertEqual('4.00vp');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.On');
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.cachedCount).assertEqual('2');
      expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.Fade');
      expect(obj.$attrs.lanes).assertEqual('5');
      expect(obj.$attrs.chainAnimation).assertEqual(true);
      expect(obj.$attrs.multiSelectable).assertEqual(true);
      expect(obj.$attrs.alignListItem).assertEqual('ListItemAlign.Start');
      expect(obj.$attrs.sticky).assertEqual('StickyStyle.None');
      console.info('[ListJsunit_0300] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0400
     * @tc.number ListJsunit_0400
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0400',  Level.LEVEL0, async (done: Function) => {
      // Illegal modification of properties of component List
      console.info('[ListJsunit_0400] START');
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'space',value:'-10'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'initialIndex',value:'30'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'listDirection',value:'10'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'strokeWidth',value:'abc'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'dividerColor',value:'10'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'startMargin',value:'#aaa'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'endMargin',value:'-10'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'scrollBar',value:'abc'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'cachedCount',value:'-10'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'edgeEffect',value:'111'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'lanesMinLength',value:'$a'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'lanesMaxLength',value:'-10'})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the List component
      let strJson = getInspectorByKey('list');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ListJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[ListJsunit_0400] space: " + JSON.stringify(obj.$attrs.space));
      console.info("[ListJsunit_0400] initialIndex: " + JSON.stringify(obj.$attrs.initialIndex));
      console.info("[ListJsunit_0400] listDirection: " + JSON.stringify(obj.$attrs.listDirection));
      console.info("[ListJsunit_0400] strokeWidth: " + JSON.stringify(obj.$attrs.divider.strokeWidth));
      console.info("[ListJsunit_0400] color: " + JSON.stringify(obj.$attrs.divider.color));
      console.info("[ListJsunit_0400] startMargin: " + JSON.stringify(obj.$attrs.divider.startMargin));
      console.info("[ListJsunit_0400] endMargin: " + JSON.stringify(obj.$attrs.divider.endMargin));
      console.info("[ListJsunit_0400] scrollBar: " + JSON.stringify(obj.$attrs.scrollBar));
      console.info("[ListJsunit_0400] cachedCount: " + JSON.stringify(obj.$attrs.cachedCount));
      console.info("[ListJsunit_0400] edgeEffect: " + JSON.stringify(obj.$attrs.edgeEffect));
      console.info("[ListJsunit_0400] lanes: " + JSON.stringify(obj.$attrs.lanes));
      console.info("[ListJsunit_0400] chainAnimation: " + JSON.stringify(obj.$attrs.chainAnimation));
      console.info("[ListJsunit_0400] multiSelectable: " + JSON.stringify(obj.$attrs.multiSelectable));
      console.info("[ListJsunit_0400] alignListItem: " + JSON.stringify(obj.$attrs.alignListItem));
      console.info("[ListJsunit_0400] sticky: " + JSON.stringify(obj.$attrs.sticky));
      expect(obj.$attrs.space).assertEqual('-10.00vp');
      expect(obj.$attrs.initialIndex).assertEqual('30');
      expect(obj.$attrs.listDirection).assertEqual('Axis.Vertical');
      expect(obj.$attrs.divider.strokeWidth).assertEqual('0.00vp');
      expect(obj.$attrs.divider.color).assertEqual('#FF00000A');
      expect(obj.$attrs.divider.startMargin).assertEqual('0.00vp');
      expect(obj.$attrs.divider.endMargin).assertEqual('-10.00vp');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Auto');
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.cachedCount).assertEqual('1');
      expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.Spring');
      expect(obj.$attrs.lanes).assertEqual('5');
      expect(obj.$attrs.chainAnimation).assertEqual(true);
      expect(obj.$attrs.multiSelectable).assertEqual(true);
      expect(obj.$attrs.alignListItem).assertEqual('ListItemAlign.Start');
      expect(obj.$attrs.sticky).assertEqual('StickyStyle.None');
      console.info('[ListJsunit_0400] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0500
     * @tc.number ListJsunit_0500
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0500',  Level.LEVEL0, async (done: Function) => {
      // Verify default value of the List component
      console.info('[ListJsunit_0500] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('list_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ListJsunit_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.space).assertEqual('0.00vp');
      expect(obj.$attrs.initialIndex).assertEqual('0');
      expect(obj.$attrs.listDirection).assertEqual('Axis.Vertical');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Auto');
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.cachedCount).assertEqual('0');
      expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.Spring');
      expect(obj.$attrs.lanes).assertEqual('0');
      console.info('[ListJsunit_0500] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0700
     * @tc.number ListJsunit_0700
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0700',  Level.LEVEL0, async (done: Function) => {
      // Verify the Vertical layout of List components
      console.info('[ListJsunit_0700] START');
      GlobalContext.getContext().getObject<Axis>('value').message.notify({name:'listDirection',value:Axis.Vertical})
      await CommonFunc.sleep(1000);
      let listItem1 = CommonFunc.getComponentRect('0');
      let top1 = listItem1.top
      let listItem2 = CommonFunc.getComponentRect('1');
      let top2 = listItem2.top
      await CommonFunc.sleep(1000);
      expect(top1).assertEqual(top2);
      console.info('[ListJsunit_0700] END');
      done();
    });
  })
}
