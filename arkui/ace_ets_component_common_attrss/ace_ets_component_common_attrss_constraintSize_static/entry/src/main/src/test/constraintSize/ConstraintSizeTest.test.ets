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

import { ConstraintSizeOptions} from '@ohos.arkui.component';
import { AttrsManager, AlignItems } from '../../../ets/MainAbility/common/AttrsManager';
import Utils, { BasePageConfig, PageConfig, TestValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign, $r, ItemAlign } from '@ohos.arkui.component';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { AppStorage, StoragePropRef } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function constraintSizeTest() {
  let supportView: Array<string> = new Array<string>(
    'AlphabetIndexer',
    'Button',
    'Blank',
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
    'Navigation',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
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
    'Counter',
    'Flex',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'Refresh',
    'RelativeContainer',
    'Row',
    'Stack',
    'Swiper',
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line'
  )
  //Custom params.
  let childWidth = 200;
  let childHeight = 200;

  let pageConfig: PageConfig = {
    testName: 'testConstraintSize',
    pageName: 'ConstraintSizePage',
    pageUrl: 'MainAbility/pages/constraintSize/ConstraintSizePage',
    childHeight: childHeight,
    childWidth: childWidth,
    referenceComponentKey: 'referenceComponentKey'
  }

  let testValues: TestValue[] = [{
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
      width: 200,
      height: 200
    }
  },
    {
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
      width: 200,
      height: 200
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
      width: 200,
      height: 200
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
      width: 200,
      height: 200
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
      width: 250,
      height: 250
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
      width: 150,
      height: 150
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
      width: 300,
      height: 300
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
      width:150,
      height: 150
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
      width: 300,
      height: 300
    }
  }
  ]

  describe('ConstraintSizeTest', () => {
    beforeAll(() => {
      console.info("constraintSizeTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      if(data.testValue.describe == "SetOrderMaxMinSetting"){
        data.testValue.expectValue.width = AppStorage.get<UIContext>("uiContext")!.vp2px(250)
        data.testValue.expectValue.height = AppStorage.get<UIContext>("uiContext")!.vp2px(250)
      } else if(data.testValue.describe == "SetOrderSettingMaxMin" || data.testValue.describe == "SetOrderSettingMinMax" ){
        data.testValue.expectValue.width = AppStorage.get<UIContext>("uiContext")!.vp2px(150)
        data.testValue.expectValue.height = AppStorage.get<UIContext>("uiContext")!.vp2px(150)
      }else if(data.testValue.describe == "SetOrderMinMaxSetting" || data.testValue.describe == "SetOrderMinSettingMax"){
        data.testValue.expectValue.width = AppStorage.get<UIContext>("uiContext")!.vp2px(300)
        data.testValue.expectValue.height = AppStorage.get<UIContext>("uiContext")!.vp2px(300)
      }else{
        data.testValue.expectValue.width = AppStorage.get<UIContext>("uiContext")!.vp2px(200)
        data.testValue.expectValue.height = AppStorage.get<UIContext>("uiContext")!.vp2px(200)
      }

      let rect = Utils.getComponentRect(data.pageConfig.componentKey??'');
      //Component width and height calculation
      let height = rect.bottom - rect.top;
      let width = rect.right - rect.left;
      console.info('[' + data.caseTag + ']' + 'rect.right is:' + JSON.stringify(rect.right));
      console.info('[' + data.caseTag + ']' + 'rect.left is:' + JSON.stringify(rect.left));
      console.info('[' + data.caseTag + ']' + 'rect.bottom is:' + JSON.stringify(rect.bottom));
      console.info('[' + data.caseTag + ']' + 'rect.top is:' + JSON.stringify(rect.top));
      console.info('[' + data.caseTag + ']' + 'width is:' + JSON.stringify(width));
      console.info('[' + data.caseTag + ']' + 'height is:' + JSON.stringify(height));
      console.info('[' + data.caseTag + ']' + 'constraintSize is:' + data.viewObj?.getElement('$attrs').getString('constraintSize'));

      const viewObjectConstraintSize = JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('constraintSize'))
      const viewObjMinWidth = viewObjectConstraintSize.getString("minWidth")
      const viewObjMinHeight = viewObjectConstraintSize.getString("minHeight")
      const viewObjMaxWidth = viewObjectConstraintSize.getString("maxWidth")
      const viewObjMaxHeight = viewObjectConstraintSize.getString("maxHeight")
      const Width1 = data.testValue.expectValue.constraintSize.minWidth
      expect(viewObjMinWidth).assertEqual(data.testValue.expectValue.constraintSize.minWidth);
      expect(viewObjMinHeight).assertEqual(data.testValue.expectValue.constraintSize.minHeight);
      expect(viewObjMaxWidth).assertEqual(data.testValue.expectValue.constraintSize.maxWidth);
      expect(viewObjMaxHeight).assertEqual(data.testValue.expectValue.constraintSize.maxHeight);
      console.info('[' + data.caseTag + ']' + 'expectValue.width is:' + JSON.stringify(data.testValue.expectValue.width));
      expect(Math.abs(Math.round(width) - Math.round(data.testValue.expectValue.width)) <= 2).assertTrue();
      console.info('[' + data.caseTag + ']' + 'expectValue.height is:' + JSON.stringify(data.testValue.expectValue.height));
      expect(Math.abs(Math.round(height) - Math.round(data.testValue.expectValue.height)) <= 2).assertTrue();
    });
  })
}