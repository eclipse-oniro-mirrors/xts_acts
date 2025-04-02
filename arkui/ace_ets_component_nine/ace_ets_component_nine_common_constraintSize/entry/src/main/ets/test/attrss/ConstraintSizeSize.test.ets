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

export default function constraintSizeTest() {
  let supportView = [
    // 'AlphabetIndexer',
    // 'Button',
    // 'Blank',
    // 'Checkbox',
    // 'CheckboxGroup',
    // 'DataPanel',
    // 'DatePicker',
    // 'Divider',
    // 'Gauge',
    // 'Image',
    // 'ImageAnimator',
    // 'LoadingProgress',
    // 'Marquee',
    // 'Menu',
    // 'MenuItem',
    // //'MenuItemGroup',
    // 'Navigation',
    // 'NavRouter',
    // 'Progress',
    // 'QRCode',
    // 'Radio',
    // 'Rating',
    // //'ScrollBar',
    // //'Search',
    // 'Select',
    // 'Slider',
    // 'Stepper',
    // //'StepperItem',
     'Text',
    // 'TextArea',
    // 'TextClock',
    // 'TextInput',
    // 'TextPicker',
    // 'TextTimer',
    // 'TimePicker',
    // 'Toggle',
    // 'Badge',
    // 'Column',
    // 'ColumnSplit',
    // 'Counter',
    // 'Flex',
    // 'FlowItem',
    // //'GridCol',
    // //'GridRow',
    // 'Grid',
    // 'GridItem',
    // 'List',
    // 'ListItem',
    // 'Navigator',
    // //'Panel',
    // 'Refresh',
    // 'RelativeContainer',
    // 'Row',
    // 'RowSplit',
    // //'Scroll',
    // //'SideBarContainer',
    // 'Stack',
    // 'Swiper',
    // //'Tabs',
    // 'Circle',
    // 'Ellipse',
    // 'Polyline',
    // 'Polygon',
    // 'Path',
    // 'Rect',
    // 'Shape',
    // 'Line',
    // 'WaterFlow'
  ]
  //Custom params.
  let childWidth = 200;
  let childHeight = 200;
  let pageConfig = {
    testName: 'testConstraintSize',
    pageName: 'ConstraintSizePage',
    pageUrl: 'MainAbility/pages/common/ConstraintSizePage',
    childHeight: childHeight,
    childWidth: childWidth,
    referenceComponentKey: 'referenceComponentKey', 
  }
  let testValues = [{
    describe: 'SetNumber',
    setValue: {
      minWidth: 0,
      maxWidth: 300,
      minHeight: 0,
      maxHeight: 300
    },
    expectValue: {
      constraintSize: {
        'minWidth': '0.00vp', 'minHeight': '0.00vp', 'maxWidth': '300.00vp', 'maxHeight': '300.00vp'
      },
      width: vp2px(200),
      height: vp2px(200)
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      minWidth: '0px',
      maxWidth: '900px',
      minHeight: '0px',
      maxHeight: '900px'
    },
    expectValue: {
      constraintSize: {
        'minWidth': '0.00px', 'minHeight': '0.00px', 'maxWidth': '900.00px', 'maxHeight': '900.00px'
      },
      width: vp2px(200),
      height: vp2px(200)
    }
  }, {
    describe: 'SetStringPercent',
    setValue: {
      minWidth: 0,
      maxWidth: '100%',
      minHeight: 0,
      maxHeight: '100%'
    },
    expectValue: {
      constraintSize: {
        'minWidth': '0.00vp', 'minHeight': '0.00vp', 'maxWidth': '100.00%', 'maxHeight': '100.00%'
      },
      width: vp2px(200),
      height: vp2px(200)
    }
  }, {
    describe: 'SetResource',
    setValue: {
      minWidth: 0,
      maxWidth: $r('app.float.300vp'),
      minHeight: 0,
      maxHeight: $r('app.float.300vp')
    },
    expectValue: {
      constraintSize: {
        'minWidth': '0.00vp', 'minHeight': '0.00vp', 'maxWidth': '300.00vp', 'maxHeight': '300.00vp'
      },
      width: vp2px(200),
      height: vp2px(200)
    }
  }, {
    describe: 'SetOrderMaxMinSetting',
    setValue: {
      minWidth: 250,
      maxWidth: 300,
      minHeight: 250,
      maxHeight: 300
    },
    expectValue: {
      constraintSize: {
        'minWidth': '250.00vp', 'minHeight': '250.00vp', 'maxWidth': '300.00vp', 'maxHeight': '300.00vp'
      },
      width: vp2px(250),
      height: vp2px(250)
    }
  }, {
    describe: 'SetOrderSettingMaxMin',
    setValue: {
      minWidth: 100,
      maxWidth: 150,
      minHeight: 100,
      maxHeight: 150
    },
    expectValue: {
      constraintSize: {
        'minWidth': '100.00vp', 'minHeight': '100.00vp', 'maxWidth': '150.00vp', 'maxHeight': '150.00vp'
      },
      width: vp2px(150),
      height: vp2px(150)
    }
  }, {
    describe: 'SetOrderMinMaxSetting',
    setValue: {
      minWidth: 300,
      maxWidth: 250,
      minHeight: 300,
      maxHeight: 250
    },
    expectValue: {
      constraintSize: {
        'minWidth': '300.00vp', 'minHeight': '300.00vp', 'maxWidth': '250.00vp', 'maxHeight': '250.00vp'
      },
      width: vp2px(300),
      height: vp2px(300)
    }
  }, {
    describe: 'SetOrderSettingMinMax',
    setValue: {
      minWidth: 150,
      maxWidth: 100,
      minHeight: 150,
      maxHeight: 100
    },
    expectValue: {
      constraintSize: {
        'minWidth': '150.00vp', 'minHeight': '150.00vp', 'maxWidth': '100.00vp', 'maxHeight': '100.00vp'
      },
      width: vp2px(150),
      height: vp2px(150)
    }
  }, {
    describe: 'SetOrderMinSettingMax',
    setValue: {
      minWidth: 300,
      maxWidth: 100,
      minHeight: 300,
      maxHeight: 100
    },
    expectValue: {
      constraintSize: {
        'minWidth': '300.00vp', 'minHeight': '300.00vp', 'maxWidth': '100.00vp', 'maxHeight': '100.00vp'
      },
      width: vp2px(300),
      height: vp2px(300)
    }
  }]
   /**
   * @tc.number Common_ConstraintSize_10010
   * @tc.name   testCommonConstraintSizeAll
   * @tc.desc   The ConstraintSize property of the Common component is set to all
   * @tc.size   MediumTest
   * @tc.type   Function
   * @tc.level  0
   */
  describe('ConstraintSizeTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.info('[ data.testValue.describe ]' + 'is:' + JSON.stringify(data.testValue.describe));
      console.info('[' + data.caseTag + ']' + 'constraintSize is:' + data.viewObj.$attrs.constraintSize);
      expect(data.viewObj.$attrs.constraintSize).assertEqual(JSON.stringify(data.testValue.expectValue.constraintSize));
    });
  })
}