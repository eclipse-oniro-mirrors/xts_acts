/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils';
import { AttrsManager } from '../../MainAbility/common/AttrsManager';

class SetValue {
  compareButtonWidth?: number;
  compareButtonHeight?: number;
  width?: number;
  height?: number;
  offset?: ESObject;
}

class TestValues {
  describe: string;
  setValue: SetValue;
  expectValue: ESObject;
  exceptView?: ESObject;
}

class PageConfig {
  testName: string;
  pageName: string;
  pageUrl: string;
  targetGroupView: string;
  parentWidth: number;
  parentHeight: number;
  parentMargin: number;
  parentKey: string;
  compareButtonKey: string;
  compareOldTextKey: string;
  compareNewTextKey: string;
}

export default function onAreaChangeTest() {

  //Component to be tested
  let supportView = [
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
    //'Menu',
    'MenuItem',
    //'MenuItemGroup',
    'Navigation',
    'NavRouter',
    //'NavDestination',
    'PatternLock',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    //'RichText',
    'ScrollBar',
    'Search',
    //'Select',
    'Slider',
    'Stepper',
    'StepperItem',
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
    //'GridCol',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'Navigator',
    'Panel',
    //'Refresh',
    'RelativeContainer',
    'Row',
    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
    'TabContent',
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
  ]

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
  let testValues: TestValues[] = [{
    describe: 'SetMove',
    setValue: {
      compareButtonWidth: 120,
      compareButtonHeight: 120
    },
    expectValue: {
      compareButtonWidth: 120,
      compareButtonHeight: 120
    }
  }, {
    describe: 'SetWidthHeight',
    setValue: {
      width: 60,
      height: 60
    },
    expectValue: {
      width: 60,
      height: 60
    }
  }, {
    describe: 'SetOffset',
    exceptView: ['RichText'],
    setValue: {
      offset: {
        x: 50, y: 50
      }
    },
    expectValue: {
      x: '50.00vp', y: '50.00vp', left: vp2px(50), top: vp2px(50)
    }
  }]

  describe('OnAreaChangeTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      //Get Information about the location of the target component before the change
      let parentRectBefore = Utils.getComponentRect(data.pageConfig.parentKey);
      let targetRectBefore = Utils.getComponentRect(data.pageConfig.componentKey);
      if ((data.pageConfig.componentKey == 'TabContent') || (data.pageConfig.componentKey == 'StepperItem')) {
        console.info('[' + data.caseTag + '] Find Parent Component Before');
        let parentComponent: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[1];
        parentComponent.$children.forEach((element: ESObject) => {
          if ('Swiper' == element.$type) {
            parentRectBefore = Utils.getComponentRectByObj(element);
          }
        });
      }
      console.info('[' + data.caseTag + '] targetRectBefore: ' + JSON.stringify(targetRectBefore));
      console.info('[' + data.caseTag + '] parentRectBefore: ' + JSON.stringify(parentRectBefore));

      //Set value
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //After the change, obtain the location information of the target component and parent container
      let parentRectAfter = Utils.getComponentRect(data.pageConfig.parentKey);
      let targetRectAfter = Utils.getComponentRect(data.pageConfig.componentKey);
      let RectAfter = parentRectAfter
      let compareOldTextComponent: ESObject = Utils.getComponentByKey(data.pageConfig.compareOldTextKey);
      let compareNewTextComponent: ESObject = Utils.getComponentByKey(data.pageConfig.compareNewTextKey);
      if ((data.pageConfig.componentKey == 'TabContent') || (data.pageConfig.componentKey == 'StepperItem')) {
        console.info('[' + data.caseTag + '] Find Parent Component After');
        let parentComponent: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[1];
        parentComponent.$children.forEach((element: ESObject) => {
          if ('Swiper' == element.$type) {
            parentRectAfter = Utils.getComponentRectByObj(element);
          }
        });
      }
      console.info('[' + data.caseTag + '] compareOldTextComponent.$attrs.content: ' +
      compareOldTextComponent.$attrs.content);
      console.info('[' + data.caseTag + '] compareNewTextComponent.$attrs.content: ' +
      compareNewTextComponent.$attrs.content);
      console.info('[' + data.caseTag + '] targetRectAfter: ' + JSON.stringify(targetRectAfter));

      if (data.testValue.describe == 'SetMove') {
        let compareButtonRectAfter = Utils.getComponentRect(data.pageConfig.compareButtonKey);
        console.info('[' + data.caseTag + '] compareButtonRectAfter: ' + JSON.stringify(compareButtonRectAfter));
        console.info('[' + data.caseTag + '] data.testValue.describe: ' + data.testValue.describe);
        expect(Math.abs(px2vp(compareButtonRectAfter.right - compareButtonRectAfter.left) -
        data.testValue.expectValue.compareButtonWidth) <= 1).assertTrue();
        expect(Math.abs(px2vp(compareButtonRectAfter.bottom - compareButtonRectAfter.top) -
        data.testValue.expectValue.compareButtonHeight) <= 1).assertTrue();
        await checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
          targetRectAfter, parentRectBefore, parentRectAfter);
      } else if (data.testValue.describe == 'SetWidthHeight') {
        console.info('[' + data.caseTag + '] data.testValue.describe: ' + data.testValue.describe);
        if ((data.pageConfig.componentKey == 'GridCol') || (data.pageConfig.componentKey == 'ListItemGroup')) {
          expect(Math.abs(px2vp(targetRectAfter.bottom - targetRectAfter.top) -
          data.testValue.expectValue.height) <= 1).assertTrue();
          await checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
            targetRectAfter, parentRectBefore, parentRectAfter);
        } else if ((data.pageConfig.componentKey == 'TabContent') || (data.pageConfig.componentKey == 'StepperItem')) {
          expect(Math.abs(px2vp(RectAfter.right - RectAfter.left) - data.testValue.expectValue.width) <= 1)
            .assertTrue();
          expect(Math.abs(px2vp(RectAfter.bottom - RectAfter.top) - data.testValue.expectValue.height) <= 1)
            .assertTrue();
          await checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
            targetRectAfter, parentRectBefore, parentRectAfter);
        } else {
          expect(Math.abs(px2vp(targetRectAfter.right - targetRectAfter.left) - data.testValue.expectValue.width) <= 1)
            .assertTrue();
          expect(Math.abs(px2vp(targetRectAfter.bottom - targetRectAfter.top) - data.testValue.expectValue.height) <= 1)
            .assertTrue();
          await checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
            targetRectAfter, parentRectBefore, parentRectAfter);
        }
      } else if (data.testValue.describe == 'SetOffset') {
        console.info('[' + data.caseTag + '] data.testValue.describe: ' + data.testValue.describe);
        let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] viewObj.$attrs.offset.x: ' + viewObj.$attrs.offset.x);
        expect(viewObj.$attrs.offset.x).assertEqual(data.testValue.expectValue.x);
        console.info('[' + data.caseTag + '] viewObj.$attrs.offset.y: ' + viewObj.$attrs.offset.y);
        expect(viewObj.$attrs.offset.y).assertEqual(data.testValue.expectValue.y);
        expect(Math.abs(Number(targetRectAfter.left - targetRectBefore.left) -
        Number(data.testValue.expectValue.left)) <= 1).assertTrue();
        expect(Math.abs(Number(targetRectAfter.top - targetRectBefore.top) -
        Number(data.testValue.expectValue.top)) <= 1).assertTrue();
        expect(compareOldTextComponent.$attrs.content).assertEqual('');
        expect(compareNewTextComponent.$attrs.content).assertEqual('');
      }
    });
  })


}

async function checkResults(data: ESObject, compareOldTextComponent: ESObject, compareNewTextComponent: ESObject, targetRectBefore: ESObject,
                            targetRectAfter: ESObject, parentRectBefore: ESObject, parentRectAfter: ESObject) {
  //Check that the position information before the change is correct
  console.info('[' + data.caseTag + '] checkResults');
  expect(compareOldTextComponent.$attrs.content != '').assertEqual(true);
  expect(compareNewTextComponent.$attrs.content != '').assertEqual(true);
  let compareOldTextObj: ESObject = JSON.parse(compareOldTextComponent.$attrs.content);
  let compareNewTextObj: ESObject = JSON.parse(compareNewTextComponent.$attrs.content);
  console.info('[' + data.caseTag + '] compareOldTextObj.width: ' + compareOldTextObj.width);
  expect(Math.abs(compareOldTextObj.width - px2vp(targetRectBefore.right - targetRectBefore.left)) <= 1).assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj.height: ' + compareOldTextObj.height);
  expect(Math.abs(compareOldTextObj.height - px2vp(targetRectBefore.bottom - targetRectBefore.top)) <= 1)
    .assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj.position.x: ' + compareOldTextObj.position.x);
  expect(Math.abs(compareOldTextObj.position.x - px2vp(targetRectBefore.left - parentRectBefore.left)) <= 1)
    .assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj.position.y: ' + compareOldTextObj.position.y);
  expect(Math.abs(compareOldTextObj.position.y - px2vp(targetRectBefore.top - parentRectBefore.top)) <= 1)
    .assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj.globalPosition.x: ' + compareOldTextObj.globalPosition.x);
  expect(Math.abs(compareOldTextObj.globalPosition.x - px2vp(targetRectBefore.left)) <= 1).assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj.globalPosition.y: ' + compareOldTextObj.globalPosition.y);
  expect(Math.abs(compareOldTextObj.globalPosition.y - px2vp(targetRectBefore.top)) <= 1).assertTrue();

  //Check whether the changed position information is correct
  console.info('[' + data.caseTag + '] compareNewTextObj.width: ' + compareNewTextObj.width);
  expect(Math.abs(compareNewTextObj.width - px2vp(targetRectAfter.right - targetRectAfter.left)) <= 1).assertTrue();
  console.info('[' + data.caseTag + '] compareNewTextObj.height: ' + compareNewTextObj.height);
  expect(Math.abs(compareNewTextObj.height - px2vp(targetRectAfter.bottom - targetRectAfter.top)) <= 1).assertTrue();
  console.info('[' + data.caseTag + '] compareNewTextObj.position.x: ' + compareNewTextObj.position.x);
  expect(Math.abs(compareNewTextObj.position.x - px2vp(targetRectAfter.left - parentRectAfter.left)) <= 1)
    .assertTrue();
  console.info('[' + data.caseTag + '] compareNewTextObj.position.y: ' + compareNewTextObj.position.y);
  expect(Math.abs(compareNewTextObj.position.y - px2vp(targetRectAfter.top - parentRectAfter.top)) <= 1).assertTrue();
  console.info('[' + data.caseTag + '] compareNewTextObj.globalPosition.x: ' + compareNewTextObj.globalPosition.x);
  expect(Math.abs(compareNewTextObj.globalPosition.x - px2vp(targetRectAfter.left)) <= 1).assertTrue();
  console.info('[' + data.caseTag + '] compareNewTextObj.globalPosition.y: ' + compareNewTextObj.globalPosition.y);
  expect(Math.abs(compareNewTextObj.globalPosition.y - px2vp(targetRectAfter.top)) <= 1).assertTrue();
}