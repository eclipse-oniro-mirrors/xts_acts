'use static';
/*
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
import Utils, { BasePageConfig, PageConfig, TestValue, RectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign } from '@ohos.arkui.component';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function AlignRulesTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = ['Select', 'SideBarContainer', 'WaterFlow', 'RowSplit', 'ColumnSplit']

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
  let testValues: TestValue[] = [
    {
    describe: 'ParentAlignTopLeftJustifying',
    setValue: {
      left: {
        anchor: '__container__', align: HorizontalAlign.Start
      },
      top: {
        anchor: '__container__', align: VerticalAlign.Top
      }
    }
  },
    {
    describe: 'ParentAlignTopHorizontalCenter',
    setValue: {
      middle: {
        anchor: '__container__', align: HorizontalAlign.Center
      },
      top: {
        anchor: '__container__', align: VerticalAlign.Top
      }
    }
  },
    {
    describe: 'ParentAlignTopRightAlignment',
    setValue: {
      right: {
        anchor: '__container__', align: HorizontalAlign.End
      },
      top: {
        anchor: '__container__', align: VerticalAlign.Top
      }
    }
  },
    {
    describe: 'ParentVerticalCenterLeftJustifying',
    setValue: {
      left: {
        anchor: '__container__', align: HorizontalAlign.Start
      },
      center: {
        anchor: '__container__', align: VerticalAlign.Center
      }
    }
  },
    {
    describe: 'ParentVerticalCenterHorizontally',
    setValue: {
      middle: {
        anchor: '__container__', align: HorizontalAlign.Center
      },
      center: {
        anchor: '__container__', align: VerticalAlign.Center
      }
    }
  },
    {
    describe: 'ParentVerticalCenterRightAlignment',
    setValue: {
      right: {
        anchor: '__container__', align: HorizontalAlign.End
      },
      center: {
        anchor: '__container__', align: VerticalAlign.Center
      }
    }
  },
    {
    describe: 'ParentAlignmentLeftJustifying',
    setValue: {
      left: {
        anchor: '__container__', align: HorizontalAlign.Start
      },
      bottom: {
        anchor: '__container__', align: VerticalAlign.Bottom
      }
    }
  },
    {
    describe: 'ParentAlignmentLeftJustifyingHorizontally',
    setValue: {
      middle: {
        anchor: '__container__', align: HorizontalAlign.Center
      },
      bottom: {
        anchor: '__container__', align: VerticalAlign.Bottom
      }
    }
  },
{
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
  },
  {
    describe: 'SubassemblyAlignmentLeftJustifyingHorizontally',
    setValue: {
      right: {
        anchor: 'referenceComponentKey', align: HorizontalAlign.End
      },
      top: {
        anchor: 'referenceComponentKey', align: VerticalAlign.Bottom
      }
    }
  },
  {
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

    beforeAll(() => {
      console.info("SizeTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.alignRules.nowear.test.static",
        "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    //Create test cases by config.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Obtain the region information of the target component.
      console.info('[' + data.caseTag + '] get targetComponent rect after position changed.');
      let rec: RectValue = Utils.getComponentRect(data.pageConfig.componentKey ?? '');

      //Obtain the region information of the parent component.
      console.info('[' + data.caseTag + '] get parentComponent rect after position changed.');
      let recParent: RectValue = Utils.getComponentRect(data.pageConfig.parentComponentKey);

      //Obtain the region information of the reference component.
      console.info('[' + data.caseTag + '] get referenceComponent rect after position changed.');
      let recReference: RectValue = Utils.getComponentRect(data.pageConfig.referenceComponentKey);
      console.info('[' + data.caseTag + '] check alignRules value.');
      console.info("================================= rec: " + JSON.stringify(rec))
      console.info("================================= recParent: " + JSON.stringify(recParent))
      console.info("================================= recReference: " + JSON.stringify(recReference))

      //Verify actual alignment position after alignment
      if (data.testValue.describe == 'ParentAlignTopLeftJustifying') {
        expect(Math.floor(Math.abs(rec.left - recParent.left)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(rec.top - recParent.top)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'ParentAlignTopHorizontalCenter') {
        console.log("========================================== " + Math.abs(Number(Number((rec.left + (rec.right - rec.left) / 2)).toFixed(2))))
        console.log("========================================== " + Number(Number((recReference.left + (recReference.right - recReference.left) / 2)).toFixed(2)))

        expect(Math.abs(Number(Number((rec.left + (rec.right - rec.left) / 2)).toFixed(2)) -
        Number(Number((recReference.left + (recReference.right - recReference.left) / 2)).toFixed(2))) <= 1)
          .assertTrue()
        expect(Math.floor(Math.abs(rec.top - recParent.top)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'ParentAlignTopRightAlignment') {
        expect(Math.floor(Math.abs(rec.right - recParent.right)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(rec.top - recParent.top)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'ParentVerticalCenterLeftJustifying') {
        expect(Math.floor(Math.abs(rec.left - recParent.left)) <= 1).assertTrue();
        expect(Math.abs(Number(Number(rec.top + (rec.bottom - rec.top) / 2).toFixed(2))
          - Number(Number(recReference.top + (recReference.bottom - recReference.top) / 2).toFixed(2))) <= 1)
          .assertTrue();
      } else if (data.testValue.describe == 'ParentVerticalCenterHorizontally') {
        expect(Math.abs(Number(Number(rec.left + (rec.right - rec.left) / 2).toFixed(2)) -
        Number(Number(recReference.left + (recReference.right - recReference.left) / 2).toFixed(2))) <= 1).assertTrue()
        expect(Math.abs(Number(Number(rec.top + (rec.bottom - rec.top) / 2).toFixed(2)) -
        Number(Number(recReference.top + (recReference.bottom - recReference.top) / 2).toFixed(2))) <= 1).assertTrue()
      } else if (data.testValue.describe == 'ParentVerticalCenterRightAlignment') {
        expect(Math.floor(Math.abs(rec.right - recParent.right)) <= 1).assertTrue();
        expect(Math.abs(Number(Number(rec.top + (rec.bottom - rec.top) / 2).toFixed(2)) -
        Number(Number(recReference.top + (recReference.bottom - recReference.top) / 2).toFixed(2))) <= 1).assertTrue()
      } else if (data.testValue.describe == 'ParentAlignmentLeftJustifying') {
        expect(Math.floor(Math.abs(rec.left - recParent.left)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(rec.bottom - recParent.bottom)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'ParentAlignmentLeftJustifyingHorizontally') {
        expect(Math.abs(Number(Number(rec.left + (rec.right - rec.left) / 2).toFixed(2)) -
        Number(Number(recReference.left + (recReference.right - recReference.left) / 2).toFixed(2))) <= 1).assertTrue()
        expect(Math.floor(Math.abs(rec.bottom - recParent.bottom)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'ParentAlignmentLeftJustifyingRightAlignment') {
        expect(Math.floor(Math.abs(rec.right - recParent.right)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(rec.bottom - recParent.bottom)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'SubassemblyAlignTopLeftJustifying') {
        expect(Math.floor(Math.abs(rec.right - recReference.left)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(rec.bottom - recReference.top)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'SubassemblyAlignTopHorizontalCenter') {
        expect(Math.floor(Math.abs(rec.right - recReference.right)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(rec.bottom - recReference.top)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'SubassemblyAlignTopRightAlignment') {
        expect(Math.floor(Math.abs(rec.left - recReference.right)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(rec.bottom - recReference.top)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'SubassemblyVerticalCenterLeftJustifying') {
        expect(Math.floor(Math.abs(rec.right - recReference.left)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(rec.top - recReference.top)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'SubassemblyVerticalCenterHorizontally') {
        if (data.pageConfig.componentKey == 'TextInput' || data.pageConfig.componentKey == 'TextArea') {
          expect(Math.floor(Math.abs(rec.left - recReference.left)) <= 2).assertTrue();
          expect(Math.floor(Math.abs(rec.top - recReference.top)) <= 2).assertTrue();
        } else {
          expect(Math.floor(Math.abs(rec.left - recReference.left)) <= 1).assertTrue();
          expect(Math.floor(Math.abs(rec.top - recReference.top)) <= 1).assertTrue();
        }
      } else if (data.testValue.describe == 'SubassemblyVerticalCenterRightAlignment') {
        expect(Math.floor(Math.abs(rec.left - recReference.right)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(rec.top - recReference.top)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'SubassemblyAlignmentLeftJustifying') {
        expect(Math.floor(Math.abs(rec.right - recReference.left)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(rec.top - recReference.bottom)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'SubassemblyAlignmentLeftJustifyingHorizontally') {
        expect(Math.floor(Math.abs(rec.right - recReference.right)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(rec.top - recReference.bottom)) <= 1).assertTrue();
      } else if (data.testValue.describe == 'SubassemblyAlignmentLeftJustifyingRightAlignment') {
        expect(Math.floor(Math.abs(rec.left - recReference.right)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(rec.top - recReference.bottom)) <= 1).assertTrue();
      }
    })
  })
}