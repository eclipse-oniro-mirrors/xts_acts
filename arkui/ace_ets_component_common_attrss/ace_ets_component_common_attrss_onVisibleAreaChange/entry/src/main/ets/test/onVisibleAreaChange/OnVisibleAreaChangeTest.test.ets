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

import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import Utils from '../../MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium';


export default function onVisibleAreaChangeTest() {

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
    'Menu',
    'MenuItem',
    'MenuItemGroup',
    'Navigation',
    'NavRouter',
    //'NavDestination',
    'PatternLock',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'RichText',
    'ScrollBar',
    'Search',
    'Select',
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
    'GridCol',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'Navigator',
    'Panel',
    'Refresh',
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
  let compareTextKey = 'compareTextKey';
  let compareTextWidth = 100;
  let compareTextHeight = 50;
  let componentWidth = 100;
  let componentHeight = 100;
  let scrollWidth = 300;
  let scrollHeight = 400;
  let columnWidth = 200;
  let columnHeight = 800;
  let buttonWidth = 100;
  let buttonHeight = 100;

  let pageConfig = {
    testName: 'testOnVisibleAreaChange',
    pageName: 'OnVisibleAreaChangePage',
    pageUrl: 'MainAbility/pages/onVisibleAreaChange/OnVisibleAreaChangePage',
    targetGroupView: 'targetGroupView',
    compareTextKey: compareTextKey,
    compareTextWidth: compareTextWidth,
    compareTextHeight: compareTextHeight,
    scrollWidth: scrollWidth,
    scrollHeight: scrollHeight,
    columnWidth: columnWidth,
    columnHeight: columnHeight,
    buttonWidth: buttonWidth,
    buttonHeight: buttonHeight,
    componentWidth: componentWidth,
    componentHeight: componentHeight
  }

  //Test content and expected results
  let testValues = [
  //    {
  //    describe: 'Normal',
  //    setValue: {
  //      leave: {
  //        yOffSetValueLeave: 200,
  //        ratiosLeft: 0.2,
  //        ratiosRight: 0.8
  //      },
  //      enter: {
  //        yOffSetValueEnter: 0
  //      }
  //    },
  //    expectValue: {
  //      yOffSetMoveLength: 200
  //    }
  //  },
    {
      describe: 'Abnormal',
      setValue: {
        leave: {
          yOffSetValueLeave: 200,
          ratiosLeft: -0.5,
          ratiosRight: 1.5
        },
        enter: {
          yOffSetValueEnter: 0
        }
      },
      expectValue: {
        yOffSetMoveLength: 200
      }
    }]

  describe('OnVisibleAreaChangeTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, null, async data => {
      //Get Information about the location of the target component before the change
      let targetRectBefore = Utils.getComponentRect(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + '] targetRectBefore: ' + targetRectBefore);

      //Set value
      AttrsManager.change(data.caseTag, data.testValue.setValue.leave);
      await Utils.sleep(1000);
      sendEventByKey('OnVisibleAreaChangeButton', 10, '');
      await Utils.sleep(4000);

      //Gets information about where the target component moved out
      let targetRectLeave = Utils.getComponentRect(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + '] targetRectLeave: ' + targetRectLeave);
      let compareTextLeave = Utils.getComponentByKey(data.pageConfig.compareTextKey);

      //Set value
      AttrsManager.change(data.caseTag, data.testValue.setValue.enter);
      await Utils.sleep(1000);
      sendEventByKey('OnVisibleAreaChangeButton', 10, '');
      await Utils.sleep(4000);

      //Gets information about where the target component enters
      let targetRectEnter = Utils.getComponentRect(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + '] targetRectEnter: ' + targetRectEnter);
      let compareTextEnter = Utils.getComponentByKey(data.pageConfig.compareTextKey);

      //Check that the target component has moved the correct distance
      console.info('[' + data.caseTag + '] targetRectBefore.bottom: ' + targetRectBefore.bottom);
      console.info('[' + data.caseTag + '] targetRectLeave.bottom: ' + targetRectLeave.bottom);
      console.info('[' + data.caseTag + '] targetRectEnter.bottom: ' + targetRectEnter.bottom);
      expect(px2vp(targetRectBefore.bottom - targetRectLeave.bottom))
        .assertEqual(data.testValue.expectValue.yOffSetMoveLength);
      expect(px2vp(targetRectEnter.bottom - targetRectLeave.bottom))
        .assertEqual(data.testValue.expectValue.yOffSetMoveLength);

      let ratiosRightNum = data.testValue.setValue.leave.ratiosRight;
      let ratiosLeftNum = data.testValue.setValue.leave.ratiosLeft;

      //Check whether a callback is triggered and whether it contains data
      console.info('[' + data.caseTag + '] compareTextLeave.$attrs.content: ' +
      compareTextLeave.$attrs.content);
      let compareTextLeaveStr = compareTextLeave.$attrs.content;
      if (compareTextLeaveStr.indexOf('@') >= 0 && compareTextLeaveStr.indexOf('{') < 0) {
        expect('null').assertEqual('objects');
      }

      //Loop to check that each set of data is correct
      let compareTextLeaveObj: string[] = compareTextLeaveStr.split('@');
      if (data.testValue.describe == 'Normal') {
        console.info('[' + data.caseTag + '] data.testValue.describe:' + data.testValue.describe);
        await checkNormalLeaveResults(data, compareTextLeaveObj, ratiosRightNum);
      } else if (data.testValue.describe == 'Abnormal') {
        console.info('[' + data.caseTag + '] data.testValue.describe:' + data.testValue.describe);
        await checkAbnormalResults(data, compareTextLeaveObj);
      } else {
        console.info('[' + data.caseTag + '] data.testValue.describe is error:' + data.testValue.describe);
      }

      //Check whether a callback is triggered and whether it contains data
      console.info('[' + data.caseTag + '] compareTextEnter.$attrs.content: ' + compareTextEnter.$attrs.content);
      let compareTextEnterStr = compareTextEnter.$attrs.content;
      if (compareTextEnterStr.indexOf('@') >= 0 && compareTextEnterStr.indexOf('{') < 0) {
        expect('null').assertEqual('objects');
      }

      //Loop to check that each set of data is correct
      let compareTextEnterObj: string[] = compareTextEnterStr.split('@');
      if (data.testValue.describe == 'Normal') {
        console.info('[' + data.caseTag + '] data.testValue.describe:' + data.testValue.describe);
        await checkNormalEnterResults(data, compareTextEnterObj, ratiosLeftNum);
      } else if (data.testValue.describe == 'Abnormal') {
        console.info('[' + data.caseTag + '] data.testValue.describe:' + data.testValue.describe);
        await checkAbnormalResults(data, compareTextEnterObj);
      } else {
        console.info('[' + data.caseTag + '] data.testValue.describe is error:' + data.testValue.describe);
        expect('data.testValue.describe').assertEqual('error');
      }
    });
  })

  async function checkNormalLeaveResults(data, compareTextObj, ratiosRightNum) {
    console.info('[' + data.caseTag + '] checkNormalLeaveResults');
    for (let num: number = 0;num <= compareTextObj.length; num++) {
      if (compareTextObj[num]) {
        console.info('[' + data.caseTag + '] compareTextObj[' + num + ']:' + compareTextObj[num]);
        console.info('[' + data.caseTag + '] JSON.parse(compareTextObj[num]).currentRatio:' +
        JSON.parse(compareTextObj[num]).currentRatio);
        console.info('[' + data.caseTag + '] JSON.parse(compareTextObj[num]).isVisible:' +
        JSON.parse(compareTextObj[num]).isVisible);
        if (JSON.parse(compareTextObj[num]).currentRatio > ratiosRightNum) {
          expect(JSON.parse(compareTextObj[num]).isVisible).assertEqual('true');
        } else if (JSON.parse(compareTextObj[num]).currentRatio < ratiosRightNum) {
          expect(JSON.parse(compareTextObj[num]).isVisible).assertEqual('false');
        } else {
          console.info('[' + data.caseTag + '] Leave currentRatio is error:' +
          JSON.parse(compareTextObj[num]).currentRatio);
        }
      }
    }
  }

  async function checkNormalEnterResults(data, compareTextObj, ratiosLeftNum) {
    console.info('[' + data.caseTag + '] checkNormalEnterResults');
    for (let num: number = 0;num <= compareTextObj.length; num++) {
      if (compareTextObj[num]) {
        console.info('[' + data.caseTag + '] compareTextObj[' + num + ']:' + compareTextObj[num]);
        console.info('[' + data.caseTag + '] JSON.parse(compareTextObj[num]).currentRatio:' +
        JSON.parse(compareTextObj[num]).currentRatio);
        console.info('[' + data.caseTag + '] JSON.parse(compareTextObj[num]).isVisible:' +
        JSON.parse(compareTextObj[num]).isVisible);
        if (JSON.parse(compareTextObj[num]).currentRatio > ratiosLeftNum) {
          expect(JSON.parse(compareTextObj[num]).isVisible).assertEqual('true');
        } else if (JSON.parse(compareTextObj[num]).currentRatio < ratiosLeftNum) {
          expect(JSON.parse(compareTextObj[num]).isVisible).assertEqual('false');
        } else {
          console.info('[' + data.caseTag + '] Enter currentRatio is error:' +
          JSON.parse(compareTextObj[num]).currentRatio);
        }
      }
    }
  }

  async function checkAbnormalResults(data, compareTextObj) {
    console.info('[' + data.caseTag + '] checkAbnormalResults');
    for (let num: number = 0;num <= compareTextObj.length; num++) {
      if (compareTextObj[num]) {
        console.info('[' + data.caseTag + '] compareTextObj[' + num + ']:' + compareTextObj[num]);
        console.info('[' + data.caseTag + '] JSON.parse(compareTextObj[num]).currentRatio:' +
        JSON.parse(compareTextObj[num]).currentRatio);
        expect((JSON.parse(compareTextObj[num]).currentRatio >= 0) && (JSON.parse(compareTextObj[num])
          .currentRatio <= 1)).assertEqual(true);
      }
    }
  }
}