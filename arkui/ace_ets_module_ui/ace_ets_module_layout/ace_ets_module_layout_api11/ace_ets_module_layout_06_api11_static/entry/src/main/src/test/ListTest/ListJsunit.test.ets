'use static';
/**
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
import { ListItemAlign,StickyStyle,Axis,EdgeEffect,BarState,Color } from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../hypium/index';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function ListJsunit() {
  describe('ListJsunit', () => {
    beforeAll(() => {
      console.info("ListJsunit beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    })
    beforeEach(async (): Promise<void> => {
      console.info("ListJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get ListJsunit state pages: " + JSON.stringify(pages));
        if (!("ListPage" == pages.name)) {
          console.info("get ListJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ListJsunit page error: " + err);
        expect().assertFail();
      }
    });

    
    



/**
     * @tc.number   ListJsunit_static_0100
     * @tc.name     ListJsunit_static_0100
     * @tc.desc     ListJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[ListJsunit_static_0100] START');
      await CommonFunc.sleep(5000);
      let strJson = inspector.getInspectorByKey('list');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ListJsunit_static_0100] space: " + JSON.stringify(obj.getElement('$attrs').getString('space')));
      console.info("[ListJsunit_static_0100] initialIndex: " +
      JSON.stringify(obj.getElement('$attrs').getString('initialIndex')));
      console.info("[ListJsunit_static_0100] listDirection: " +
      JSON.stringify(obj.getElement('$attrs').getString('listDirection')));
      console.info("[ListJsunit_static_0100] strokeWidth: " +
      JSON.stringify(obj.getElement('$attrs').getElement('divider').getString('strokeWidth')));
      console.info("[ListJsunit_static_0100] color: " +
      JSON.stringify(obj.getElement('$attrs').getElement('divider').getString('color')));
      console.info("[ListJsunit_static_0100] startMargin: " +
      JSON.stringify(obj.getElement('$attrs').getElement('divider').getString('startMargin')));
      console.info("[ListJsunit_static_0100] endMargin: " +
      JSON.stringify(obj.getElement('$attrs').getElement('divider').getString('endMargin')));
      console.info("[ListJsunit_static_0100] scrollBar: " + JSON.stringify(obj.getElement('$attrs').getString('scrollBar')));
      console.info("[ListJsunit_static_0100] cachedCount: " +
      JSON.stringify(obj.getElement('$attrs').getString('cachedCount')));
      console.info("[ListJsunit_static_0100] edgeEffect: " + JSON.stringify(obj.getElement('$attrs').getString('edgeEffect')));
      console.info("[ListJsunit_static_0100] lanes: " + JSON.stringify(obj.getElement('$attrs').getString('lanes')));
      console.info("[ListJsunit_static_0100] chainAnimation: " +
      JSON.stringify(obj.getElement('$attrs').getBoolean('chainAnimation')));
      console.info("[ListJsunit_static_0100] multiSelectable: " +
      JSON.stringify(obj.getElement('$attrs').getBoolean('multiSelectable')));
      console.info("[ListJsunit_static_0100] alignListItem: " +
      JSON.stringify(obj.getElement('$attrs').getString('alignListItem')));
      console.info("[ListJsunit_static_0100] sticky: " + JSON.stringify(obj.getElement('$attrs').getString('sticky')));
      console.info("[ListJsunit_static_0100] lanes: " + JSON.stringify(obj.getElement('$attrs').getString('lanes')));
      expect(obj.getElement('$attrs').getString('space')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getString('initialIndex')).assertEqual('0');
      expect(obj.getElement('$attrs').getString('listDirection')).assertEqual('Axis.Vertical');
      expect(obj.getElement('$attrs').getElement('divider').getString('strokeWidth')).assertEqual('2.00vp');
      expect(obj.getElement('$attrs').getElement('divider').getString('color')).assertEqual('#FF0000FF');
      expect(obj.getElement('$attrs').getElement('divider').getString('startMargin')).assertEqual('3.00vp');
      expect(obj.getElement('$attrs').getElement('divider').getString('endMargin')).assertEqual('2.00vp');
      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual('BarState.Off');
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('cachedCount')).assertEqual('1');
      expect(obj.getElement('$attrs').getString('edgeEffect')).assertEqual('EdgeEffect.Spring');
      expect(obj.getElement('$attrs').getString('lanes')).assertEqual('1');
      expect(obj.getElement('$attrs').getBoolean('chainAnimation')).assertEqual(false);
      expect(obj.getElement('$attrs').getBoolean('multiSelectable')).assertEqual(false);
      expect(obj.getElement('$attrs').getString('sticky')).assertEqual('StickyStyle.None');
      expect(obj.getElement('$attrs').getString('alignListItem')).assertEqual('ListItemAlign.End');
      console.info('[ListJsunit_static_0100] END');
      done();
    });

    
    



/**
     * @tc.number   ListJsunit_static_0200
     * @tc.name     ListJsunit_static_0200
     * @tc.desc     ListJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[ListJsunit_0200] START');

      
      let gridTop = CommonFunc.getComponentRect('list');
      let top:number = gridTop.top
      let gridBottom = CommonFunc.getComponentRect('list');
      let bottom:number = gridBottom.bottom
      let gridRight = CommonFunc.getComponentRect('list');
      let right:number = gridRight.right
      let left:number = gridRight.left;
      let driver = Driver.create()
      console.info("windowRect Left: " + String((AppStorage.get<number>('winLeft')) as number) + ',' +
        "windowRect Top: " + String((AppStorage.get<number>('winTop')) as number));
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left +
        (right - left) / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + (bottom - top) / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right - left) / 2 -
        UIContext.resolveUIContext()!.vp2px(4))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + (bottom - top) / 2)).toInt());
      await CommonFunc.sleep(1000);

      let onScrollText = await driver.findComponent(ON.id('onScrollText'));
      let text1 = await onScrollText!.getText();
      console.info("[ListJsunit_0200] onScrollText: " + text1);
      expect(text1).assertEqual('onScroll');

      
      await CommonFunc.sleep(200);
      let onReachStartText = await driver.findComponent(ON.id('onReachStartText'));
      let text2 = await onReachStartText!.getText();
      console.info("[ListJsunit_0200] onReachStartText: " + text2);
      expect(text2).assertEqual('onReachStart:succ');

      
      await CommonFunc.sleep(200);
      let onScrollBeginText = await driver.findComponent(ON.id('onScrollBeginText'));
      let text3 = await onScrollBeginText!.getText();
      console.info("[ListJsunit_0200] onScrollBeginText: " + text3);
      expect(text3).assertEqual('onScrollBegin');

      
      await CommonFunc.sleep(200);
      let onScrollStartText = await driver.findComponent(ON.id('onScrollStartText'));
      let text4 = await onScrollStartText!.getText();
      console.info("[ListJsunit_0200] onScrollStartText: " + text4);
      expect(text4).assertEqual('onScrollStart');

      
      await CommonFunc.sleep(200);
      let onScrollStopText = await driver.findComponent(ON.id('onScrollStopText'));
      let text5 = await onScrollStopText!.getText();
      console.info("[ListJsunit_0200] onScrollStopText: " + text5);
      expect(text5).assertEqual('onScrollStop');

      
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left +
        (right - left) / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + (bottom - top) / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right - left) / 2 -
        UIContext.resolveUIContext()!.vp2px(4))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + (bottom - top) / 2)).toInt());
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left +
        (right - left) / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + (bottom - top) / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right - left) / 2 -
        UIContext.resolveUIContext()!.vp2px(4))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + (bottom - top) / 2)).toInt());
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left +
        (right - left) / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + (bottom - top) / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right - left) / 2 -
        UIContext.resolveUIContext()!.vp2px(4))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + (bottom - top) / 2)).toInt());
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left +
        (right - left) / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + (bottom - top) / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right - left) / 2 -
        UIContext.resolveUIContext()!.vp2px(4))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + (bottom - top) / 2)).toInt());
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left +
        (right - left) / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + (bottom - top) / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right - left) / 2 -
        UIContext.resolveUIContext()!.vp2px(4))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + (bottom - top) / 2)).toInt());
      await CommonFunc.sleep(1000);
      let onReachEndText = await driver.findComponent(ON.id('onReachEndText'));
      let text = await onReachEndText!.getText();
      console.info("[ListJsunit_0200] onReachEndText: " + text);
      expect(text).assertEqual('onReachEnd');
      console.info('[ListJsunit_0200] END');
      done();
    });

    
    



/**
     * @tc.number   ListJsunit_static_0300
     * @tc.name     ListJsunit_static_0300
     * @tc.desc     ListJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[ListJsunit_0300] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({ name: 'space', value: 25 })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({ name: 'initialIndex', value: 1 })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<Axis>>('messageManager')?.notify({ name: 'listDirection', value: Axis.Horizontal })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({ name: 'strokeWidth', value: 3 })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<Color>>('messageManager')?.notify({ name: 'dividerColor', value: Color.Black })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<number>>('messageManager') ?.notify({ name: 'startMargin', value: 5 })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<number>>('messageManager') ?.notify({ name: 'endMargin', value: 4 })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<BarState>>('messageManager')?.notify({ name: 'scrollBar', value: BarState.On })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<int>>('messageManager') ?.notify({ name: 'cachedCount', value: 2 })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<EdgeEffect>>('messageManager')?.notify({ name: 'edgeEffect', value: EdgeEffect.Fade })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<boolean>>('messageManager')?.notify({ name: 'chainAnimation', value: true })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<int>>('messageManager') ?.notify({ name: 'lanes', value: 5 })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<boolean>>('messageManager')?.notify({ name: 'multiSelectable', value: true })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<ListItemAlign>>('messageManager')?.notify({ name: 'alignListItem', value: ListItemAlign.Start })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<StickyStyle>>('messageManager')?.notify({ name: 'sticky', value: StickyStyle.None })
      await CommonFunc.sleep(2000);

      
      let strJson = inspector.getInspectorByKey('list');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ListJsunit_0300] space: " + JSON.stringify(obj.getElement('$attrs').getString('space')));
      console.info("[ListJsunit_0300] initialIndex: " +
      JSON.stringify(obj.getElement('$attrs').getString('initialIndex')));
      console.info("[ListJsunit_0300] listDirection: " +
      JSON.stringify(obj.getElement('$attrs').getString('listDirection')));
      console.info("[ListJsunit_0300] strokeWidth: " +
      JSON.stringify(obj.getElement('$attrs').getElement('divider').getString('strokeWidth')));
      console.info("[ListJsunit_0300] color: " +
      JSON.stringify(obj.getElement('$attrs').getElement('divider').getString('color')));
      console.info("[ListJsunit_0300] startMargin: " +
      JSON.stringify(obj.getElement('$attrs').getElement('divider').getString('startMargin')));
      console.info("[ListJsunit_0300] endMargin: " +
      JSON.stringify(obj.getElement('$attrs').getElement('divider').getString('endMargin')));
      console.info("[ListJsunit_0300] scrollBar: " + JSON.stringify(obj.getElement('$attrs').getString('scrollBar')));
      console.info("[ListJsunit_0300] cachedCount: " +
      JSON.stringify(obj.getElement('$attrs').getString('cachedCount')));
      console.info("[ListJsunit_0300] edgeEffect: " + JSON.stringify(obj.getElement('$attrs').getString('edgeEffect')));
      console.info("[ListJsunit_0300] lanes: " + JSON.stringify(obj.getElement('$attrs').getString('lanes')));
      console.info("[ListJsunit_0300] chainAnimation: " +
      JSON.stringify(obj.getElement('$attrs').getBoolean('chainAnimation')));
      console.info("[ListJsunit_0300] multiSelectable: " +
      JSON.stringify(obj.getElement('$attrs').getBoolean('multiSelectable')));
      console.info("[ListJsunit_0300] alignListItem: " +
      JSON.stringify(obj.getElement('$attrs').getString('alignListItem')));
      console.info("[ListJsunit_0300] sticky: " + JSON.stringify(obj.getElement('$attrs').getString('sticky')));
      expect(obj.getElement('$attrs').getString('space')).assertEqual('25.00vp');
      expect(obj.getElement('$attrs').getString('initialIndex')).assertEqual('1');
      expect(obj.getElement('$attrs').getString('listDirection')).assertEqual('Axis.Horizontal');
      expect(obj.getElement('$attrs').getElement('divider').getString('strokeWidth')).assertEqual('3.00vp');
      expect(obj.getElement('$attrs').getElement('divider').getString('color')).assertEqual('#FF000000');
      expect(obj.getElement('$attrs').getElement('divider').getString('startMargin')).assertEqual('5.00vp');
      expect(obj.getElement('$attrs').getElement('divider').getString('endMargin')).assertEqual('4.00vp');
      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual('BarState.On');
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('cachedCount')).assertEqual('2');
      expect(obj.getElement('$attrs').getString('edgeEffect')).assertEqual('EdgeEffect.Fade');
      expect(obj.getElement('$attrs').getString('lanes')).assertEqual('5');
      expect(obj.getElement('$attrs').getBoolean('chainAnimation')).assertEqual(true);
      expect(obj.getElement('$attrs').getBoolean('multiSelectable')).assertEqual(true);
      expect(obj.getElement('$attrs').getString('alignListItem')).assertEqual('ListItemAlign.Start');
      expect(obj.getElement('$attrs').getString('sticky')).assertEqual('StickyStyle.None');
      console.info('[ListJsunit_0300] END');
      done();
    });

/**
     * @tc.number   ListJsunit_static_0500
     * @tc.name     ListJsunit_static_0500
     * @tc.desc     ListJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[ListJsunit_0500] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('list_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListJsunit_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('space')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('initialIndex')).assertEqual('0');
      expect(obj.getElement('$attrs').getString('listDirection')).assertEqual('Axis.Vertical');
      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual('BarState.Auto');
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('cachedCount')).assertEqual('0');
      expect(obj.getElement('$attrs').getString('edgeEffect')).assertEqual('EdgeEffect.Spring');
      expect(obj.getElement('$attrs').getString('lanes')).assertEqual('0');
      console.info('[ListJsunit_0500] END');
      done();
    });

    
    



/**
     * @tc.number   ListJsunit_static_0600
     * @tc.name     ListJsunit_static_0600
     * @tc.desc     ListJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[ListJsunit_0600] START');
      let listItem1 = CommonFunc.getComponentRect('0');
      let left1:number = listItem1.left
      let listItem2 = CommonFunc.getComponentRect('1');
      let left2:number = listItem2.left
      await CommonFunc.sleep(1000);
      expect(left1).assertEqual(left1);
      console.info('[ListJsunit_0600] END');
      done();
    });

    
    



/**
     * @tc.number   ListJsunit_static_0700
     * @tc.name     ListJsunit_static_0700
     * @tc.desc     ListJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ListJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[ListJsunit_0700] START');
      AppStorage.get<MessageManager<Axis>>('messageManager')?.notify({ name: 'listDirection', value: Axis.Vertical })
      await CommonFunc.sleep(1000);
      let listItem1 = CommonFunc.getComponentRect('0');
      let top1:number = listItem1.top
      let listItem2 = CommonFunc.getComponentRect('1');
      let top2:number = listItem2.top
      await CommonFunc.sleep(1000);
      expect(top1).assertEqual(top2);
      console.info('[ListJsunit_0700] END');
      done();
    });
  })
}
