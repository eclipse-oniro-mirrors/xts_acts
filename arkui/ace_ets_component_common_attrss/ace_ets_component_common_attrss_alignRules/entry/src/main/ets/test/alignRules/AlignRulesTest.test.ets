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
import Utils, { RectValue } from '../../MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

class TestValue {
  describe: string;
  setValue: AlignRuleOption;
}

class PageConfig {
  testName: string;
  pageName: string;
  pageUrl: string;
  parentWidth: number;
  parentHeight: number;
  subassemblyWidth: number;
  subassemblyHeight: number;
  subassemblyCenter: AlignRuleOption;
  parentComponentKey: string;
  referenceComponentKey: string;
}

export default function AlignRulesTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = ['Text', 'Button', 'Radio', 'Select', 'Checkbox', 'CheckboxGroup', 'DataPanel', 'DatePicker',
    'Divider', 'Gauge', 'LoadingProgress', 'Marquee', 'Navigation', 'Image', 'ImageAnimator', 'AlphabetIndexer',
    'Progress', 'QRCode', 'Rating', 'Search', 'Slider', 'TextArea', 'TextClock', 'TextInput', 'TextPicker',
    'TimePicker', 'Toggle', 'Badge', 'Column', 'Counter', 'Flex', 'Grid', 'GridRow', 'List', 'Row', 'Scroll',
    'SideBarContainer', 'Stack', 'Tabs', 'WaterFlow', 'Circle', 'Ellipse', 'Line', 'Polyline', 'Polygon', 'Path',
    'Rect', 'Shape', 'Panel', 'Refresh', 'RowSplit', 'ColumnSplit', 'RelativeContainer', 'Swiper', 'Navigator',
    'TextTimer', 'Stepper', 'ScrollBar', 'Menu']

  //The size of the parent component, when set as a percentage, serves as the calculation basis.
  let parentWidth = 300;
  let parentHeight = 300;
  let subassemblyWidth = 100;
  let subassemblyHeight = 100;
  let subassemblyCenter: AlignRuleOption = {
    center: {
      anchor: '__container__', align: VerticalAlign.Center
    },
    middle: {
      anchor: '__container__', align: HorizontalAlign.Center
    }
  }

  //Page config, this param is required.
  let pageConfig: PageConfig = {
    testName: 'testAlignRules',
    pageName: 'AlignRulesPage',
    pageUrl: 'MainAbility/pages/alignRules/AlignRulesPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    subassemblyWidth: subassemblyWidth,
    subassemblyHeight: subassemblyHeight,
    subassemblyCenter: subassemblyCenter,
    parentComponentKey: 'parentComponentKey',
    referenceComponentKey: 'referenceComponentKey'
  }

  //Test values, looped to create cases, this param is required.
  let testValues: TestValue[] = [{
    describe: 'ParentAlignTopLeftJustifying',
    setValue: {
      left: {
        anchor: '__container__', align: HorizontalAlign.Start
      },
      top: {
        anchor: '__container__', align: VerticalAlign.Top
      }
    }
  }, {
    describe: 'ParentAlignTopHorizontalCenter',
    setValue: {
      middle: {
        anchor: '__container__', align: HorizontalAlign.Center
      },
      top: {
        anchor: '__container__', align: VerticalAlign.Top
      }
    }
  }, {
    describe: 'ParentAlignTopRightAlignment',
    setValue: {
      right: {
        anchor: '__container__', align: HorizontalAlign.End
      },
      top: {
        anchor: '__container__', align: VerticalAlign.Top
      }
    }
  }, {
    describe: 'ParentVerticalCenterLeftJustifying',
    setValue: {
      left: {
        anchor: '__container__', align: HorizontalAlign.Start
      },
      center: {
        anchor: '__container__', align: VerticalAlign.Center
      }
    }
  }, {
    describe: 'ParentVerticalCenterHorizontally',
    setValue: {
      middle: {
        anchor: '__container__', align: HorizontalAlign.Center
      },
      center: {
        anchor: '__container__', align: VerticalAlign.Center
      }
    }
  }, {
    describe: 'ParentVerticalCenterRightAlignment',
    setValue: {
      right: {
        anchor: '__container__', align: HorizontalAlign.End
      },
      center: {
        anchor: '__container__', align: VerticalAlign.Center
      }
    }
  }, {
    describe: 'ParentAlignmentLeftJustifying',
    setValue: {
      left: {
        anchor: '__container__', align: HorizontalAlign.Start
      },
      bottom: {
        anchor: '__container__', align: VerticalAlign.Bottom
      }
    }
  }, {
    describe: 'ParentAlignmentLeftJustifyingHorizontally',
    setValue: {
      middle: {
        anchor: '__container__', align: HorizontalAlign.Center
      },
      bottom: {
        anchor: '__container__', align: VerticalAlign.Bottom
      }
    }
  }, {
    describe: 'ParentAlignmentLeftJustifyingRightAlignment',
    setValue: {
      right: {
        anchor: '__container__', align: HorizontalAlign.End
      },
      bottom: {
        anchor: '__container__', align: VerticalAlign.Bottom
      }
    }
  }, {
    describe: 'SubassemblyAlignTopLeftJustifying',
    setValue: {
      right: {
        anchor: 'referenceComponentKey', align: HorizontalAlign.Start
      },
      bottom: {
        anchor: 'referenceComponentKey', align: VerticalAlign.Top
      }
    }
  }, {
    describe: 'SubassemblyAlignTopHorizontalCenter',
    setValue: {
      right: {
        anchor: 'referenceComponentKey', align: HorizontalAlign.End
      },
      bottom: {
        anchor: 'referenceComponentKey', align: VerticalAlign.Top
      }
    }
  }, {
    describe: 'SubassemblyAlignTopRightAlignment',
    setValue: {
      left: {
        anchor: 'referenceComponentKey', align: HorizontalAlign.End
      },
      bottom: {
        anchor: 'referenceComponentKey', align: VerticalAlign.Top
      }
    }
  }, {
    describe: 'SubassemblyVerticalCenterLeftJustifying',
    setValue: {
      right: {
        anchor: 'referenceComponentKey', align: HorizontalAlign.Start
      },
      top: {
        anchor: 'referenceComponentKey', align: VerticalAlign.Top
      }
    }
  }, {
    describe: 'SubassemblyVerticalCenterHorizontally',
    setValue: {
      right: {
        anchor: 'referenceComponentKey', align: HorizontalAlign.End
      },
      top: {
        anchor: 'referenceComponentKey', align: VerticalAlign.Top
      }
    }
  }, {
    describe: 'SubassemblyVerticalCenterRightAlignment',
    setValue: {
      left: {
        anchor: 'referenceComponentKey', align: HorizontalAlign.End
      },
      top: {
        anchor: 'referenceComponentKey', align: VerticalAlign.Top
      }
    }
  }, {
    describe: 'SubassemblyAlignmentLeftJustifying',
    setValue: {
      right: {
        anchor: 'referenceComponentKey', align: HorizontalAlign.Start
      },
      top: {
        anchor: 'referenceComponentKey', align: VerticalAlign.Bottom
      }
    }
  }, {
    describe: 'SubassemblyAlignmentLeftJustifyingHorizontally',
    setValue: {
      right: {
        anchor: 'referenceComponentKey', align: HorizontalAlign.End
      },
      top: {
        anchor: 'referenceComponentKey', align: VerticalAlign.Bottom
      }
    }
  }, {
    describe: 'SubassemblyAlignmentLeftJustifyingRightAlignment',
    setValue: {
      left: {
        anchor: 'referenceComponentKey', align: HorizontalAlign.End
      },
      top: {
        anchor: 'referenceComponentKey', align: VerticalAlign.Bottom
      }
    }
  }
  ]

  describe('AlignRulesTest', () => {
    //Create test cases by config.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {

      //Obtain the region information of the target component.
      console.info('[' + data.caseTag + '] get targetComponent rect after position changed.');
      let rec: RectValue = Utils.getComponentRect(data.pageConfig.componentKey);

      //Obtain the region information of the parent component.
      console.info('[' + data.caseTag + '] get parentComponent rect after position changed.');
      let recParent: RectValue = Utils.getComponentRect(data.pageConfig.parentComponentKey);

      //Obtain the region information of the reference component.
      console.info('[' + data.caseTag + '] get referenceComponent rect after position changed.');
      let recReference: RectValue = Utils.getComponentRect(data.pageConfig.referenceComponentKey);
      console.info('[' + data.caseTag + '] check alignRules value.');

      //Verify actual alignment position after alignment
      if (data.testValue.describe == 'ParentAlignTopLeftJustifying') {
        expect(rec.left).assertEqual(recParent.left)
        expect(rec.top).assertEqual(recParent.top)
      } else if (data.testValue.describe == 'ParentAlignTopHorizontalCenter') {
        expect(Math.abs(Number((rec.left + (rec.right - rec.left) / 2).toFixed(2)) -
        Number((recReference.left + (recReference.right - recReference.left) / 2).toFixed(2))) <= 1).assertTrue()
        expect(rec.top).assertEqual(recParent.top)
      } else if (data.testValue.describe == 'ParentAlignTopRightAlignment') {
        expect(rec.right).assertEqual(recParent.right)
        expect(rec.top).assertEqual(recParent.top)
      } else if (data.testValue.describe == 'ParentVerticalCenterLeftJustifying') {
        expect(rec.left).assertEqual(recParent.left)
        expect(Math.abs(Number((rec.top + (rec.bottom - rec.top) / 2).toFixed(2))
          - Number((recReference.top + (recReference.bottom - recReference.top) / 2).toFixed(2))) <= 1).assertTrue();
      } else if (data.testValue.describe == 'ParentVerticalCenterHorizontally') {
        expect(Math.abs(Number((rec.left + (rec.right - rec.left) / 2).toFixed(2)) -
        Number((recReference.left + (recReference.right - recReference.left) / 2).toFixed(2))) <= 1).assertTrue()
        expect(Math.abs(Number((rec.top + (rec.bottom - rec.top) / 2).toFixed(2)) -
        Number((recReference.top + (recReference.bottom - recReference.top) / 2).toFixed(2))) <= 1).assertTrue()
      } else if (data.testValue.describe == 'ParentVerticalCenterRightAlignment') {
        expect(rec.right).assertEqual(recParent.right)
        expect(Math.abs(Number((rec.top + (rec.bottom - rec.top) / 2).toFixed(2)) -
        Number((recReference.top + (recReference.bottom - recReference.top) / 2).toFixed(2))) <= 1).assertTrue()
      } else if (data.testValue.describe == 'ParentAlignmentLeftJustifying') {
        expect(rec.left).assertEqual(recParent.left)
        expect(rec.bottom).assertEqual(recParent.bottom)
      } else if (data.testValue.describe == 'ParentAlignmentLeftJustifyingHorizontally') {
        expect(Math.abs(Number((rec.left + (rec.right - rec.left) / 2).toFixed(2)) -
        Number((recReference.left + (recReference.right - recReference.left) / 2).toFixed(2))) <= 1).assertTrue()
        expect(rec.bottom).assertEqual(recParent.bottom)
      } else if (data.testValue.describe == 'ParentAlignmentLeftJustifyingRightAlignment') {
        expect(rec.right).assertEqual(recParent.right)
        expect(rec.bottom).assertEqual(recParent.bottom)
      } else if (data.testValue.describe == 'SubassemblyAlignTopLeftJustifying') {
        expect(rec.right).assertEqual(recReference.left)
        expect(rec.bottom).assertEqual(recReference.top)
      } else if (data.testValue.describe == 'SubassemblyAlignTopHorizontalCenter') {
        expect(rec.right).assertEqual(recReference.right)
        expect(rec.bottom).assertEqual(recReference.top)
      } else if (data.testValue.describe == 'SubassemblyAlignTopRightAlignment') {
        expect(rec.left).assertEqual(recReference.right)
        expect(rec.bottom).assertEqual(recReference.top)
      } else if (data.testValue.describe == 'SubassemblyVerticalCenterLeftJustifying') {
        expect(rec.right).assertEqual(recReference.left)
        expect(rec.top).assertEqual(recReference.top)
      } else if (data.testValue.describe == 'SubassemblyVerticalCenterHorizontally') {
        expect(Math.abs(rec.left - recReference.left) <= 1).assertTrue();
        expect(Math.abs(rec.top - recReference.top) <= 1).assertTrue();
      } else if (data.testValue.describe == 'SubassemblyVerticalCenterRightAlignment') {
        expect(rec.left).assertEqual(recReference.right)
        expect(rec.top).assertEqual(recReference.top)
      } else if (data.testValue.describe == 'SubassemblyAlignmentLeftJustifying') {
        expect(rec.right).assertEqual(recReference.left)
        expect(rec.top).assertEqual(recReference.bottom)
      } else if (data.testValue.describe == 'SubassemblyAlignmentLeftJustifyingHorizontally') {
        expect(rec.right).assertEqual(recReference.right)
        expect(rec.top).assertEqual(recReference.bottom)
      } else if (data.testValue.describe == 'SubassemblyAlignmentLeftJustifyingRightAlignment') {
        expect(rec.left).assertEqual(recReference.right)
        expect(rec.top).assertEqual(recReference.bottom)
      }
    })
  })
}