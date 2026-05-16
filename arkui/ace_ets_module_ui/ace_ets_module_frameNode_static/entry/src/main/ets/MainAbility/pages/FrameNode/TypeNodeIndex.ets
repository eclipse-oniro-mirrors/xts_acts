'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Text, Scroller, SwiperController, TextController, TextInputController, TextAreaController, EventQueryType } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { typeNode, FrameNode, UIState } from 'arkui.FrameNode';

@Entry
@Component
struct TypeNodeIndex {
  @State statusText: string = 'pending';

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] TypeNodeIndex error ' + error); }
  }

  onPageShow() {
    try {
      let uiCtx = this.getUIContext();

      let listNode = typeNode.createListNode(uiCtx);
      let listAttr = typeNode.getListAttribute(listNode);
      AppStorage.setOrCreate<string>('tn_getListAttribute', listAttr != null && listAttr != undefined ? 'ok' : 'undefined');

      let listEvt = typeNode.getListEvent(listNode);
      AppStorage.setOrCreate<string>('tn_getListEvent', listEvt != null && listEvt != undefined ? 'ok' : 'undefined');

      let listScroller: Scroller = new Scroller();
      typeNode.bindListController(listNode, listScroller);
      AppStorage.setOrCreate<string>('tn_bindListController', 'called');

      let listItemNode = typeNode.createListItemNode(uiCtx);
      let liAttr = typeNode.getListItemAttribute(listItemNode);
      AppStorage.setOrCreate<string>('tn_getListItemAttribute', liAttr != null && liAttr != undefined ? 'ok' : 'undefined');

      let ligNode = typeNode.createListItemGroupNode(uiCtx);
      let ligAttr = typeNode.getListItemGroupAttribute(ligNode);
      AppStorage.setOrCreate<string>('tn_getListItemGroupAttribute', ligAttr != null && ligAttr != undefined ? 'ok' : 'undefined');

      let scrollNode = typeNode.createScrollNode(uiCtx);
      let scrollAttr = typeNode.getScrollAttribute(scrollNode);
      AppStorage.setOrCreate<string>('tn_getScrollAttribute', scrollAttr != null && scrollAttr != undefined ? 'ok' : 'undefined');

      let scrollEvt = typeNode.getScrollEvent(scrollNode);
      AppStorage.setOrCreate<string>('tn_getScrollEvent', scrollEvt != null && scrollEvt != undefined ? 'ok' : 'undefined');

      let scrollCtrl: Scroller = new Scroller();
      typeNode.bindScrollController(scrollNode, scrollCtrl);
      AppStorage.setOrCreate<string>('tn_bindScrollController', 'called');

      let gridNode = typeNode.createGridNode(uiCtx);
      let gridAttr = typeNode.getGridAttribute(gridNode);
      AppStorage.setOrCreate<string>('tn_getGridAttribute', gridAttr != null && gridAttr != undefined ? 'ok' : 'undefined');

      let gridEvt = typeNode.getGridEvent(gridNode);
      AppStorage.setOrCreate<string>('tn_getGridEvent', gridEvt != null && gridEvt != undefined ? 'ok' : 'undefined');

      let gridCtrl: Scroller = new Scroller();
      typeNode.bindGridController(gridNode, gridCtrl);
      AppStorage.setOrCreate<string>('tn_bindGridController', 'called');

      let gridItemNode = typeNode.createGridItemNode(uiCtx);
      let giAttr = typeNode.getGridItemAttribute(gridItemNode);
      AppStorage.setOrCreate<string>('tn_getGridItemAttribute', giAttr != null && giAttr != undefined ? 'ok' : 'undefined');

      let wfNode = typeNode.createWaterFlowNode(uiCtx);
      let wfAttr = typeNode.getWaterFlowAttribute(wfNode);
      AppStorage.setOrCreate<string>('tn_getWaterFlowAttribute', wfAttr != null && wfAttr != undefined ? 'ok' : 'undefined');

      let wfEvt = typeNode.getWaterFlowEvent(wfNode);
      AppStorage.setOrCreate<string>('tn_getWaterFlowEvent', wfEvt != null && wfEvt != undefined ? 'ok' : 'undefined');

      let wfCtrl: Scroller = new Scroller();
      typeNode.bindWaterFlowController(wfNode, wfCtrl);
      AppStorage.setOrCreate<string>('tn_bindWaterFlowController', 'called');

      let fiNode = typeNode.createFlowItemNode(uiCtx);
      let fiAttr = typeNode.getFlowItemAttribute(fiNode);
      AppStorage.setOrCreate<string>('tn_getFlowItemAttribute', fiAttr != null && fiAttr != undefined ? 'ok' : 'undefined');

      let textNode = typeNode.createTextNode(uiCtx);
      let textAttr = typeNode.getTextAttribute(textNode);
      AppStorage.setOrCreate<string>('tn_getTextAttribute', textAttr != null && textAttr != undefined ? 'ok' : 'undefined');

      let textCtrl: TextController = new TextController();
      typeNode.bindTextController(textNode, textCtrl);
      AppStorage.setOrCreate<string>('tn_bindTextController', 'called');

      let tiNode = typeNode.createTextInputNode(uiCtx);
      let tiAttr = typeNode.getTextInputAttribute(tiNode);
      AppStorage.setOrCreate<string>('tn_getTextInputAttribute', tiAttr != null && tiAttr != undefined ? 'ok' : 'undefined');

      let tiCtrl: TextInputController = new TextInputController();
      typeNode.bindTextInputController(tiNode, tiCtrl);
      AppStorage.setOrCreate<string>('tn_bindTextInputController', 'called');

      let taNode = typeNode.createTextAreaNode(uiCtx);
      let taAttr = typeNode.getTextAreaAttribute(taNode);
      AppStorage.setOrCreate<string>('tn_getTextAreaAttribute', taAttr != null && taAttr != undefined ? 'ok' : 'undefined');

      let taCtrl: TextAreaController = new TextAreaController();
      typeNode.bindTextAreaController(taNode, taCtrl);
      AppStorage.setOrCreate<string>('tn_bindTextAreaController', 'called');

      let swiperNode = typeNode.createSwiperNode(uiCtx);
      let swCtrl: SwiperController = new SwiperController();
      typeNode.bindSwiperController(swiperNode, swCtrl);
      AppStorage.setOrCreate<string>('tn_bindSwiperController', 'called');

      listNode.addSupportedUIStates(UIState.PRESSED, (n: FrameNode, states: int): void => {
        console.info('[ARKUI_NEW] UIStatesChangeHandler triggered');
      });
      AppStorage.setOrCreate<string>('fn_addSupportedUIStates', 'called');

      listNode.removeSupportedUIStates(UIState.PRESSED);
      AppStorage.setOrCreate<string>('fn_removeSupportedUIStates', 'called');

      let bindInfo = listNode.getInteractionEventBindingInfo(EventQueryType.ON_CLICK);
      AppStorage.setOrCreate<string>('fn_getInteractionEventBindingInfo', bindInfo != null && bindInfo != undefined ? 'ok' : 'undefined');
      if (bindInfo != null && bindInfo != undefined) {
        AppStorage.setOrCreate<string>('fn_baseEventRegistered', String(bindInfo.baseEventRegistered));
        AppStorage.setOrCreate<string>('fn_nodeEventRegistered', String(bindInfo.nodeEventRegistered));
        AppStorage.setOrCreate<string>('fn_nativeEventRegistered', String(bindInfo.nativeEventRegistered));
        AppStorage.setOrCreate<string>('fn_builtInEventRegistered', String(bindInfo.builtInEventRegistered));
      }

      this.statusText = 'done';
      console.info('[ARKUI_NEW] TypeNodeIndex onPageShow all calls completed');
    } catch (error) {
      this.statusText = 'error';
      console.error('[ARKUI_NEW] TypeNodeIndex onPageShow error: ' + error);
    }
  }

  build() {
    Column() {
      Text('TypeNode Test Page').key('typeNodeRoot').id('typeNodeRoot').fontSize(20)
      Text('Status: ' + this.statusText).key('typeNodeStatus').id('typeNodeStatus').fontSize(14)
    }.width('100%').height('100%').padding(16)
  }
}
