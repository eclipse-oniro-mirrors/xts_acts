'use static';
/*
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

import Utils, { BasePageConfig, PageConfig, TestValue, RectValue, SetValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect, beforeAll,afterEach } from '../../../../hypium/index'
import {  ItemAlign, VerticalAlign, HorizontalAlign, Position } from '@ohos.arkui.component'
import { UIContext, Router } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'
import { jsonx } from "std/core";
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function onAreaChangeTest() {
  //Component to be tested
  let supportView: Array<string> = new Array<string>(
    'AlphabetIndexer',
    'Blank',
    'Button',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    'ImageAnimator',
    'LoadingProgress',
    'Marquee',
    'MenuItem',
    'Navigation',
    'PatternLock',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'ScrollBar',
    'Search',
    'Slider',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    'ColumnSplit',
    'Flex',
    'FlowItem',
    'GridRow',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'RelativeContainer',
    'Row',
    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
    // 'TabContent',//fail
    'WaterFlow',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Counter'
  )

  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;
  let parentMargin = 30;
  let parentKey = 'parentKey'
  let compareButtonKey = 'compareButtonKey'
  let compareOldTextKey = 'compareOldTextKey'
  let compareNewTextKey = 'compareNewTextKey'

  let pageConfig: PageConfig = {
    testName: 'testOnAreaChange',
    pageName: 'OnAreaChangePage',
    pageUrl: 'MainAbility/pages/onAreaChange/OnAreaChangePage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentMargin: parentMargin,
    parentKey: parentKey,
    compareButtonKey: compareButtonKey,
    compareOldTextKey: compareOldTextKey,
    compareNewTextKey: compareNewTextKey
  }


  //Test content and expected results
  let testValues: TestValue[] = [
    {
    describe: 'SetMove',
    setValue: {
      compareButtonWidth: 120,
      compareButtonHeight: 120
    },
    expectValue: {
      compareButtonWidth: 120,
      compareButtonHeight: 120
    }
  },
    {
    describe: 'SetWidthHeight',
    setValue: {
      width: 60,
      height: 60
    },
    expectValue: {
      width: 60,
      height: 60
    }
  },
    {
    describe: 'SetOffset',
    exceptView: ['RichText'],
    setValue: {
      offset: {
        x: 50, y: 50
      } as Position
    },
    expectValue: {
      x: '50.00vp', y: '50.00vp',
      left: Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)), top: Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))
    }
  }
  ]

  describe('OnAreaChangeTest', () => {
    beforeAll(() => {
      console.info('OnAreaChangeTest beforeAll start')
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      let testData: BasePageConfig = data
      if(testData.testValue.describe == 'SetOffset'){
        testData = {
          pageConfig: data.pageConfig,
          testValue: {
            describe: data.testValue.describe,
            setValue: data.testValue.setValue,
            exceptView: data.testValue.exceptView,
            expectValue:{
              x: '50.00vp', y: '50.00vp',
              left: Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)), top: Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))
            }
          },
          caseTag: data.caseTag,
          customParams: data.customParams,
          viewObj: data.viewObj
        }
      }
      //Get Information about the location of the target component before the change
      let parentRectBefore: RectValue = Utils.getComponentRect(testData.pageConfig.parentKey);
      let targetRectBefore: RectValue = Utils.getComponentRect(testData.pageConfig.componentKey);
      if ((testData.pageConfig.componentKey == 'TabContent')) {
        console.info('[' + testData.caseTag + '] Find Parent Component Before');
        let parentComponent = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[1];
        parentComponent.getArray('$children').forEach((element) => {
          if ('Swiper' == element.getString('type')) {
            parentRectBefore = Utils.getComponentRectByObj(element);
          }
        });
      }
      console.info('[' + testData.caseTag + '] targetRectBefore: ' + JSON.stringify(targetRectBefore));
      console.info('[' + testData.caseTag + '] parentRectBefore: ' + JSON.stringify(parentRectBefore));
      console.log('JSON.stringify setValue',JSON.stringify(testData.testValue.setValue))
      //Set value
      if(testData.testValue.setValue.width && testData.testValue.setValue.height){
        console.log('JSON.stringify offset setValue',111111)
        let eventData: events_emitter.EventData = {
          data: {
            "_width": testData.testValue.setValue.width as number,
            "_height": testData.testValue.setValue.height as number
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 99,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("flexDirection_static_0700 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      }
      if(testData.testValue.setValue.compareButtonWidth&&testData.testValue.setValue.compareButtonHeight){
        let eventData: events_emitter.EventData = {
          data: {
            "_compareButtonWidth": testData.testValue.setValue.compareButtonWidth as number,
            "_compareButtonHeight": testData.testValue.setValue.compareButtonHeight as number
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 99,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("flexDirection_static_0700 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      }
      if(testData.testValue.setValue.offset){
        console.log('JSON.stringify offset setValue',testData.testValue.setValue)
        let eventData: events_emitter.EventData = {
          data: {
            "_offset": testData.testValue.setValue.offset as Position
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 99,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("flexDirection_static_0700 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      }
      await Utils.sleep(3000);
      //After the change, obtain the location information of the target component and parent container
      let parentRectAfter: RectValue = Utils.getComponentRect(testData.pageConfig.parentKey);
      let targetRectAfter: RectValue = Utils.getComponentRect(testData.pageConfig.componentKey);
      console.info('[' + testData.caseTag + '] targetRectAfter: ' + JSON.stringify(targetRectAfter));
      console.info('[' + testData.caseTag + '] parentRectAfter: ' + JSON.stringify(parentRectAfter));
      let RectAfter = parentRectAfter
      let compareOldTextComponent = Utils.getComponentByKey(testData.pageConfig.compareOldTextKey);
      let compareNewTextComponent = Utils.getComponentByKey(testData.pageConfig.compareNewTextKey);
      if ((testData.pageConfig.componentKey == 'TabContent')) {
        console.info('[' + testData.caseTag + '] Find Parent Component After');
        let parentComponent = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[1];
        parentComponent.getArray('$children').forEach((element) => {
          if ('Swiper' == element.getString('type')) {
            parentRectAfter = Utils.getComponentRectByObj(element);
          }
        });
      }
      console.info('[' + testData.caseTag + '] compareOldTextComponent.$attrs.content: ' +
      compareOldTextComponent.getElement('$attrs').getString('content'));
      console.info('[' + testData.caseTag + '] compareNewTextComponent.$attrs.content: ' +
      compareNewTextComponent.getElement('$attrs').getString('content'));
      console.info('[' + testData.caseTag + '] targetRectAfter: ' + JSON.stringify(targetRectAfter));

      if (testData.testValue.describe == 'SetMove') {
        let compareButtonRectAfter: RectValue = Utils.getComponentRect(testData.pageConfig.compareButtonKey);
        console.info('[' + testData.caseTag + '] compareButtonRectAfter: ' + JSON.stringify(compareButtonRectAfter));
        console.info('[' + testData.caseTag + '] testData.testValue.describe: ' + testData.testValue.describe);
        console.info('compareButtonRectAfter right: ' , compareButtonRectAfter.bottom,compareButtonRectAfter.top);
        console.info('compareButtonRectAfter px2vp: ' , AppStorage.get<UIContext>('uiContext')?.px2vp(compareButtonRectAfter.bottom - compareButtonRectAfter.top),testData.testValue.expectValue.compareButtonHeight);
        expect(Math.abs(Number(AppStorage.get<UIContext>('uiContext')?.px2vp(compareButtonRectAfter.right - compareButtonRectAfter.left)) -
        testData.testValue.expectValue.compareButtonWidth!) <= 2).assertTrue();
        expect(Math.abs(Number(AppStorage.get<UIContext>('uiContext')?.px2vp(compareButtonRectAfter.bottom - compareButtonRectAfter.top)) -
        testData.testValue.expectValue.compareButtonHeight!) <= 2).assertTrue();
        await checkResults(testData, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
          targetRectAfter, parentRectBefore, parentRectAfter);
      } else if (testData.testValue.describe == 'SetWidthHeight') {
        console.info('[' + testData.caseTag + '] testData.testValue.describe: ' + testData.testValue.describe);
        if ((testData.pageConfig.componentKey == 'GridCol') || (testData.pageConfig.componentKey == 'ListItemGroup')) {
          expect(Math.abs(Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectAfter.bottom - targetRectAfter.top)) -
          testData.testValue.expectValue.height!) <= 1).assertTrue();
          await checkResults(testData, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
            targetRectAfter, parentRectBefore, parentRectAfter);
        } else if ((testData.pageConfig.componentKey == 'TabContent')) {
          expect(Math.abs(Number(AppStorage.get<UIContext>('uiContext')?.px2vp(RectAfter.right - RectAfter.left)) - testData.testValue.expectValue.width!) <= 2)
            .assertTrue();
          expect(Math.abs(Number(AppStorage.get<UIContext>('uiContext')?.px2vp(RectAfter.bottom - RectAfter.top)) - testData.testValue.expectValue.height!) <= 2)
            .assertTrue();
          await checkResults(testData, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
            targetRectAfter, parentRectBefore, parentRectAfter);
        } else {
          expect(Math.abs(Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectAfter.right - targetRectAfter.left)) - testData.testValue.expectValue.width!) <= 2)
            .assertTrue();
          expect(Math.abs(Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectAfter.bottom - targetRectAfter.top)) - testData.testValue.expectValue.height!) <= 2)
            .assertTrue();
          await checkResults(testData, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
            targetRectAfter, parentRectBefore, parentRectAfter);
        }
      } else if (testData.testValue.describe == 'SetOffset') {
        console.info('[' + testData.caseTag + '] testData.testValue.describe: ' + testData.testValue.describe);
        let viewObj = Utils.getComponentByKey(testData.pageConfig.componentKey);
        console.info('[' + testData.caseTag + '] viewObj.$attrs.offset.x: ' + viewObj.getElement('$attrs').getElement('offset').getString('x'));
        expect(viewObj.getElement('$attrs').getElement('offset').getString('x')).assertEqual(testData.testValue.expectValue.x);
        console.info('[' + testData.caseTag + '] viewObj.$attrs.offset.y: ' + viewObj.getElement('$attrs').getElement('offset').getString('y'));
        expect(viewObj.getElement('$attrs').getElement('offset').getString('y')).assertEqual(testData.testValue.expectValue.y);
        console.log('leftleft',targetRectAfter.left,targetRectBefore.left)
        console.log('expectValue left',testData.testValue.expectValue.left)
        expect(Math.abs(Number(targetRectAfter.left - targetRectBefore.left) -
        Number(testData.testValue.expectValue.left ?? 0)) <= 2).assertTrue();
        expect(Math.abs(Number(targetRectAfter.top - targetRectBefore.top) -
        Number(testData.testValue.expectValue.top ?? 0)) <= 2).assertTrue();
        console.log('compareOldTextComponent content',compareOldTextComponent.getElement('$attrs').getString('content'))
        expect(compareOldTextComponent.getElement('$attrs').getString('content')).assertEqual('');
        expect(compareNewTextComponent.getElement('$attrs').getString('content')).assertEqual('');
      }
    });
  })
}
async function checkResults(testData: BasePageConfig, compareOldTextComponent: jsonx.JsonElement, compareNewTextComponent: jsonx.JsonElement, targetRectBefore: RectValue,
  targetRectAfter: RectValue, parentRectBefore: RectValue, parentRectAfter: RectValue) {
  //Check that the position information before the change is correct
  console.info('[' + testData.caseTag + '] checkResults',compareOldTextComponent.getElement('$attrs').getString('content'));
  expect(compareOldTextComponent.getElement('$attrs').getString('content') != '').assertEqual(true);
  expect(compareNewTextComponent.getElement('$attrs').getString('content') != '').assertEqual(true);
  let compareOldTextObj = JSON.parseJsonElement(compareOldTextComponent.getElement('$attrs').getString('content'))
  let compareNewTextObj = JSON.parseJsonElement(compareNewTextComponent.getElement('$attrs').getString('content'))
  console.info('[' + testData.caseTag + '] compareOldTextObj width: ' + compareOldTextObj.getInteger('width'));
  expect(Math.abs(compareOldTextObj.getInteger('width') - Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectBefore.right - targetRectBefore.left))) <= 2).assertTrue();
  console.info('[' + testData.caseTag + '] compareOldTextObj height: ' + compareOldTextObj.getInteger('height'));
  console.info(' compareOldTextObj targetRectBefore px2vp: ' , Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectBefore.right - targetRectBefore.left)));
  expect(Math.abs(compareOldTextObj.getInteger('height') - Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectBefore.bottom - targetRectBefore.top))) <= 2)
    .assertTrue();
  console.info('[' + testData.caseTag + '] compareOldTextObj.position.x: ' + compareOldTextObj.getElement('position').getInteger('x'));
  expect(Math.abs(compareOldTextObj.getElement('position').getInteger('x') - Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectBefore.left - parentRectBefore.left))) <= 2)
    .assertTrue();
  console.info('[' + testData.caseTag + '] compareOldTextObj.position.y: ' + compareOldTextObj.getElement('position').getDouble('y'));
  expect(Math.abs(compareOldTextObj.getElement('position').getDouble('y') - Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectBefore.top - parentRectBefore.top))) <= 2)
    .assertTrue();
  console.info('[' + testData.caseTag + '] compareOldTextObj.globalPosition.x: ' + compareOldTextObj.getElement('globalPosition').getInteger('x'));
  expect(Math.abs(compareOldTextObj.getElement('globalPosition').getInteger('x') - Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectBefore.left))) <= 2).assertTrue();
  console.info('[' + testData.caseTag + '] compareOldTextObj.globalPosition.y: ' + compareOldTextObj.getElement('globalPosition').getDouble('y'));
  expect(Math.abs(compareOldTextObj.getElement('globalPosition').getDouble('y') - Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectBefore.top))) <= 2).assertTrue();

  //Check whether the changed position information is correct
  console.info('[' + testData.caseTag + '] compareNewTextObj.width: ' + compareNewTextObj.getDouble('width'));
  expect(Math.abs(compareNewTextObj.getDouble('width') - Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectAfter.right - targetRectAfter.left))) <= 2).assertTrue();
  console.info('[' + testData.caseTag + '] compareNewTextObj.height: ' + compareNewTextObj.getDouble('height'));
  expect(Math.abs(compareNewTextObj.getDouble('height') - Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectAfter.bottom - targetRectAfter.top))) <= 2).assertTrue();
  console.info('[' + testData.caseTag + '] compareNewTextObj.position.x: ' + compareNewTextObj.getElement('position').getDouble('x'));
  expect(Math.abs(compareNewTextObj.getElement('position').getDouble('x') - Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectAfter.left - parentRectAfter.left))) <= 2)
    .assertTrue();
  console.info('[' + testData.caseTag + '] compareNewTextObj.position.y: ' + compareNewTextObj.getElement('position').getDouble('y'));
  expect(Math.abs(compareNewTextObj.getElement('position').getDouble('y') - Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectAfter.top - parentRectAfter.top))) <= 2).assertTrue();
  console.info('[' + testData.caseTag + '] compareNewTextObj.globalPosition.x: ' + compareNewTextObj.getElement('globalPosition').getDouble('x'));
  expect(Math.abs(compareNewTextObj.getElement('globalPosition').getDouble('x') - Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectAfter.left))) <= 2).assertTrue();
  console.info('[' + testData.caseTag + '] compareNewTextObj.globalPosition.y: ' + compareNewTextObj.getElement('globalPosition').getDouble('y'));
  expect(Math.abs(compareNewTextObj.getElement('globalPosition').getDouble('y') - Number(AppStorage.get<UIContext>('uiContext')?.px2vp(targetRectAfter.top))) <= 2).assertTrue();

}

