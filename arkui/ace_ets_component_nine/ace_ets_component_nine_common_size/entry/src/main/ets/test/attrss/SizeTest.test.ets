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
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils';

export default function sizeTest() {
  let supportView = [
    //'AlphabetIndexer',
    //'Button',
    //'Blank',
    //'Checkbox',
    //'CheckboxGroup',
    //'DataPanel',
    //'DatePicker',
    //'Divider',
    //'Gauge',
    //'Image',
    //'ImageAnimator',
    //'LoadingProgress',
    //'Marquee',
    //'Menu',
    //'MenuItem',
    //'MenuItemGroup',
    ////'Navigation',
    //'NavRouter',
    //'Progress',
    //'QRCode',
    //'Radio',
    //'Rating',
    //'ScrollBar',
    //'Search',
    //'Select',
    //'Slider',
    //'Stepper',
    'Text',
    //'TextArea',
    //'TextClock',
    ///'TextInput',
    //'TextPicker',
    //'TextTimer',
    //'TimePicker',
    //'Toggle',
    //'Badge',
    //'Column',
   // 'ColumnSplit',
    //'Counter',
    //'Flex',
    ////'FlowItem',
    //'GridCol',
    //'GridRow',
    //'Grid',
    //'GridItem',
    //'List',
    //'ListItem',
    //'ListItemGroup',
    //'Navigator',
    //'Panel',
    //'Refresh',
    //'RelativeContainer',
    //'Row',
    //'RowSplit',
    //'Scroll',
    //'SideBarContainer',
    //'Stack',
    //'Swiper',
    //'Tabs',
    //'Circle',
    //'Ellipse',
    //'Polyline',
    //'Polygon',
    //'Path',
    //'Rect',
    //'Shape',
    //'Line',
    //'WaterFlow'
  ]
  let parentWidth = 300;
  let parentHeight = 300;
  let parentBackGroundColor = Color.Red;
  let BackGroundColor = Color.Orange;
  let pageConfig = {
    testName: 'testSize',
    pageName: 'SizePage',
    pageUrl: 'MainAbility/pages/common/SizePage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentBackGroundColor: parentBackGroundColor,
    BackGroundColor: BackGroundColor
  }
  let testValues = [{
    describe: 'StringNumber',
    setValue: {
      width: 200, height: 200
    },
    expectValue: {
      widthCompare: '200.00vp', heightCompare: '200.00vp',
      width: vp2px(200), height: vp2px(200)
    }
  }, {
    describe: 'StringPercent',
    setValue: {
      width: '50%', height: '50%'
    },
    expectValue: {
      widthCompare: '50.00%', heightCompare: '50.00%',
      width: vp2px(parentWidth) * 0.5, height: vp2px(parentHeight) * 0.5
    }
  }, {
    describe: 'Resource',
    setValue: {
      width: $r('app.float.200vp'),
      height: $r('app.float.100vp')
    },
    expectValue: {
      widthCompare: '200.00vp', heightCompare: '100.00vp',
      width: vp2px(200),
      height: vp2px(100)
    }
  }, {
    describe: 'StringPx',
    setValue: {
      width: '300px',
      height: '300px'
    },
    expectValue: {
      widthCompare: '300.00px', heightCompare: '300.00px',
      width: 300, height: 300
    }
  }, {
    describe: 'SetStringWidth',
    setValue: {
      width: '300px'
    },
    expectValue: {
      widthCompare: '300.00px',
      width: 300
    }
  }, {
    describe: 'SetStringHeight',
    setValue: {
      height: '300px'
    },
    expectValue: {
      heightCompare: '300.00px',
      height: 300
    }
  }]
   /**
   * @tc.number Common_Size_10010
   * @tc.name   testCommonSizeAll
   * @tc.desc   The Size property of the Common component is set to all
   * @tc.size   MediumTest
   * @tc.type   Function
   * @tc.level  0
   */
  describe('SizeTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.info( 'key ['+ data.pageConfig.componentKey + '] json is: ' + JSON.stringify( data.viewObj.$attrs));
      console.info( 'key ['+ data.pageConfig.componentKey + '] attr size is: ' + JSON.stringify( data.viewObj.$attrs.size));
      console.info('[' + data.caseTag + '] data.testValue.expectValue.width:' + data.testValue.expectValue.width);
      console.info('[' + data.caseTag + '] data.testValue.expectValue.height:' + data.testValue.expectValue.height);
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.size.width:' + data.viewObj.$attrs.width);
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.size.height:' + data.viewObj.$attrs.height);
      if (data.testValue.describe == 'SetStringWidth') {
        expect(data.viewObj.$attrs.size.width).assertEqual(data.testValue.expectValue.widthCompare);
      } else if (data.testValue.describe == 'SetStringHeight') {
        expect(data.viewObj.$attrs.size.height).assertEqual(data.testValue.expectValue.heightCompare);
      } else {
        expect(data.viewObj.$attrs.size.width).assertEqual(data.testValue.expectValue.widthCompare);
        expect(data.viewObj.$attrs.size.height).assertEqual(data.testValue.expectValue.heightCompare);
      }
    })
  })
}